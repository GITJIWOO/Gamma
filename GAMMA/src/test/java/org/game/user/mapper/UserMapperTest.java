package org.game.user.mapper;

import org.game.user.domain.ConsumerVO;
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
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@WebAppConfiguration 
public class UserMapperTest {
	@Autowired
	private UserMapper mapper;
	@Autowired
	private WebApplicationContext ctx;
	
	// 브라우저 없이 모의로 접속하는 기능을 가진 객체
	private MockMvc mockMvc;
	
	// @Test 이전에 실행할 내용을 기술하는 어노테이션
	// 주의! org.junit.before로 입력해주세요.
	//@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.
				webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testList() throws Exception {
		
		log.info(
			// .get(접속주소)/.post(접속주소) 를 제외한 나머지는
			// 다 고정된 양식을 가진 코드이므로 복잡해보이지만
			// 실제로는 복사붙여넣기로 쓰셔도 무방합니다.
			// .get(접속주소)를 입력하면 get방식으로 해당 주소에
			// 접속합니다.
			// /board/list 에 접속하면 글 목록 가져오기 페이지이기 때문에
			// 글 전체 목록을 가져오는지 여부를 테스트해야 합니다.
			mockMvc.perform(
				MockMvcRequestBuilders.get("/user/userJoin"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	
	
	//@Test
	public void testuserJoin() throws Exception {
		ConsumerVO userVO =new ConsumerVO();
			userVO.setCid("test");
			userVO.setEmail("test@test.test");
			userVO.setNickname("test");
			userVO.setPassword("test");
		    mapper.userJoin(userVO);
	}
	
	//@Test
	/*public void testLogin() throws Exception {
		ConsumerVO vo = mapper.userLogin("user00");
		log.info(vo);
		vo.getAuthList();
	}*/

	

}
