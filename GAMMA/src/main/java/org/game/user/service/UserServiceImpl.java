package org.game.user.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper mapper;

	// 회원정보상세조회
	@Override
	public ConsumerVO userGet(String cid) {
		return mapper.userGet(cid);
	}

	// 아이디 중복 체크
	@Override
	public long idChk(String cid) throws Exception {
		long result = mapper.idChk(cid);
		return result;
	}

	// 이메일 중복 체크
	@Override
	public long emailChk(String email) throws Exception {
		long result = mapper.emailChk(email);
		return result;
	}

	// 패스워드 중복 체크
	@Override
	public long passChk(ConsumerVO userVO) throws Exception {
		long result = mapper.passChk(userVO);
		return result;
	}

	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) throws Exception {
		log.info("유저회원가입실행");
		mapper.userJoin(userVO);
	}

	// 로그인
	@Override
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception {
		log.info("로그인실행");
		return mapper.userLogin(userVO);
	}

	// 회원정보 수정
	@Override
	public void userModify(ConsumerVO userVO) throws Exception {

		mapper.userModify(userVO);
	}

	// 회원탈퇴
	@Override
	public void userDelete(ConsumerVO userVO) throws Exception {
		mapper.userDelete(userVO);
	}

	// 비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(ConsumerVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "chohoonhyun0722@gamail.com";
		String hostSMTPpwd = "gnsgus0722";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "chohoonhyun0722@gamail.com";
		String fromName = "(주)GAMMA";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "(주)GAMMA 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getCid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, ConsumerVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		ConsumerVO ck = mapper.userGet(vo.getCid());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (mapper.idChk(vo.getCid()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPassword(pw);
			// 비밀번호 변경
			mapper.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
}