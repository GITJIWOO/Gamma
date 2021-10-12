package org.game.user.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ConsumerBasketVO {
	
	private long sbnum;
	private String cid;
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
	
}
