<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

	<div></div>


</body>
</html>