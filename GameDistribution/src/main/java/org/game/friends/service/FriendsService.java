package org.game.friends.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.friends.domain.FriendsVO;
import org.game.user.domain.ConsumerVO;

public interface FriendsService {
	public List<ConsumerVO> UserList(String keyword);
	
	public void addFriend(FriendsVO vo);
	
	public List<FriendsVO> FollowerList(@Param("following")String following, @Param("keyword")String keyword);
	
	public List<FriendsVO> FollowingList(@Param("follower")String follower, @Param("keyword")String keyword);
	
	public void removeFriend(@Param("follower")String follower, @Param("following")String following);
}
