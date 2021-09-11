<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_event_detail.css">
</head>
<body>
<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>
  	<div id="mainpage">
        <header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>
        <div class="mypage-box" >
                <div class="mypage-head">
                    <h2 class="mypage-title2">진행중 이벤트</h2>
                    <a class="mypage-back" href="javascript:history.back()"></a>
                </div>
        </div>

        <main>
            <div class="event-detail-head">
                <div>
                    <img src="${pageContext.request.contextPath}/assets/img/2101_mail_01.png">
                </div>
                <p>
                    [안녕하소 2021] 2021년의 시작, 랭킹닭컴 50% 할인으로 활기차게!
                </p>
                <p><span>2020.12.23-2021.01.29</span></p>
                
            </div>


            <div class="event-mainboxc">
               <img src="${pageContext.request.contextPath}/assets/img/2101_mail_02.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_03.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_04.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_05.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_06.png">
               <img src="${pageContext.request.contextPath}/assets/img/2101_mail_07.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_08.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_09.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_10.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_11.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_12.png">
                <img src="${pageContext.request.contextPath}/assets/img/2101_mail_13.png">
               
                <div class="event-mainboxc1">
                    <img src="${pageContext.request.contextPath}/assets/img/2101_mail_14.png">
                </div>
                <div class="event-mainboxc1">
                    <img src="${pageContext.request.contextPath}/assets/img/2101_mail_15.png">
                </div>
                <div class="event-mainboxc1">
                   <img src="${pageContext.request.contextPath}/assets/img/2101_mail_16.png">
                </div>
                <div class="event-mainboxc1">
                    <img src="${pageContext.request.contextPath}/assets/img/2101_mail_17.png">
                </div>
                <div class="white-box">
                    
                </div>
                <div class="event-btcategory">
                    <a href="${pageContext.request.contextPath}/mypage/my_event.do">목록</a>
                </div>    
                  
               
            </div>
        </main>


        <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
       	<%@ include file="/WEB-INF/views/common/recent.jsp"%>
    
    </div>
    
    <script type="text/javascript">
        $(function() {


          	// 상단 헤더 fix 기능 구현 --- 최윤호----
            var lastScrollTop = 0;
      
            $(window).scroll(function(event){
            	 var st = $(this).scrollTop();

                 if (st > lastScrollTop && st >= 0){
                     $('.mypage-box').addClass('mypage-fix');
                     $('.gnb').removeClass('gnb-fix');
                 }

                 else {
                         $('.mypage-box').removeClass('mypage-fix');

                         if(st <= lastScrollTop && st >=10) {
                             $('.gnb').addClass('gnb-fix');
                             $('.mypage-box').addClass('mypage-fix2');
                         }
                          else{
                             $('.gnb').removeClass('gnb-fix');
                              $('.mypage-box').removeClass('mypage-fix2');
                         }
                 }

                 lastScrollTop = st;
            });

            


            // --- 김지효 ---
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
            $(document).on('click','.top-menu',function (e) {
            	e.preventDefault();
                if($("#menutab").css("display")=="none"){
                    
                    $("#menutab").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });
            $(document).on('click','.close-icon',function (e) {
            	e.preventDefault();
                if($("#menutab").css("display")=="block"){
                    $("#menutab").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 클릭 시 서치 탭 숨김, 표시 처리 */
            $(document).on('click','.search-account',function (e) {
            	e.preventDefault();
                if($("#search-layer").css("display")=="none"){
                    $("#search-layer").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });
            $(document).on('click','.search-layer-close',function (e) {
            	e.preventDefault();
                if($("#search-layer").css("display")=="block"){
                    $("#search-layer").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 종류별 브랜드별 탭 클릭 이벤트 */
            $(document).on('click','.tab-title > li',function (e) {
            	e.preventDefault();
                if($(this).hasClass("on")){
                    $(".tab-title > li").not(this).removeClass("on");
                } else {
                    $(this).addClass("on");
                    $(".tab-title > li").not(this).removeClass("on");
                }
            });
             $(document).on('click','.tab-title > li:first-child',function (e) {
            	 e.preventDefault();
                $("#menu-list-wrap").css("display", "block");
                $("#menu-table-wrap").css("display", "none");
            });
             $(document).on('click','.tab-title > li:last-child',function (e) {
            	 e.preventDefault();
                $("#menu-table-wrap").css("display", "block");
                $("#menu-list-wrap").css("display", "none");
            });


        });
    </script>
</body>
</html>