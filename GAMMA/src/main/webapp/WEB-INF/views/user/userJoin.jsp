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
#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}
.correct{
    color : green;
}
.incorrect{
    color : red;
}
</style>
</head>

<script type="text/javascript">


var code = ""; 
	function fn_idChk() {

		var cid = $("#cid").val();
		console.log(cid);
		console.log("cid값을 클릭시 얻어오는지 확인");
		$.ajax({
			url : '/urest/idChk',
			type : 'post',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : cid,
			success : function(result) {
				if (result == 1) {
					alert("중복된 아이디입니다.");
				} else if (result == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	};
	function fn_emailChk() {

		var email = $("#email").val();
		console.log(email);
		console.log("email값을 클릭시 얻어오는지 확인");
		$.ajax({
			url : '/urest/emailChk',
			type : 'post',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : email,
			success : function(result) {
				console.log(result);
				if (result == 0) {
					alert("사용가능한 email입니다.")
					console.log("사용가능한 이멜");
					$("#emailChk").attr("value", "Y");
				} else if (result == 1) {
					alert("이미 등록된 email입니다.");
					console("사용불가능한 이멜");
				}
			}
		})
	};
	
	
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "/user/userJoin";
		})

		$("#submit").on("click", function() {
			if ($("#cid").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#cid").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if ($("#nickname").val() == "") {
				alert("닉네임을 입력해주세요.");
				$("#nickname").focus();
				return false;
			}
			var idChkVal = $('#idChk').val();
			console.log(idChkVal);
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
			 var eChkVal = $('#emailChk').val();
			console.log(eChkVal);
			if (eChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (eChkVal == "Y") {
				$("#regForm").submit();
			} 
		});
	});
	// 인증번호 이메일 전송
/* 	$(".mail_check_button").click(function(){
		var email=$(".email").val(); // 입력한이메일
		var checkBox=$(".mail_check_input"); // 인증번호 입력란
		var boxWrap=$(".mail_check_input_box"); // 인증번호 입력란 박스
		$.ajax({
			
			type:'GET',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			url:'/urest/emailChk',
			dataType : 'text',
			data : email,
					success:function(data){
						console.log("data : "+data);
						checkBox.attr("disabled",false);
						boxWrap.attr("id", "mail_check_input_box_true");
						code=data;
					}
			
		});
	}); */
	
	/* 인증번호 비교 */
/* 	$(".mail_check_input").blur(function(){
	    
		var inputCode = $(".mail_check_input").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과  
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }    
	});
	  */
	
	//작동잘됨
	  function check_pw(){
		 
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
	    } ;
</script>
<body>
	<section id="container"> <!-- security 로 id pass에 value값 넣음 admin으로 -->
		<form action="/user/userJoin" method="post" id="regForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="cid">아이디</label> <input
					class="form-control" type="text" id="cid" name="cid" value="admin" />
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" name="password" id="password" value="admin"
					onchange="check_pw()" placeholder="!,@,#,$,%중 하나이상을 포함해주세요" />
			</div>
			 <div class="form-group has-feedback">
				<label class="control-label" for="passwordConfirm">패스워드확인</label> <input
					class="form-control" type="password" name="userPW2" id="pw2"
					onchange="check_pw()">&nbsp;<span id="check"></span>
			</div> 
			<div class="form-group has-feedback">
				<label class="control-label" for="email">Email</label> <input
					class="form-control mail_input" type="text" id="email" name="email" />
					<button class="emailChk" type="button" id="emailChk" onclick="fn_emailChk();"
					value="N">중복확인</button>
						<!-- <div class="mail_check_warn">
							<div class="mail_check_input_box" id="mail_check_input_box_false">
								<input class="mail_check_input" disabled="disabled"/>
							</div>
							<button class="mail_check_button">
								<span>인증번호 전송</span>
							</button> 
						 <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div>-->
					
			</div>
			
			<div class="form-group has-feedback">
				<label class="control-label" for="nickname">닉네임</label> <input
					class="form-control" type="text" id="nickname" name="nickname" />
			</div>

		</form>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
	</section>

</body>

</html>