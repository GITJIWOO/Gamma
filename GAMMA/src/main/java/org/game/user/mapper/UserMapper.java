package org.game.user.mapper;


import org.apache.ibatis.annotations.Param;
import org.game.user.domain.ConsumerVO;

public interface UserMapper {
	
	
	// 유저정보 상세조회
	public ConsumerVO userGet(String cid);
	
	// 비밀번호 변경
	public int updatePw(ConsumerVO vo) throws Exception;

	
	// 회원가입 
	public void userJoin(ConsumerVO userVO) throws Exception;
	
	// 로그인
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception;
	
	// 회원정보수정
	public void userModify(ConsumerVO userVO) throws Exception;
	
	// 회워탈퇴
	public void userDelete(ConsumerVO userVO) throws Exception;
	public void authDelete(ConsumerVO userVO) throws Exception;
	
	// 아이디 중복체크
	public long idChk(String cid) throws Exception;

	// email 중복체크
	public long emailChk(String email) throws Exception;

	//패스워드 체크
	public long passChk(ConsumerVO userVO) throws Exception;
	
	// 재인 추가
	public ConsumerVO read(String cid);
	
	// 회원가입
	public void insertConsumer(ConsumerVO vo);
	public void insertConsumerAuth(ConsumerVO vo);
	
}