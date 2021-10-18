<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style>
	.consumer {
		width: 18%;
		position: relative;
		text-align: center;
		height: 10%;
		buttom: 100;
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
		display: none;
		position: absolute;
		left: 100%;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            ><a href="#"><img src="/resources/css/image/logo.png" /></a
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
        --></div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
	
	<h1>게임 등록</h1>
	<form action="/gameInfo/gameregister" method="post">
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
				<td><input type="submit" value="게임등록"></td>
				<td><input type="reset" value="리셋"></td>
				<td><a href="/gameInfo/gamelist"><input type="button"
						value="목록으로"></a></td>
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