package org.game.gamelibrary.mapper;

import org.game.gamelibrary.domain.GameLibraryVO;
import org.game.review.mapper.ReviewMapperTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GameLibraryMapperTest {
	
	@Autowired
	private GameLibraryMapper mapper;
	
	// @Test
	public void librarySelectTest() {
		log.info(mapper.librarySelect("kjw011231"));
	}
	
	// @Test
	public void libraryInsertTest() {
		GameLibraryVO vo = new GameLibraryVO();
		vo.setCid("kjw011231");
		vo.setGnum(1L);
		mapper.libraryInsert(vo.getCid(), vo.getGnum());
	}
}
