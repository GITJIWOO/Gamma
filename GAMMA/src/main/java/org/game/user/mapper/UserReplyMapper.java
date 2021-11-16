package org.game.user.mapper;

import java.util.List;

import org.game.user.domain.UserReplyVO;

public interface UserReplyMapper {

	public List<UserReplyVO> getList(String cid);

	public void create(UserReplyVO vo);

	public void update(UserReplyVO vo);

	public void delete(Long rno);
}
