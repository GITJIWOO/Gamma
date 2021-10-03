package org.game.review.mapper;

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
public class ReviewMapperTest {
	
	@Autowired
	private ReviewMapper mapper;
	
	// @Test
	public void reviewListTest() {
		log.info(mapper.reviewList(1L));
	}
	
	// @Test
	public void reviewSelectTest() {
		log.info(mapper.reviewSelect(1));
	}
	
	// @Test
	public void reviewInsertTest() {
		ReviewVO vo = new ReviewVO();
		vo.setGrnum(1);
		vo.setGnum(1);
		vo.setCid("kjw011231");
		vo.setGrlike(1);
		vo.setGrtitle("재미있다");
		vo.setGrcontent("재미재미 있다");
		vo.setGrrecommend(0);
		mapper.reviewInsert(vo);
	}
	
	// @Test
	public void reviewUpdateTest() {
		ReviewVO vo = new ReviewVO();
		vo.setGrnum(1);
		vo.setGnum(1);
		vo.setCid("kjw011231");
		vo.setGrlike(0);
		vo.setGrtitle("재미없다2");
		vo.setGrcontent("재미 없어졌다2");
		vo.setGrrecommend(0);
		mapper.reviewUpdate(vo);
	}
	
	// @Test
	public void reviewDeleteTest() {
		mapper.reviewDelete(2L);
	}
	
	// @Test
	public void reviewLikeTest() {
		mapper.reviewLike(1L);
	}
	
	// @Test
	public void reviewLikeDeleteTest() {
		mapper.reviewLikeDelete(1L);
	}
}
