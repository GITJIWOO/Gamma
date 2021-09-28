<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#cid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#cid").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/user/idChk",
				type : "post",
				dataType : "json",
				data : {"cid" : $("#cid").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		function passConfirm() {
		
				var password = document.getElementById('password');					//비밀번호 
				var passwordConfirm = document.getElementById('passwordConfirm');	//비밀번호 확인 값
				var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
				var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
				var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
				
				if(password.value == passwordConfirm.value){
					confirmMsg.style.color = correctColor;
					confirmMsg.innerHTML ="비밀번호 일치";
				}else{
					confirmMsg.style.color = wrongColor;
					confirmMsg.innerHTML ="비밀번호 불일치";
				}
			}
		
	</script>
	<body>
		<section id="container">
			<form action="/userjoin" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="cid">아이디</label>
					<input class="form-control" type="text" id="cid" name="cid" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="passwordConfirm">패스워드확인</label>
					<input class="form-control" type="password" id="passwordConfirm" name="passwordConfirm" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">Email</label>
					<input class="form-control" type="text" id="email" name="email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="nickname">닉네임</label>
					<input class="form-control" type="text" id="nickname" name="nickname" />
				</div>
				
			</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
		</section>
		
	</body>
	
</html>