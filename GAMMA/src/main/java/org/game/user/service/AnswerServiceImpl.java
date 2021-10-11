package org.game.user.service;

import org.game.user.domain.AnswerVO;
import org.game.user.mapper.AnswerMapper;
import org.game.user.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AnswerServiceImpl implements AnswerService{

	@Autowired
	private AnswerMapper mapper;
	
	@Autowired
	private QuestionMapper qmapper;
	
	//@Transactional
	@Override
	public void addAnswer(AnswerVO vo) {
		// 답변 추가 
		mapper.insertAnswer(vo);
		// 답변 여 
		qmapper.updateAnswerOrNot(vo.getQnum(), 1);
	}

	@Override
	public AnswerVO getAnswer(int qnum) {
		return mapper.getAnswer(qnum);
	}

	@Override
	public void modifyAnswer(AnswerVO vo) {
		mapper.updateAnswer(vo);
	}

	//@Transactional
	@Override
	public void removeAnswer(int anum) {
		int qnum = mapper.getQnum(anum);
		// 답변 삭제 
		mapper.deleteAnswer(anum);
		// 답변 부 
		qmapper.updateAnswerOrNot(qnum, -1);
	}

}
