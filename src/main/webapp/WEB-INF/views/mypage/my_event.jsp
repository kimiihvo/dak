<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_event.css">
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
                <h2 class="mypage-title2">이벤트 참여</h2>
                <a class="mypage-back" href="javascript:history.back()"></a>
            </div>
        </div>
        <main>
            <section class="event_section">
                <h3 class="event_main_image">
                    <img src="${pageContext.request.contextPath}/assets/img/my_event.png">
                </h3>

                <h4 class="event_bigtitle">
                    진행중 이벤트
                    <!--<a href="#">전체보기 ></a>  -->
                </h4>

                <div class="event_box">
                    <ul>
                        <li class="clear">
                            <div>
                                <a href="${pageContext.request.contextPath}/mypage/my_event_detail.do"><img src="${pageContext.request.contextPath}/assets/img/eventing1.jpg"></a>
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/img/eventing2.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/img/eventing3.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                              <img src="${pageContext.request.contextPath}/assets/img/eventing4.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                               <img src="${pageContext.request.contextPath}/assets/img/eventing5.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                               <img src="${pageContext.request.contextPath}/assets/img/eventing6.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/img/eventing7.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                        <li class="clear">
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/img/eventing8.jpg">
                            </div>
                            <div>
                                <p>[수고했어 2020] 올 한 해를 마무리 할 최대 62% 할인 혜택!</p>
                                <div><span class="r-icon">진행중</span>2020.11.27 - 2020.12.30</div>
                            </div>
                        </li>
                    </ul>  
                </div>


                <h4 class="ano_title">
                    당첨자 발표
                    <a href="#">전체보기 ></a>
                </h4>
                <div class="ano_content">
                    <a href="#">12월 3주차 상품평 이벤트 담청자 발표:)</a>
                    <a href="#">[인스타그램 라이브 퀴즈쇼]2020년 11월 18일 당첨자 발표</a>
                    <a href="#">12월 2주차 상품평 이벤트 담청자 발표:)</a>
                </div>
            </section>   
        </main>

        <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
        <!-- 최근 본 상품 및 최상단으로 이동 버튼 -->
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