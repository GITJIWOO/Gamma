package org.game.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.user.domain.AuthVO;
import org.game.user.domain.ConsumerVO;
import org.game.user.domain.CustomUser;
import org.game.user.naver.NaverLoginBO;
import org.game.user.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/friends/*")
public class HomeController {
	
	@Autowired
	UserService service;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult="";

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("/chatting")
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		
		return "/friends/chat";
	}
	@GetMapping("/naverLogin")
	public String login(HttpSession session) {
		String naverAuthUrl=naverLoginBO.getAuthorizationUrl(session);
		System.out.println("발급된 일회용 접근 URL 확인 : "+naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		
		return "redirect:/user/userLogin";
	}
	
	@RequestMapping(value="/naver/login",method= {RequestMethod.GET,RequestMethod.POST})
	public String callback(Model model,@RequestParam String code,@RequestParam String state,
			HttpSession session)
					throws IOException, ParseException{
		
		// parse 임포트할때 simple로 전부 위의 ParseEx~도 simple~로 
		OAuth2AccessToken oauthToken;
		oauthToken=naverLoginBO.getAccessToken(session,code,state);
		apiResult=naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		
		JSONObject jsonObj=(JSONObject) obj;
		
		JSONObject response_obj=(JSONObject) jsonObj.get("response");
		System.out.println("파싱해온 API : "+response_obj);
		
		String cid=(String) response_obj.get("cid");
		String email=(String) response_obj.get("email");
		String nickname=(String) response_obj.get("nickname");
		
		ConsumerVO user=new ConsumerVO();
		List<AuthVO> authList=new ArrayList<AuthVO>();
		AuthVO auth =new AuthVO();
		UUID uuid=UUID.randomUUID();
		auth.setCid("NAVER"+cid);
		auth.setAuth("ROLE_MEMBER");
		authList.add(auth);
		
		user.setCid("NAVER"+cid);
		user.setAuthList(authList);
		user.setPassword(uuid.toString());
		user.setNickname(nickname);
		System.out.println("INSERT하기전 마지막 체크 : "+user);
		
		if(service.read(user.getCid())==null) {
			service.insertConsumer(user);
		}
		
		CustomUser customUser=new CustomUser(user);
		
		Authentication authentication =new UsernamePasswordAuthenticationToken
				(customUser,null,customUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/main/main";
		
	}
}
