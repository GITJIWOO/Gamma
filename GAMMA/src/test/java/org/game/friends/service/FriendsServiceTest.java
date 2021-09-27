package org.game.friends.service;

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
		service.UserList("abc");
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
		service.followerList("asfgd", "dv");
	}
	
	//@Test
	public void testFollowingList() {
		service.followingList("asfgd", "bc");
	}
	
	//@Test
	public void testRemoveFriend() {
		service.removeFriend("excfnjg", "htrew");
	}
	
}
