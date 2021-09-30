package org.game.user.service;

import org.game.user.domain.AnswerVO;

public interface AnswerService {
	public void addAnswer(AnswerVO vo);
	
	public AnswerVO getAnswer(int qnum);
	
	public void modifyAnswer(AnswerVO vo);
	
	public void removeAnswer(int anum);
}
