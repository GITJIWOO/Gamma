<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script>
   	// form 내부의 submit 버튼을 눌러도 해당 리스트가 계속 유지되어야함 - 모든 리스트가 조회되면 안됨
      window.onload = function () {
        const follower = document.getElementById("follower");
        const following = document.getElementById("following");
        const followertbl = document.getElementById("followertbl");
        const followingtbl = document.getElementById("followingtbl");
        function clickFollower() {
          followertbl.style.display = "block";
          followingtbl.style.display = "none";
        }
        function clickFollowing() {
          followertbl.style.display = "none";
          followingtbl.style.display = "block";
        }
        follower.onclick = clickFollower;
        following.onclick = clickFollowing;
      };
    </script>
</head>
<body>
    <h1>친구 목록</h1>
    <h6 id="follower">팔로우한 친구</h6>
    <h6 id="following">팔로잉한 친구</h6>
    <form>
      <table border="1" id="followertbl">
        <tr>
          <td>${followerList.cid }</td>
          <!-- 현재 친구 상태이기 때문에 '친구 삭제(default)'와 '친구 추가' toggle -->
          <td rowspan="2"><input type="submit" value="친구 삭제" /></td>
        </tr>
        <tr>
          <td>${followerList.nickname }</td>
        </tr>
      </table>
    </form>
    <form>
      <table id="followingtbl">
        <tr>
          <td>${followerList.cid }</td>
          <td rowspan="2"><input type="submit" value="친구 삭제" /></td>
        </tr>
        <tr>
          <td>${followerList.nickname }</td>
        </tr>
      </table>
    </form>
</body>
</html>