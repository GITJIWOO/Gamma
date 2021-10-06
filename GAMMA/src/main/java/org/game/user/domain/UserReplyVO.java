package org.game.user.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserReplyVO {
	private Long rno;
	private Long cnum;
	private String reply;
	private String nickname;
	private Date ureplydate;
	private Date uupdatedate;

}
