package org.game.gamelibrary.service;

import static org.junit.Assert.assertNotNull;

import org.game.review.mapper.ReviewMapperTest;
import org.game.review.service.ReviewServiceTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GameLibraryServiceTest {
	
	@Autowired
	private GameLibraryService service;

	@Test
	public void serviceExistTest() {
		assertNotNull(service);
	}
	
	// @Test
	public void getAllGameLibraryTest() {
		service.getAllConsumerLibrary("kjw011231");
	}
	
	// @Test
	public void additionalLibraryTest() {
		service.additionalLibrary("kjw011231", 1L);
	}
}
