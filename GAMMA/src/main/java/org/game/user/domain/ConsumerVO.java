package org.game.user.domain;


import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ConsumerVO {
	private Long cnum;
	private String cid;
	private String email;
	private String password;
	private String nickname;
	private Long cadmin;
	private Date userregdate;
	private Date userupdatedate;
	//private boolean enabled;
	
	private List<UserAttachVO> attachList;
}
