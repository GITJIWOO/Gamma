package org.game.user.controller;

import java.util.List;

import org.game.user.domain.QuestionVO;
import org.game.user.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QuestionController {
	@Autowired
	private QuestionService service;
	
	// 질문글 작성하는 폼 
	@PostMapping("/questionform")
	public String addQuestion(String qwriter, Model model) {
		model.addAttribute("qwriter", qwriter);
		return "/qna/registerquestion";
	}
	
	// 작성한 질문글 등록하고 자신이 작성한 질문글 목록 조회
	@PostMapping("/registerquestion")
	public String registerQuestion(QuestionVO vo, RedirectAttributes rttr) {
		service.addQuestion(vo);
		rttr.addFlashAttribute("vo", vo);
		return "redirect:/qna/questionlist";
	}
	
	// 질문글 목록 조회
	@PostMapping("/questionlist")
	public String questionList(String cid, Model model) {
		int admin = service.adminOrNot(cid);
		// 1이면 관리자, 0이면 일반회원
		if(admin == 1) {
			List<QuestionVO> vo = service.questionList("%%");			
			model.addAttribute("vo", vo);
		}else {
			List<QuestionVO> vo = service.questionList(cid);
			model.addAttribute("vo", vo);
		}
		return "/qna/questionlist";
	}
	
	// 질문글 수정
	@PostMapping("/modifyquestion")
	public String modifyQuestionForm(Long qnum, Model model) {
		QuestionVO vo = service.ownQuestion(qnum);
		model.addAttribute("vo", vo);
		return "qna/modifyclear";
	}
	
	// 질문글 수정 완료
	@PostMapping("modifyclear")
	public String modifyQuestion(QuestionVO vo, RedirectAttributes rttr) {
		service.modifyQuestion(vo);
		rttr.addFlashAttribute("success", "modify");
		rttr.addFlashAttribute("qnum", vo.getQnum());

		// 아래 주소로 넘길 때 post 이지만 파라미터 값으로 번호를 넘겨서 해당 번호 질문글 상세로 넘어가게 하려면? 
		return "redirect:/qna/getquestion";
	}
	
	// 질문글 상세 조회
	@PostMapping("getquestion")
	public String getQuestion(Long qnum, Model model) {
		QuestionVO vo = service.ownQuestion(qnum);
		model.addAttribute("vo", vo);
		return "/qna/getquestion";
	}
	
	// 질문글 삭제
	@PostMapping("removequestion")
	public String removeQuestion(Long qnum, RedirectAttributes rttr) {
		service.removeQuestion(qnum);
		rttr.addFlashAttribute("success", "remove");
		rttr.addFlashAttribute("qnum", qnum);
		return "redirect:/qna/questionlist";
	}
}
