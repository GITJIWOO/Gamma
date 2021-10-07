<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#modDiv{
		width: 300px;
		height: 100px;
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
	<h2>답변 입력</h2>
	<!-- 입력 -->
	<div>
		<div>
			<textarea rows="10" cols="50" name="acontent" id="acontent" placeholder="답변 입력창"></textarea>
		</div>
		<button id="addAnswerBtn">답변 등록</button>
	</div>
	<!-- 조회 -->
	<ul id="regiAnswer">
		
	</ul>
	<!-- modal -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="answertext"/>
		</div>
		<div>
			<button type="button" id="answerModBtn">수정</button>
			<button type="button" id="answerDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		var qnum = 578;
		function getAnswer(){
			$.getJSON("/qna/answer/" + qnum, function(data){
				var str = "";
				$(data).each(function(){					
					str += "<li data-anum='" + this.anum + "' class='answerDetail'>" + this.acontent + " <button>수정/삭제</button></li>";
				});
				$("#regiAnswer").html(str);
			});
		}
		getAnswer();
		$("#addAnswerBtn").on("click", function(){
			var acontent = $("#acontent").val();
			console.log(answerContent);
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
						alert("add success");
						getAnswer();
						
					}
				}
			});
		});
		$("#regiAnswer").on("click", ".answerDetail button", function(){
			var answerDetail = $(this).parent();
			var anum = answerDetail.attr("data-anum");
			var acontent = answerDetail.text();
			console.log(anum + ":" + acontent);
			$(".modal-title").html(anum);
			$("#answertext").val(acontent);
			$("#modDiv").show("slow");
		});
	</script>
</body>
</html>