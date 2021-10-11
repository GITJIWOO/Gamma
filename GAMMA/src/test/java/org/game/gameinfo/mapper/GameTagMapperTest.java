package org.game.gameinfo.mapper;

import java.sql.SQLException;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameTagVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GameTagMapperTest {

	@Autowired
	private GameTagMapper mapper;
	
	@Test
	public void testTagSelect() throws Exception {
		log.info(mapper.selectTag(1L));
	}
	
//	@Test
//	public void testTagUnsert() {
//		GameInfoVO vo = new GameInfoVO();
//		vo.setTagname("qwer");
//		vo.setGnum(1L);
//		mapper.insertTag(vo);
//	}
	
//	@Test
	public void testTagDelete() {
		mapper.deleteTag(23L);
	}
	
//	@Test
//	public void testTagUpdate() {
//		GameInfoVO vo = new GameInfoVO();
//		vo.setTagname("asdfasdf");
//		vo.setGtnum(2L);
//		mapper.updateTag(vo);
//	}
}
