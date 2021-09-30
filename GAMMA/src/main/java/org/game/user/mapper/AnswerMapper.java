package org.game.user.mapper;

import org.game.user.domain.AnswerVO;

public interface AnswerMapper {
	public void insertAnswer(AnswerVO vo);
	
	public AnswerVO getAnswer(int qnum);
	
	public void updateAnswer(AnswerVO vo);
	
	public void deleteAnswer(int anum);
}
