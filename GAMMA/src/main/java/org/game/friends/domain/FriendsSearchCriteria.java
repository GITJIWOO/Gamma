package org.game.friends.domain;

import lombok.Data;

@Data
public class FriendsSearchCriteria extends FriendsCriteria{
	private String keyword;
}
