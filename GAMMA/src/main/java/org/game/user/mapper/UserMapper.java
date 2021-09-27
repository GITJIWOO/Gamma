package org.game.user.mapper;

import org.game.user.domain.ConsumerVO;

public interface UserMapper {
	
	public void userJoin(ConsumerVO userVO);
	
	public void userLogin();
	
	public void userLogout();
	
	public void userDelete();
	
	public void userUpdate(ConsumerVO userVO);
	
	public ConsumerVO userSearch(ConsumerVO userVO);

}
