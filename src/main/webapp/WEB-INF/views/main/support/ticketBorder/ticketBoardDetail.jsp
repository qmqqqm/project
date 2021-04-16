<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<span>등록일<em class="regist_day">${ticketDetail.ticketBoard_regDate}</em></span>
						<span class="check_tit_area">조회수<em class="check_num">${ticketDetail.ticketBoard_readcount}</em></span>
					</li>
				</ul>
				<div class="view_area">
					<p> ${ticketDetail.ticketBoard_content}</p>
				</div>
				<div class="customer_btn"><button type="button" class="round inblack" id="btn_list"><span>목록으로</span></button></div>
				<!-- 이전글,다음글 (s) -->
				<div class="btm_sup_list">
					<ul class="line_sup_next">
						<li class="stit">이전글</li>
						<li class="name"><a href='#' class="txt">이전 글이 없습니다.</a></li>
                        
					</ul>
					<ul class="line_sup_prev">
						<li class="stit">다음글</li>
						<li class="name"><a href='/support/news/detail-view.aspx?idx=7824&type=1&page=1&searchtext=&searchfield=0' class="txt">하나멤버스 하나머니 사용 일시중단 안내(1/23(토) 02:00~05:00)</a></li>
                        <li class="check_writ_area">등록일<span class="check_num">2021.01.22</span></li>
					</ul>
				</div>
				<!-- 이전글,다음글 (e) -->
			</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>			  