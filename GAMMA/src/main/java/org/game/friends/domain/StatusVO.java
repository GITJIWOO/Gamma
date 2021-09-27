package org.game.friends.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class StatusVO {
	private Long snum;
	private String semail;
	private Date sdate;
}
