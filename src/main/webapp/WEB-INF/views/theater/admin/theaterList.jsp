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
<title>영화관 LIST</title>
<style type="text/css">
	table{
		text-align:center;
		margin:0 auto;
		width:50%;
	}
</style>
</head>
<body>
<form>
	<table border="1" width="100%">
		<caption>영화관 LIST</caption>
		<thead>
			<tr>
				<th>번호</th>
				<th>지역</th>
				<th>영화관명</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>노출여부</th>
				<td>삭제</td>
				<td>수정</td>
			</tr>
		</thead>
		<tbody>
			
			<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
			<c:forEach  var="theater"  items="${theaterList}">
			<tr>

				<td>${theater.theater_id}</td>
				<td>${theater.theater_location}</td>
				<td>${theater.theater_name}</td>
				<td>${theater.theater_address}</td>
				<td>${theater.theater_phone}</td>
				<td>${theater.theater_isshow}</td>
				<td><button type="button" onclick="location.href='<%=request.getContextPath() %>/deleteTheater.do?theater_id=${theater.theater_id}'">삭제</button></td>
				<td><button type="button" onclick="location.href='<%=request.getContextPath() %>/modifyTheater.do?theater_id=${theater.theater_id}'">수정</button></td>
			</tr>
		
			</c:forEach>
			
			<tr>
				<td colspan="6" style="text-align:right;padding-right:20px;">
					<a href="<%=request.getContextPath()%>/createTheaterForm.do">새로운 영화관 추가</a>	
				</td>
			</tr>
		</tbody>
	</table>		

</form>	
</body>
</html>