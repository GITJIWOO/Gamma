package org.game.gameinfo.domain;

import lombok.Data;

@Data
public class GameSearchCriteria extends GameInfoCriteria {

	private String searchType;
	private String keyword;
}
