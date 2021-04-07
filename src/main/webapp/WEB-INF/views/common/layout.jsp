<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%-- pageContext를 이용하여 request객체를 얻고 얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/module.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/common.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="${contextPath}/resources/css/print.css" /> 
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />

    <script type="text/javascript" src="${contextPath}/resources/js/extraTheaters.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.config.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.utils.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.utils.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/app.init.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/silverlight_link.js"></script>
	<script src="${contextPath}/resources/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/slick.css" />
	<link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/slick-theme-custom.css" />

    <script type="text/javascript" src="${contextPath}/resources/js/icheck/login.timer.js"></script>
    <script src="${contextPath}/resources/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/icheck/iCheck.css" />

    <!-- 2020.05.07 감정지수/프리에그 프로젝트 추가 -->
    <link rel="stylesheet" media="all" type="text/css" href="${contextPath}/resources/css/preegg.css" />

<script>
$(function(){
});
</script>	
</head>
<body>
<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>

</body>
</html>










