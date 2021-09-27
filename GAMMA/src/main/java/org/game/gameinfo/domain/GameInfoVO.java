package org.game.gameinfo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GameInfoVO {
	
	private long gNum;
	private String gName;
	private Date gLaunch;
	private String gDeveloper;
	private String gFublisher;
	private int gPrice;
	private String gContent;
	private int gGrade;
	private String gSite;
	private String gAddress;
}
