package org.game.gameinfo.service;

import static org.junit.Assert.assertNotNull;

import org.game.friends.service.FriendsServiceTest;
import org.game.gameinfo.domain.GameInfoVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GameInfoServiceTest {

	@Autowired
	private GameInfoService service;

//	@Test
	public void testExist() {
		log.info(service);

		// 객체 null인 경우 에러 발생
		/// 테스트시 null인 경우 fail, null 아닌 경우 success
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister() {
		GameInfoVO vo = new GameInfoVO();
		vo.setGaddress("www.youtube.com/aaaaaa");
		vo.setGcontent("aaa");
		vo.setGdeveloper("aaa");
		vo.setGfublisher("aaa");
		vo.setGgrade(18);
		vo.setGlaunch("2021-09-27");
		vo.setGname("aaa");
		vo.setGprice(11111);
		vo.setGsite("www.aaaaa.com");
		service.registerGame(vo);
	}
	
//	@Test
	public void testGameList() {
		service.gameList("배");
	}
	
	@Test
	public void testGameSelect() {
		service.getGame(1L);
	}
	
//	@Test
	public void testGameDelete() {
		service.removeGame(23L);
	}
	
//	@Test
	public void testGameUpdate() {
		GameInfoVO vo = new GameInfoVO();
		vo.setGaddress("www.youtube.com/3");
		vo.setGcontent("space - war");
		vo.setGdeveloper("bli");
		vo.setGfublisher("bli");
		vo.setGgrade(18);
		vo.setGlaunch("2222-02-22");
		vo.setGname("starcraft");
		vo.setGprice(10000000);
		vo.setGsite("www.blizard.com");
		vo.setGnum(25L);
		service.modifyGame(vo);
		
	}

}
