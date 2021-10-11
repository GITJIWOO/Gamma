package org.game.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/urest/*")
public class UserRestController {

	
	@Inject
	UserService service;
	//@Autowired
	//private JavaMailSender mailSender;

 //@Inject
 //BCryptPasswordEncoder pwdEncoder;
	
	// 아이디 중복 체크
		@ResponseBody
		@PostMapping(value="/idChk",
			consumes="application/json",
			produces={MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> idChk(@RequestBody String cid) throws Exception {
			System.out.println("요청 감지");
			System.out.println("CID로 들어온 값 : " + cid);
			long result = service.idChk(cid);
			System.out.println("result : "+ result);
			String strResult = result + ""; // 문자열로 바꿔줌
			System.out.println("strResult : " + strResult);
			return new ResponseEntity<String>(strResult, HttpStatus.OK);
		}
		
		// 이메일 중복확인 체크
		
		  @ResponseBody
		  
		  @PostMapping(value="/emailChk",consumes="application/json",produces=
		  {MediaType.TEXT_PLAIN_VALUE}) public ResponseEntity<String>
		  emailChk(@RequestBody String email) throws Exception{
		  
		 System.out.println("요청 이메일 : "+ email); 
		 long result =service.emailChk(email); 
		 String eResult = result + ""; // 문자열로 바꿔줌 
		 return new
		  ResponseEntity<String>(eResult, HttpStatus.OK); }
		 
		// 이메일 인증 메서드
		//@ResponseBody
		//@GetMapping(value="/emailChk",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
		/*public String mailCheckGET(String email) throws Exception{
			System.out.println("이메일 인증 컨트롤러");
			System.out.println("이메일 : " + email);
			
			// 인증번호(난수생성)
			Random random = new Random();
			int checkNum=random.nextInt(888888)+111111;
			System.out.println("인증번호 : "+checkNum);
			

	         이메일 보내기 
	        String setFrom = "sos104v@naver.com";
	        String toMail = email;
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        String num = Integer.toString(checkNum);
	        return num;
		}*/
		

		
		// 비밀번호 중복 체크
		// @ResponseBody
		// @PostMapping("/passChk")
		// public boolean passChk(ConsumerVO userVO) throws Exception {

		// ConsumerVO login = service.userLogin(userVO);
		// boolean pwdChk = pwdEncoder.matches(userVO.getPassword(),
		// login.getPassword());
		// return pwdChk;
		// }
		

		// post 회원정보 수정 시큐리티 복호화 하면 넣을장소
		/*@ResponseBody
		@PostMapping(value="/userModify" consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
		public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception {
			service.userModify(vo);
			session.invalidate();
			return "/user/userLogin";
		}*/

}
