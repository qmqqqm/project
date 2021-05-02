<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

        <!-- LineMap -->

        <div id="ctl00_navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        
                            <li >
                                <a href="index.html">고객센터</a>
                            </li>
                        
                            <li  class="last">
                                예약문의
                            </li>
                        
                        
                    </ul>
                </div>
                <!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			

<!-- Contents Area -->
<div id="contents">
	<!-- Contents Start -->
	<div class="cols-content">
		
<div class="col-aside">
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class=''><a href="support.do">고객센터 메인<i></i></a></li>
            <li class=''><a href="news/default.html">공지/뉴스<i></i></a></li>
            <li class='on'><a href="ticketBoardList.do" >예매문의<i></i></a></li>
            <li class=''><a href="../user/login/index08fe.html">이벤트<i></i></a></li>
            <li class=''><a href="../user/login/indexf961.html">분실물 문의<i></i></a></li>
            <li class=''><a href="lease/default.html">자유게시판<i></i></a></li>            
          
            
          
        </ul>
    </div>
  
</div>
    
 <div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">예매문의</h2>
				<p class="stit">늘봄극장 예매(예매,취소,상영시간)관련 게시판 입니다</p>
			</div>
			
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${ticketDetail.ticketBoard_title}</li>
					<li class="stit_area">
					<form action="adminTicketReplWrite.do">
					<span>제목 : <input name="title" type="text"></span><br/>
					 <input name="userid" type="hidden" value="${admin.member_userid}" readonly="readonly" >
					 <input name="ticketBoard_id" type="hidden" value="${ticketBoard_id}" readonly="readonly" >
					
						<input name="kind" type="hidden" value="ㄴ답변" readonly="readonly" >			
						
						</select></span>
					</li>
				</ul>
				<div class="view_area">
					<p><textarea name="content" rows="20" cols="80">${ticketDetail.ticketBoard_content}</textarea> </p>
				</div>
				
				<div class="customer_btn"><input type="submit" class="round inblack" id="write" value="답변하기"></button></a></div>
				</form>
			</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>			  