package org.game.gameinfo.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
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
//	public void testRegister() {
//		String[] tags = new String[] { "aaa", "bbb", "ccc" };
//		for (int i = 0; i < tags.length; i++) {
//			GameInfoVO vo = new GameInfoVO();
//			log.info(tags[i]);
//			vo.setGnum(542);
//			vo.setTagname(tags[i]);
//			service.registerTag(tags, vo);
//		}
//
//	}

//	@Test
	public void testTagSelect() {
		service.getTag(1L);
	}

//	@Test
	public void testTagDelete() {
		service.removeTag(82L);
	}

////	@Test
//	public void testTagUpdate() {
//		GameInfoVO vo = new GameInfoVO();
//		vo.setTagname("수정 qwer");
//		vo.setGtnum(62L);
//		service.modifyTag(vo);
//
//	}
}
