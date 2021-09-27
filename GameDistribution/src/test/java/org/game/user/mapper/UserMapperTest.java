package org.game.user.mapper;

import org.game.user.domain.ConsumerVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testInsert() {
		ConsumerVO userVO=new ConsumerVO();
		
		userVO.setCid("테스트용아디");
		userVO.setEmail("testEamil");
		userVO.setNickname("testNickname");
		userVO.setPassword("testPWD");
		
		mapper.userJoin(userVO);
		
	}
	
}
