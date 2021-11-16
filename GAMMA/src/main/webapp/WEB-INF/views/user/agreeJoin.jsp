<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

	*{
	margin: 0;
	padding: 0;
	text-align: center;
	}
h1{
 position: relative;
 top:30px;
 font-weight:bold;
 right:15px;
}
button {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 5px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}
	.border {
	width: 370px;
	height: 450px;
	border: 1px solid #000;
	border-radius: 10%;
}
textarea{
width:350px;
text-align:center;
resize: none;
height : 100px;
line-height:100px;
          
}

img {
	width: 150px;
	height: 150px;
	padding:0;
	margin:0;
}
.row{
display:flex; 
	flex-flow:row;
	margin: 5px 0 0 0;	
	height :110px;
}
.row1{
	position:relative;
	
}
.container{
display: flex;
  justify-content: center;
  align-items: center;
}
	
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="container">
		<div class="border">
			<div class="row">
				<img src="/resources/css/image/mainIcon.png" />
				<h1 style="text-align: left;font-size:40px; font-weight:bold;  ">약관의 동의</h1>
			</div>
			<div class="row1">
				<hr>
				<div>
					<textarea rows="10" cols="60" readonly>회원 가입을 위한 동의서 내용</textarea>

					<hr>
				</div>
				<div >
					<input type="checkbox" id="agree"> 개인정보 수집 및 이용에 동의합니다. <br>
					<br>
					<button class="btn btn-dark" id="goJoin" onclick="agreeJ()">동의
						후 회원가입</button>
					<button class="btn btn-dark" id="mainBtn" onclick="main()">돌아가기</button>
					<br>
				</div>
			</div>
		</div>
	</div>
   <script>
   		
   		
   		function agreeJ() {
   			
   		var agreeCheck = document.getElementById("agree").checked;
   		
   			
   			if(agreeCheck) {
   				window.location.href="/user/userJoin";
   				
   			}else {
   				alert('개인정보 수집 및 이용에 동의해주세요.');
   			}
   			
   		}
   		
   		function main() {
   			window.location.href="/main/main";
   		}
   </script>
   
</body>
</html>