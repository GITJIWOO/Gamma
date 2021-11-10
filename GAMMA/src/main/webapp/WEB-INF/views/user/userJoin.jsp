<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
			<div class="border">
				<div class="row">
						<img src="/resources/css/image/mainIcon.png" />
						<h1 style="text-align: left;">회원가입</h1>
				</div>
				<div class="row1">
		<form action="/user/join" method="post" id="regForm">
					<label class="control-label" for="cid">아이디</label> <br/><input
						 type="text" id="cid" name="cid" /><br/>
					<button class="idChk" type="button" id="idChk"
						onclick="fn_idChk();" value="N">중복확인</button><br/><br/>
					<label class="control-label" for="password">패스워드</label><br/> <input
						 type="password" name="password" id="password"
						onchange="check_pw()" placeholder="!,@,#,$,%중 하나이상을 포함해주세요" /><br/>
					<label class="control-label" for="pw2">패스워드확인</label><br/> <input
						 type="password" name="userPW2" id="pw2"
						onchange="check_pw()" placeholder="!,@,#,$,%중 하나이상을 포함해주세요"><span
						id="check"></span><br/><br/>
					<label class="control-label" for="email">Email</label> <br/><input
						class="mail_input" type="text" id="email" 
						name="email" /><br/>
					<button class="emailChk" type="button" id="emailChk"
						onclick="fn_emailChk();" value="N">중복확인</button><br/><br/>
					<!-- <div class="mail_check_warn">
							<div class="mail_check_input_box" id="mail_check_input_box_false">
								<input class="mail_check_input" disabled="disabled"/>
							</div>
							<button class="mail_check_button">
								<span>인증번호 전송</span>
							</button> 
						 <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div>-->
					<label class="control-label" for="nickname">닉네임</label><br/> <input
						 type="text" id="nickname" name="nickname" /><br/><br/>
                <input type="hidden" name="role" value="ROLE_MEMBER"/>
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		</form>
					<button class="btn" type="button" id="submit">회원가입</button>
					<button class="cencle btn" type="button">취소</button>
				</div>
			</div>
</div>
</body>
</html>