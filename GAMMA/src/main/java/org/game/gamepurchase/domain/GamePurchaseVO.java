package org.game.gamepurchase.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GamePurchaseVO {
	
	private String gname;
	private int gprice;
	private String cid;
	private Date cpdate;
	private String merchant_uid;
	
}
