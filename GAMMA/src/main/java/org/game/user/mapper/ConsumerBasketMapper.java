package org.game.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.user.domain.ConsumerBasketVO;

public interface ConsumerBasketMapper {
	
	// 장바구니 게임 조회
	public List<ConsumerBasketVO> consumerBasketSelect(String cid);
	
	// 장바구니 게임 하나 조회
	public ConsumerBasketVO consumerGameBasketSelect(@Param("cid") String cid, @Param("gnum") long gnum);
	
	// 장바구니 게임 추가
	public void consumerBasketInsert(@Param("cid") String cid, @Param("gnum") long gnum);
	
	// 장바구니 게임 삭제
	public void consumerBasketDelete(@Param("cid") String cid, @Param("gnum") long gnum);
	
}
