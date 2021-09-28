package org.game.user.domain;

public interface UserDAO {
	
	// 회원가입 
	public void userJoin(ConsumerVO userVO) throws Exception;
	
	// 회원정보수정
	public void userModify(ConsumerVO userVO) throws Exception;
	
	// 회워탈퇴
	public void userDelete(ConsumerVO userVO) throws Exception;
	
	// 아이디 중복체크
	public int idChk(ConsumerVO userVO) throws Exception;

	//패스워드 체크
	public int passChk(ConsumerVO userVO) throws Exception;
}
