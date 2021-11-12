package org.game.user.dao;

import org.game.user.domain.ConsumerVO;

public interface UserDao {
	
	int GetKey(String cid, String user_key); // 유저 인증키 생성 메서드
	int alter_userKey(String cid, String key); // 유저 인증키 Y로 바꿔주는 메서드
	int searchPassword(String cid, String email, String key); // 회원 임시 비밀번호 변경 메서드
	ConsumerVO userInfo(String cid);
}
