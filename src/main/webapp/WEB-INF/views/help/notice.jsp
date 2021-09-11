<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notice.css">
   	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
   		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>
	<div id="mainpage">
	    <header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>

	    <main>
	        <div id="boardlist">
	            <h2 class="title"><a href="${pageContext.request.contextPath}/help/help.do" onclick=""></a>공지사항</h2>
	            <ul id="boardlist_body" class="list">
	                <li>
	                    <div class="subject">
	                        <p class="stat"><strong>[공지]</strong> <span class="date">2020-12-23</span></p>
	                        <p class="title">2020년 연말연시 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><strong>[공지]</strong> <span class="date">2019-06-19</span></p>
	                        <p class="title">돌아와요 회원님, 휴면회원 분들께 "1만원 할인쿠폰"을 드립니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><strong>[공지]</strong> <span class="date">2019-04-18</span></p>
	                        <p class="title">랭킹닭컴 멤버쉽 완전정복~! 회원 혜택부터 등급별 안내까지, 지금 바로 확인하세요!</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><strong>[공지]</strong> <span class="date">2015-08-10</span></p>
	                        <p class="title">랭킹닭컴 ,개근질닷컴, 닭쿡, 스튜디오 유 개인정보 유효기간제 시행 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><strong>[공지]</strong> <span class="date">2013-03-21</span></p>
	                        <p class="title">닭대리 통합포인트 사용안내!!</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-10-07</span></p>
	                        <p class="title">2020년 한글날 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-09-25</span></p>
	                        <p class="title">2020년 추석 연휴 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-08-12</span></p>
	                        <p class="title">8월 연휴 기간 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-06-18</span></p>
	                        <p class="title">개인 정보처리 방침 변경 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-06-05</span></p>
	                        <p class="title">6월 연휴 기간 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-04-29</span></p>
	                        <p class="title">5월 연휴 기간 배송 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-04-14</span></p>
	                        <p class="title">선거 기간 배송 공지 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-02-12</span></p>
	                        <p class="title">랭킹닭컴 생일쿠폰 발급 변경 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2020-01-21</span></p>
	                        <p class="title">설 연휴 배송공지 안내</p>
	                    </div>
	                </li>
	                <li>
	                    <div class="subject">
	                        <p class="stat"><span class="date">2019-12-31</span></p>
	                        <p class="title">1월 연휴 배송공지 안내</p>
	                    </div>
	                </li>
	            </ul>
	            <div class="more">
	                <a href="#" onclick="alert('마지막 페이지 입니다.'); return false;">
	                    <img src="${pageContext.request.contextPath}/assets/img/more2.png" alt="더보기">
	                </a>
	            </div>
	        </div>
	    </main>

	    <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
    </div>

    <script type="text/javascript">
        $(function() {

        	// --- 김지효 ---
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */

            $(document).on('click', ".top-menu", function() {
                if($("#menutab").css("display")=="none"){
                    $("#menutab").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".close-icon", function() {
                if($("#menutab").css("display")=="block"){
                    $("#menutab").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 클릭 시 서치 탭 숨김, 표시 처리 */
            $(document).on('click', ".search-account", function() {
                if($("#search-layer").css("display")=="none"){
                    $("#search-layer").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".search-layer-close", function() {
                if($("#search-layer").css("display")=="block"){
                    $("#search-layer").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 종류별 브랜드별 탭 클릭 이벤트 */
            $(".tab-title > li").click(function () {
                if($(this).hasClass("on")){
                    $(".tab-title > li").not(this).removeClass("on");
                } else {
                    $(this).addClass("on");
                    $(".tab-title > li").not(this).removeClass("on");
                }
            });

            $(".tab-title > li:first-child").click(function() {
                $("#menu-list-wrap").css("display", "block");
                $("#menu-table-wrap").css("display", "none");
            });

            $(".tab-title > li:last-child").click(function() {
                $("#menu-table-wrap").css("display", "block");
                $("#menu-list-wrap").css("display", "none");
            });

            $("#boardlist_body > li").click(function() {
                window.location.href='notice_detail.do';
            });

        });
    </script>
</body>
</html>