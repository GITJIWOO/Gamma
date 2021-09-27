package org.game.user.service;

import static org.junit.Assert.assertNotNull;

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
public class UserServiceTest {
	 @Autowired
	 private UserService service;
	 
	// @Test
	 public void testService() {
		 log.info(service);
		 assertNotNull(service);
	 }
	 
	 @Test
	 public void testuserJoin() {
		 ConsumerVO userVO=new ConsumerVO();
		 	userVO.setCid("서비스용아디");
			userVO.setEmail("서비스Eamil");
			userVO.setNickname("서비스Nickname");
			userVO.setPassword("서비스PWD");
			
		 service.userJoin(userVO);
	 }
	
	
}
