<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	게임정보: ${gvo }
	<br> 게임태그: ${tvoList }
	<br> 시스템 요구사항: ${rvo }
	<br>
	<p>페이지번호: ${param.pageNum } 검색조건: ${param.searchType } 키워드:
		${param.keyword }</p>--%>
	<h1>게시물 상세 조회</h1>
	<table border="1">
		<tr>
			<th>게임</th>
			<td>${gvo.gname }</td>
		</tr>
		<tr>
			<th>출시일</th>
			<td>${gvo.glaunch }</td>
		</tr>
		<tr>
			<th>개발사</th>
			<td>${gvo.gdeveloper }</td>
		</tr>
		<tr>
			<th>배급사</th>
			<td>${gvo.gfublisher }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${gvo.gprice }</td>
		</tr>
		<tr>
			<th>게임 소개</th>
			<td><textarea rows="10" cols="30" name="gcontent"
					required="required">${gvo.gcontent }</textarea><br /></td>
		</tr>
		<tr>
			<th>개임 등급</th>
			<td>${gvo.ggrade }</td>
		</tr>
		<tr>
			<th>게임 사이트</th>
			<td>${gvo.gsite }</td>
		</tr>
		<tr>
			<th>동영상</th>
			<td>${gvo.gaddress }</td>
		</tr>
		<tr>
			<th>운영체제</th>
			<td>${rvo.gos }</td>
		</tr>
		<tr>
			<th>프로세서</th>
			<td>${rvo.gprocessor }</td>
		</tr>
		<tr>
			<th>메모리</th>
			<td>${rvo.gmemory }</td>
		</tr>
		<tr>
			<th>그래픽</th>
			<td>${rvo.ggraphic }</td>
		</tr>
		<tr>
			<th>directX</th>
			<td>${rvo.gdirectx }</td>
		</tr>

		<tr>
			<th>저장공간</th>
			<td>${rvo.gstore }</td>
		</tr>
		<tr>
			<th>게임 태그</th>
			<td>${tvo.tagname}</td>
		</tr>
	</table>
	<a href="/gameInfo/gamelist?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}">
		<input type="button" value="목록으로"></a>
	
	
	<form action="/gameInfo/modifyform" method="post">
		<input type="hidden" name="gnum" value="${gvo.gnum }"> 
		<input type="hidden" name="pageNum" value="${param.pageNum }"> 
		<input type="hidden" name="searchType" value="${param.searchType }">
		<input type="hidden" name="keyword" value="${param.keyword }">
		<input type="submit" value="수정하기">
	</form>
	
	<form action="/gameInfo/gameremove" method="post" id="deleteForm">
		<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
			type="button" value="삭제하기" onclick="confirm_delete();">
	</form>

	<script type="text/javascript">
		function confirm_delete() {
			var deleteForm = document.getElementById('deleteForm');
			if (confirm("정말 삭제하시겠습니까?")) {
				alert("삭제 확인")
				deleteForm.submit();
			} else {
				alert("삭제 취소")
			}
		}
	</script>

</body>
</html>