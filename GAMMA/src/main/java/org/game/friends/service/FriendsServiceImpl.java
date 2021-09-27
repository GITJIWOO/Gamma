package org.game.friends.service;

import java.util.List;

import org.game.friends.domain.FriendsVO;
import org.game.friends.mapper.FriendsMapper;
import org.game.user.domain.ConsumerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FriendsServiceImpl implements FriendsService{
	
	@Autowired
	private FriendsMapper mapper;

	@Override
	public List<ConsumerVO> UserList(String keyword) {
		log.info("전체 회원 목록 조회");
		return mapper.getUser(keyword);
	}

	@Override
	public void addFriend(FriendsVO vo) {
		log.info("친구 추가 실행");
		mapper.insertFriend(vo);
		
	}

	@Override
	public List<FriendsVO> followerList(String following, String keyword) {
		log.info("로그인 계정이 팔로워하는 계정 조회");
		return mapper.getFollower(following, keyword);
	}

	@Override
	public List<FriendsVO> followingList(String follower, String keyword) {
		log.info("로그인 계정을 팔로우하는 계정 조회");
		return mapper.getFollowing(follower, keyword);
	}

	@Override
	public void removeFriend(String follower, String following) {
		log.info("친구 삭제 실행");
		mapper.deleteFriend(follower, following);
	}

}
