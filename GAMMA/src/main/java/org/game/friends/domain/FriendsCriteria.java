package org.game.friends.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FriendsCriteria {
	private int pageNum;
	private int amount;
	
	public FriendsCriteria() {
		this(1, 10);
	}
	
	public FriendsCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
