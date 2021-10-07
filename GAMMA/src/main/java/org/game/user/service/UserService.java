package org.game.user.service;


import org.game.user.domain.ConsumerVO;

public interface UserService {

	// 회원정보상세조회
	public ConsumerVO userGet(String cid);

	// 아이디 중복 체크
	public long idChk(ConsumerVO userVO) throws Exception;

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

}
