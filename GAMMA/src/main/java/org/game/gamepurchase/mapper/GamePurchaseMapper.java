package org.game.gamepurchase.mapper;

import java.util.List;

import org.game.gamepurchase.domain.GamePurchaseVO;

public interface GamePurchaseMapper {
	
	public List<GamePurchaseVO> patmentSelect(String cid);
	
	public void paymentInsert(GamePurchaseVO gpVO);
	
}
