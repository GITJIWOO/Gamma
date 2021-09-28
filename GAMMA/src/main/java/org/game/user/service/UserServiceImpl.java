package org.game.user.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;
	@Autowired
	private HttpSession session;

	// 아이디 중복 체크
	@Override
	public int idChk(ConsumerVO userVO) {
		int result =mapper.idChk(userVO);
		return result;
	}
	
	// 패스워드 중복 체크
	@Override
	public int passChk(ConsumerVO userVO) {
		int result =mapper.passChk(userVO);
		return result;
	}
	
	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) {
	log.info("유저회원가입실행");
	mapper.userJoin(userVO);
	}
	
	//로그인
	@Override
	 public ConsumerVO userLogin(ConsumerVO userVO) {
		log.info("로그인실행");
        return mapper.userLogin(userVO);
    }

	@Override
	public ConsumerVO userModify(String cid)  {
        return mapper.userModify(cid);
 }





	@Override
	public void userLogout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userDelete() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public ConsumerVO userSearch(ConsumerVO userVO) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
