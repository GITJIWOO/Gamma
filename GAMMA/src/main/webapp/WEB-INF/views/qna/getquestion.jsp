<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h2>질문 상세</h2>
	질문 번호: ${param.qnum }
	로그인 계정: ${param.qwriter }
	질문 페이지번호: ${param.pageNum }
	<!-- 질문 -->
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${vo.qnum }</td>
		</tr>
		<tr>
			<th>유형</th>
			<td>${vo.qtype }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.qtitle }</td>
		</tr>
		<tr>
			<th>본문</th>
			<td>${vo.qcontent }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.qwriter }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.qdate }</td>
		</tr>
	</table>
	<!-- 답변 -->
	<c:if test="${admin == 1 }">
	<h2>답변 입력</h2>
	<!-- 입력 -->
	<div>
		<div id="inputAnswer">
			
		</div>
		<button id="addAnswerBtn">답변 등록</button>
	</div>
	<!-- 조회 -->
	<ul id="regiAnswer">
	</ul>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		var qnum = ${param.qnum };
		var content = "";
		function getAnswer(){
			$.getJSON("/qna/answer/" + qnum, function(data){
				console.log("실행중");
				var str2 = "";
				$(data).each(function(){
					content = this.acontent;
				});
				var str = "";
				$(data).each(function(){	
					var timestamp = this.adate;
					var date = new Date(timestamp);
					var formattedTime = "답변 게시일: " + date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
					str += "<div data-anum='" 
						+ this.anum 
						+ "' class='answerDetail'><strong>@관리자</strong><br>" 
						+ formattedTime 
						+ "<br><div class='acontent'>" 
						+ this.acontent 
						+ "</div><button class='btn btn-dark'>수정/삭제</button></div>";
					console.log("content 내용물: " + content);
				});
				$("#regiAnswer").html(str);
			});
			// 이게 먼저 실행되고 있음 - 왜...?
			if(content === ""){
				console.log("비어있음");
				str2 = "<textarea rows='10' cols='50' name='acontent' id='acontent' placeholder='답변 입력창'></textarea>";
				$("#inputAnswer").html(str2);	
			};
		}
		getAnswer();
	</script>
	</c:if>
	<a href="/qna/questionlist?qwriter=${param.qwriter }&pageNum=${param.pageNum }"><button>질문 목록</button></a>
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="hidden" name="qwriter" value="${param.qwriter }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="submit" value="질문 수정"/>
	</form>
	<c:if test="${admin == 0 }">
		<form action="/qna/removequestion" method="post">
			<input type="hidden" name="qnum" value="${vo.qnum }"/>
			<input type="hidden" name="qwriter" value="${param.qwriter }"/>
			<input type="submit" value="질문 삭제"/>
		</form>
	</c:if>
</body>
</html>