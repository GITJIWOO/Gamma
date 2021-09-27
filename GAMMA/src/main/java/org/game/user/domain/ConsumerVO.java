package org.game.user.domain;

import lombok.Data;

@Data
public class ConsumerVO {
	private Long cnum;
	private String cid;
	private String email;
	private String password;
	private String nickname;
	private int cadmin;
}
