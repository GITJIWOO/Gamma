package org.game.user.service;

import org.game.user.domain.AnswerVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AnswerServiceTest {
	@Autowired
	private AnswerService service;
	
	//@Test
	public void testAddAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setQnum(555);
		vo.setAcontent("answer service test");
		service.addAnswer(vo);
	}
	
	//@Test
	public void testGetAnswer() {
		service.getAnswer(555);
	}
	
	//@Test
	public void testModifyAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setAnum(42);
		vo.setAcontent("answer update service test");
		service.modifyAnswer(vo);
	}
	
	@Test
	public void testRemoveAnswer() {
		service.removeAnswer(42);
	}
}
