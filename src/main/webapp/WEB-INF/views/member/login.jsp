<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="../assets/css/login.css">
</head>

<body>

	<div id="menu">
	<%@ include file="/WEB-INF/views/common/menutab.jsp" %>
	</div>
	
	<div id="search">
	<%@ include file="/WEB-INF/views/common/search_layer.jsp" %>
    </div>

	<div id="mainpage">

	    <header>
		<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	    </header>
	
	
	<main>
		<div id="login" class="box_member">
			<h2 class="">로그인</h2>
			<!-- <div class="tabs">
				<ul class="tab_login tabmenu">
					<li class="tab tab_login1 active"><a href="#">회원</a></li>
					<li class="tab tab_login2"><a href="#">비회원 주문</a></li>
					<li class="tab tab_login3"><a href="#">비회원(주문조회)</a></li>
				</ul>
			</div> -->
			<div class="tab_contents">
				<div class="tab_content active">
					<form method="post" action="${pageContext.request.contextPath}/member/login_ok.do">
						<fieldset class="login_field">
							<legend class="hidden">회원 로그인</legend>
							<div class="fld">
								<input type="text" name="memId" value="" maxlength="50" id="memId" class="form_input member" placeholder="아이디">
							</div>
							<div class="fld">
								<input type="password" name="memPw" value="" maxlength="16" id="memPw" class="form_input member" placeholder="비밀번호">
							</div>
							<input type="hidden"/>
							<div class="login_auto_box">
								<input type="hidden" name="auto_login" id="auto_login" value="">
								<a href="#" id="auto_login_chk"><span class="custom_check"></span><span>자동로그인</span></a>
								<a href="${pageContext.request.contextPath}/member/find.do" class="link_find"><span>아이디/비밀번호 찾기 <img src="${pageContext.request.contextPath}/assets/img/arrow_rgt_type3.png" alt=""></span></a>
							</div>
							<span class="box_btn block large strong orange"><input type="submit" value="로그인"></span>
						</fieldset>
					</form>
					<div class="join">
						<p>회원가입을 하시면 보다 많은 혜택을 누려보실 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/member/join.do" class="join_button">회원가입</a>
					</div>
					<!-- 가입혜택배너 -->
					<div class="m_login_benefit"><img src="${pageContext.request.contextPath}/assets/img/ad_join.jpg"></div>
				</div>

				<div class="tab_content">

				</div>

				<div class="tab_content">
					<!-- <h3>비회원 주문조회</h3> -->
					<form method="post" action="${pageContext.request.contextPath}" onsubmit="alert('비회원 주문조회는 현재 준비중입니다.')" style="margin:0px">

						<fieldset>
							<legend class="hidden">비회원 주문조회</legend>
							<div class="fld">
								<input type="text" name="ono" id="login_order_no" class="form_input member" placeholder="주문번호">
							</div>
							<div class="fld">
								<input type="tel" name="phone" id="login_phone" class="form_input member" maxlength="11" autocomplete="off" placeholder="전화번호">
							</div>
							<span class="box_btn block large orange strong"><input type="submit" value="주문조회하기"></span>
						</fieldset>
					</form>
					<div class="join clear">
						<p>회원가입을 하시면 보다 많은 혜택을 누려보실 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/member/join.do" class="join_button">회원가입</a>
					</div>
					<!-- 가입혜택배너 -->
					<div class="m_login_benefit"><img src="${pageContext.request.contextPath}/assets/img/ad_join.jpg"></div>
				</div>
			</div>
		</div>
	</main>
	
		<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	    </footer>
	</div>
	
    <script type="text/javascript">

        // 로그인 상단부 탭 처리
        $('#login .tabmenu .tab a').on('click',function(e){
            e.preventDefault();
            var n = $('#login .tabmenu .tab a').index($(this));
            $('#login .tabmenu .tab').eq(n).addClass('active').siblings().removeClass('active');
            $('#login .tab_contents .tab_content').eq(n).addClass('active').siblings().removeClass('active');
        });
        
        var auto_chk = 0;
        
        // 자동 로그인
        $('#auto_login_chk').on('click', function(e) {
        	e.preventDefault();
        	
        	if(auto_chk == 0) {
        		$('.login_auto_box .custom_check').toggleClass('on');
        		$('#auto_login').val('1');
        		auto_chk = 1;
        	} else {
        		$('.login_auto_box .custom_check').toggleClass('on');
        		$('#auto_login').val('0');
        		auto_chk = 0;
        	}
        });

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