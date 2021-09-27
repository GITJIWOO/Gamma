package org.game.friends.domain;

import lombok.Data;

@Data
public class FriendsVO {
	private Long fnum;
	private String follower;	// 로그인된 계정을 기준으로 다른 사람 이메일
	private String following;	// 로그인된 계정(해당 계정이 팔로우 하는 계정이 follower)
}
