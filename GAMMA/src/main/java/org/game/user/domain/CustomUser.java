package org.game.user.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	
	private ConsumerVO consumer;
	
	public CustomUser(String cid, String password, Collection<? extends GrantedAuthority> auth) {
		super(cid, password,auth);
	}
	
	public CustomUser(ConsumerVO vo) {
		super(vo.getCid(), vo.getPassword(), vo.getAuthList().stream().map(author -> new SimpleGrantedAuthority(author.getAuth())).collect(Collectors.toList()));
		this.consumer = vo;
	}
	
}
