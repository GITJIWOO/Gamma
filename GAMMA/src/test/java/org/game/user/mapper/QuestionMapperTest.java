package org.game.user.mapper;

import java.util.List;

import org.game.user.domain.QuestionCriteria;
import org.game.user.domain.QuestionPageDTO;
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
public class QuestionMapperTest {
	@Autowired
	private QuestionMapper mapper;
	
	//@Test
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
	
	@Test
	public void testGetQuestionListP() {
		QuestionSearchCriteria cri = new QuestionSearchCriteria();
		cri.setKeyword("dgjf");
		cri.setAmount(10);
		cri.setPageNum(3);
		mapper.getQuestionListP(cri, "%%");	// 관리자일 경우 %% 넣어주는 것으로 고정 
	}

	//@Test
	public void testGetCountQuestion() {
		QuestionSearchCriteria cri = new QuestionSearchCriteria();
		mapper.getCountQuestion(cri, "%%");
	}
	
	//@Test
	public void testGetQtypeQuestion() {
		mapper.getQtypeQuestion("계정 및 내정보");
	}
	//@Test
	public void testGetCountQtype() {
		mapper.getCountQtype("계정 및 내정보");
	}
	
	//@Test
	public void testGetOwnQuestion() {
		mapper.getOwnQuestion(2);
	}
	
	//@Test
	public void testUpdateQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQnum(7);
		vo.setQtitle("updateTest");
		vo.setQcontent("updateTest");
		mapper.updateQuestion(vo);
	}
	
	//@Test
	public void testDeleteQuestion() {
		mapper.deleteQuestion(2);
	}
}