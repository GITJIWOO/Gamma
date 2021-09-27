package org.game.review.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration
public class ReviewControllerTest {
	
	@Autowired
	WebApplicationContext ctx; 
	
	MockMvc mockMvc; 
	
	@Before
	public void setUpMockMvc() { 
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build(); 
	}
	
	@Test
	public void getReviewListTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.get("/review/reviewList?gnum=1"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	// @Test
	public void getReviewDetailTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.get("/review/reviewDetail/1"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	// @Test
	public void writeReviewTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewWrite")
						.param("gnum", "1")
						.param("cid", "kjw011231")
						.param("grlike", "1")
						.param("grtitle", "테스트제목제목")
						.param("grcontent", "테스트내용내용"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	// @Test
	public void modifyReviewTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewModify")
						.param("gnum", "1")
						.param("cid", "kjw011231")
						.param("grlike", "0")
						.param("grtitle", "테스트제목제목수정")
						.param("grcontent", "테스트내용내용수정"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	// @Test
	public void removeReviewTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewRemove?grnum=2"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	// @Test
	public void likeReviewTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewLike?grnum=1"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	// @Test
	public void writeReviewCommentTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewCommmentWrite")
						.param("grnum", "1")
						.param("cid", "kjw011231")
						.param("rccontent", "댓글테스트내용"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	// @Test
	public void removeReviewCommentTest() throws Exception {
		String resultPage = mockMvc.perform(
					MockMvcRequestBuilders.post("/review/reviewCommentRemove?grnum=2"))
						.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
