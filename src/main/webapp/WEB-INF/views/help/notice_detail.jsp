<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
      	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notice.css">


</head>
<body>
<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">
	    <header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>
	
	    <main>
	        <div id="boardview">
	            <h2 class="title">
	                <a href="javascript:" onclick="history.back();"></a>공지사항
	            </h2>
	            <div class="info">
	                <div class="subject">
	                    <p class="title">1월 연휴 배송공지 안내</p>
	                    <p class="stat">2019-12-31</p>
	                </div>
	            </div>
	            <div class="boxview">
	                <div id="boardcnt" class="content">
	                    <div style="text-align: center"><br></div>
	                    <div style="text-align: center">랭킹닭컴을 사랑해주시는 여러분!<br></div>
	                    <div style="text-align: center">1월 연휴 제품구매와 제품수령에 문제가 없으시도록</div>
	                    <div style="text-align: center">꼭! 아래의 발송마감 날짜와 시간을 확인해주세요!</div>
	                    <div style="text-align: center"><br></div>
	
	                    <img style="width:100%;" src="${pageContext.request.contextPath}/assets/img/notice_01.jpg"><br>
	
	                    <div style="text-align: center">일반배송의 경우 12월 30일 마감되며, 1월 2일부터 정상출고됩니다.</div>
	                    <div style="text-align: center">(배송마감일은 브랜드별로 상이할 수 있습니다.)</div>
	                    <div style="text-align: center"><br></div>
	                    <div style="text-align: center">감사합니다.</div>
	                </div>
	            </div>
	            <div class="btn">
	                <span class="box_btn view_box_btn block white large"><a href="${pageContext.request.contextPath}/mypage/help/notice.do">목록</a></span>
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
        	
        });
    </script>
</body>
</html>