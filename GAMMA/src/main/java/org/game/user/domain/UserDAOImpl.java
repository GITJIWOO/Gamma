package org.game.user.domain;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.game.user.mapper.UserMapper;
import org.game.user.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserDAOImpl implements UserDAO{
	@Autowired
	SqlSession sql;
	
	@Autowired
	private UserMapper mapper;
	
	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("mapper.userJoin",userVO);
	}
		
	@Override
	public int idChk(ConsumerVO userVO) throws Exception {
		int result=sql.selectOne("mapper.idChk",userVO);
		return result;
	}

	@Override
	public int passChk(ConsumerVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}




	@Override
	public void userModify(ConsumerVO userVO) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void userDelete(ConsumerVO userVO) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
