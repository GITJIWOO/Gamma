package org.game.user.service;


import javax.inject.Inject;

import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper mapper;
	

	// 회원정보상세조회
	@Override
	public ConsumerVO userGet(String cid) {
		return mapper.userGet(cid);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(ConsumerVO userVO) throws Exception {
		int result = mapper.idChk(userVO);
		return result;
	}

	// 패스워드 중복 체크
	@Override
	public int passChk(ConsumerVO userVO) throws Exception {
		int result = mapper.passChk(userVO);
		return result;
	}

	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) throws Exception {
		log.info("유저회원가입실행");
		mapper.userJoin(userVO);
	}

	// 로그인
	@Override
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception {
		log.info("로그인실행");
		return mapper.userLogin(userVO);
	}

	// 회원정보 수정
	@Override
	public void userModify(ConsumerVO userVO) throws Exception {
		
		 mapper.userModify(userVO);
	}

	// 회원탈퇴
	@Override
	public void userDelete(ConsumerVO userVO) throws Exception {
		mapper.userDelete(userVO);
	}




}
