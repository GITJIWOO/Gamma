package org.game.user.domain;

import lombok.Data;

@Data
public class AuthVO {
	// 시큐리티 관련  VO
	private String cid;
	private String auth; 

}
