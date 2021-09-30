package org.game.user.mapper;

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
public class AnswerMapperTest {
	@Autowired
	private AnswerMapper mapper;
	
	//@Test
	public void testInsertAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setQnum(551);
		vo.setAcontent("it is my answer");
		mapper.insertAnswer(vo);
	}
	
	//@Test
	public void testGetAnswer() {
		mapper.getAnswer(551);
	}
	
	//@Test
	public void testUpdateAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setAcontent("update answer");
		vo.setAnum(21);
		mapper.updateAnswer(vo);
	}
	
	@Test
	public void testDeleteAnswer() {
		mapper.deleteAnswer(21);
	}
}
