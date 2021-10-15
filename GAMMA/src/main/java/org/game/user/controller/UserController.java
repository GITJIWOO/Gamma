package org.game.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.friends.service.FriendsService;
import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	// @Inject
	// BCryptPasswordEncoder pwdEncoder;
	//@Autowired
	//private JavaMailSender mailSender;
	
	@Autowired
	private FriendsService fservice;
	
	// 유저프로필
	@GetMapping("/userPro")
	public String userPro() {
		/*
		재인 추가
		service.userGet(null);	// 아마 이거 작성되어야 프로필 조회할 수 있을듯..
		model.addAttribute("result" ,fservice.fOrNot(null, cid));	// null 에는 해당 로직으로 이동하면 나오는 user 정보 추가 예정, cid는 로그인 계정 
		log.info(fservice.fOrNot(null, cid);
		model.addAttribute("follower", null);
		model.addAttribute("following", cid);
		*/
		return "/user/userPro";
	}

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
		// log.info("회원가입");
		// service.userJoin(userVO);

		log.info("poset회원가입실행");
		long result = service.idChk(userVO.getCid());
		log.info("result값: " + result);
		try {
			if (result == 1) {
				return "/user/userJoin";
			} else if (result == 0) {
				// String inputPass = userVO.getPassword();
				// String pwd = pwdEncoder.encode(inputPass);
				// userVO.setPassword(pwd);
				service.userJoin(userVO);
			}

		} catch (Exception e) {
			throw new RuntimeException();
		}

		return "/user/userLogin";
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

		return "/user/userLogin";
	}

	@PostMapping("/userLogin")
	public String userLogin(ConsumerVO userVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		log.info("로그인컨트롤실행");
		HttpSession session = req.getSession();
		String memberSession = String.valueOf(session.getAttribute("member"));
		System.out.println("멤버세션값 : " + memberSession);
		ConsumerVO login = service.userLogin(userVO);
		System.out.println("VO" + userVO);
		System.out.println("DB" + login);
		System.out.println("VO의 비번 " + userVO.getPassword());
		System.out.println("DB의 비번 " + login.getPassword());
		// boolean pwdMatch = pwdEncoder.matches(userVO.getPassword(),
		// login.getPassword());
		// System.out.println("비번매칭 : " + pwdMatch);
		boolean result = login.getPassword().equals(userVO.getPassword());
		System.out.println("result 값 : " + result);
		if (result == true) { // 위의 result는 나중에 바꿔야함 복호화와 시큐리티 적용하면 오류생길가능성이 높다 .equls는 단순한 문자열 비교라 그럼
			session.setAttribute("member", login);
			session.setAttribute("session_cid", login.getCid());
			session.setAttribute("session_cadmin", login.getCadmin());
			memberSession = String.valueOf(session.getAttribute("member"));
			System.out.println("멤버세션값 iftrue : " + memberSession);
		} else {
			session.setAttribute("member", null);
			memberSession = String.valueOf(session.getAttribute("member"));
			System.out.println("멤버세션값 else : " + memberSession);
			rttr.addFlashAttribute("msg", false);
			return "/user/userLogin";
		}
		return "/main/main";
	}

	// 로그아웃 과 세션 초기화
	// 시큐리티 적용 전 얘하나로만 했었음
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) throws Exception { 
		// security-con~ 에서 세션파기설정이되있음
		session.invalidate();

		return "/main/main";
	}

	// 로그아웃 과 세션 초기화 시큐리티적용버전
	/*
	 * @GetMapping("/userLogout") public void userLogoutget() { // security-con~ 에서
	 * 세션파기설정이되있음 session.invalidate(); log.info("로그아웃 폼으로 이동"); }
	 * 
	 * @PostMapping("/userLogout") public void userLogout() {
	 * log.info("포스트방식으로 로그아웃 처리");
	 * 
	 * }
	 */

	// 겟으로 접근하는 수정창 -- ajax쓰기려고 넘김
	@GetMapping("/userModify")
	public String userModify() throws Exception {
		return "user/userModify";
	}

	// post 회원정보 수정
	@PostMapping("/userModify")
	public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception {
		service.userModify(vo);
		session.invalidate();
		return "/user/userLogin";
	}

	// 회원 탈퇴 get
	@GetMapping("/userDelete")
	public String userDelete(HttpSession session) throws Exception {
		return "/user/userDelete";
	}

	// 회원 탈퇴 post
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		service.userDelete(userVO);
		session.invalidate();
		return "/user/userLogin";
	}
	
	// 비밀번호찾기 이메일발송
	@GetMapping("/findpw")
	public String findPwGet() throws Exception{
		return "/user/findpw";
	}
	
	@PostMapping("/findpw")
	public String findPwPost() throws Exception{
		return "/user/findpw";
	}
	

}