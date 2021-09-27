package org.game.user.service;

import org.game.user.domain.ConsumerVO;

public interface UserService {

	public void userJoin(ConsumerVO userVO);

	public void userLogin();

	public void userLogout();

	public void userDelete();

	public void userUpdate(ConsumerVO userVO);

	public ConsumerVO userSearch(ConsumerVO userVO);

}
