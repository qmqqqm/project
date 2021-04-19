<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.movie{
width:26%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
} 
.theaters{
width:26%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
}
.local{
float: left;
width:40%;
}
.localsub{
width:55%;
float: left;
}
.day{
width:10%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
}
.time{
width:35%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
} 
.bottombar{
	clear: both;
	height:100px;
	background:black;
}
.title{
	text-align: center;
	font-size:15px;
	color:white;
	background: black;
	padding:5px 0;
}
.bottombarmovie{
width:25%;
height:60px;
border-right: 1px solid white;
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
float: left;
}
.bottombarselect{
width:25%;
height:60px;
border-right: 1px solid white;
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
float: left;
}
.bottombarpay{
width:45%;
height:60px;
margin : 20px 0;
font-size:25px;
font-weight:900;
padding:0 10px;
float: left;
}
</style>
<div id="contaniner">

        <!-- LineMap -->
        <div id="navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="./main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        <li><a href="index.html">예매</a></li>
                        <li class="last">빠른예매</li>
                    </ul>
                </div>
                <div class="sect-special">
                    <ul> 
                        <li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../user/memberShip/ClubService.html" class="specialclub" title="새창">CLUB 서비스</a></li>
                       <!-- <li><a href="#" class="photi" title="새창">포토티켓</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

		<!-- Contents Area -->
		<div id="contents" style="height:1px;padding:0;"></div>
        
        <div class="movie">
        <div class="title">영화</div>
        <c:forEach items="${movieList.movies}" var="movie">
        
        ${movie.movie_title}<br/>
        </c:forEach>
        
        </div>
        
        <div class="theaters">
       <div class="title">지역</div>
       <div class="local">
       <c:forEach items="${movieList.theaters}" var="theaters">
			 ${theaters.theater_location}<br>
			</c:forEach>
			 </div>
			 <div class="localsub">
			 	<c:forEach items="${movieList.sang}" var="theaters">
				 ${theaters.theater_name}<br>
			</c:forEach>
			 </div>
		</div>
		
	<%-- 내용 들어 가는 곳 --%>
<%--	<div >
		
			
	
		 <div class="tab_container">
			<div class="tab_content" id="tab1">
				<h4>책소개</h4>
				jstl의 함수 replace를 이용하여  br태그로 치환후 출력
				<p>${fn:replace(goods.goods_intro,crcn,br) }</p>
				<c:forEach var="image" items="${imageList }">
					<img 
						src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</div>
			<div class="tab_content" id="tab2">
				<h4>저자소개</h4>
				<p>
				<div class="writer">저자 : ${goods.goods_writer}</div>
				 <p>${fn:replace(goods.goods_writer_intro,crcn,br) }</p> 
				
			</div>
			<div class="tab_content" id="tab3">
				<h4>책목차</h4>
				<p>${fn:replace(goods.goods_contents_order,crcn,br) }</p> 
			</div>
			<div class="tab_content" id="tab4">
				<h4>출판사서평</h4>
				 <p>${fn:replace(goods.goods_publisher_comment,crcn,br) }</p> 
			</div>
			<div class="tab_content" id="tab5">
				<h4>추천사</h4>
				<p>${fn:replace(goods_recommendation,crcn,br) }</p>
			</div>
		</div>
	</div> 
        </div>--%>
        <div class="day">
        <div class="title">날짜</div>
        <c:forEach items="${movieList.nal}" var="theaters">
				 ${theaters.times_time}<br>
			</c:forEach>
        </div>
        <div class="time">
        <div class="title">시간</div>
        </div>
	</div>
        <div class="bottombar">
        <div class="bottombarmovie">
        	영화선택
        </div>
         <div class="bottombarselect">
         <!-- <table>
         <tr>
         <td>극장</td>
         <td></td>
         </tr>
         <tr>
         <td>일시</td>
         <td></td>
         </tr>
         <tr>
         <td>상영관</td>
         <td></td>
         </tr>
         <tr>
         <td>인원</td>
         <td></td>
         </tr>
         </table> -->
         		극장선택
        </div>
         <div class="bottombarpay">
         		좌석선택 > 결제
        </div>
        </div>
	<!-- /Contaniner -->





