package org.game.user.service;

import org.game.user.domain.ConsumerVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class UserServiceTest {

	@Autowired
	private UserService service;
	
	

	/*
	 * //@Test public void testuserJoin() { ConsumerVO userVO = new ConsumerVO();
	 * userVO.setCid("서비스아디"); userVO.setEmail("서비스이메일");
	 * userVO.setNickname("서비스닉넴"); userVO.setPassword("서비스비번");
	 * service.userJoin(userVO); } //@Test public void testuserLogin() { ConsumerVO
	 * userVO = new ConsumerVO(); String cid="서비스아디"; service.userLogin(userVO); }
	 */
}
