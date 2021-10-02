package org.game.review.mapper;

import org.game.review.domain.ReviewLikeVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewLikeMapperTest {
	
	@Autowired
	private ReviewLikeMapper mapper;
	
	// @Test
	public void ReviewLikeSelectTest() {
		mapper.reviewLikeSelect(23L, "kjw011231");
	}
	
	// @Test
	public void ReviewLikeTest() {
		ReviewLikeVO rlvo = new ReviewLikeVO();
		rlvo.setGrnum(23L);
		rlvo.setCid("kjw011231");
		mapper.reviewLikeInsert(rlvo);
	}
	
	// @Test
	public void ReviewLikeDeleteTest() {
		mapper.reviewLikeDelete(23L, "kjw011231");
	}
}
