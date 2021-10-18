<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link rel="stylesheet" href="/resources/css/styles.css" />
<script src="<c:url value="/resources/js/main.js"/>"></script>
<style>
* {
	padding: 5px;
	margin: 5px;
}
	.consumer {
		width: 25%;
		position: relative;
		text-align: center;
		height: 20%;
		buttom: 100;
		left:10px;
	}
	.consumer__imgPro {
		float: left;
		padding: 0;
		margin: 0;
	}
	.conimg {
		width: 100px;
		height: 100px;
	}
	.consumer__nickname {
		float: right;
		font-size: 25px;
		font-weight: bold;
		color: white;
		
	}
	.consumer__info {
		background-color:gray;
		color:white;
		display: none;
		position: absolute;
		top:50px;
		left: 150%;
		width:120px;
		margin:5px;
		border-radius: 10%;
		text-align:left;
	}
.detail{
	display: flex;
	flex-flow: row;
}
.modAub{
	position:relative;
	left:50px;
}

.table1{position:relative;
	left:50px;}
.rowB{
text-align: center;
position:relative;
top:50px;
}

.nick {
	display: flex;
	flex-flow: row;
}

h2 {
	font-weight: bold;
	font-size: big;
}

.img {
	display: flex;
	flex-flow: row;
	padding: 10px;
}

.cidPro {
	color: orange;
}

.table {
	font-weight: bold;
}


strong {
	color: blue;
}

#modDiv {
	border-radius: 2px;
	width: 310px;
	height: 140px;
	background-color: black;
	position: absolute;
	padding: 10px;
	top: 40%;
	left: 30%;
	z-index: 1000;
	width: 310px;
}

modBtn {
	display: flex;
	flex-flow: row;
	background-color: white;
	color: gray;
}

#replytext {
	position: relative;
	right: 7px;
}

button {
	width: 100px;
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

.proImg {
position:relative;
	bottom:200px;
	text-align: center;
}

.imgPro {
	width: 150px;
	height: 150px;
}

.imgProA {
	width: 250px;
	height: 250px;
	padding: 0;
	margin: 0;
}

.uid {
	position: relative;
	top: 10px;
	font-weight: bold;
	color: white;
}
.gameImg {
	height: 100px;
	width: 100px;
}
</style>
<meta charset="UTF-8">

<title>회원정보 상세 페이지</title>

</head>
<body>

	<div class="display">
		<!-- side-bar -->
		<div class="side-bar">
			<!-- logo -->
			<div class="side-bar__row">
				<!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
				<span><a href="/main/main"><img
						src="/resources/css/image/logo.png" /></a></span>
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
				<span><a href="#">게임 스토어</a></span> <span><a href="#">라이브러리</a></span>
			</div>
			<!-- qna -->
			<div class="side-bar__row">
				<span><a href="#">Q&A</a></span> &nbsp;&nbsp;|&nbsp;&nbsp; <span><a
					href="#">자주하는 질문</a></span>
			</div>
				<div class="side-bar__row">
				<c:if test="${member == null }">
            <div class="loginBtn">
		        <span><a href="/user/userLogin" class="loginA">로그인</a></span>
            </div>
            <div class="joinBtn">
		        <span><a href="/user/userJoin" class="joinA">가입하기</a></span>
            </div>
          </c:if>
          <c:if test="${member != null }">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p>${member.cid}</p>
		          </div>
		          <div class="consumer__info">
	   					<a href="/user/userGet">* 유저정보창</a><br/>
	   				<a href="/user/userpro">* 유저프로필창</a><br/>
	   				<a href="/user/userLogout">* 로그아웃</a><br/>
	   				<a href="/user/userDelete">* 회원탈퇴</a><br/>
		   		  </div>
	          </div>
          </c:if>
        </div>
      </div>
			<!-- about user -->
			<div class="main">
				<div class="container">
					<div class="detail">
					<div class="rowA">
						<form name="form1" method="post">
							<div class="img">
								<div class="row">&nbsp;</div>
								<img class="imgProA" src="/resources/css/image/chaIcon.png" />
									<div>
									<br> <br> <br>
									<h2>[[프로필이미지]]</h2>
										<div class="uploadDiv">
											<input type="file" name="uploadFile" multiple>
										</div>

										<div class="uploadResult">
											<ul>
												<!-- 업로드된 파일이 들어갈 자리 -->
											</ul>
										</div>
										<button id="uploadBtn">upload</button>

									</div>
							</div>
							<table class="table table1" width="400px">

								<c:if test="${member eq 'kjw011231' }">
									<tr>
										<td>유저고유번호</td>
										<td><input id="cnum" name="cnum" value="${member.cnum}"
											readonly="readonly"></td>
									</tr>
								</c:if>
								<tr>
									<td>아이디</td>
									<td id="cid" name="cid">${member.cid}</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td id="nickname" name="nickname">${member.nickname}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td id="email" name="email">${member.email}</td>
								</tr>
								<tr>
									<td>회원가입일자</td>
									<td><fmt:formatDate value="${member.userregdate}"
											pattern="yyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>회원정보 수정일자</td>
									<td><fmt:formatDate value="${member.userupdatedate}"
											pattern="yyy-MM-dd" /></td>
								</tr>
							</table>
						</form>
						<div class="row">&nbsp;</div>
						<div class="Mbtn">
							<c:if test="${member != null}">
								<a href="/user/userLogin"><button>로그인</button></a>
								<a href="/user/userLogout"><button>로그아웃</button></a>
								<a href="/user/userModify"><button>유저수정</button></a>
								<a href="/user/userDelete"><button>탈퇴</button></a>
								<a href="/user/userPro"><button>프로필창</button></a>
							</c:if>
						</div>
						</div>
				<div class="rowB">
				<table class="table table-hover">
					<tr>
						<th>게임식별번호</th>
						<th>게임제목</th>
						<th>게임설명</th>
						<th>태그</th>
						<th>구매일자</th>
					</tr>
					<c:forEach var="library" items="${library }">
						<tr>
							<td>${library.gnum }</td>
							<td><a href="gname">${gname}</a></td>
							<td>${gcontent}</td>
							<td>${tagname }</td>
							<td>${board.regdate }</td>
						</tr>
					</c:forEach>

				</table>
				</div>
					</div>
				
				</div>
			</div>
			<!--  row main-->

			<div class="footer">
				<div class="footer-info">
					<div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
					<div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
					<div>
						CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a>
					</div>
				</div>
				<div class="footer-copyright">
					<div>Copyright © GAMMA All right reserved.</div>
				</div>
			</div>
	</div>
	<!-- 모달 요소는 안 보이기 때문에 어디 넣어도 되지만 보통 html요소들 끼리 놨을때
	제일 아래쪽에 작성하는 경우가 많습니다. -->
	<div id="modDiv" style="display: none;">
		<div class="modal-title" style="color: white"></div>
		<div>
			<textarea style="resize: none;" name="reply" id="replytext" rows="2"
				cols="41"></textarea>
		</div>
		<div class="modBtn">
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>

	<script>
	$(document).ready(function() {
		
		$(".loginA").on("click", function() {
			location.href = "/user/userLogin";
		});
		$(".joinA").on("click", function() {
			location.href = "/user/userJoin";
		});
		$(".consumer").mouseover(function(){
				$(".consumer__info").show();
			});

			$(".consumer").mouseout(function(){
				$(".consumer__info").hide();
			});
			
	
		var cnum = ${member.cnum};
		function getAllList() {
			$.getJSON("/userrp/all/" + cnum,
							function(data) {
								//data 변수가 바로 얻어온 json데이터의 집합
								console.log(data);

								// str 변수 내부에 문자 형태로 html 코드를 작성함
								var str = "";

								$(data).each(function() {
													// $(data).each()는 향상된 for문처럼 내부데이터를 하나하나 반복합니다.
													// 내부 this는 댓글 하나하나입니다.
													// 시간 형식을 우리가 쓰는 형식으로 변경
													var timestamp = this.uupdatedate;
													var date = new Date(
															timestamp);
													// date만으로도 시간표시는 우리가 아는 형태로 할 수 있지만 보기 불편함
													console.log(date);
													// date 내부의 시간을 형식(format)화 해서 출력
													var formattedTime = "게시일 : "
															+ date
																	.getFullYear() // 년도 추출
															+ "/"
															+ (date.getMonth() + 1) // month는 0월부터시작
															+ "/"
															+ date.getDate() // 날짜 추출
															+ "/"
															+ date.getHours() // 시간 추출
															+ ":"
															+ date.getMinutes() // 분 추출
															+ ":"
															+ date.getSeconds() // 초 추출	

													// this.updateDate를 표출하면 시간이 unix시간으로 표시됨  요소분석으로 a태그 찾아서 본거고 http://로 시작해야 앞에 짜잘한거 안붙어요.
													str += "<div class='replyLi' data-rno='" + this.rno + "'><br/><a href='http://localhost:8181/user/userPro?cid=${member.cid}'><strong>@"
															+ this.nickname
															+ "</strong></a> - "
															+ formattedTime
															+ "<br>"
															+ "<div class='reply'>"
															+ this.reply
															+ "</div><br/>"
															+ "<button type='button' class='btn btn-info'>수정/삭제</button><br/>"
															+ "</div>";
												});

								// #replies인 ul태그 내부에 str을 끼워넣음
								$("#replies").html(str);
							});
		}
		getAllList();

		// 비동기 코드
		// 글쓰기 부분
		$("#replyAddBtn").on("click", function() {
			// 각 input태그에 들어있던 글쓴이, 본문의 value값을 변수에 저장함.
			var nickname = $("#newReplyWriter").val();
			var reply = $("#newReply").val();
			// 디버깅시는 console.log() 내부에 적어서 확인합니다.
			//console.log(replyer + "/" + reply);
			console.log("디버깅 : " + cnum + "/" + nickname + "/" + reply);
			$.ajax({
				type : 'post',
				url : '/userrp/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					cnum : cnum,
					nickname : nickname,
					reply : reply
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						// 댓글 쓰고 나서 다시 새롭게 갱신된 목록을
						// 넣어주도록 전체 댓글 목록 다시 조회
						getAllList();
						// 댓글 다 썼으면 댓글창 비워지도록 처리
						$("#newReply").val("");
					}
				}
			})
		});

		// 글 삭제 로직
		$("#replyDelBtn").on("click", function() {
			// 삭제에 필요한 댓글번호를 모달 타이틀 부분에서 얻기
			var rno = $(".modal-title").html();

			$.ajax({
				type : 'delete',
				url : '/userrp/' + rno,
				// 삭제로직은 rno만 전달함
				// 호출타입 delete, url정보 이외엔 처리할게 없음
				success : function(result) {
					if (result === 'SUCCESS') {
						alert(rno + "번 댓글이 삭제되었습니다.");
						// 댓글삭제 후에 모달창 닫고 새 댓글목록 갱신
						$('#modDiv').hide('slow');
						getAllList();
					}
				}
			})
		});

		// 글 수정 로직(rno, reply 필요)
		$('#replyModBtn').on("click", function() {
			// rno(수정에 필요한 댓글번호 모달 타이틀에서 얻기)
			var rno = $(".modal-title").html();
			// 수정에 필요한 본문내역을 #replytext의 value값으로 얻기
			var reply = $("#replytext").val();

			$.ajax({
				type : 'put',
				url : '/userrp/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				dataType : 'text',
				data : JSON.stringify({
					reply : reply
				}),
				success : function(result) {
					if (result === 'SUCCESS') {
						alert(rno + "번 댓글이 수정되었습니다.");
						// 댓글 삭제 후 모달창 닫고 새 댓글목록 갱신
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});

		// 이벤트 위임
		// 내가 현재 이벤트를 걸려는 집단(button) 을 포함하면서 범위가 제일 좁은
		// #replies로 시작조건을 잡습니다.
		// .on("click", "목적지 태그까지 요소들", function(){실행문})
		// 과 같이 위임시는 파라미터가 3개 들어갑니다.
		$("#replies").on("click", ".replyLi button", function() {
			// this는 최 하위태그인 button, button의부모면 결국 .replyLi
			var replyLi = $(this).parent();

			// .attr("속성명") 을 하면 해당 속성의 값을 얻습니다.
			var rno = replyLi.attr("data-rno");// data-rno=this.rno 얻어오기
			//버튼의 형제(.reply)의 내부텍스트 얻기
			var reply = $(this).siblings(".reply").text();
			// 버튼의 부모(replyLi)의 자식(.reply) div class="reply"의 내부텍스트얻기
			// var reply = $(this).parent().childrens(".reply").text();

			// 클릭한 버튼에 해당하는 댓글번호 + 본문이 얻어지나 디버깅
			console.log(rno + ":" + reply);

			// 모달 열리도록 추가
			$(".modal-title").html(rno + "번 댓글");// 모달 상단에 댓글번호 넣기
			$("#replytext").val(reply);// 모달 수정창에 댓글본문 넣기
			$("#modDiv").show("slow"); // 창에 애니메이션 효과 넣기
		});

		// 모달 닫기 : closeBtn을 눌렀을때 #modDiv가 hide되도록 해야함
		$("#closeBtn").on("click", function() {
			$("#modDiv").hide("slow");
		});

			$("#btnUpdate").click(function() {
				// 확인 대화상자
				if (confirm("수정하시겠습니까?")) {
					document.form1.action = "localhost:8181/user/userModify";
					document.form1.submit();
				}
			});
			$("#btnDelete").click(function() {
				//확인 대화 상자
				if (confirm("삭제하시겠습니까?")) {
					document.form1.action = "localhost:8181/user/userDelete"
					document.form1.submit();
				}
			});
			// 정규표현식으로 파일 확장자, 용량 거르기
			var regex = new RegExp("(.*?)\.(exe|sh|zip|az)$");
			
			var maxSize = 5242880; //5mb
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				// 아까 만든 형식에 파일 이름이 해당하는지 아닌지 검사
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");					
					return false;
				}
				return true;
			}			
			
			// 업로드시 파일 선택을 초기화시키기 위해 미리 비어있는
			// .uploadDiv를 깊은복사로 복사해둠
			var cloneObj = $('.uploadDiv').clone();
			
			
			$("#uploadBtn").on("click", function(e){
				
				
				var cnum =$(".cnum").val();
				// ajax는 제출버튼을 눌렀을때 목적지가 없기 때문에
				// 빈 폼을 만들고 거기에 정보를 채워나갑니다.
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				console.log(cnum);
				console.log(inputFile);
				var files= inputFile[0].files;
				
				console.log(files);
				
				// 파일데이터를 폼에 넣기
				for(var i = 0; i < files.length; i++){
					// 폼에 넣기 전에 검사부터
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				console.log(formData);
				
				$.ajax({
					url: '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,cnum
					type : 'POST',
					dataType:'json', // 입력시 json으로 콘솔에, 안입력하면 xml로 콘솔에찍힘.
					success : function(result){
						console.log(result);// 내가 업로드한 파일 내역이 콘솔에 찍히나 디버깅

						// 업로드된 그림파일 목록을 ul내부에 리스트로 입력
						showUploadedFile(result);
						
						// 세팅되어있던 파일이 업로드되면서 목록에서 사라지게 처리.
						$(".uploadDiv").html(cloneObj.html());
					}
				});
			});// onclick uploadBtn
			

			
			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr){
				var str = "";
				
				// i는 인덱스번호(0, 1, 2....) obj 그림파일 정보가 담긴 json
				$(uploadResultArr).each(function(i, obj){
					
						if(!obj.image){
							
							var fileCallPath = encodeURIComponent(
									obj.uploadPath + "/"
								+ obj.uuuid + "_" + obj.fileName);
							
							// 그림이 아니면 썸네일대신 resources폴더 내 이미지를 대체로 보여줌
							str += "<li "
								+"data-path='" + obj.uploadPath + "' data-uuuid='" + obj.uuuid
								+ "' data-filename='" + obj.fileName + "' data-type='" + obj.image
								+ "'><a href='/download?fileName=" + fileCallPath
								+ "'><img src='/resources/file.png'>"
								+ obj.fileName + "</a>"
								+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>X</span>"
								+ "</li>";
						} else {
							//str += "<li>" + obj.fileName + "</li>";
							// 파일이름 + 썸네일을 보여주기 위해 썸네일 주소 요청하게 만들기
							var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_" + obj.uuuid + "_" + obj.fileName);
							var fileCallPath2 = encodeURIComponent(obj.uploadPath
									+ "/" + obj.uuuid + "_" + obj.fileName);
							
							// 원래 그냥 fileCallPath를 조립해서
							str += "<li "
								+"data-path='" + obj.uploadPath + "' data-uuuid='" + obj.uuuid
								+ "' data-filename='" + obj.fileName + "' data-type='" + obj.image
								+ "'><a href='/download?fileName=" + fileCallPath2
								+ "'><img src='/display?fileName=" 
								+ fileCallPath +"'>" + obj.fileName + "</a>"
								+ "<span data-file=\'" + fileCallPath + "\' data-type='image'>X</span>"	
								+ "</li>";
						}
					});
					uploadResult.append(str);
				}//showUploadedFile
			
			$(".uploadResult").on("click", "span", function(e){
				
				
				
				console.log($(e));
				
				console.log($(this));
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				console.log(targetFile + "///" + type);
				
				var targetLi  = $(this).closest("li");
				
				$.ajax({
					url : '/deleteFile',
					data : {fileName : targetFile, type:type},
					dataType : 'text',
					type : 'post',
					success : function(result){
						alert(result);
						targetLi.remove();
					}
				})
			});// .uploadResult click
			
			
			$("#submitBtn").on("click", function(e){
				// 클릭된 요소의 동작 중지(제출버튼인경우 버튼을 눌러도 제출이 되지 않음)
				// 글쓰기를 했을때, 그림이 몇 장 추가될지는 글을 써봐야 알 수 있음
				// 제출을 바로 하지 못하도록 막습니다.
				e.preventDefault();
				
				// 위의 form에 업로드된 그림요소들에 대한 정보를 추가합니다.
				// 1. form 태그 정보 얻어오기
				// 상단 form태그에 이미지 관련 정보를 hidden으로 추가하기 위해 얻어옴
				var formObj = $('form');
				
				// 2. 추가내용을 먼저 받기 위해 빈 문자열 생성
				var str = "";
				
				// 3. .uploadResult 내부에 들어간 그림정보를 얻어와서
				// formObj내부에 넣어주기
				// .uploadResult내부 ul 내부의 li가 그림정보를 담고있으므로
				// 반복문으로 처리
				$(".uploadResult ul li").each(function(i, obj){
					
					var imgInfo = $(obj);
					// BoardVO 내부의 List<BoardAttachVO>를 처리하기 위해 변수명 attachList로 전달 
					str += "<input type='hidden' name='attachList[" + i + "].fileName'"
						+ " value='"+ imgInfo.data("filename") +"'>"
						+ "<input type='hidden' name='attachList[" + i + "].uuuid'"
						+ " value='"+ imgInfo.data("uuid") +"'>"
						+ "<input type='hidden' name='attachList[" + i + "].uploadPath'"
						+ " value='"+ imgInfo.data("path") +"'>"
						+ "<input type='hidden' name='attachList[" + i + "].image'"
						+ " value='"+ imgInfo.data("type") +"'>"
				});
				// 반복이 끝나면, formObj에 위 태그들을 추가한 다음 제출합니다.
				formObj.append(str).submit();
				// 그림정보가 잘 추가되는지 디버깅
				//console.log($(formObj));
			});// #submitBtn onclick
						
	});
	
	</script>
</body>
</html>