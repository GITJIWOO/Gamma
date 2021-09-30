package org.game.user.service;

import org.game.user.domain.AnswerVO;
import org.game.user.mapper.AnswerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AnswerServiceImpl implements AnswerService{

	@Autowired
	private AnswerMapper mapper;
	
	@Override
	public void addAnswer(AnswerVO vo) {
		mapper.insertAnswer(vo);
	}

	@Override
	public AnswerVO getAnswer(int qnum) {
		return mapper.getAnswer(qnum);
	}

	@Override
	public void modifyAnswer(AnswerVO vo) {
		mapper.updateAnswer(vo);
	}

	@Override
	public void removeAnswer(int anum) {
		mapper.deleteAnswer(anum);
	}

}
