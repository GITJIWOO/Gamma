package org.game.user.mapper;

import org.game.user.domain.QuestionVO;

public interface QuestionMapper {
	// 질문글 게시 
	public void insertQuestion(QuestionVO vo);
	
	// 질문글 목록 어디
}
