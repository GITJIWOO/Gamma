package org.game.friends.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.friends.domain.FriendsSearchCriteria;
import org.game.friends.domain.FriendsVO;
import org.game.user.domain.ConsumerVO;

public interface FriendsService {
	public List<ConsumerVO> UserList(@Param("cri")FriendsSearchCriteria criteria, @Param("cid")String cid);
	
	public void addFriend(FriendsVO vo);
	
	public List<FriendsVO> followerList(@Param("following")String following, @Param("cri")FriendsSearchCriteria criteria);
	
	public List<FriendsVO> followingList(@Param("follower")String follower, @Param("cri")FriendsSearchCriteria criteria);
	
	public void removeFriend(@Param("follower")String follower, @Param("following")String following);
	
	public int countUser(@Param("cri")FriendsSearchCriteria criteria, String cid);
}
