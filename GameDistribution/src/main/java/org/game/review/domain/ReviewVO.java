package org.game.review.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private long grnum;
	private long gnum;
	private String email;
	private int grlike;
	private String grtitle;
	private String grcontent;
	private long grrecommend;
	private Date grdate;
}
