package org.game.user.service;

import java.util.List;

import org.game.user.domain.QuestionVO;

public interface QuestionService {
	public int adminOrNot(String cid);
	
	public void addQuestion(QuestionVO vo);
	
	public List<QuestionVO> questionList(String qwriter);
	public int countQuestion(String qwriter);
	
	public List<QuestionVO> typeQuestion(String qtype);
	public int countQtype(String qtype);
	
	public QuestionVO ownQuestion(Long qnum);
	
	public void modifyQuestion(QuestionVO vo);
	
	public void removeQuestion(Long qnum);
}
