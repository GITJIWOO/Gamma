package org.game.user.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
// 재인 추가
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	@Autowired
	private PasswordEncoder pwen;
	
	@Autowired DataSource ds;
	
	// 기존 데이터 변경
	//@Test
	public void testCryptDefaultDB() {
		String [] idList = {"user00", "member00", "admin00"};
		
		String sql = "UPDATE users SET password = ? WHERE username = ?";
		try {
			Connection con = ds.getConnection();
			for(String id : idList) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pwen.encode("pw00"));
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testCryptDB() {
		String [] idList = {"admin"};
		
		String sql = "UPDATE consumer SET password = ? WHERE cid = ?";
		try {
			Connection con = ds.getConnection();
			for(String id : idList) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pwen.encode("admin"));
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// test용 데이터 적재(consumer)
	//@Test
	public void testCryptCustomDB() {
		try {
			Connection con = ds.getConnection();
			String sql = "INSERT INTO consumer (cnum, cid, email, password, nickname, cadmin, userregdate, userupdatedate) VALUES (consumer_num.nextval, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
			
			for(int i = 0; i < 10; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(3, pwen.encode("pw" + i));
				
				if(i < 5) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "user" + i + "@mail.com");
					pstmt.setString(4, "회원" + i);
					pstmt.setInt(5, 0);
				}else if(i < 10) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "user" + i + "@mail.com");
					pstmt.setString(4, "관리자" + i);
					pstmt.setInt(5, 1);
				}
				pstmt.execute();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testAuthDB() {
		try {
			Connection con = ds.getConnection();
			String sql = "INSERT INTO consumer_auth (cid, auth) VALUES (?, ?)";
			
			for(int i = 0; i < 10; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				if(i < 5) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				}else if(i < 10) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.execute();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
}
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
	

