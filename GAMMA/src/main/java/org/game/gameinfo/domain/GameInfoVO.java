package org.game.gameinfo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GameInfoVO {
	
	private long gnum;
	private String gname;
	private String glaunch;
	private String gdeveloper;
	private String gfublisher;
	private int gprice;
	private String gcontent;
	private int ggrade;
	private String gsite;
	private String gaddress;
}
