package org.game.user.service;

import java.util.List;

import javax.inject.Inject;

import org.game.user.domain.ConsumerVO;
import org.game.user.persistence.UserDAO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	// 회원정보상세조회
	@Override
	public ConsumerVO userGet(String cid) {
		return dao.userGet(cid);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(ConsumerVO userVO) throws Exception {
		int result = dao.idChk(userVO);
		return result;
	}

	// 패스워드 중복 체크
	@Override
	public int passChk(ConsumerVO userVO) throws Exception {
		int result = dao.passChk(userVO);
		return result;
	}

	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) throws Exception {
		log.info("유저회원가입실행");
		dao.userJoin(userVO);
	}

	// 로그인
	@Override
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception {
		log.info("로그인실행");
		return dao.userLogin(userVO);
	}

	// 회원정보 수정
	@Override
	public void userModify(ConsumerVO userVO) throws Exception {
		
		 dao.userModify(userVO);
	}

	// 회원탈퇴
	@Override
	public void userDelete(ConsumerVO userVO) throws Exception {
		dao.userDelete(userVO);
	}




}
