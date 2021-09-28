<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<body>
<h2>[회원정보 수정]</h2>
<form action="/userJoin" method="post">
    <div>아이디<input type="text" name="cid" id="cid" value="${cid}" readonly="readonly"></div>    
    <div>비밀번호<input type="text" name="password" id="password" value="${password}"></div>
    <div>이메일<input type="text" name="email" id="email" value="${email}" ></div>
    <div>닉네임<input type="text" name="nickname" id="nickname" value="${nickname}" ></div>
</form>
    <button type="button" id="submit" onclick="modifyMember()">수정완료</button>
    <button type="button" onclick="location.href='/main'">처음으로</button>
    <button type="button" onclick="userDelete()">회원 탈퇴</button>
</body>
</html>


