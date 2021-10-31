package org.game.user.security;

import org.game.user.domain.ConsumerVO;
import org.game.user.domain.CustomUser;
import org.game.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService{

	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String cid) throws UsernameNotFoundException {
		log.warn("유저 아이디 확인: " + cid);
		
		ConsumerVO vo = mapper.read(cid);
		log.info("확인된 유저이름으로 얻어온 정보: " + vo);
		return vo == null ? null : new CustomUser(vo);
	}

}
