package org.game.user.service;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.game.user.domain.ConsumerVO;
import org.game.user.domain.UserAttachVO;

public interface UserService {

	// 회원정보상세조회
	public ConsumerVO userGet(String cid);

	// 아이디 중복 체크
	public long idChk(String cid) throws Exception;

	// 아이디 중복 체크
	public long emailChk(String email) throws Exception;

	// 패스워드 중복 체크
	public long passChk(ConsumerVO userVO) throws Exception;

	// 회원가입
	public void userJoin(ConsumerVO userVO) throws Exception;
	
	// 로그인
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception;

	// 회원정보 수정
	public void userModify(ConsumerVO userVO) throws Exception;

	// 회원탈퇴
	public void userDelete(ConsumerVO userVO) throws Exception;

	//이메일발송
	public void sendEmail(ConsumerVO vo, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, ConsumerVO vo) throws Exception;
	
	// 유저 상세창에 같이 딸려오는거
		public List<UserAttachVO> getAttachList(Long cnum);
		
	// 재인 추가 - 회워가입 
	public void insertConsumer(ConsumerVO vo);
}
