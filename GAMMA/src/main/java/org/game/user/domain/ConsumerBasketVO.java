package org.game.user.domain;

import java.util.List;

import lombok.Data;

@Data
public class ConsumerBasketVO {
	
	private long sbnum;
	private String cid;
	private long gnum;
	
	private List<ConsumerBasketVO> basketList;
	
}
