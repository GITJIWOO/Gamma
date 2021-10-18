package org.game.gameinfo.domain;

import java.sql.Date;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class GameInfoVO {
	
	private long gnum;
	private String gname;
	private Date glaunch;
	private String gdeveloper;
	private String gfublisher;
	private int gprice; 
	private String gcontent;
	private int ggrade;
	private String gsite;
	private String gaddress;
	private String gpicture;	// 사진
	
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
