<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	<c:if test="${success eq 'register'}">
		<script>
			alert("???????????? ?????????????????????.");
		</script>
	</c:if>
	<c:if test="${success eq 'modify'}">
		<script>
			alert("???????????? ?????????????????????.");
		</script>
	</c:if>
	<c:if test="${success eq 'remove'}">
		<script>
			alert("???????????? ?????????????????????.");
		</script>
	</c:if>
	
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
          <span><a href="/library/conLibrary?cid=${qwriter}">???????????????</a></span>
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
          <sec:authorize access="isAuthenticated()">
          	<sec:authentication property="principal" var="secuInfo" />
          	<c:if test="${secuInfo.consumer.cid eq qwriter }">
            <h2 class="table-header">1:1 ??????</h2>
  			<c:if test="${!empty vo}">
            <table class="table table-hover questiontable">
              <thead class="questiontable-contents">
                <tr>
                  <!-- <th>No</th> -->
                  <th class="questiontable-each">????????????</th>
                  <th class="questiontable-each">??????</th>
                  <!-- <th>??????</th>	 -->
                  <th class="questiontable-each">?????????</th>
                  <th class="questiontable-each">?????????</th>
                  <th class="questiontable-each">????????????</th>
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
                          >?????? ?????????</span
                        >
                      </td>
                    </c:if>
                    <c:if test="${vo.aornot == 1 }">
                      <td><span class="badge bg-dark">?????? ??????</span></td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            
            <!-- ????????? ?????? -->
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
              <h1>????????? ????????? ????????????.</h1>
            </div>
			</c:if>
			</c:if>
          </sec:authorize>
            <c:if test="${admin == 0 }">
                <form action="/qna/questionform" method="get">
                  <input type="hidden" name="qwriter" value="${qwriter }" />
                  <input
                    type="hidden"
                    name="pageNum"
                    value="${btnMaker.cri.pageNum }"
                  />
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input class="question-submit" type="submit" value="1:1 ????????????" />
                </form>
              </c:if>
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
    <script src="https://kit.fontawesome.com/62b1f47417.js" crossorigin="anonymous"></script>
  </body>
</html>