package org.game.user.service;

import org.game.user.domain.QuestionSearchCriteria;
import org.game.user.domain.QuestionVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QuestionServiceTest {
	@Autowired
	private QuestionService service;
	
	//@Test
	public void testAdminOrNot() {
		service.adminOrNot("admin");
	}
	
	//@Test
	public void testAddQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQtitle("serviceTest");
		vo.setQcontent("serviceTest");
		vo.setQwriter("htrew");
		service.addQuestion(vo);
	}
	
	//@Test
	public void testQuestionList() {
		service.questionList("%%");
	}
	//@Test
	public void testCountQuestion() {
		QuestionSearchCriteria cri = new QuestionSearchCriteria();
		service.countQuestion(cri, "%%");
	}
	
	@Test
	public void testQtypeQuestion() {
		service.typeQuestion("소프트웨어 및 게임");
	}
	@Test
	public void testCountQtype() {
		service.countQtype("소프트웨어 및 게임");
	}
	
	//@Test
	public void testOwnQuestion() {
		service.ownQuestion(3);
	}
	
	//@Test
	public void testModifyQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQnum(109);
		vo.setQtype("채팅");
		vo.setQtitle("modifyTest");
		vo.setQcontent("modifyTest");
		service.modifyQuestion(vo);
	}
	
	//@Test
	public void testDeleteQuestion() {
		service.removeQuestion(9);
	}
}