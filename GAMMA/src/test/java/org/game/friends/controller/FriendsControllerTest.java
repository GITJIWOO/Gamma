package org.game.friends.controller;

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
public class FriendsControllerTest {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testMain() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/friends/friendsmain")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);
	}
	
	//@Test - controller 완성하고 다시 테스트 해야함  
	public void testFollowerList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/friends/followerlist")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);
	}
	
	//@Test - param()에는 controller에서 작성한 파라미터명을 넣어줘야 함 
	public void testFollowerRemove() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/friends/followerremove")
					.param("follower", "asfgd")
					.param("cid", "bfads"))
				.andReturn()
				.getModelAndView()
				.getViewName()
		);
	}
	
	//@Test - controller 완성하고 다시 테스트 해야함  
	public void testFollowingList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/friends/followinglist")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//@Test
	public void testFollowingRemove() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/friends/followingremove")
					.param("cid", "asfgd")
					.param("following", "bfads"))
				.andReturn()
				.getModelAndView()
				.getViewName()
		);
	}
	
	@Test
	public void testSearchFriends() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/friends/searchfriends")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
				/* 키워드 넣어서 검색
					.param("keyword", ""))
				.andReturn()
				.getModelAndView()
				.getViewName()
		);*/
	}
}
