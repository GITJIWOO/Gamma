package org.game.gamepurchase.service;

import java.util.List;

import org.game.gamepurchase.domain.GamePurchaseVO;

public interface GamePurchaseService {
	
	public List<GamePurchaseVO> getPaymentList(String cid);
	
	public void paymentInputInfo(GamePurchaseVO gpVO);
	
}
