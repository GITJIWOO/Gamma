package org.game.user.domain;

import lombok.Data;

@Data
public class QuestionSearchCriteria extends QuestionCriteria {
	private String keyword;
}