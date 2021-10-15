package org.game.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuestionCriteria {
	private int pageNum;	// Integer로 바꿈
	private int amount;
	
	public QuestionCriteria() {
		this(1, 10);
	}
	
	public QuestionCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}