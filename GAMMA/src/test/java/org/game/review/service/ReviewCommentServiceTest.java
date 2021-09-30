package org.game.review.service;

import static org.junit.Assert.assertNotNull;

import org.game.review.domain.ReviewCommentVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewCommentServiceTest {
	
	@Autowired
	private ReviewCommentService service;
	
	// @Test
	public void serviceExistTest() {
		assertNotNull(service);
	}
	
	// @Test
	public void getReviewCommentTest() {
		service.getReviewComment(1L, null);
	}
	
	// @Test
	public void writeReviewCommentTest() {
		ReviewCommentVO reviewComment = new ReviewCommentVO();
		reviewComment.setGrnum(1L);
		reviewComment.setCid("kjw011231");
		reviewComment.setRccontent("동의보감");
		service.writeReviewComment(reviewComment);
	}
	
	// @Test
	public void removeReviewCommentTest() {
		ReviewCommentVO reviewComment = new ReviewCommentVO();
		reviewComment.setGrnum(1L);
		reviewComment.setRcnum(1L);
		service.removeReviewComment(reviewComment);
	}
}
