package org.game.user.domain;

import lombok.Data;

@Data
public class QuesitonSearchCriteria extends QuestionCriteria {
	private String searchType;
	private String keyword;
}
