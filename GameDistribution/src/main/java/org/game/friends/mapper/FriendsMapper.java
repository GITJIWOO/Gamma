package org.game.friends.mapper;

import java.util.List;

import org.game.friends.domain.FriendsVO;

public interface FriendsMapper {
	// 친구 추가(insert-selectKey)
	public void insertFriend(FriendsVO vo);
	
	// 친구 목록 조회(select)
	public List<FriendsVO> getFList(String keyword);
	
	// 친구 여부(select)
	public FriendsVO getFriend(String following);
	
	// 친구 삭제(delete)
	public void deleteFriend(String follower);
}
