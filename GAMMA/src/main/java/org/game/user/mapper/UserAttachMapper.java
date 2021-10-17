package org.game.user.mapper;

import java.util.List;

import org.game.user.domain.UserAttachVO;

public interface UserAttachMapper {

	public void insert(UserAttachVO vo);

	public void delete(String uuuid);

	public List<UserAttachVO> findByCnum(Long cnum);
}
