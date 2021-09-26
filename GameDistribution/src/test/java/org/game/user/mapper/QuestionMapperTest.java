package org.game.user.mapper;

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
public class QuestionMapperTest {
	@Autowired
	private QuestionMapper mapper;
	
	@Test
	public void testGetAdmin() {
		mapper.getAdmin("admin");
	}
	
	//@Test
	public void testInsertQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQtype("구매");
		vo.setQtitle("insertTest");
		vo.setQcontent("insertTest");
		vo.setQwriter("excfnjg");
		mapper.insertQuestion(vo);
	}
	
	//@Test
	public void testGetQuestionList() {
		log.info(mapper.getQuestionList("%%"));	// 관리자일 경우 %% 넣어주는 것으로 고정 
	}
	
	//@Test
	public void testGetQtypeQuestion() {
		log.info(mapper.getQtypeQuestion("계정 및 내정보"));
	}
	
	//@Test
	public void testGetOwnQuestion() {
		log.info(mapper.getOwnQuestion(2L));
	}
	
	//@Test
	public void testUpdateQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQnum(7L);
		vo.setQtitle("updateTest");
		vo.setQcontent("updateTest");
		mapper.updateQuestion(vo);
	}
	
	//@Test
	public void testDeleteQuestion() {
		mapper.deleteQuestion(2L);
	}
}
