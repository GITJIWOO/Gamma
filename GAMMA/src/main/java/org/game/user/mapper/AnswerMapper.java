package org.game.user.mapper;

import org.game.user.domain.AnswerVO;

public interface AnswerMapper {
	public void insertAnswer(AnswerVO vo);
	
	public AnswerVO getAnswer(int qnum);
	
	public int getQnum(int anum);
	
	public void updateAnswer(AnswerVO vo);
	
	public void deleteAnswer(int anum);
	
	// 질문글 삭제시 트랜잭션 
	public void deleteQnA(int qnum);
}
