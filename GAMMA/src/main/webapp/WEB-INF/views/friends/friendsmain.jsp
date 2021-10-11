<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>메인 화면</h1>
<!-- 해당 페이지에 있어야 하는 기능
	1. 친구 목록 보기(팔로우, 팔로잉) + 친구 검색(팔로우, 팔로잉 중에서) + 추가, 삭제 - 다른 페이지와 연동 
	2. 친구 검색(전체 회원중에서) - 다른 페이지와 연동(됨 - 페이지네이션 추가해야됨)
	3. 채팅 - 다른 페이지와 연동 
//	4. 상태글 남기기 - 해당 페이지에서
	 -->
<!-- 이 페이지에서 각 url로 이동하고 거기서 각 기능 보여줌 -->
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
	<a href="/friends/searchfriends">친구 검색</a>
	<a href="/main">채팅 메세지 보내기</a>
</body>
</html>