<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
* {
	padding: 10;
	margin: 0;
}
</style>
</head>

<script type="text/javascript">
		 $(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/user/userJoin";
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
				headers:{"Content-Type":"application/json","X-HTTP-Method-Override":"POST"},
				dataType : "text",
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
		//작동잘됨
		/*  function check_pw(){
			 
	            var pw = document.getElementById('password').value;
	            var SC = ["!","@","#","$","%"];
	            var check_SC = 0;
	 
	            if(pw.length < 6 || pw.length>16){
	                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	                document.getElementById('password').value='';
	            }
	            for(var i=0;i<SC.length;i++){
	                if(pw.indexOf(SC[i]) != -1){
	                    check_SC = 1;
	                }
	            }
	            if(check_SC == 0){
	                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
	                document.getElementById('password').value='';
	            }
	            if(document.getElementById('password').value !='' && document.getElementById('pw2').value!=''){
	                if(document.getElementById('password').value==document.getElementById('pw2').value){
	                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	                    document.getElementById('check').style.color='blue';
	                }
	                else{
	                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	                    document.getElementById('check').style.color='red';
	                }
	            }
	        } */
	    </script>
<body>
	<section id="container">
		<form action="/user/userJoin" method="post" id="regForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="cid">아이디</label> <input
					class="form-control" type="text" id="cid" name="cid" />
				<!-- <button class="idChk" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button> -->
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" name="password" id="password"
					onchange="check_pw()" placeholder="!,@,#,$,%중 하나이상을 포함해주세요" />
			</div>
			<!-- <div class="form-group has-feedback">
				<label class="control-label" for="passwordConfirm">패스워드확인</label> <input
					class="form-control" type="password" name="userPW2" id="pw2"
					onchange="check_pw()">&nbsp;<span id="check"></span>
			</div> -->
			<div class="form-group has-feedback">
				<label class="control-label" for="email">Email</label> <input
					class="form-control" type="text" id="email" name="email" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="nickname">닉네임</label> <input
					class="form-control" type="text" id="nickname" name="nickname" />
			</div>

		<div class="form-group has-feedback">
		<input type ="submit" value ="회원가입" class="btn btn-success" >
			<!-- <button class="btn btn-success" type="button" id="submit">회원가입</button>
			<button class="cencle btn btn-danger" type="button">취소</button> -->
		</div>
		</form>
	</section>

</body>

</html>