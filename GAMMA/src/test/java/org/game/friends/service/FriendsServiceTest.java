package org.game.friends.service;

import org.game.friends.domain.FriendsSearchCriteria;
import org.game.friends.domain.FriendsVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FriendsServiceTest {
	@Autowired
	private FriendsService service;
	
	//@Test
	public void testUserList() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(1);
		cri.setKeyword("");
		service.UserList(cri, "asfgd");
	}
	
	//@Test
	public void testAddFriends() {
		FriendsVO vo = new FriendsVO();
		vo.setFollower("fteqwa");
		vo.setFollowing("gnmb");
		service.addFriend(vo);
	}
	
	//@Test
	public void testFollowerList() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(1);
		cri.setKeyword("");
		service.followerList("htrew", cri);
	}
	
	@Test
	public void testFollowingList() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(2);
		cri.setKeyword("");
		service.followingList("pegr", cri);
	}
	
	//@Test
	public void testRemoveFriend() {
		service.removeFriend("excfnjg", "htrew");
	}
	
}
