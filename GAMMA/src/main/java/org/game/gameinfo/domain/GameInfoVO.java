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
	
	private long grnum;
	private String gos;
	private String gprocessor;
	private String gmemory;
	private String ggraphic;
	private String gdirectx;
	private String gstore;
	
	private long gtnum;
	private String tagname;
}
