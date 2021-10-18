package org.game.user.service;

import java.util.List;

import org.game.user.domain.ConsumerBasketVO;

public interface ConsumerBasketService {
	
	// 장바구니 게임 조회
	public List<ConsumerBasketVO> getConsumerBasketList(String cid);
	
	// 장바구니 게임 하나 조회
	public ConsumerBasketVO getOneConsumerBasket(String cid, long gnum);
	
	// 장바구니 게임 추가
	public void additionConsumerBasket(String cid, long gnum);
	
	// 장바구니 게임 삭제
	public void removeConsumerBasket(String cid, long gnum);
	
}
