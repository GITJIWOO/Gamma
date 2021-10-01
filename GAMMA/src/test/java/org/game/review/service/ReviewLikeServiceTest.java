package org.game.review.service;

import static org.junit.Assert.assertNotNull;

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
public class ReviewLikeServiceTest {
	
	@Autowired
	private ReviewLikeService service;

	// @Test
	public void serviceExistTest() {
		assertNotNull(service);
	}
	
	@Test
	public void getReviewLikeTest() {
		service.getReviewLike(23L, "kjw011231");
	}
	
	// @Test
	public void reviewLikeTest() {
		ReviewLikeVO vo = new ReviewLikeVO();
		vo.setGrnum(23L);
		vo.setCid("kjw011231");
		service.reviewLike(vo);
	}
	
	// @Test
	public void reviewLikeCancelTest() {
		service.reviewLikeCancel(23L, "kjw011231");
	}
}
