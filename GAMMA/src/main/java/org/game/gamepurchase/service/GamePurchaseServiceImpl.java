package org.game.gamepurchase.service;

import java.util.List;

import org.game.gamepurchase.domain.GamePurchaseVO;
import org.game.gamepurchase.mapper.GamePurchaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GamePurchaseServiceImpl implements GamePurchaseService {
	
	@Autowired
	private GamePurchaseMapper mapper;

	@Override
	public List<GamePurchaseVO> getPaymentList(String cid) {
		List<GamePurchaseVO> paymentList = mapper.patmentSelect(cid);
		return paymentList;
	}

	@Override
	public void paymentInputInfo(GamePurchaseVO gpVO) {
		mapper.paymentInsert(gpVO);
	}

}
