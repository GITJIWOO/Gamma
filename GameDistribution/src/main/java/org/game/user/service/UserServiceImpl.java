package org.game.user.service;

import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public void userJoin(ConsumerVO userVO) {
		log.info("회원가입 서비스시작");
		mapper.userJoin(userVO);
	}

	@Override
	public void userLogin() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userLogout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userDelete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userUpdate(ConsumerVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ConsumerVO userSearch(ConsumerVO userVO) {
		// TODO Auto-generated method stub
		return null;
	}


}
