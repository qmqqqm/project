/*********************************************************************************
**
**	
**  
**  
*********************************************************************************/

       
	   var getSiteAddUrl = function (page) {
		    var sUrl = "";
			sUrl = eventScriptUrl + page;
			return sUrl;
	   }
	   
	   var isMobile = function ()
	   {
		   var mobileYN = "N";
		   if (eventScriptUrl == "/WebApp/EventNotiV4/EventDetailGeneralUnited.aspx/")
		   {
			   mobileYN = "Y";
		   }
		   else
		   {
			   mobileYN = "N";
		   }
		   return mobileYN;
	   }
	   

       var getEvent_Desc = function (type, userId, eventCode, eventName, eventDesc) {
			var rtnVal ;
			var sUrl = getSiteAddUrl("registDesc");
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{type:'" + type + "', userId:'" + userId + "', eventCode:'" + eventCode + "', eventName:'" + eventName + "', eventDesc:'" + eventDesc + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
				async: true
            });
			
			return rtnVal;
        }
		
		var EventRegistDescV2 = function (type, event_seq, userId, eventType, eventCode, eventName, eventPoll, eventPollNm, eventDesc, winYn, userLevel, memberSort, clubServe, userAge, userGen, idx) 
		{
			var rtnVal ;
			var sUrl = getSiteAddUrl("EventRegistDescV2");
			jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{type:'" + type 
				+ "', event_seq:" + event_seq 
				+ ", userId:'" + userId 
				+ "', eventType:'" + eventType 
				+ "', eventCode:'" + eventCode 
				+ "', eventName:'" + eventName 
				+ "', eventPoll:'" + eventPoll 
				+ "', eventPollNm:'" + eventPollNm 
				+ "', eventDesc:'" + eventDesc 
				+ "', winYn:'" + winYn
				+ "', isMobile:'" + isMobile()
				+ "', userLevel:'" + userLevel
				+ "', memberSort:'" + memberSort
				+ "', clubServe:'" + clubServe
				+ "', userAge:'" + userAge
				+ "', userGen:'" + userGen
				+ "', idx:" + idx				
				+ "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
				success: function (data) {
    			    rtnVal = data.d;
    			},
				error: function (xhr, status, err) {
					alert(xhr.responseText);
                },
				async: false
            });
			
			return rtnVal;
        }

        var RegistPopupOpen = function () {
            
            if (pollYn === "Y" && pollSelectYn === "Y") {
                jQuery('#evt_pop_select').show();
            }

            if (pollSelectYn === "N") {
                jQuery('.btn_evt').trigger("click");
            }
            return false;

        }

        var btn_eventClick = function (type, eventPoll, eventPollNm, eventType
        , event_cd, event_nm, eventDesc, eventSeq, userId, isLogin,
        winYn, userLevel, memberSort, clubServe, userAge, idx) {
        
            if (isLogin == "False") {
                Login();
                return false;
            }

            if (multiYn == 'Y')
            {
                if ($('input:checkbox[name="evt_chk"]:checked').length > multiCnt)
                {
                    alert(multiCnt + "개 까지만 선택할수 있습니다.");
                    return false;
                }

                $('input:checkbox[name="evt_chk"]').each(function() {
            
                    if(this.checked){//checked 처리된 항목의 값
                      eventPoll += ',' + this.value; 
                      eventType += ',' + $(this).data('type');
                    }
                });
                if (eventPoll.length > 0 && eventPoll.substring(0, 1) == ",")
                {
                    eventPoll = eventPoll.substring(1, eventPoll.length);
                }
                if (eventType.length > 0 && eventType.substring(0, 1) == ",")
                {
                    eventType = eventType.substring(1, eventType.length);
                }

            }
            else
            {
                eventPoll = jQuery(":input:radio[name=evt_chk]:checked").val() == undefined ? "" : jQuery(":input:radio[name=evt_chk]:checked").val();
                eventType = jQuery(":input:radio[name=evt_chk]:checked").data('type');
                eventPollNm = jQuery(":input:radio[name=evt_chk]:checked").data('nm') == null ? "" : jQuery(":input:radio[name=evt_chk]:checked").data('nm');
            }

			if (pollYn === "N")
			{
				alert("응모하기 미사용 이벤트 입니다.");
				return false;
			}

            if (pollSelectYn === "Y" && jQuery(":input:radio[name=evt_chk]:checked").val() == undefined)
            {
                alert("선택해 주세요.");
                return false;
            }
        
       
            var rtnVal = EventRegistDescV2(type, eventSeq, userId
            , eventType, event_cd, event_nm, eventPoll, eventPollNm, eventDesc
            , winYn, userLevel, memberSort, clubServe, userAge, userGen, idx);

            if (rtnVal == "1") {
    		        alert("응모 완료 되었습니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else if (rtnVal == "9003"){
    		        Login();
    	        }
                else if (rtnVal == "10"){
    		        alert("이벤트 준비 중 입니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else if (rtnVal == "20"){
    		        alert("이벤트가 종료 되었습니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else if (rtnVal == "30"){
    		        alert("참여가능한 고객이 아닙니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else if (rtnVal == "40"){
    		        alert("이벤트 당첨자가 발표된 이벤트입니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else if (rtnVal == "0") {
    		        alert("이미 응모 한 이벤트 입니다.");
                    jQuery('#evt_pop_select').hide();
    	        }
                else
                {
                    alert("잠시 후 다시 시도 해 주세요.");
                    jQuery('#evt_pop_select').hide();
                }

                jQuery('input[name="evt_chk"]').removeAttr('checked');
                jQuery('.btn_evt').removeClass('on');
        };
		
		var checkAge = function (userId, age) {
            
			var methodNm = "IsOverCheckAge";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', checkAge:'" + age + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var checkEvent = function (userId, eventCode) {
            
			var methodNm = "check";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', eventCode:'" + eventCode + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getEvent_Desc_Contents = function (userId, eventCode) {
            
			var methodNm = "checkDescContents";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', eventCode:'" + eventCode + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getEvent = function (userId, eventCode, eventName) {
            
			var methodNm = "regist";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', eventCode:'" + eventCode + "', eventName:'" + eventName + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getWatch = function (userId, movieidx, end_dt) {

			var methodNm = "watch";
			var sUrl = getSiteAddUrl(methodNm);
			
            return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId: '" + userId + "', movieIdx:'" + movieidx + "', end_dt:'" + end_dt + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: function (data) {
                    var rtnNum = "0";
                    var result_count = parseInt(data.d.WatchCnt,10);

                    if (result_count < 1000) {
                        rtnNum = result_count;
                    }
                    else if (result_count < 10000) {
                        rtnNum = numberWithCommas(result_count);
                    }
                    else {
                        rtnNum = String(parseInt(result_count / 10000)) + "." + String(parseInt(result_count / 1000) - parseInt(result_count / 10000) * 10) + '만';
                    }

                    jQuery("#joinCntNum").html(rtnNum);
                    jQuery("#watch").addClass(data.d.HeartBtn);

                },
                error: function (xhr, status, err) {
                }
            });
        }
	
		var getClubInfo = function (userId, joinCode, type) {
            
			var methodNm = "getClubInfo";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', joinCode:'" + joinCode + "', type:'" + type + "', channelType:'" + channelType + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                error: function (xhr, status, err) {
                }
            });
        }


        var getClubJoinInfo = function (userId, joinCode, type) {
            
			var methodNm = "GetClubJoinInfo";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', joinCode:'" + joinCode + "', type:'" + type + "', channelType:'" + channelType + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getPushStatus = function (userId, flag) {
            
			var methodNm = "getPushStatus";
			var sUrl = getSiteAddUrl(methodNm);
			
			return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', flag:'" + flag + "', channelType:'" + channelType + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var GetCouponNew2 = function (userId, channelType, ip, eventCode, eventType, eventDesc,  stExp, endExp) {
			
			var sUrl = getSiteAddUrl("GetCouponNew2");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', channelType:'" + channelType + "', ip:'" + ip + "', eventCode:'" + eventCode + "', eventType:'" + eventType + "', eventDesc:'" + eventDesc + "', stExp:'" + stExp + "', endExp:'" + endExp + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var GetCouponNew2_V2 = function (userId, channelType, ip, eventCode, eventType, eventDesc,  stExp, endExp, event_seq) {
			
			var sUrl = getSiteAddUrl("GetCouponNew2_V2");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', channelType:'" + channelType + "', ip:'" + ip + "', eventCode:'" + eventCode + "', eventType:'" + eventType + "', eventDesc:'" + eventDesc + "', stExp:'" + stExp + "', endExp:'" + endExp + "', mobileYN:'" + isMobile() + "', event_seq:" + event_seq + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }

        var GetCouponNew2_V3 = function (userId, channelType, ip, eventCode, eventType, eventDesc, stExp, endExp, event_seq, userLevel, memberSort, clubServe, userAge, userGen) {

            var sUrl = getSiteAddUrl("GetCouponNew2_V3");
            return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId
		                + "', channelType:'" + channelType
		                + "', ip:'" + ip
		                + "', eventCode:'" + eventCode
		                + "', eventType:'" + eventType
		                + "', eventDesc:'" + eventDesc
		                + "', stExp:'" + stExp
		                + "', endExp:'" + endExp
		                + "', mobileYN:'" + isMobile()
		                + "', event_seq:" + event_seq
		                + ",  userLevel:'" + userLevel
		                + "', memberSort:'" + memberSort
		                + "', clubServe:'" + clubServe
		                + "', userAge:'" + userAge
		                + "', userGen:'" + userGen
		                + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var checkCouple = function (userId, eventCode, eventType) {
			
			var sUrl = getSiteAddUrl("checkCouple");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', eventCode:'" + eventCode + "', eventType:'" + eventType + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var CoupleRegist = function (userId, eventCode, eventName, eventDesc, eventType, ip) {
			
			var sUrl = getSiteAddUrl("CoupleRegist");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{userId:'" + userId + "', eventCode:'" + eventCode + "', eventName:'" + eventName + "', eventDesc:'" + eventDesc + "', eventType:'" + eventType + "', ip:'" + ip + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getUseCoupon = function (groupIdx) {
			
			var sUrl = getSiteAddUrl("getUseCoupon");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{groupIdx:'" + groupIdx + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true
            });
        }
		
		var getUseCouponQuick = function (groupIdx) {
			var rtnVal;
			var sUrl = getSiteAddUrl("getUseCouponQuick");
		    return jQuery.ajax({
                type: "POST",
                url: sUrl,
                data: "{groupIdx:'" + groupIdx + "', mobileYN:'" + isMobile() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
				success: function (data) {
					rtnVal = data.responseText;
					console.log(data.d);
				},
				error: function (xhr, status, err) {
					var err = eval("(" + xhr.responseText + ")");
					alert(err.Message);
				}
            });
        }

        var val = ""
        var eventDesc = ""
        var index = 0; //페이지 인덱스 번호
        var stExp = "";
        var endExp = "";
        function getCouponNew(eventCode, eventType) {
            if (isLogin == "False") {
                Login();
                return false;
            }
            else if (couponDownYn != "Y") {
                //alert("쿠폰 다운로드 설정이 안 되어 있습니다. ");
                return false;
            }
            else {

                GetCouponNew2_V2(userId, channelType, ip, eventCode, eventType, eventDesc, stExp, endExp, _TRK_ICMP).done(function (data) { 
                    try {

                        if (data.d.code == "00") {
                            alert('쿠폰이 발급되었습니다.');
                            self.location.reload();
                        }
                        else if (data.d.code == "01") {
                            alert('이미 쿠폰을 발급받았습니다.');
                        }
                        else if (data.d.code == "95") {
                            alert('선착순 마감되었습니다.');
                        }
                        else if (data.d.code == "96") {
                            alert('이벤트 오픈전 입니다.');
                            self.location.reload();
                        }
                        else if (data.d.code == "97") {
                            alert('이벤트가 종료되었습니다.');
                        }
                        else {
                            alert('잠시 후 다시 이용해주세요.2');
                            self.location.reload();
                        }
                    } catch (e) {
                        alert("잠시 후 이용해 주세요.");
                    }
                });

//                var result = GetCouponNew2_V2(userId, channelType, ip, eventCode, eventType, eventDesc, stExp, endExp, _TRK_ICMP);
//                result.success(function (data) {
//                    try {

//                        if (data.d.code == "00") {
//                            alert('쿠폰이 발급되었습니다.');
//                            self.location.reload();
//                        }
//                        else if (data.d.code == "01") {
//                            alert('이미 쿠폰을 발급받았습니다.');
//                        }
//                        else if (data.d.code == "95") {
//                            alert('선착순 마감되었습니다.');
//                        }
//                        else if (data.d.code == "96") {
//                            alert('이벤트 오픈전 입니다.');
//                            self.location.reload();
//                        }
//                        else if (data.d.code == "97") {
//                            alert('이벤트가 종료되었습니다.');
//                        }
//                        else {
//                            alert('잠시 후 다시 이용해주세요.2');
//                            self.location.reload();
//                        }
//                    } catch (e) {
//                        alert("잠시 후 이용해 주세요.");
//                    }
//                });
            }
        }

        function getCouponNewV2(eventCode, eventType) {
            if (isLogin == "False") {
                Login();
                return false;
            }
            else if (couponDownYn != "Y") {
                //alert("쿠폰 다운로드 설정이 안 되어 있습니다. ");
                return false;
            }
            else {

                GetCouponNew2_V3(userId, channelType, ip, eventCode, eventType, eventDesc, stExp, endExp, _TRK_ICMP, userLevel, memberSort, clubServe, userAge, userGen).done(function (data) {
                    try {

                        if (data.d.code == "00") {
                            alert('쿠폰이 발급되었습니다.');
                            self.location.reload();
                        }
                        else if (data.d.code == "01") {
                            alert('이미 쿠폰을 발급받았습니다.');
                        }
                        else if (data.d.code == "95") {
                            alert('선착순 마감되었습니다.');
                        }
                        else if (data.d.code == "96") {
                            alert('이벤트 오픈전 입니다.');
                            self.location.reload();
                        }
                        else if (data.d.code == "97") {
                            alert('이벤트가 종료되었습니다.');
                        }
                        else if (data.d.code == "30") {
                            alert("참여가능한 고객이 아닙니다.");
                        }
                        else {
                            alert('잠시 후 다시 이용해주세요.2');
                            self.location.reload();
                        }
                    } catch (e) {
                        alert("잠시 후 이용해 주세요.");
                    }
                });

                
            }
        }

        function pad(n, width) {
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
        }

        function numberWithCommas(money) {
            return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
		
		var goMovieDetailInfo = function (mvIdx) {

			if (isMobile() === "Y")
			{
				window.location.href = "http://m.cgv.co.kr/WebApp/MovieV4/movieDetail.aspx?movieIdx="+mvIdx;
			}
			else
			{
				window.location.href = "http://www.cgv.co.kr/movies/detail-view/?midx="+mvIdx;
			}
        }

//var CgvEventHelper = function () {
//	
//	this.GetTest = function (idx)
//	{
//		return idx;
//	}
//}