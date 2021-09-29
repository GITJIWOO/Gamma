package org.game.user.persistence;

import org.game.user.domain.ConsumerVO;

public interface UserDAO {
	
	// 회원가입 
	public void userJoin(ConsumerVO userVO) throws Exception;
	
	// 로그인
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception;
	
	// 회원정보수정
	public void userModify(ConsumerVO userVO) throws Exception;
	
	// 회워탈퇴
	public void userDelete(ConsumerVO userVO) throws Exception;
	
	// 아이디 중복체크
	public int idChk(ConsumerVO userVO) throws Exception;

	//패스워드 체크
	public int passChk(ConsumerVO userVO) throws Exception;
	
}