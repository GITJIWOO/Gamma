<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gamma</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"><!-- Bootstrap cdn 설정 -->	
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
</head>

<script>
	var arrInput = new Array(0);
	var arrInputValue = new Array(0);

	function addInput() {
		arrInput.push(arrInput.length);
		arrInputValue.push("");
		display();
	}

	function display() {
		document.getElementById('parah').innerHTML = "";
		for (intI = 0; intI < arrInput.length; intI++) {
			document.getElementById('parah').innerHTML += createInput(
					arrInput[intI], arrInputValue[intI]);
		}
	}

	function saveValue(intId, strValue) {
		arrInputValue[intId] = strValue;
	}

	function createInput(id, value) {
		return "<input name = 'tagname' type='text' id='test " + id
				+ "' onChange='javascript:saveValue(" + id
				+ ",this.value)' value='" +

				value + "'><br>";
	}

	function deleteInput() {
		if (arrInput.length > 0) {
			arrInput.pop();
			arrInputValue.pop();
		}
		display();
	}
	/////////////////////////////////////////////////////////
	/*  $("#checked").click(function() {
	    var checked = this.checked;
	    $(this).closest("div").find(":text").prop('name', function() {
	        if (checked) {
	            return this.name + "_Dis";
	        } else {
	            return this.name.replace("_Dis", "");
	        }
	    });
	}); */
</script>

<body>
    <div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
          <span
            ><a href="/main/main"><img src="/resources/css/image/logo.png" /></a
          ></span>
        </div>
        <!-- search -->
        <div class="side-bar__row">
          <form action="/gameInfo/gamelist" method="get">
          <select name="searchType" style="display:none">
          	<option  value="n"
				<c:out value="${btnMaker.cri.searchType eq 'n' ? 'selected' : '' }"/>>
				</option>
            </select>
            <input type="text" placeholder="Search Game" name="keyword" value="${btnMaker.cri.keyword }"/>
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="/gameInfo/gamelist">게임 스토어</a></span>
          <c:if test="${cid ne null}">
          	<span><a href="/library/conLibrary?cid=${cid}">라이브러리</a></span>
          </c:if>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="/qna/questionlist">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="/qna/commonquestion">자주하는 질문</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if로 로그인 전에는 회원가입+로그인 / 로그인 후에는 프로필 -->
          <c:if test="${cid eq null }">
	          <div class="loginBtn">
	        	<span><a href="/user/naverLogin" class="loginA">로그인</a></span>
	          </div>
	          <div class="joinBtn">
	        	<span><a href="/user/agreeJoin" class="joinA">가입하기</a></span>
	          </div>
       	  </c:if>
          <c:if test="${cid ne null}">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p style="color:white;"><sec:authentication property="principal.consumer.nickname"/></p>
		          </div>
		          <div class="consumer__info">
	   				<a href="/user/userGet">* 내정보</a><br/>
	   				<a href="/user/userPro">* 프로필</a><br/>
	   				<a href="/friends/followerlist">* 팔로워리스트</a><br/>
	   				<a href="/friends/followinglist">* 팔로잉리스트</a><br/>
	   				<a href="/friends/searchfriends">* 친구 검색</a><br/>
		   		  </div>
				  <form action="/user/userLogout" method="post">
					  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					  <input class="logout" type="submit" value="로그아웃" />
				  </form>
	          </div>
          </c:if>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <!-- 여기에 각자 content 붙여넣기 -->
	
	<h1>게임 등록</h1>
	<form action="/gameInfo/gameregister" method="post" id="registerForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table border="1">
			<tr>
				<th>게임 제목</th>
				<td><input type="text" name="gname" required="required" /><br /></td>
			</tr>
			<tr>
				<th>출시일</th>
				<td><input type="date" name="glaunch" required="required" /><br /></td>
			</tr>
			<tr>
				<th>개발사</th>
				<td><input type="text" name="gdeveloper" required="required" /><br /></td>
			</tr>
			<tr>
				<th>배급사</th>
				<td><input type="text" name="gfublisher" required="required" /><br /></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="gprice" required="required" /><br /></td>
			</tr>
			<tr>
				<th>게임 소개</th>
				<td><textarea rows="10" cols="50" name="gcontent"
						required="required"></textarea><br /></td>
			</tr>
			<tr>
				<th>개임 등급</th>
				<td><input type="number" name="ggrade" required="required" /><br /></td>
			</tr>
			<tr>
				<th>게임 사이트</th>
				<td><input type="text" name="gsite" required="required" /><br /></td>
			</tr>
			<tr>
				<th>동영상</th>
				<td><input type="text" name="gaddress" required="required" /><br /></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="text" name="gpicture" required="required" /><br /></td>
			</tr>
			<tr>
				<th>운영체제</th>
				<td><input type="text" name="gos" required="required" /><br /></td>
			</tr>
			<tr>
				<th>프로세서</th>
				<td><input type="text" name="gprocessor" required="required" /><br /></td>
			</tr>
			<tr>
				<th>메모리</th>
				<td><input type="text" name="gmemory" required="required" /><br /></td>
			</tr>
			<tr>
				<th>그래픽</th>
				<td><input type="text" name="ggraphic" required="required" /><br /></td>
			</tr>
			<tr>
				<th>directX</th>
				<td><input type="text" name="gdirectx" required="required" /><br /></td>
			</tr>

			<tr>
				<th>저장공간</th>
				<td><input type="text" name="gstore" required /><br /></td>
			</tr>
			<tr>
				<th>게임 태그</th>
				<td><input type="text" name="tagname" required /><br /></td>
				<th><input type="button" value="+" onclick="addInput();" /> <input
					type="button" value="-" onclick="deleteInput();" /></th>
			</tr>

			<tr>
				<td><input type="button" value="게임등록" onclick="confirm_register();"></td>
				<td><input type="reset" value="리셋"></td>
				<td><a href="/gameInfo/gamelist"><input type="button" value="목록으로"></a></td>
			</tr>

		</table>
		<input type="hidden" name="gamelist">
	</form>

	</div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO/Game-Project"
                >https://github.com/GITJIWOO/Game-Project</a
              >
            </div>
          </div>
          <div class="footer-copyright">
            <div>Copyright © GAMMA All right reserved.</div>
          </div>
        </div>
      </div>
    </div>
    
    <script type="text/javascript">
	    function confirm_register() {
			var registerForm = document.getElementById('registerForm');
			if (confirm("게임을 등록하시겠습니까?")) {
				alert("등록 확인")
				registerForm.submit();
			} else {
				alert("등록 취소")
			}
		}
    </script>


</body>
</html>