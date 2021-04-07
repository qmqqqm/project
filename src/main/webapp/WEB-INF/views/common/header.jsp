<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고 얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
});
</script>	
</head>
<body>
		 <form name="ssologinfrm" action="https://www.cgv.co.kr/user/login/login-sso.aspx" method="post">
        <input type="hidden" id="cjssoq" name="cjssoq" />
        <input type="hidden" name="returnURL" value="/default.aspx" />
    </form>
    <script type="text/javascript">
        function cjsso() {
            if ((typeof _cjssoEncData) != "undefined" && _cjssoEncData != "") {
                document.getElementById("cjssoq").value = _cjssoEncData;
                document.ssologinfrm.submit();
            }
        }

        cjsso();
    </script>

<div class="skipnaiv">
	<a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
</div>
<div id="cgvwrap">
    <div class="cgv-ad-wrap" id="cgv_main_ad">
        <div id="TopBarWrapper" class="sect-head-ad">
            <div class="top_extend_ad_wrap">
                <div class="adreduce" id="adReduce">                    
                    <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                </div> 
                <div class="adextend" id="adExtend"></div>
            </div><!-- //.top_extend_ad_wrap -->
        </div>    
    </div>    
	<!-- Header -->
	<div id="header">
		<div class="head">
			
            <!-- 서비스 메뉴 --> 
            <!-- 앱다운로드 레이어 팝업 -->
<script type="text/javascript">
    $(function () {
        $('.btn_send').on('click', function () {

            var smsyn = $('input:radio[name="myapp"]:checked').val();
            var phoneNum_1 = $('#phoneNum1').val();
            var phoneNum_2 = $('#phoneNum2').val();
            var phoneNum_3 = $('#phoneNum3').val();


            var $btn = $('.util .app');
            var $btnli = $btn.parent();
            var $layer = $btnli.find('.app-downinfo');
            var $closebtn = $layer.find('.btn_close');

            if ($("input:radio[name='myapp']:checked").val() == undefined) {

                alert('앱을 선택해주세요.');
                return;
            }

            if ($('#phoneNum1').val() == '') {

                alert('첫번째 휴대폰번호를 입력해주세요.');
                return $('#phoneNum1').focus();
            }

            if ($('#phoneNum2').val() == '') {
                alert('두번째 휴대폰번호를 입력해주세요.');
                return $('#phoneNum2').focus();
            }

            if ($('#phoneNum3').val() == '') {
                alert('세번째 휴대폰번호를 입력해주세요.');
                return $('#phoneNum3').focus();
            }

            $.ajax({
                type: "POST",
                url: '/common/ajax/user.aspx/GetSMSMaster',
                data: "{'sms_yn':'" + smsyn + "' , 'phoneNum1':'" + app.crypto.AESEncryptToBase64(phoneNum_1) + "',  'phoneNum2':'" + app.crypto.AESEncryptToBase64(phoneNum_2) + "', 'phoneNum3':'" + app.crypto.AESEncryptToBase64(phoneNum_3) + "'  }",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (result) {
                    switch (result.d.toString()) {
                        case "0":
                            // 등록되지 않음
                            alert('전송에 실패하였습니다. 잠시후 다시 시도해주시길 바랍니다.');
                            break;
                        case "1":

                            //alert('성공');
                            alert('고객님의 핸드폰 번호 ' + phoneNum_1 + '-' + phoneNum_2 + '-' + phoneNum_3 + '로 전송완료 하였습니다.');
                            $('#phoneNum1').val('')
                            $('#phoneNum2').val('')
                            $('#phoneNum3').val('')
                            $layer.removeClass('on');
                            $(this).blur();

                            // 등록완료
                            break;
                        case "2":
                            // 등록되지 않음
                            alert('1일 3회까지만 발송 가능합니다.');
                            break;
                        default:
                            //   alert('Error result Value : ' + result);
                            break;
                    }
                }
            });
        });  // SMS
    });
    

    function numberOnly() {
        if (event.keyCode != 8 && event.keyCode != 9) {
            if ((event.keyCode < 48) || (event.keyCode > 57)
				&& (event.keyCode < 96 || event.keyCode > 105)) {
                event.returnValue = false;
            }
        }
    }

    $("#phoneNum1").keyup(function (event) {
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ''));
        }
    });

    $("#phoneNum2").keyup(function (event) {
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ''));
        }
    });

    $("#phoneNum3").keyup(function (event) {
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ''));
        }
    });

    function appDownInfoPop() {

        var $btn = $('.util .app');
        var $btnli = $btn.parent();
        var $layer = $btnli.find('.app-downinfo');
        var $closebtn = $layer.find('.btn_close');

        var isCheck = function () {
            if (!$layer.hasClass('hover') && !$btnli.find('*').is(':focus')) {
                $layer.removeClass('on');
            }
        }

        $btn.on('focusin', inHandler);
        $btnli.on('mouseenter focusin', mouseenterHandler).on('mouseleave focusout', mouseleaveHandler);
        $layer.on('mouseenter', function () {
            $layer.addClass('hover');
        }).on('mouseleave', function () {
            $layer.removeClass('hover');
        })

        function inHandler(e) {
            $layer.addClass('on');

            return false;
        }
        function mouseenterHandler(e) {
            $layer.addClass('on');

            /******************************************
            GA Tag 상단 appdownload 마우스 오버시 전송
            *******************************************/
            ga('send', { hitType: 'pageview', location: 'http://www.cgv.co.kr/appdownload', title: '앱다운로드 레이어팝업' });
            ga('cgvTracker.send', { hitType: 'pageview', location: 'http://www.cgv.co.kr/appdownload', title: '앱다운로드 레이어팝업' });
            ga('rollup.send', { hitType: 'pageview', location: 'http://www.cgv.co.kr/appdownload', title: '앱다운로드 레이어팝업' });

            return false;
        }
        function mouseleaveHandler(e) {
            setTimeout(isCheck, 100);
            return false;
        }

        $closebtn.on('click', function () {
            $layer.removeClass('on');
            $(this).blur();
            return false;
        })
    }
</script>



            <h1><a href="index.html"><img src="../img.cgv.co.kr/R2014/images/title/h1_cgv.png" alt="CGV" /></a></h1>

            <div class="sect-service">
				<h2>서비스 메뉴</h2>
                <ul class="util">
					<li>
                        <!-- 2019.09 수정 -->
                        <a href="#" class="app" style="cursor:pointer" title="CGV앱 4.0 설치 새창" ><span>CGV앱 4.0 설치</span></a>
						<!-- 앱 다운로드 레이어 팝업 2019.09 SMS 전송,하단 영역 제거 -->
						<div class="app-downinfo v2">
							<div class="inner">
								<div class="tit-box">
									<strong><em>CGV</em>앱에서<br />더 편리하게 이용하세요.</strong>
								</div>
								<div class="choice-way">
									<div class="qr">
										<div class="qr-codeimg">
											<img src="../img.cgv.co.kr/R2014/images/common/img_qrcode.gif" alt="QR CODE" />
										</div>
                                        <div class="qr-desc">
                                            <p>QR코드를 스캔하고<br />앱 설치 페이지로 바로 이동하세요 </p>
                                        </div>
									</div>
								</div>
								<a class="btn_close" href="#">팝업 닫기</a>
							</div>
						</div>
                        <!-- 2019.09 수정 -->
                    </li>
					<li><a href="https://www.facebook.com/CJCGV" class="like" target="_blank" title="Facebook 좋아요! 새창" ><span>Facebook 좋아요!</span></a></li>
				    <li><a href="https://www.instagram.com/cgv_korea/" class="insta" target="_blank" title="Instagram Follow" ><span>Instagram Follow</span></a></li>
                	<li><a href="discount/index.html" class="frugal" ><span>알뜰한 영화관람법!</span></a></li> <!-- 할인카드 -->
				</ul>
                <ul class="gnb">
                
                    <li><a href="user/login/index2db8.html?returnURL=https%3a%2f%2fwww.cgv.co.kr%2fdefault.aspx" class="login" ><span>로그인</span></a></li>
					<li><a href="user/join/index.html" class="join" ><span>회원가입</span></a></li>
                    
                

					<li><a href="user/mycgv/index.html" class="mycgv required-login" data-url="/user/mycgv/" ><span>MY CGV</span></a></li>
					<li><a href="user/vip-lounge/index.html" class="vip" ><span>VIP LOUNGE</span></a></li>
					<li><a href="user/memberShip/ClubService.html" title="새창" class="club specialclub"  ><span>CLUB 서비스</span></a></li>
					<!-- 2014.12.8 리뉴얼-->
					<li><a href="support/default.html" class="customer" ><span>고객센터</span></a></li>
				    <!-- 2014.12.8 리뉴얼-->
					<li><a href="ticket/eng/newdefault.html" class="showtimes"   ><span>ENGLISH TICKETING</span></a></li>
				</ul>
           </div>
            <!-- 서비스 메뉴 -->
            
            <div class="im-wrap"> <!-- Important wrap -->
				<h2><img src="../img.cgv.co.kr/R2014/images/title/h2_cultureplex.png" alt="CULTUREPLEX" /></h2>

				<!-- 서브 메뉴 -->

</body>
</html>










