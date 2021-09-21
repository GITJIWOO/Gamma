package org.game.review.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewCommentVO {
	
	private long rcnum;
	private long grnum;
	private String email;
	private String rccontent;
	private Date rcdate;
}
