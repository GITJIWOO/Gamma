package org.game.gameinfo.mapper;

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
public class GameInfoMapperTest {
	
	@Autowired
	private GameInfoMapper mapper;
	
	@Test
	public void testGameList() {
		log.info(mapper.gameList("배"));
	}
	
//	@Test
	public void testGameInsert() {
		GameInfoVO vo = new GameInfoVO();
		vo.setGaddress("www.youtube.com/3");
		vo.setGcontent("333");
		vo.setGdeveloper("333");
		vo.setGfublisher("333");
		vo.setGgrade(18);
//		vo.setGlaunch("2021-09-25");
		vo.setGname("333");
		vo.setGprice(30000);
		vo.setGsite("www.wqewqqw.com");
		mapper.insertGame(vo);
	}
	
//	@Test
	public void testGameSelect() {
		mapper.selectGame(6L);
	}
	
//	@Test
	public void testDameDelete() {
		mapper.deleteGame(21L);
	}
	
//	@Test
	public void testGameUpdate() {
		GameInfoVO vo = new GameInfoVO();
		vo.setGaddress("www.youtube.com/3");
		vo.setGcontent("space - war");
		vo.setGdeveloper("bli");
		vo.setGfublisher("bli");
		vo.setGgrade(18);
//		vo.setGlaunch("2222-02-22");
		vo.setGname("starcraft");
		vo.setGprice(10000000);
		vo.setGsite("www.blizard.com");
		vo.setGnum(25L);
		
		mapper.updateGame(vo);
		
	}
	
	
}// end class
