<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
<style>
	#modDiv{
		width: 480px;
		height: 340px;
		background-color: lightgray;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -5px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
</style>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<h2>답변</h2>
	
	<!-- 입력 -->
	<div>
		<div id="inputAnswer">
			
		</div>
	</div>

	<!-- modal -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<textarea rows='10' cols='50' id="answertext"></textarea>
		</div>
		<div>
			<button type="button" id="answerModBtn">수정</button>
			<button type="button" id="answerDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>
	</c:if>
	<!-- 조회 -->
	<div id="regiAnswer">
	</div>

	<script type="text/javascript">
		var qnum = ${param.qnum };
		var str2 = "<textarea rows='10' cols='50' name='acontent' id='acontent' placeholder='답변 입력창'></textarea><br><button id='addAnswerBtn'>답변 등록</button>";
		$("#inputAnswer").html(str2);
		var adminOrNot = ${admin};
		console.log("admin 인지 아닌지: "+adminOrNot);
		function getAnswer(){
			$.getJSON("/qna/answer/" + qnum, function(data){
				console.log("실행중");
				$(data).each(function(){
					content = this.acontent;
				});
				var str = "";
				$(data).each(function(){	
					var timestamp = this.adate;
					var date = new Date(timestamp);
					var formattedTime = "답변 게시일: " + date.getFullYear() 
													 + "/" + (date.getMonth() + 1) 
													 + "/" + date.getDate()
													 + " " + date.getHours()
													 + ":" + date.getMinutes()
													 + ":" + date.getSeconds();
					// 관리자일 경우,  
					if(adminOrNot === 0){
						str += "<div data-anum='" 
							+ this.anum 
							+ "' class='answerDetail'><strong>@관리자</strong><br>" 
							+ formattedTime 
							+ "<br><div class='acontent'>" 
							+ this.acontent 
							+ "</div></div>";
					}
					// 일반 회원일 경우,
					else if(adminOrNot === 1){
						str += "<div data-anum='" 
							+ this.anum 
							+ "' class='answerDetail'><strong>@관리자</strong><br>" 
							+ formattedTime 
							+ "<br><div class='acontent'>" 
							+ this.acontent 
							+ "</div><button class='btn btn-dark'>수정/삭제</button></div>";
					}
					if(str != ""){
						str2 = "";
						$("#inputAnswer").html(str2);
					}
				});
				$("#regiAnswer").html(str);
			});
		}
		getAnswer();
	</script>
	
	<c:if test="${admin == 1 }">
	<script>
	
	// 답변 등록 버튼
	$("#addAnswerBtn").on("click", function(){
		var acontent = $("#acontent").val();
		$.ajax({
			type : 'post',
			url : '/qna/answer/new',
			headers : {
				"Content-Type" : "application/json", 
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				qnum : qnum,
				acontent : acontent
			}),
			success : function(result){
				if(result == 'add success'){
					alert("답변 작성이 완료되었습니다.");
					getAnswer();
					
				}
			}
		});
	});
	
	// 수정/삭제 버튼
	$("#regiAnswer").on("click", ".answerDetail button", function(){
		var answerDetail = $(this).parent();
		var anum = answerDetail.attr("data-anum");
		var acontent = $(this).siblings(".acontent").text();
		console.log(anum + ":" + acontent);
		$(".modal-title").html(anum);
		$("#answertext").val(acontent);
		$("#modDiv").show("slow");
	});
	
	// modal - 답변 수정 버튼
	$("#answerModBtn").on("click", function(){
		var anum = $(".modal-title").html();
		var acontent = $("#answertext").val();
		$.ajax({
			type : 'patch',
			url : '/qna/answer/'+ anum,
			headers : {
				"Content-Type" : "application/json", 
				"X-HTTP-Method-Override" : "PATCH"
			},
			dataType : 'text',
			data : JSON.stringify({
				acontent : acontent
			}),
			success : function(result){
				if(result == 'modify success'){
					alert("답변 수정이 완료되었습니다.");
					$("#modDiv").hide("slow");	
					getAnswer();
				}
			}
		});
	});
	
	// modal - 답변 삭제 버튼
	$("#answerDelBtn").on("click", function(){
		var anum = $(".modal-title").html();
		$.ajax({
			type : 'delete',
			url : '/qna/answer/'+ anum,
			success : function(result){
				if(result == 'remove success'){
					alert("답변 삭제가 완료되었습니다.");
					$("#modDiv").hide("slow");
					// 새로고침을 해야함 - 왜..?
					getAnswer();
				}
			}
		});
	});
	
	// modal - 닫기 버튼 
	$("#closeBtn").on("click", function(){
		$("#modDiv").hide("slow");			
	});
	</script>
	</c:if>
	<a href="/qna/questionlist?qwriter=${param.qwriter }&pageNum=${param.pageNum }"><button>질문 목록</button></a>
	<c:if test="${admin == 0 }">
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="hidden" name="qwriter" value="${param.qwriter }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="submit" value="질문 수정"/>
	</form>
		<form action="/qna/removequestion" method="post">
			<input type="hidden" name="qnum" value="${vo.qnum }"/>
			<input type="hidden" name="qwriter" value="${param.qwriter }"/>
			<input type="submit" value="질문 삭제"/>
		</form>
	</c:if>
</body>
</html>