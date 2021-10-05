<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>페이지번호: ${param.pageNum } 검색조건: ${param.searchType } 키워드:
		${param.keyword }</p>
	<h1>${gvo.gname }게임 수정 페이지</h1>
	
	<form action="/gameInfo/modify" method="post">
		<input type="hidden" name="gnum" value="${gvo.gnum }"> 
		<input type="hidden" name="pageNum" value="${param.pageNum }"> 
		<input type="hidden" name="searchType" value="${param.searchType }">
		<input type="hidden" name="keyword" value="${param.keyword }">
		<table border="1">
			<tr>
				<th>게임 제목</th>
				<td><input type="text" name="gname" required="required" /><br /></td>
			</tr>
			<tr>
				<th>출시일</th>
				<td><input type="date" name="glaunch" required="required" /><br /></td>
			</tr>
			<tr>
				<th>개발사</th>
				<td><input type="text" name="gdeveloper" required="required" /><br /></td>
			</tr>
			<tr>
				<th>배급사</th>
				<td><input type="text" name="gfublisher" required="required" /><br /></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="gprice" required="required" /><br /></td>
			</tr>
			<tr>
				<th>게임 소개</th>
				<td><textarea rows="10" cols="50" name="gcontent"
						required="required"></textarea><br /></td>
			</tr>
			<tr>
				<th>개임 등급</th>
				<td><input type="number" name="ggrade" required="required" /><br /></td>
			</tr>
			<tr>
				<th>게임 사이트</th>
				<td><input type="text" name="gsite" required="required" /><br /></td>
			</tr>
			<tr>
				<th>동영상</th>
				<td><input type="text" name="gaddress" required="required" /><br /></td>
			</tr>
			<tr>
				<th>운영체제</th>
				<td><input type="text" name="gos" required="required" /><br /></td>
			</tr>
			<tr>
				<th>프로세서</th>
				<td><input type="text" name="gprocessor" required="required" /><br /></td>
			</tr>
			<tr>
				<th>메모리</th>
				<td><input type="text" name="gmemory" required="required" /><br /></td>
			</tr>
			<tr>
				<th>그래픽</th>
				<td><input type="text" name="ggraphic" required="required" /><br /></td>
			</tr>
			<tr>
				<th>directX</th>
				<td><input type="text" name="gdirectx" required="required" /><br /></td>
			</tr>

			<tr>
				<th>저장공간</th>
				<td><input type="text" name="gstore" required /><br /></td>
			</tr>
			<tr>
				<th>게임 태그</th>
				<td><input type="text" name="tagname" required /><br /></td>
			</tr>
			
		</table>
		<input type="submit" value="수정완료"> <input type="reset"
			value="초기화">
	</form>
	<a href="/gameInfo/gamelist?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}"><input type="button" value="목록으로"></a>
</body>
</html>