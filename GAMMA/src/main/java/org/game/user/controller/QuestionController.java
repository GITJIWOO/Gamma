package org.game.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.user.domain.QuestionPageDTO;
import org.game.user.domain.QuestionSearchCriteria;
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
	public String addQuestion(HttpSession session, Model model) {
		String cid = String.valueOf(session.getAttribute("session_cid"));
		model.addAttribute("qwriter", cid);
		return "/qna/registerquestion";
	}
	
	// 작성한 질문글 등록하고 자신이 작성한 질문글 목록 조회
	@PostMapping("/registerquestion")
	public String registerQuestion(QuestionVO vo, RedirectAttributes rttr) {
		service.addQuestion(vo);
		rttr.addFlashAttribute("cid", vo.getQwriter());
		rttr.addFlashAttribute("qnum", vo.getQnum());
		rttr.addFlashAttribute("success", "register");
		
		rttr.addAttribute("qwriter", vo.getQwriter());
		return "redirect:/qna/questionlist";
	}
	
	// 질문글 목록 조회
	@GetMapping("/questionlist")
	public String questionList(HttpSession session, QuestionSearchCriteria cri, Model model) {
		String qwriter = String.valueOf(session.getAttribute("session_cid"));
		int admin = service.adminOrNot(qwriter);
		List<QuestionVO> vo;
		QuestionPageDTO btnMaker;
		// 1이면 관리자, 0이면 일반회원
		if(admin == 1) {
			vo = service.questionListP(cri, "%%");
			btnMaker = new QuestionPageDTO(cri, service.countQuestion(cri, "%%"), 10);
		}else {
			vo = service.questionListP(cri, qwriter);
			btnMaker = new QuestionPageDTO(cri, service.countQuestion(cri, qwriter), 10);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("btnMaker", btnMaker);
		log.info("qwriter 확인: " + qwriter );
		log.info("cri값 확인 keyword: " + cri.getKeyword());
		log.info("cri값 확인 pageNum: " + cri.getPageNum());
		log.info("cri값 확인 amount: " + cri.getAmount());
		model.addAttribute("admin", admin);
		model.addAttribute("qwriter", qwriter);
		return "/qna/questionlist";
	}
	
	// 질문글 수정
	@PostMapping("/modifyquestion")
	public String modifyQuestionForm(int qnum, Model model) {
		QuestionVO vo = service.ownQuestion(qnum);
		model.addAttribute("vo", vo);
		return "qna/modifyquestion";
	}
	
	// 질문글 수정 완료
	@PostMapping("/modifyclear")
	public String modifyQuestion(QuestionVO vo, QuestionSearchCriteria cri, RedirectAttributes rttr) {
		service.modifyQuestion(vo);
		rttr.addFlashAttribute("success", "modify");
		rttr.addFlashAttribute("qnum", vo.getQnum());
		log.info("cri 페이지번호: " +cri.getPageNum());
		rttr.addAttribute("qnum", vo.getQnum());
		rttr.addAttribute("qwriter", vo.getQwriter());
		rttr.addAttribute("pageNum", cri.getPageNum());
		return "redirect:/qna/getquestion";
	}
	
	// 질문글 상세 조회
	@GetMapping("/getquestion")
	public String getQuestion(HttpSession session, int qnum, Model model) {
		String qwriter = String.valueOf(session.getAttribute("session_cid"));
		int admin = service.adminOrNot(qwriter);
		QuestionVO vo = service.ownQuestion(qnum);
		model.addAttribute("admin", admin);
		model.addAttribute("vo", vo);
		return "/qna/getquestion";
	}
	
	// 질문글 삭제
	@PostMapping("/removequestion")
	public String removeQuestion(HttpSession session, int qnum, RedirectAttributes rttr) {
		String qwriter = String.valueOf(session.getAttribute("session_cid"));
		service.removeQuestion(qnum);
		rttr.addFlashAttribute("success", "remove");
		rttr.addFlashAttribute("qnum", qnum);
		rttr.addAttribute("qwriter", qwriter);
		return "redirect:/qna/questionlist";
	}
	
	// 자주하는 질문 
	@GetMapping("/commonquestion")
	public String commonQuestion() {
		return "/qna/commonquestion";
	}
}