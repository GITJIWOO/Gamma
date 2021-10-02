package org.game.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
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
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	@Inject
	UserService service;
	//@Inject
	//BCryptPasswordEncoder pwdEncoder;

	// 아이디 중복 체크
	/*
	 * @PostMapping("/idChk") public int idChk(ConsumerVO vo) throws Exception { int
	 * result = service.idChk(vo); return result;
	 }*/

	// 비밀번호 중복 체크
	//@PostMapping("/passChk")
	//public boolean passChk(ConsumerVO userVO) throws Exception {

		//ConsumerVO login = service.userLogin(userVO);
		//boolean pwdChk = pwdEncoder.matches(userVO.getPassword(), login.getPassword());
		//return pwdChk;
	//}
	@GetMapping("/userGet")
	public String userGet() {
		return "/user/userGet";
	}
	// 유저 상제정보창
	@PostMapping("/userGet")
	public String userGet(String cid, Model model) {
		model.addAttribute("dto", service.userGet(cid));
		log.info("클릭한유저번호" + cid);
		return "/user/userGet";
	}

	// 회원가입 get방식으로 접근여부 가능

	@GetMapping("/userJoin")
	public String userJoin() throws Exception {
		log.info("get방식회원가입접속");
		return "/user/userJoin";

	}

	// 회원가입

	@PostMapping("/userJoin")
	public String userJoin(ConsumerVO userVO) throws Exception {
		log.info("회원가입");
		service.userJoin(userVO);

		log.info("poset회원가입실행");
//		int result = service.idChk(userVO);
//		try {
//			if (result == 1) {
//				return "/user/userLogin";
//			} else if (result == 0) {
//				String inputPass = userVO.getPassword();
//				String pwd = pwdEncoder.encode(inputPass);
//				userVO.setPassword(pwd);
//				service.userJoin(userVO);
//			}
//		} catch (Exception e) {
//		}

		return "/user/userHome";
	}

	/*
	 * @GetMapping("/userHome") public String home(Locale locale, Model model) {
	 * log.info("userHome실행");//로깅이 안되는거같네요. 우선 System.out.println으로 대체해서 디버깅하시고.
	 * System.out.println("userHome접속함"); Date date = new Date(); DateFormat
	 * dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
	 * locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate);
	 * 
	 * return "/user/userHome"; }
	 */

	// get로그인

	@GetMapping("/userLogin")
	public String userLogin() throws Exception {
		return "/user/userHome";
	}

	@PostMapping("/userLogin")
	public String login(ConsumerVO userVO,HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		log.info("로그인컨트롤실행"); 
		HttpSession session = req.getSession();
		String memberSession = String.valueOf(session.getAttribute("member"));
		System.out.println("멤버세션값 : " + memberSession);
		ConsumerVO login = service.userLogin(userVO);
		System.out.println("VO" + userVO);
		System.out.println("DB" + login);
		System.out.println("VO의 비번 " + userVO.getPassword());
		System.out.println("DB의 비번 " + login.getPassword());
		//boolean pwdMatch = pwdEncoder.matches(userVO.getPassword(), login.getPassword());
		//System.out.println("비번매칭 : " + pwdMatch);
		boolean result =(login.getPassword()==userVO.getPassword());
		if(result != true) { //잘못된거임 위의 주입된비번 db내비번같은데 같지않다고떠서 해놓은거 위해결하면 ==으로바꾸기
			session.setAttribute("member", login);
			memberSession = String.valueOf(session.getAttribute("member"));
			System.out.println("멤버세션값 iftrue : " + memberSession);
		} else {
			session.setAttribute("member", null);
			memberSession = String.valueOf(session.getAttribute("member"));
			System.out.println("멤버세션값 else : " + memberSession);
			rttr.addFlashAttribute("msg", false);
		}
		return "/user/nav";
	}
	

	// 로그아웃 과 세션 초기화
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) throws Exception {

		session.invalidate();

		return "/user/userHome";
	}

	// 겟으로 접근하는 수정창
	@GetMapping("/userModify")
	public String userModify() throws Exception {
		return "user/userModify";
	}

	// post 회원정보 수정
	@PostMapping("/userModify")
	public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception {
		service.userModify(vo);
		session.invalidate();
		return "redirect:/user/userGet";
	}

	// 회원 탈퇴 get
	@GetMapping("/userDelete")
	public String userDelete(HttpSession session) throws Exception {
		session.invalidate();
		return "/user/userDelete";
	}

	// 회원 탈퇴 post
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {

		service.userDelete(userVO);
		session.invalidate();
		return "/user/userHome";
	}

}