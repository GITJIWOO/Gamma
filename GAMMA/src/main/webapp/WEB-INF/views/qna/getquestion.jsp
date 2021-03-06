<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>Gamma</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	#modDiv{
		width: 430px;
		height: 230px;
		background-color: white;
		position: relative;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19),
                    0 6px 6px rgba(0, 0, 0, 0.23);
		border-radius: 10px;
		top: 50%;
		left: 50%;
		margin-top: -5px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
	#modDiv button{
		margin-top: 5px;
	    padding: 5px;
	    color: white;
	    background-color: black;
	    border-radius: 5px;
	    cursor: pointer;
	}
	.modal-title{
		margin: 10px 0;
		font-size: 18px;
	}
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
     .regi-header,
      .regi-content {
        border-bottom: 1px solid rgba(0, 0, 0, 0.2);
      }
      .regi-header {
        color: black;
        text-align: start;
        padding-right: 80px;
      }
      .regi-content {
        width: 75%;
        padding: 20px 30px;
      }
      .adminAnswer {
        color: rgba(0, 0, 0, 0.8);
        font-size: 23px;
        font-weight: 600;
        padding: 70px 0 30px 0;
        border-bottom: 2px solid rgba(0, 0, 0, 0.8);
        margin-bottom: 30px;
      }
      .answerDetail {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }
      .answerDetail .answerWho {
        color: black;
        font-size: 17px;
        font-weight: bold;
      }
      .answerDetail .answerWhen {
        color: rgba(0, 0, 0, 0.7);
        margin: 10px 0;
      }
      .answerDetail .acontent {
        margin: 10px 0;
      }
      .answerDetail .answerDetailBtn {
        margin: 20px 0;
        border: none;
        font-size: 17px;
        padding: 0;
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        padding: 8px 10px;
        border-radius: 5px;
        cursor: pointer;
      }
      #addAnswerBtn{
        margin: 20px 0;
        border: none;
        font-size: 17px;
        padding: 0;
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        padding: 8px 10px;
        border-radius: 5px;
        cursor: pointer;      
      }
      #addAnswerBtn:hover{
      background-color: rgba(0, 0, 0, 0.2);
      color:black;
      }
      .answerDetail .answerDetailBtn:hover {
        background-color: rgba(0, 0, 0, 0.2);
        color:black;
      }
      .allAboutBtn {
        margin-top: 60px;
        display: flex;
        justify-content: center;
      }
      .golist button,
      .goregister {
        background-color: black;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
      }
      .goregister {
        margin: 0 30px;
        padding: 8px 15px;
      }
      .goregister,
      .godelete {
        font-size: 17px;
        border: none;
        font-weight: bold;
      }
      .godelete {
        padding: 8px 15px;
        cursor: pointer;
        background-color: rgba(0, 0, 0, 0.1);
        color: black;
        border-radius: 5px;
      }
      .golist button:hover,
      .goregister:hover {
        background-color: rgba(0, 0, 0, 0.7);
      }
      .godelete:hover {
        background-color: rgba(0, 0, 0, 0.4);
        color: white;
        font-weight: 400;
      }
</style>
</head>
<body>
	<!-- 
	?????? ??????: ${param.qnum }
	????????? ??????: ${param.qwriter }
	?????? ???????????????: ${param.pageNum }
	 -->
	<!-- ?????? -->
    <div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- ???????????? main???????????? ??????????????? a ?????? ?????? -->
          <span
            ><a href="/main/main"><img src="/resources/css/image/logo.png" /></a
          ></span>
        </div>
        <!-- search -->
        <div class="side-bar__row">
          <form action="/gameInfo/gamelist" method="get">
          <select name="searchType" style="display:none">
            </select>
            <input type="text" placeholder="Search Game" name="keyword" value="${btnMaker.cri.keyword }"/>
            <!-- origin?????? ?????? ?????????, enter ?????? ????????? -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="/gameInfo/gamelist">?????? ?????????</a></span>
          <span><a href="/library/conLibrary?cid=${vo.qwriter }">???????????????</a></span>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="/qna/questionlist">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="/qna/commonquestion">???????????? ??????</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if??? ????????? ????????? ????????????+????????? / ????????? ????????? ????????? -->
          <div class="consumer">
          	  <div class="consumer__imgPro">
		        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
          	  </div>
	          <div class="consumer__nickname">
	          	<p style="color:white;"><sec:authentication property="principal.consumer.nickname"/></p>
	          </div>
	          <div class="consumer__info">
   				<a href="/user/userGet">* ?????????</a><br/>
   				<a href="/user/userPro">* ?????????</a><br/>
   				<a href="/friends/followerlist">* ??????????????????</a><br/>
   				<a href="/friends/followinglist">* ??????????????????</a><br/>
   				<a href="/friends/searchfriends">* ?????? ??????</a><br/>
	   		  </div>
			  <form action="/user/userLogout" method="post">
				  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				  <input class="logout" type="submit" value="????????????" />
			  </form>
          </div>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
          <!-- start -->
            <h1 class="form-header">1:1 ?????? ??????</h1>
              <table class="register-table">
                <tr>
			<th class="regi-header">?????? ??????</th>
			<td class="regi-content">${vo.qnum }</td>
		</tr>
		<tr>
			<th class="regi-header">?????? ??????</th>
			<td class="regi-content">${vo.qtype }</td>
		</tr>
		<tr>
			<th class="regi-header">?????????</th>
			<td class="regi-content">${vo.qwriter }</td>
		</tr>
		<tr>
			<th class="regi-header">?????? ??????</th>
			<td class="regi-content">${vo.qtitle }</td>
		</tr>
		<tr>
			<th class="regi-header">?????? ??????</th>
			<td class="regi-content">${vo.qcontent }</td>
		</tr>

		<tr>
			<th class="regi-header">?????? ?????????</th>
			<td class="regi-content">${vo.qdate }</td>
		</tr>
	</table>
	
	<!-- ?????? -->
	<c:if test="${admin == 1 }">
	<h2 class="adminAnswer">1:1 ?????? ??????</h2>
	
	<!-- ?????? -->
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
			<button type="button" id="answerModBtn">??????</button>
			<button type="button" id="answerDelBtn">??????</button>
			<button type="button" id="closeBtn">??????</button>
		</div>
	</div>
	</c:if>
	
	<!-- ?????? -->
	<div id="regiAnswer">
	</div>

	<script type="text/javascript">
		var qnum = ${param.qnum };
		var str2 = "<textarea rows='10' cols='50' name='acontent' id='acontent' placeholder='????????? ??????????????????.'></textarea><br><button id='addAnswerBtn'>?????? ??????</button>";
		$("#inputAnswer").html(str2);
		var adminOrNot = ${admin};
		console.log("admin ?????? ?????????: "+adminOrNot);
		function getAnswer(){
			$.getJSON("/qna/answer/" + qnum, function(data){
				console.log("?????????");
				$(data).each(function(){
					content = this.acontent;
				});
				var str = "";
				$(data).each(function(){	
					var timestamp = this.adate;
					var date = new Date(timestamp);
					var formattedTime = "<span class='answerWhen'>?????? ?????????: " + date.getFullYear() 
													 + "/" + (date.getMonth() + 1) 
													 + "/" + date.getDate()
													 + " " + date.getHours()
													 + ":" + date.getMinutes()
													 + ":" + date.getSeconds();
													 + "</span>"
					// ?????? ????????? ??????,  
					if(adminOrNot === 0){
						str += "<div data-anum='" 
							+ this.anum 
							+ "' class='answerDetail'><span class='answerWho'>@?????????</span>" 
							+ formattedTime 
							+ "<div class='acontent'>" 
							+ this.acontent 
							+ "</div></div>";
					}
					// ???????????? ??????,
					else if(adminOrNot === 1){
						str += "<div data-anum='" 
							+ this.anum 
							+ "' class='answerDetail'><span class='answerWho'>@?????????</span>" 
							+ formattedTime 
							+ "<div class='acontent'>" 
							+ this.acontent 
							+ "</div><button class='answerDetailBtn'>??????/??????</button></div>";
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
	
	// ?????? ?????? ??????
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	$("#addAnswerBtn").on("click", function(){
		var acontent = $("#acontent").val();
		$.ajax({
			type : 'post',
			url : '/qna/answer/new',
			beforeSend : function(xhr) {
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
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
					alert("?????? ????????? ?????????????????????.");
					getAnswer();
					
				}
			}
		});
	});
	
	// ??????/?????? ??????
	$("#regiAnswer").on("click", ".answerDetail button", function(){
		var answerDetail = $(this).parent().parent();
		var anum = answerDetail.attr("data-anum");
		var acontent = $(this).siblings(".acontent").text();
		console.log(anum + ":" + acontent);
		$(".modal-title").html(anum);
		$("#answertext").val(acontent);
		$("#modDiv").show("slow");
	});
	
	// modal - ?????? ?????? ??????
	$("#answerModBtn").on("click", function(){
		var anum = $(".modal-title").html();
		console.log(anum);
		var acontent = $("#answertext").val();
		$.ajax({
			type : 'patch',
			url : '/qna/answer/'+ anum,
			beforeSend : function(xhr) {
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
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
					alert("?????? ????????? ?????????????????????.");
					$("#modDiv").hide("slow");	
					getAnswer();
				}
			}
		});
	});
	
	// modal - ?????? ?????? ??????
	$("#answerDelBtn").on("click", function(){
		var anum = $(".modal-title").html();
		$.ajax({
			type : 'delete',
			url : '/qna/answer/'+ anum,
			beforeSend : function(xhr) {
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			success : function(result){
				if(result == 'remove success'){
					alert("?????? ????????? ?????????????????????.");
					$("#modDiv").hide("slow");
					// ??????????????? ????????? - ???..?
					getAnswer();
				}
			}
		});
	});
	
	// modal - ?????? ?????? 
	$("#closeBtn").on("click", function(){
		$("#modDiv").hide("slow");			
	});
	</script>
	</c:if>
	<div class="allAboutBtn">
	<a class="golist" href="/qna/questionlist?qwriter=${param.qwriter }&pageNum=${param.pageNum }"><button>?????? ??????</button></a>
	<c:if test="${admin == 0 }">
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="hidden" name="qwriter" value="${param.qwriter }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input class="goregister" type="submit" value="?????? ??????"/>
	</form>
		<form action="/qna/removequestion" method="post">
			<input type="hidden" name="qnum" value="${vo.qnum }"/>
			<input type="hidden" name="qwriter" value="${param.qwriter }"/>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input class="godelete" type="submit" value="?????? ??????"/>
		</form>
	</c:if>
	</div>
          </div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;?????????, ?????????, ?????????, ?????????</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO/Game-Project"
                >https://github.com/GITJIWOO/Game-Project</a
              >
            </div>
          </div>
          <div class="footer-copyright">
            <div>Copyright ?? GAMMA All right reserved.</div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>