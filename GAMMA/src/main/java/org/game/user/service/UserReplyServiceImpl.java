package org.game.user.service;

import java.util.List;

import org.game.user.domain.UserReplyVO;
import org.game.user.mapper.UserReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserReplyServiceImpl implements UserReplyService {

	@Autowired
	private UserReplyMapper mapper;
	
	@Override
	public void addUserReply(UserReplyVO vo) {
		mapper.create(vo);
	}

	@Override
	public List<UserReplyVO> listUserReply(String cid) {
		return mapper.getList(cid);
	}

	@Override
	public void modifyUserReply(UserReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void removeUserReply(Long rno) {
		mapper.delete(rno);
	}
}
