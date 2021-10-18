 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/styles.css" />
<title>Insert title here</title>
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
  padding: 20px 30px;
}
.regi-content select {
  height: 33px;
  width: 102%;
}
.regi-content input {
  height: 33px;
  width: 100%;
}
.regi-content input[type="text"]::placeholder,
.regi-content textarea::placeholder {
  padding-left: 5px;
  font-size: 17px;
}
.regi-content textarea::placeholder {
  padding-top: 5px;
}
.regi-content textarea {
  resize: vertical;
}
.submitBtn {
  display: flex;
  flex-direction: row-reverse;
  align-items: center;
  justify-content: center;
  margin: 30px 0;
}
.submitBtn input[type="submit"] {
  border: none;
  font-size: 17px;
  padding: 0;
  background-color: black;
  color: white;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
}
.submitBtn input[type="submit"]:hover {
  background-color: rgba(0, 0, 0, 0.7);
}
.cancelBtn {
  color: black;
  font-size: 17px;
  padding: 12px 15px;
  border-radius: 5px;
  background-color: rgba(0, 0, 0, 0.1);
  margin-right: 10px;
  cursor: pointer;
}
.cancelBtn:hover{
  background-color: rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
<!-- 
	글쓴이: ${param.qwriter }
	페이지 번호: ${param.pageNum }
 -->
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
          <c:if test="${cid eq null}">
            <div class="loginBtn">
		        <span><a href="/user/userLogin" class="loginA">로그인</a></span>
            </div>
            <div class="joinBtn">
		        <span><a href="/user/userJoin" class="joinA">가입하기</a></span>
            </div>
          </c:if>
          <c:if test="${cid ne null}">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p>${cid}</p>
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
      <div class="main">
        <div class="contents">
          <div class="detail">
          <!-- start -->
            <h1 class="form-header">1:1 문의 작성</h1>
            <form action="/qna/registerquestion" method="post">
              <table class="register-table">
                <tr>
                  <!-- 유형: 계정 및 내정보, 소프트웨어 및 게임, 라이브러리, 구매, 친구, 채팅, 어플리케이션, 기타 -->
                  <th class="regi-header">문의 유형</th>
                  <td class="regi-content">
                    <select name="qtype" required>
                      <option value="" disabled selected>
                        -- 유형을 선택하세요 --
                      </option>
                      <option value="account">계정 및 내정보</option>
                      <option value="softngame">소프트웨어 및 게임</option>
                      <option value="library">라이브러리</option>
                      <option value="purchase">구매</option>
                      <option value="friends">친구</option>
                      <option value="chatting">채팅</option>
                      <option value="app">어플리케이션</option>
                      <option value="etc">기타</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <th class="regi-header">작성자</th>
                  <td class="regi-content">
                    <input
                      type="text"
                      name="qwriter"
                      value="${param.qwriter }"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th class="regi-header">문의 제목</th>
                  <td class="regi-content">
                    <input
                      type="text"
                      name="qtitle"
                      placeholder="제목을 입력해주세요"
                    />
                  </td>
                </tr>
                <tr>
                  <th class="regi-header">문의 내용</th>
                  <td class="regi-content">
                    <textarea
                      rows="20"
                      cols="50"
                      name="qcontent"
                      placeholder="내용을 입력해주세요"
                    ></textarea>
                  </td>
                </tr>
              </table>
              <div class="submitBtn">
                <input type="submit" value="문의 등록" /><br />
                <button class="cancelBtn">취소</button>
              </div>
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
    <script>
      const cancelBtn = document.querySelector(".cancelBtn");
      function stopBtnnMove(evt) {
        evt.preventDefault();
        location.href = "/qna/questionlist";
      }
      cancelBtn.addEventListener("click", stopBtnnMove);
    </script>
</body>
</html>