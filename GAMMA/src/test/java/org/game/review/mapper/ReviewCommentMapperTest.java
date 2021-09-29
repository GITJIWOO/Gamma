package org.game.review.mapper;

import org.game.review.domain.ReviewCommentCriteria;
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
public class ReviewCommentMapperTest {
	
	@Autowired
	private ReviewCommentMapper mapper;
	
	// @Test
	public void reviewCommentSelectTest() {
		ReviewCommentCriteria rccri = new ReviewCommentCriteria();
		rccri.setPageNum(2);
		rccri.setAmount(10);
		log.info(mapper.reviewCommentSelect(23L, rccri));
	}
	
	// @Test
	public void reviewCommentInsertTest() {
		ReviewCommentVO vo = new ReviewCommentVO();
		vo.setGrnum(1L);
		vo.setCid("kjw011231");
		vo.setRccontent("동의동의");
		mapper.reviewCommentInsert(vo);
	}
	
	// @Test
	public void reviewCommentDeleteTest() {
		ReviewCommentVO vo = new ReviewCommentVO();
		vo.setGrnum(1L);
		vo.setRcnum(1L);
		mapper.reviewCommentDelete(vo);
	}
}
