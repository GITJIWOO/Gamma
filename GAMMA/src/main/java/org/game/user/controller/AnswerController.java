package org.game.user.controller;

import org.game.user.domain.AnswerVO;
import org.game.user.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/qna")
public class AnswerController {
	@Autowired
	private AnswerService service;
	/*
	HomeController 에 붙여넣을 메서드
	@GetMapping("/answer")
	public void answer() {
		
	}
	*/
	// 답변 작성 
	@PostMapping(value="/answer/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> registerAnswer(@RequestBody AnswerVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.addAnswer(vo);
			entity = new ResponseEntity<String>("add success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 답변 - 질문글 번호로 조회
	/* 같은 질문글에 여러개의 답변글이 들어갈 수 있지만(qnum이 기본키가 아니기 때문에) List로 작성하지 않음
	 * 해당 질문글에 답변글이 작성되었는지 확인하고 작성된 답변글이 있다면 자바스크립트로 alert 창 띄울 예정
	 */
	@GetMapping(value="/answer/{qnum}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<AnswerVO> getAnswer(@PathVariable("qnum") int qnum){
		ResponseEntity<AnswerVO> entity = null;
		try {
			entity = new ResponseEntity<AnswerVO>(service.getAnswer(qnum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<AnswerVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 위 답변에 해당하는 질문 조회
	
	// 답변 수정 - 답변글 번호로 조회해 수정
	@RequestMapping(value="/answer/{anum}", method= {RequestMethod.PATCH, RequestMethod.PUT}, consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modifyAnswer(@RequestBody AnswerVO vo, @PathVariable("anum")int anum){
		ResponseEntity<String> entity = null;
		try {
			vo.setAnum(anum);
			service.modifyAnswer(vo);
			entity = new ResponseEntity<String>("modify success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 답변 삭제 - 답변글 번호로 조회해 수정
	@DeleteMapping(value="/answer/{anum}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeAnswer(@PathVariable("anum")int anum){
		ResponseEntity<String> entity = null;
		try {
			service.removeAnswer(anum);
			entity = new ResponseEntity<String>("remove success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
