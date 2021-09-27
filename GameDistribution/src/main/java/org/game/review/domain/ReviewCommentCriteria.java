package org.game.review.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewCommentCriteria {
	
	private int pageNum;
	private int amount;
	
	public ReviewCommentCriteria() {
		this(1, 10);
	}
	
	public ReviewCommentCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
