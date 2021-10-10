package org.game.friends.mapper;

import java.util.List;

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
public class FriendsMapperTest {
	@Autowired
	private FriendsMapper mapper;
	
	//@Test
	public void testGetUser() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(1);
		cri.setKeyword("");
		mapper.getUser(cri, "asfgd");
	}
	
	@Test
	public void testGetFOrNot() {
		mapper.getFOrNot("asfgd", "kqrqwr");
	}
	
	//@Test
	public void testInsertFriend() {
		FriendsVO vo = new FriendsVO();
		vo.setFollower("htrew");
		vo.setFollowing("gnmb");
		mapper.insertFriend(vo);
	}
	
	//@Test
	public void testGetFollower() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(1);
		cri.setKeyword("");
		mapper.getFollower("htrew", cri);
	}
	
	//@Test
	public void testGetFollowing() {
		FriendsSearchCriteria cri = new FriendsSearchCriteria();
		cri.setAmount(10);
		cri.setPageNum(2);
		cri.setKeyword("");
		mapper.getFollowing("pegr", cri);
	}
	
	//@Test
	public void testDeleteFriend() {
		mapper.deleteFriend("excfnjg", "htrew");
	}
}