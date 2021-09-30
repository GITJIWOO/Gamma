package org.game.user.controller;

import javax.inject.Inject;

import org.game.user.domain.ConsumerVO;
import org.game.user.persistence.UserDAO;
import org.game.user.service.UserServiceTest;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class UserControllerTest {
	@Inject
	private UserDAO dao;
	
	@Test //@Test 전에 실행
	public void testInsertMember() throws Exception{
		ConsumerVO vo = new ConsumerVO();
		vo.setCid("gguri");
		vo.setPassword("1234");
		vo.setEmail("rudals4549@naver.com");
		vo.setNickname("koo");
		
		dao.userJoin(vo);
	}
	//@Test
	/*
	 * public void testSelectMember() throws Exception{ ConsumerVO vo =
	 * dao.selectM("gguri");
	 * System.out.println(vo.getUserid()+"/"+vo.getUsername()+"/" +vo.getEmail()); }
	 */}
