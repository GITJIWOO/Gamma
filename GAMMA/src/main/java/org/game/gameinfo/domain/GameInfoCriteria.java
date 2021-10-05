package org.game.gameinfo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GameInfoCriteria {

	private int pageNum;
	private int amount;
	
	public GameInfoCriteria() {
		this(1, 10);
	}

	public GameInfoCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
