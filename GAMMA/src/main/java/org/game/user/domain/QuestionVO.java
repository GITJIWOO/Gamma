package org.game.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QuestionVO {
	private int qnum;
	// 계정 및 내정보, 소프트웨어 및 게임, 라이브러리, 구매, 친구, 채팅, 어플리케이션, 기타
	private String qtype;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private Date qdate;
}
