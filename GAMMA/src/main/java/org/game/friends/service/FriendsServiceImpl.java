package org.game.friends.service;

import java.util.List;

import org.game.friends.domain.FriendsSearchCriteria;
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
	public List<ConsumerVO> UserList(FriendsSearchCriteria criteria, String cid) {
		log.info("전체 회원 목록 조회");
		return mapper.getUser(criteria, cid);
	}

	@Override
	public Integer fOrNot(String follower, String following) {
		log.info("해당 유저가 팔로워인지 조회");
		log.info("follower 체크: " + follower);	// null
		log.info("following 체크: " + following);
		return mapper.getFOrNot(follower, following);
	}
	
	@Override
	public void addFriend(FriendsVO vo) {
		log.info("친구 추가 실행");
		mapper.insertFriend(vo);
	}

	@Override
	public List<FriendsVO> followerList(String following, FriendsSearchCriteria criteria) {
		log.info("로그인 계정이 팔로워하는 계정 조회");
		return mapper.getFollower(following, criteria);
	}

	@Override
	public List<FriendsVO> followingList(String follower, FriendsSearchCriteria criteria) {
		log.info("로그인 계정을 팔로우하는 계정 조회");
		return mapper.getFollowing(follower, criteria);
	}

	@Override
	public void removeFriend(String follower, String following) {
		log.info("친구 삭제 실행");
		mapper.deleteFriend(follower, following);
	}

	@Override
	public int countUser(FriendsSearchCriteria criteria, String cid) {
		log.info("유저 카운트");
		return mapper.getCountUser(criteria, cid);
	}

	@Override
	public int countFollower(FriendsSearchCriteria criteria, String following) {
		log.info("내가 팔로우하는 유저 카운트");
		return mapper.getCountFollower(criteria, following);
	}

	@Override
	public int countFollowing(FriendsSearchCriteria criteria, String follower) {
		log.info("나를 팔로우하는 유저 카운트");
		return mapper.getCountFollowing(criteria, follower);
	}
}
