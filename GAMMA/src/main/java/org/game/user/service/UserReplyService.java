package org.game.user.service;

import java.util.List;

import org.game.user.domain.UserReplyVO;

public interface UserReplyService {
	
	public void addUserReply(UserReplyVO vo);

	public List<UserReplyVO> listUserReply(Long cnum);

	public void modifyUserReply(UserReplyVO vo);

	public void removeUserReply(Long rno);

}
