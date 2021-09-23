package org.game.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QuestionVO {
	private Long qnum;
	private String qtitle;
	private String qcontent;
	private String qemail;
	private Date qdate;
}
