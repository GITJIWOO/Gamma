package org.game.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private Long anum;
	private Long qnanum;
	private String acontent;
	private Date adate;
}
