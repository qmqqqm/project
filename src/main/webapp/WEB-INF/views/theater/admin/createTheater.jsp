<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 영화관 만들기</title>
<style>
#createTheater{
	text-align:center;
	margin:0 auto;
	width:50%;
}
table,tr,td{
	border:1px solid;
}
td{
	padding:10px;
}
</style>

<script>

	function add(){
		var location = prompt('지역을 추가하세요','지역명');
		alert(location);
		
		var op = new Option();
		op.value=location;
		op.text=location;
		
		document.forms["frm"].theater_location.add(op);
	}

	function del(){
		
		var loc = document.getElementById("theater_location");
		var locIndex = document.getElementById("theater_location").options.selectedIndex;
		
		loc.options[locIndex].remove();
	}


</script>
</head>
<body>
	<form name="frm" action="${contextPath}/createTheater.do" method="post">
		<table id="createTheater">
			<caption>New 영화관</caption>
			<tr>
				<td width="20%">지역</td>
				<td width="30%">
					<select name="theater_location" id="theater_location">
						<c:forEach  var="location"  items="${locationList}">
							<option class="location">${location}</option>
						</c:forEach>
					</select>
					<button type="button" onclick="add()">추가</button>
					<button type="button" onclick="del()">삭제</button>
				</td>
			</tr>
			<tr>
				<td width="20%">이름</td>
				<td width="30%">
					<input type="text" size="40" name="theater_name"/>
				</td>
			</tr>
			<tr>
				<td width="20%">주소</td>
				<td width="30%">
					<input type="text" size="40" name="theater_address"/>
				</td>
			</tr>
			<tr>
				<td width="20%">전화번호</td>
				<td width="30%">
					<input type="text" size="40" name="theater_phone"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">확인하기</button>
					<button type="button" onClick="location='main.jsp'">취소하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>