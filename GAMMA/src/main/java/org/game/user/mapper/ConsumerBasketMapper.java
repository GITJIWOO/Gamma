package org.game.user.mapper;

import org.game.user.domain.ConsumerBasketVO;

public interface ConsumerBasketMapper {
	
	// 장바구니 게임 조회
	public ConsumerBasketVO ConsumerBasketSelect(String cid);
	
	// 장바구니 게임 추가
	public void ConsumerBasketInsert(String cid, long gnum);
	
	// 장바구니 게임 삭제
	public void ConsumerBasketDelete(long sbnum);
	
}
