package org.game.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private int anum;
	private int qnum;
	private String acontent;
	private Date adate;
}
