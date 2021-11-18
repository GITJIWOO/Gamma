package org.game.user.service;

import java.util.List;

import org.game.user.domain.ConsumerBasketVO;
import org.game.user.mapper.ConsumerBasketMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConsumerBasketServiceImpl implements ConsumerBasketService {
	
	@Autowired
	private ConsumerBasketMapper mapper;

	// 장바구니 게임 조회
	@Override
	public List<ConsumerBasketVO> getConsumerBasketList(String cid) {
		List<ConsumerBasketVO> basketList = mapper.consumerBasketSelect(cid);
		return basketList;
	}
	
	// 장바구니 게임 하나 조회
	public ConsumerBasketVO getOneConsumerBasket(String cid, long gnum) {
		ConsumerBasketVO basket = mapper.consumerGameBasketSelect(cid, gnum);
		return basket;
	}

	// 장바구니 게임 추가
	@Override
	public void additionConsumerBasket(String cid, long gnum) {
		mapper.consumerBasketInsert(cid, gnum);
	}

	@Override
	// 장바구니 게임 삭제
	public void removeConsumerBasket(String cid, long gnum) {
		mapper.consumerBasketDelete(cid, gnum);
	}


}
