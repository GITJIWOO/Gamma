<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<title>Insert title here</title>
<style>
.detail {
  width: 90%;
  margin: 0 auto;
}
.table-header {
  color: rgba(0, 0, 0, 0.8);
  font-size: 27px;
  font-weight: 600;
  padding: 20px 0 30px 0;
  border-bottom: 3px solid rgba(0, 0, 0, 0.8);
  margin-bottom: 30px;
}
.table {
  text-align: center;
}
.questiontable-each:first-child,
.questiontable-each:nth-child(3),
.questiontable-each:nth-child(4),
.questiontable-each:last-child {
  width: 19.5%;
}
.questiontable-each:nth-child(2) {
  width: 22%;
}
.pagination {
  margin: 20px 0 25px 0;
}
.page-item.active .page-link {
  background-color: var(--mainColor);
  border-color: var(--mainColor);
}
.page-link {
  color: black;
}
.question-submit {
  border: none;
  background-color: black;
  color: white;
  padding: 10px 15px;
  border-radius: 5px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.question-submit:hover {
  background-color: rgba(0, 0, 0, 0.7);
}
.emptyquestion {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 100px 0;
}
.emptyquestion i {
  font-size: 70px;
  color: rgba(0, 0, 0, 0.2);
  margin-bottom: 50px;
}
.emptyquestion h1 {
  color: rgba(0, 0, 0, 0.5);
  font-size: 30px;
  font-weight: 700;
}
</style>
</head>
<body>
	<!-- 검색창 - 관리자만 볼 수 있음 
	<c:if test="${admin == 1 }">
	<form action="qna/questionlist" method="get">
		<input type="hidden" name="pageNum" value="${btnMaker.cri.pageNum }"/>
		<input type="hidden" name="amount" value="${btnMaker.cri.amount }"/>
		<input type="text" name="keyword" value="${btnMaker.cri.keyword }" placeholder="작성자 아이디를 입력해주세요"/>
		<input type="submit" value="검색"/>
	</form>
	</c:if> -->
	<c:if test="${success eq 'register'}">
		<script>
			alert("질문글이 등록되었습니다.");
		</script>
	</c:if>
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
          <form action="#" method="get">
            <input type="text" placeholder="   Search Game" />
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
          -->
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <h2 class="table-header">1:1 문의</h2>
  			<c:if test="${!empty vo}">
            <table class="table table-hover questiontable">
              <thead class="questiontable-contents">
                <tr>
                  <!-- <th>No</th> -->
                  <th class="questiontable-each">문의유형</th>
                  <th class="questiontable-each">제목</th>
                  <!-- <th>본문</th>	 -->
                  <th class="questiontable-each">작성자</th>
                  <th class="questiontable-each">등록일</th>
                  <th class="questiontable-each">답변여부</th>
                </tr>
              </thead>
              <tbody class="questiontable-contents">
                <c:forEach items="${vo }" var="vo">
                  <tr>
                    <!-- <td>${vo.qnum }</td> -->
                    <td class="questiontable-each">${vo.qtype }</td>
                    <td class="questiontable-each">
                      <a
                        href="/qna/getquestion?qnum=${vo.qnum }&qwriter=${qwriter }&pageNum=${btnMaker.cri.pageNum }"
                        >${vo.qtitle }</a
                      >
                    </td>
                    <!-- <td>${vo.qcontent }</td> -->
                    <td class="questiontable-each">${vo.qwriter }</td>
                    <td class="questiontable-each">${vo.qdate }</td>
                    <c:if test="${vo.aornot == 0 }">
                      <td>
                        <span class="badge bg-light text-dark"
                          >답변 준비중</span
                        >
                      </td>
                    </c:if>
                    <c:if test="${vo.aornot == 1 }">
                      <td><span class="badge bg-dark">답변 완료</span></td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <!-- 페이징 처리 -->
            <nav aria-label="...">
              <ul class="pagination justify-content-center">
                <c:if test="${btnMaker.prev }">
                  <li class="page-item">
                    <a
                      class="page-link"
                      href="/qna/questionlist?qwriter=${qwriter }&pageNum=${btnMaker.startPage - 1 }"
                      >Previous</a
                    >
                  </li>
                </c:if>
                <c:forEach
                  var="pageNum"
                  begin="${btnMaker.startPage }"
                  end="${btnMaker.endPage }"
                >
                  <li
                    class="
                      page-item
                      ${btnMaker.cri.pageNum
                      ==
                      pageNum
                      ?
                      'active'
                      :
                      ''
                      }
                    "
                  >
                    <a
                      class="page-link"
                      href="/qna/questionlist?qwriter=${qwriter }&pageNum=${pageNum }"
                      >${pageNum }</a
                    >
                  </li>
                </c:forEach>
                <c:if test="${btnMaker.next }">
                  <li class="page-item">
                    <a
                      class="page-link"
                      href="/qna/questionlist?qwriter=${qwriter }&pageNum=${btnMaker.endPage + 1 }"
                      >Next</a
                    >
                  </li>
                </c:if>
              </ul>
            </nav>
            <!-- 	${btnMaker }    -->
			</c:if>
			<c:if test="${empty vo}">
            <div class="emptyquestion">
              <i class="fas fa-exclamation-triangle"></i>
              <h1>등록된 문의가 없습니다.</h1>
            </div>
			</c:if>
            <c:if test="${admin == 0 }">
                <form action="/qna/questionform" method="post">
                  <input type="hidden" name="qwriter" value="${qwriter }" />
                  <input
                    type="hidden"
                    name="pageNum"
                    value="${btnMaker.cri.pageNum }"
                  />
                  <input class="question-submit" type="submit" value="1:1 문의하기" />
                </form>
              </c:if>
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
    <script src="https://kit.fontawesome.com/62b1f47417.js" crossorigin="anonymous"></script>
  </body>
</html>