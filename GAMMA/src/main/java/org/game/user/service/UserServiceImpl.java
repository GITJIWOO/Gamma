package org.game.user.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.game.user.domain.ConsumerVO;
import org.game.user.domain.UserAttachVO;
import org.game.user.mapper.UserAttachMapper;
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
	@Inject
	private UserAttachMapper attachMapper;
	// 회원정보상세조회
	@Override
	public ConsumerVO userGet(String cid) {
		return mapper.userGet(cid);
	}

	// 아이디 중복 체크
	@Override
	public long idChk(String cid) throws Exception {
		long result = mapper.idChk(cid);
		return result;
	}

	// 이메일 중복 체크
	@Override
	public long emailChk(String email) throws Exception {
		long result = mapper.emailChk(email);
		return result;
	}

	// 패스워드 중복 체크
	@Override
	public long passChk(ConsumerVO userVO) throws Exception {
		long result = mapper.passChk(userVO);
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
		mapper.authDelete(userVO);
		mapper.userDelete(userVO);
	}

	
	// 이미지 업러드 관련
	@Override
	public List<UserAttachVO> getAttachList(Long cnum) {
		return attachMapper.findByCnum(cnum);
	}

	// 재인 추가 - 회원가입
	@Override
	public void insertConsumer(ConsumerVO vo) {
		mapper.insertConsumer(vo);
		mapper.insertConsumerAuth(vo);
	}

	
}