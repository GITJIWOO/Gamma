package org.game.gamepurchase.domain;

import lombok.Data;

@Data
public class GamePurchaseVO {
	
	private String gname;
	private int gprice;
	private String cid;
	private String merchant_uid;
	
}
