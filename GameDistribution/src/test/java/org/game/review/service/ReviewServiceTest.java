package org.game.review.service;

import static org.junit.Assert.assertNotNull;

import org.game.review.domain.ReviewVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTest {
	
	@Autowired
	private ReviewService service;

	// @Test
	public void serviceExistTest() {
		assertNotNull(service);
	}
	
	// @Test
	public void getNewReviewTest() {
		service.getNewReview();
	}
	
	// @Test
	public void getFamousReview() {
		service.getFamousReview();
	}
	
	// @Test
	public void getReviewDetailTest() {
		service.getReviewDetail(1L);
	}
	
	// @Test
	public void writeReviewTest() {
		ReviewVO review = new ReviewVO();
		review.setGnum(1L);
		review.setCid("kjw011231");
		review.setGrlike(1);
		review.setGrtitle("리뷰 제목");
		review.setGrcontent("리뷰 내용");
		service.writeReview(review);
	}
	
	// @Test
	public void modifyReviewTest() {
		ReviewVO review = new ReviewVO();
		review.setGnum(1L);
		review.setCid("kjw011231");
		review.setGrlike(0);
		review.setGrtitle("수정 한 리뷰 제목");
		review.setGrcontent("수정 한 리뷰 내용");
		service.modifyReview(review);
	}
	
	// @Test
	public void removeReviewTest() {
		service.removeReview(1L);
	}
}
