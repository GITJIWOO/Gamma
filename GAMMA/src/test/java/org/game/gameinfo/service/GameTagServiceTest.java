package org.game.gameinfo.service;

import static org.junit.Assert.assertNotNull;

import org.game.gameinfo.domain.GameTagVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GameTagServiceTest {

	@Autowired
	private GameTagService service;

//	@Test
	public void testExist() {
		log.info(service);

		// 객체 null인 경우 에러 발생
		/// 테스트시 null인 경우 fail, null 아닌 경우 success
		assertNotNull(service);
	}

//	@Test
	public void testRegister() {
		GameTagVO vo = new GameTagVO();
		vo.setTagname("zzzzz");
		vo.setGnum(1);
		service.registerTag(vo);

	}

//	@Test
	public void testTagSelect() {
		service.getTag(1L);
	}

//	@Test
	public void testTagDelete() {
		service.removeTag(82L);
	}
	
	@Test
	public void testTagUpdate() {
		GameTagVO vo = new GameTagVO();
		vo.setTagname("수정 qwer");
		vo.setGtnum(62L);
		service.modifyTag(vo);
		
	}
}
