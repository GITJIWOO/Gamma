<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/styles.css" /><title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.detail {
	  font-size: 17px;
	  width: 90%;
	  margin: 0 auto;
	}
	.form-header {
	  color: rgba(0, 0, 0, 0.8);
	  font-size: 27px;
	  font-weight: 600;
	  padding: 20px 0 30px 0;
	  border-bottom: 3px solid rgba(0, 0, 0, 0.8);
	  margin-bottom: 30px;
	}
	.register-table {
	  margin: 0 auto;
	}
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
</head>
<body>
	<!-- 
	질문 번호: ${param.qnum }
	로그인 계정: ${param.qwriter }
	질문 페이지번호: ${param.pageNum }
	 -->
	<!-- 질문 -->
    <div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
          <span
            ><a href="#"><img src="/resources/css/image/logo.png" /></a
          ></span>
        </div>
        <!-- search -->
        <div class="side-bar__row">
          <form action="#" method="get">
            <input type="text" placeholder="   Search Game" />
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="#">게임 스토어</a></span>
          <span><a href="#">라이브러리</a></span>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="#">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="#">자주하는 질문</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if로 로그인 전에는 회원가입+로그인 / 로그인 후에는 프로필 -->
          <span><a href="#">로그인</a></span>
          <span><a href="#">가입하기</a></span>
          <!--
          <span>
            <a href="#"><button class="profile">Profile</button></a>
          </span>
          -->
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <h1 class="form-header">문의 상세</h1>
              <table class="register-table">
                <tr>
			<th>문의 번호</th>
			<td>${vo.qnum }</td>
		</tr>
		<tr>
			<th>문의 유형</th>
			<td>${vo.qtype }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.qwriter }</td>
		</tr>
		<tr>
			<th>문의 제목</th>
			<td>${vo.qtitle }</td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td>${vo.qcontent }</td>
		</tr>

		<tr>
			<th>문의 작성일</th>
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
              </div>
          </div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO"
                >https://github.com/GITJIWOO</a
              >
            </div>
          </div>
          <div class="footer-copyright">
            <div>Copyright © GAMMA All right reserved.</div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>