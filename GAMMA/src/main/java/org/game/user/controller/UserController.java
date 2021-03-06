package org.game.user.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.game.friends.domain.FriendsSearchCriteria;
import org.game.friends.service.FriendsService;
import org.game.gamelibrary.domain.ResultLibraryVO;
import org.game.gamelibrary.service.GameLibraryService;
import org.game.user.domain.AuthVO;
import org.game.user.domain.ConsumerVO;
import org.game.user.domain.CustomUser;
import org.game.user.naver.NaverLoginBO;
import org.game.user.service.UserMailSendService;
import org.game.user.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {

	@Inject
	UserService service;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	UserMailSendService mailsender;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult="";

	
	@Autowired
	private FriendsService fservice;

	@Autowired
	private GameLibraryService libraryService;

	@GetMapping("/agreeJoin")
	private String agreeJoin() {
		log.info("????????? ??????");
		return "/user/agreeJoin";
	}

	// ???????????????
	@PreAuthorize("permitAll")
	@GetMapping("/userPro")
	public String userPro(String cid, Principal principal, FriendsSearchCriteria criteria, Model model) throws InterruptedException {
		
		if(principal != null) {
			String myCid = principal.getName();
			model.addAttribute("myCid", myCid);
			// ?????? ?????? ??????
			int fOrNot;
			if(cid == null) {
				cid = myCid;
				if(fservice.fOrNot(cid, myCid) == null) {
					log.info("cid ??????4: " + cid);
					fOrNot = 0;
				}else {
					log.info("cid ??????5: " + cid);
					fOrNot = fservice.fOrNot(cid, myCid);
				}
				log.info("cid ??????6: " + cid);
				model.addAttribute("fOrNot", fOrNot);
				log.info("cid ??????7: " + cid);
			}
		}
		
		log.info("cid ??????8: " + cid);
		if(criteria.getKeyword() == null) {
			criteria.setKeyword("");			
		}
		// ?????? ?????? ??????
		log.info("cid ??????9: " + cid);
		int countFollower = fservice.countFollower(criteria, cid);
		log.info("cid ??????10: " + cid);
		int countFollowing = fservice.countFollowing(criteria, cid);
		log.info("cid ??????11: " + cid);
		model.addAttribute("countFollower", countFollower);
		log.info("cid ??????12: " + cid);
		model.addAttribute("countFollowing", countFollowing);
		log.info("cid ??????13: " + cid);


		ConsumerVO userVO = service.userGet(cid);
		log.info("cid ??????14: " + cid);
 
		model.addAttribute("cid", cid);
		log.info("cid ??????15: " + cid);
		model.addAttribute("nickname", userVO.getNickname());
		log.info("cid ??????16: " + cid);
		model.addAttribute("cnum", userVO.getCnum());
		log.info("cid ??????17: " + cid);

		List<ResultLibraryVO> libraryList = libraryService.getAllConsumerLibrary(userVO.getCid());
		log.info("cid ??????18: " + cid);

		model.addAttribute("libraryList", libraryList);

		return "/user/userPro";
	}
	
	// ?????? ???????????????
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@GetMapping("/userGet")
	public String userGet(String cid, Principal principal, Model model) { // ?????? ?????????, ?????????
		
		cid = principal.getName();
		
		model.addAttribute("cid", cid);
		
		return "/user/userGet";
	}

	// ???????????? get???????????? ???????????? ??????
	/*
	 * @GetMapping("/userJoin") public String userJoin() throws Exception {
	 * log.info("get????????????????????????");
	 * 
	 * return "/user/userJoin";
	 * 
	 * }
	 * 
	 * // ????????????
	 * 
	 * @PostMapping("/userJoin") public String userJoin(ConsumerVO userVO) throws
	 * Exception { // log.info("????????????"); // service.userJoin(userVO);
	 * 
	 * log.info("poset??????????????????"); long result = service.idChk(userVO.getCid());
	 * log.info("result???: " + result); try { if (result == 1) { return
	 * "/user/userJoin"; } else if (result == 0) { // String inputPass =
	 * userVO.getPassword(); // String pwd = pwdEncoder.encode(inputPass); //
	 * userVO.setPassword(pwd); service.userJoin(userVO); }
	 * 
	 * } catch (Exception e) { throw new RuntimeException(); }
	 * 
	 * return "/user/userLogin"; }
	 */
	/*
	 * @PreAuthorize("permitAll")
	 * 
	 * @PostMapping("/userJoin") public String userJoin(ConsumerVO userVO, String[]
	 * role) throws Exception { // log.info("????????????"); // service.userJoin(userVO);
	 * log.info("????????????????????????" + userVO); log.info("???????????????" + role);
	 * 
	 * String beforeCrPw = userVO.getPassword();
	 * 
	 * log.info("poset??????????????????"); long result = service.idChk(userVO.getCid());
	 * log.info("result???: " + result); try { if (result == 1) { return
	 * "/user/userJoin"; } else if (result == 0) { // String inputPass =
	 * userVO.getPassword(); // String pwd = pwdEncoder.encode(inputPass); //
	 * userVO.setPassword(pwd); service.userJoin(userVO); }
	 * 
	 * } catch (Exception e) { throw new RuntimeException(); }
	 * 
	 * return "/user/userLogin"; }
	 */

	/*
	 * @GetMapping("/userHome") public String home(Locale locale, Model model) {
	 * log.info("userHome??????");//????????? ?????????????????????. ?????? System.out.println?????? ???????????? ??????????????????.
	 * System.out.println("userHome?????????"); Date date = new Date(); DateFormat
	 * dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
	 * locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate);
	 * 
	 * return "/user/userHome"; }
	 */

	// get?????????
	/*
	 * @GetMapping("/userLogin") public String userLogin() throws Exception {
	 * 
	 * return "/user/userLogin"; }
	 */
	/*
	 * @SuppressWarnings("unused")
	 * 
	 * @PostMapping("/userLogin") public String userLogin(ConsumerVO userVO,
	 * HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 * log.info("????????????????????????"); HttpSession session = req.getSession(); String
	 * memberSession = String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? : " + memberSession); ConsumerVO login =
	 * service.userLogin(userVO);
	 * 
	 * System.out.println("UserVO : " + userVO); System.out.println("DB : " +
	 * login); System.out.println("UserVO??? ?????? : " + userVO.getPassword());
	 * System.out.println("DB??? ?????? : " + login.getPassword()); // boolean pwdMatch =
	 * pwdEncoder.matches(userVO.getPassword(), // login.getPassword()); //
	 * System.out.println("???????????? : " + pwdMatch); if (login == null) {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? else : " + memberSession);
	 * rttr.addFlashAttribute("msg", false);
	 * 
	 * return "redirect:/user/userLogin"; } boolean result =
	 * login.getPassword().equals(userVO.getPassword()); if(result==true){
	 * System.out.println("result ??? : " + result); session.setAttribute("member",
	 * login); session.setAttribute("session_cid", login.getCid());
	 * session.setAttribute("session_cadmin", login.getCadmin()); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? iftrue : " + memberSession); } else {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? else : " + memberSession);
	 * rttr.addFlashAttribute("msg", false); return "redirect:/user/userLogin"; //
	 * rttr.addF~ ??? return??? redirect: ???????????? ??????????????? } return
	 * "redirect:/user/userLogin"; }
	 */
	/*
	 * // ???????????? ??? ?????? ????????? // ???????????? ?????? ??? ??????????????? ?????????
	 * 
	 * @GetMapping("/userLogout") public String userLogout(HttpSession session)
	 * throws Exception { // security-con~ ?????? ?????????????????????????????? session.invalidate();
	 * 
	 * return "redirect:/main/main"; }
	 */

	/*
	 * @GetMapping("/userLogin") public String userLogin() throws Exception {
	 * 
	 * return "/user/userLogin"; }
	 */

	/*
	 * @PreAuthorize("permitAll")
	 * 
	 * @SuppressWarnings("unused")
	 * 
	 * @PostMapping("/userLogin") public String userLogin(ConsumerVO userVO,
	 * HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 * log.info("????????????????????????"); System.out.println("???????????? cid : " + userVO.getCid());
	 * System.out.println("???????????? userVO : " + userVO); HttpSession session =
	 * req.getSession(); String memberSession =
	 * String.valueOf(session.getAttribute("member")); System.out.println("??????????????? : "
	 * + memberSession); ConsumerVO login = service.userLogin(userVO);
	 * 
	 * System.out.println("UserVO : " + userVO); System.out.println("DB : " +
	 * login); System.out.println("UserVO??? ?????? : " + userVO.getPassword());
	 * System.out.println("DB??? ?????? : " + login.getPassword()); boolean pwdMatch =
	 * pwdEncoder.matches(userVO.getPassword(), login.getPassword());
	 * System.out.println("???????????? : " + pwdMatch);
	 * 
	 * if (login == null) { session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? else1 : " + memberSession);
	 * rttr.addFlashAttribute("msg", false);
	 * 
	 * return "redirect:/user/userLogin"; }
	 */
	
	/*
	 * ???????????? ????????? (??????????????????) boolean result =
	 * login.getPassword().equals(userVO.getPassword());
	 * System.out.println("result ??? : "+result);
	 */
	/*
	 * if (pwdMatch == true) { System.out.println("???????????? : " + pwdMatch);
	 * session.setAttribute("member", login); session.setAttribute("session_cid",
	 * login.getCid()); session.setAttribute("session_cadmin", login.getCadmin());
	 * memberSession = String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? iftrue : " + memberSession); } else {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("??????????????? else2 : " + memberSession);
	 * rttr.addFlashAttribute("msg", false); return "redirect:/user/userLogin"; //
	 * rttr.addF~ ??? return??? redirect: ???????????? ??????????????? } return
	 * "redirect:/user/userLogin"; }
	 */
	// ???????????? ??? ?????? ?????????
	// ???????????? ?????? ??? ??????????????? ?????????
	/*
	 * @GetMapping("/userLogout") public String userLogout(HttpSession session)
	 * throws Exception { // security-con~ ?????? ?????????????????????????????? session.invalidate();
	 * 
	 * return "redirect:/main/main"; }
	 */

	// ???????????? ??? ?????? ????????? ????????????????????????
	/*
	 * @GetMapping("/userLogout") public void userLogoutget() { // security-con~ ??????
	 * ?????????????????????????????? session.invalidate(); log.info("???????????? ????????? ??????"); }
	 * 
	 * @PostMapping("/userLogout") public void userLogout() {
	 * log.info("????????????????????? ???????????? ??????");
	 * 
	 * }
	 */
	@PreAuthorize("permitAll")
	@GetMapping("/naverLogin")
	public String login(HttpSession session) {
		String naverAuthUrl=naverLoginBO.getAuthorizationUrl(session);
		System.out.println("????????? ????????? ?????? URL ?????? : "+naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		
		return "redirect:/user/userLogin";
	}
	@PreAuthorize("permitAll")
	@RequestMapping(value="/naver/login",method= {RequestMethod.GET,RequestMethod.POST})
	public String callback(Model model,@RequestParam String code,@RequestParam String state,
			HttpSession session)
					throws IOException, ParseException{
		
		// parse ??????????????? simple??? ?????? ?????? ParseEx~??? simple~??? 
		OAuth2AccessToken oauthToken;
		oauthToken=naverLoginBO.getAccessToken(session,code,state);
		apiResult=naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		
		JSONObject jsonObj=(JSONObject) obj;
		
		JSONObject response_obj=(JSONObject) jsonObj.get("response");
		System.out.println("???????????? API : "+response_obj);
		
		String id=(String) response_obj.get("id");
		String email=(String) response_obj.get("email");
		String userName=(String) response_obj.get("nickname");
		
		ConsumerVO user=new ConsumerVO();
		List<AuthVO> authList=new ArrayList<AuthVO>();
		AuthVO auth =new AuthVO();
		UUID uuid=UUID.randomUUID();
		
		auth.setCid("NAVER"+id);
		auth.setAuth("ROLE_MEMBER");
		authList.add(auth);
		user.setEmail(email);
		user.setCid("NAVER"+id);
		user.setAuthList(authList);
		user.setPassword(uuid.toString());
		user.setNickname(userName);
		System.out.println("INSERT????????? ????????? ?????? : "+user);
		
		if(service.read(user.getCid())==null) {
			service.insertConsumer(user);
		}
		
		CustomUser customUser=new CustomUser(user);
		
		Authentication authentication =new UsernamePasswordAuthenticationToken
				(customUser,null,customUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/main/main";
		
	}
	

	// ????????? ???????????? ????????? -- ajax???????????? ??????
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@GetMapping("/userModify")
	public String userModify() throws Exception {
		return "user/userModify";
	}

	// post ???????????? ??????
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/userModify")
	public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception {
		String beforeCrPw = vo.getPassword();
		vo.setPassword(pwdEncoder.encode(beforeCrPw));
		vo.setAuthList(new ArrayList<AuthVO>());
		vo.getAuthList().add(new AuthVO());
		vo.getAuthList().get(0).setCid(vo.getCid());
		System.out.println("vo : "+vo);
		service.userModify(vo);
		session.invalidate();
		SecurityContextHolder.getContext().setAuthentication(null);
		return "redirect:/user/modifyOk";
	}
	@PreAuthorize("permitAll")
	@GetMapping("/user/modifyOk")
	public String modifyOk() {
		return "/user/modifyOk";
	}

	// ?????? ?????? get
	@PreAuthorize("permitAll")
	@GetMapping("/userDelete")
	public String userDelete(HttpSession session) throws Exception {
		return "/user/userDelete";
	}

	// ?????? ?????? post
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("??????????????????");
		ConsumerVO login = service.userGet(userVO.getCid());
		System.out.println("cid : "+userVO.getCid());
		 boolean pwdMatch = pwdEncoder.matches(userVO.getPassword(),  login.getPassword()); 
		if(pwdMatch==true) {
		service.userDelete(userVO);
		session.invalidate();
		SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "/user/deleteOk";
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/user/mailCheck")
	public String userMailSend() {
		return "/user/mailCheck";
	}
	@PreAuthorize("permitAll")
	@GetMapping("/mailCheckOk")
	public String mailCheckOk() {
		return "/user/mailCheckOk";
	}
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@RequestMapping(value = "/user/mailCheck", method = RequestMethod.POST)
	public String userMailSend(ConsumerVO userVO, Model model, HttpServletRequest request, HttpSession session) {
		// ?????? ?????? ????????? ?????????
				mailsender.mailSendWithUserKey(userVO.getEmail(), userVO.getCid(), request);

				return "/user/mailCheckOk";
	}
	// e-mail ?????? ????????????
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
		@ResponseBody
			@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
			public String key_alterConfirm(@RequestParam("cid") String cid, @RequestParam("user_key") String key) {

				mailsender.alter_userKey_service(cid, key);

				return "/user/userMailSuccess";
			}
	@PreAuthorize("permitAll")
		@GetMapping("/user/userMailSuccess")
		public String userMailSuccess() {
			return "/user/userMailSuccess";
		}
	@PreAuthorize("permitAll")
		@GetMapping("/user/findpw")
		public String findPW() {
			return "/user/findpw";
		}
	
		// ???????????? ??????
	@PreAuthorize("permitAll")
		@RequestMapping(value = "/user/findpw", method = RequestMethod.POST)
		public String passwordSearch(@RequestParam("cid") String cid,
				@RequestParam("email") String email,HttpServletRequest request) throws Exception {
			mailsender.mailSendWithPassword(cid, email,request);
			
			return "/user/mailCheckOk";
		}

}