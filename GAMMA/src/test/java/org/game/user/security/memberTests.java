package org.game.user.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class memberTests {
	/*
	 * @Autowired private PasswordEncoder pwen;
	 * 
	 * @Autowired private DataSource ds;
	 * 
	 * @Test public void testCryptDefaultDB() {
	 * 
	 * String[] idList={"user00","member00","admin00"};
	 * 
	 * String sql ="UPDATE consumer set password=? WHERE cnum=?"; try { Connection
	 * con = ds.getConnection();
	 * 
	 * for(String cnum : idList) { PreparedStatement pstmt =
	 * con.prepareStatement(sql); pstmt.setString(502,pwen.encode("pw00"));
	 * pstmt.setString(503, cnum); pstmt.executeUpdate(); }
	 * 
	 * }catch(Exception e) { e.printStackTrace(); }
	 * 
	 * }
	 */
	
}
