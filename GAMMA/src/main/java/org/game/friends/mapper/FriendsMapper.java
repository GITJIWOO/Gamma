package org.game.friends.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.friends.domain.FriendsSearchCriteria;
import org.game.friends.domain.FriendsVO;
import org.game.user.domain.ConsumerVO;

public interface FriendsMapper {
	// 친구 추가를 위한 전체 회원 조회 
	public List<ConsumerVO> getUser(@Param("cri")FriendsSearchCriteria criteria, @Param("cid")String cid);
	
	// 친구 추가(insert-selectKey)
	public void insertFriend(FriendsVO vo);
	
	// 내가 follow 하는 친구(로그인 계정=following) 목록 조회(select)
	public List<FriendsVO> getFollower(@Param("following")String following, @Param("cri")FriendsSearchCriteria criteria);
	
	// 나를 follow 하는 친구(로그인 계정=follower) 목록 조회(select)
	public List<FriendsVO> getFollowing(@Param("follower")String follower, @Param("cri")FriendsSearchCriteria criteria);
	
	// 전체 회원 명수 조회
	public int getCountUser(@Param("cri")FriendsSearchCriteria criteria, @Param("cid")String cid);
	
	// 친구 삭제(delete)
	public void deleteFriend(@Param("follower")String follower, @Param("following")String following);
}