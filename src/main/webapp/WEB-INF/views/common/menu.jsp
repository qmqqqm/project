<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 서브 메뉴 -->
				

<script type="text/javascript">
    //상단 키워드 광고 (S)
    function AdSearchExt(txt, SearchText) {
        $('#header_keyword').attr('placeholder', txt);
        $('#header_ad_keyword').val(SearchText);
    }

    function hdIcoSet(left, sh) { }
    //상단 키워드 광고 (E)


    //특별관 클럽 팝업
    function openSpecialClub() {
        
        var win = window.open('event/develop/1503_CLUB_Info.html', 'winSpecialClub', 'left=0,top=0,width=580,height=700,toolbar=no,scrollbars=yes');
        win.focus();
    }
    //노원타운
    function openNowonTown() {
        var win = window.open('http://section.cgv.co.kr/event/NowonTown/serviceInfo.aspx', 'winNowonTown', 'left=0,top=0,width=700,height=800,toolbar=no,scrollbars=yes');
        win.focus();
    }


    //상단광고닫기
    function hideCgvTopAd() {
        $(".cgv-ad-wrap").hide();
        $('#wrap_main_notice').parent('div').css('top', 280);
    }

    //비즈스프링 클릭로그
    function setClickLog(title) {
        // eval("try{trk_clickTrace('EVT', '" + title + "')}catch(_e){}");
    }
   
    //]]>
</script>

<!-- 통합검색 -->
<script type="text/javascript">
    (function ($) {
        $(function () {

            //검색 입력창 클릭 시 광고값 reset
            $('#header_keyword').on('click', function () {
                $(this).attr('placeholder', '');
                $('#header_ad_keyword').val('');
            });

            //통합검색 상단 검색 버튼
            $('#btn_header_search').on('click', function () {
                if ($('#header_ad_keyword').val() != "")
                    goSearch($('#header_ad_keyword'));      //광고
                else
                    goSearch($('#header_keyword'));

                return false;
            });

            //통합검색 검색어 입력창
            $('#header_keyword').keyup(function (e) {
                if (e.keyCode == 13) goSearch($('#header_keyword'));
            });

            //통합검색
            function goSearch($objKeyword) {

                if ($objKeyword.val() == "") {
                    alert("검색어를 입력해 주세요");
                    $objKeyword.focus();
                    return false;
                }

                location = "/search/?query=" + escape($objKeyword.val());
            }
        });
    })(jQuery);
</script>
				<div class="lnb">
					<h2>CGV 주메뉴</h2>
					<ul id="gnb_list">
						<li class="movie"><a href="movies/index.html">영화</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="movie/index.html">무비차트</a></li>
										<li><a href="movie/hd-trailer.html">HD 트레일러</a></li>
										<li><a href="movie/finder.html">무비파인더</a></li>
                                        <!--
                                        2019-12-03 평점 서비스 삭제 by 안지은
										<li><a href="/movies/point/">평점</a></li>
                                        -->
										<li class="last"><a href="arthouse/index.html">CGV아트하우스</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="booking"><a href="ticket/index.html">예매</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="ticket/index.html">빠른예매</a></li>
										<li><a href="reserve/show-times/index.html">상영시간표</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="theaters"><a href="theaters/index.html">극장</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="theaters/index.html">CGV 극장</a></li>
										<li><a href="theaters/special/index.html">특별관</a></li>
										<li class="last"><a href="user/memberShip/ClubService.html" class="specialclub">CLUB 서비스</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="culture"><a href="culture-event/event/index.html">이벤트&amp;컬쳐</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="culture-event/event/index.html">이벤트</a></li>
										<li><a href="culture-event/popcorn-store/index.html">기프트샵</a></li>
										<li><a href="magazine/index.html" >매거진</a></li>									
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- /Local Navigation Bar -->

                <!-- Integrated search(통합검색) -->
				<div class="sect-srh">
					<h2>통합검색서비스</h2>
					<fieldset>
						<legend>통합검색</legend>
						<input type="text" title="통합검색" id="header_keyword" name="header_keyword" minlength="2" maxlength="20" />
                        <input type="hidden" id="header_ad_keyword" name="header_ad_keyword" />
						<button type="button" class="btn-go-search" id="btn_header_search">검색</button>
                        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Search_txt" width="0" height="0" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>
					</fieldset>
				</div>
				<!-- /Integrated search(통합검색) -->
                <!-- Advertisement -->
                
				<div class="ad-partner">
                    <a href="http://section.cgv.co.kr/discount/Special/discount/EventDetail.aspx?Idx=11972&amp;pb=Y"  >
                        <img src="/movie/resources/images/WingBanner/2020/1015/16027565478490.png" alt="간편결제 차이" />
                    </a>					
				</div>
                
				<!-- /Advertisement -->
                <!-- 서브 메뉴 -->
                	</div>
		</div>
        <!-- txt banner -->
        
        <!-- /text banner -->
	</div>
	<!-- /Header -->
	<!-- /Contaniner --> 
	 <div class="com_pop_wrap">
		<div class="com_pop_fog"></div>
	</div>











