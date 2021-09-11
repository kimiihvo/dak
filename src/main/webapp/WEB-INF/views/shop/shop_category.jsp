<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/shop-category.css">

</head>
<body>


	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">
		<header>
			<div class="gnb">
				<h1>
					<span class="hide">닭킹랭컴</span><a href="${pageContext.request.contextPath}"><img
						src="${pageContext.request.contextPath}/assets/img/logo_303030.png"></a>
				</h1>
				<a href="${pageContext.request.contextPath}/shop/cart.do" class="top-shopcart"><img
					src="${pageContext.request.contextPath}/assets/img/cart_icon.png" alt="장바구니"><span class="front-cart-row">0</span></a> <a href="#" class="top-menu"><img
					src="${pageContext.request.contextPath}/assets/img/category_icon.png" alt="메뉴"></a>
			</div>


			<div class="search-wrapper">
				<div class="search-account">
					<a href="#" class="search-bar">포만감 가-득한 곤약 모음전!</a>
				</div>
				<a href="${pageContext.request.contextPath}/mypage/mypage_index.do"
					class="account"></a>
			</div>



			<nav>
				<ul>
					<li><a href="${pageContext.request.contextPath}/shop/promotion.do">이달의특가</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/benefit_md.do">혜택정리</a></li>
					<li><a>종류별</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/ranking_save.do">랭킹</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/express.do"><img
							src="${pageContext.request.contextPath}/assets/img/express_delivery.png"></a></li>
				</ul>
			</nav>
		</header>


		<section>

			<div class="category-menu-wrap">
				<div class="category-menu-nav swiper-container">
					<div class="swiper-button-prev">
						<img src="${pageContext.request.contextPath}/assets/img/prev2_on.png">
					</div>

					<ul class="swiper-wrapper">
						<li id="cate-nav-1" class="swiper-slide swiper-slide-active"><a
							href="#section1"><img src="${pageContext.request.contextPath}/assets/img/all_cate_01.png"><span>닭가슴살</span></a></li>
						<li id="cate-nav-2" class="swiper-slide"><a href="#section2"><img
								src="${pageContext.request.contextPath}/assets/img/all_cate_02.png"><span>간편한끼</span></a></li>
						<li id="cate-nav-3" class="swiper-slide"><a href="#section3"><img
								src="${pageContext.request.contextPath}/assets/img/all_cate_03.png"><span>도시락/샐러드</span></a></li>
						<li id="cate-nav-4" class="swiper-slide"><a href="#section4"><img
								src="${pageContext.request.contextPath}/assets/img/all_cate_05.png"><span>간편식</span></a></li>
						<li id="cate-nav-5" class="swiper-slide"><a href="#section5"><img
								src="${pageContext.request.contextPath}/assets/img/all_cate_06.png"><span>건강간식</span></a></li>

					</ul>
					<div class="swiper-button-next">
						<img src="${pageContext.request.contextPath}/assets/img/next2_on.png">
					</div>
				</div>


				<div class="category-menu-section-wrap">

					<div class="category-menu-section section-1 clear">
						<a href="#" id="section1">
							<div class="category-banner-img">
								<img src="${pageContext.request.contextPath}/assets/img/cate100_banner.jpg" alt="닭가슴살이미지배너">
							</div>
						</a>
						<div>
							<ul>
								<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="0">
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=1"><img
										src="${pageContext.request.contextPath}/assets/img/cate_all.png"><span>전체</span></a></li>
										</c:forEach>
										
								<c:forEach var="item" items="${output}" varStatus="status">
								<c:if test="${item.mainCateNo == 1 }">
								
								
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=${item.mainCateNo}&subCateNo=${item.subCateNo}"><img
										src="${pageContext.request.contextPath}/assets/img/cate-10${item.subCateNo}.jpg"><span>${item.subCateName}</span></a></li>
								</c:if>
								</c:forEach>
						
								
							</ul>
						</div>
					</div>

					<div class="category-menu-section section-2 clear">
						<a href="#" id="section2">
							<div class="category-banner-img">
								<img src="${pageContext.request.contextPath}/assets/img/cate200_banner.jpg" alt="간편한끼이미지배너">
							</div>
						</a>
						<div>
							<ul>
								<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="0">
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=2"><img
										src="${pageContext.request.contextPath}/assets/img/cate_all.png"><span>전체</span></a></li>
										</c:forEach>
										
								<c:forEach var="item" items="${output}" varStatus="status">
								<c:if test="${item.mainCateNo == 2 }">
								
								
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=${item.mainCateNo}&subCateNo=${item.subCateNo}"><img
										src="${pageContext.request.contextPath}/assets/img/cate-${item.subCateNo}.jpg"><span>${item.subCateName}</span></a></li>
								</c:if>
								</c:forEach>
								
							</ul>
						</div>
					</div>

					<div class="category-menu-section section-3 clear">
						<a href="#" id="section3">
							<div class="category-banner-img">
								<img src="${pageContext.request.contextPath}/assets/img/cate300_banner.jpg" alt="도시락샐러드이미지배너">
							</div>
						</a>
						<div>
							<ul>
								<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="0">
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=3"><img
										src="${pageContext.request.contextPath}/assets/img/cate_all.png"><span>전체</span></a></li>
										</c:forEach>
								<c:forEach var="item" items="${output}" varStatus="status">
								<c:if test="${item.mainCateNo == 3 }">
								
								
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=${item.mainCateNo}&subCateNo=${item.subCateNo}"><img
										src="${pageContext.request.contextPath}/assets/img/cate-${item.subCateNo}.jpg"><span>${item.subCateName}</span></a></li>
								</c:if>
								</c:forEach>
								
							</ul>
						</div>
					</div>

					<div class="category-menu-section clear">
						<a href="#" id="section4">
							<div class="category-banner-img">
								<img src="${pageContext.request.contextPath}/assets/img/cate400_banner.jpg" alt="간편식이미지배너">
							</div>
						</a>
						<div>
							<ul>
								<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="0">
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=4"><img
										src="${pageContext.request.contextPath}/assets/img/cate_all.png"><span>전체</span></a></li>
										</c:forEach>
								<c:forEach var="item" items="${output}" varStatus="status">
								<c:if test="${item.mainCateNo == 4 }">
								
								
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=${item.mainCateNo}&subCateNo=${item.subCateNo}"><img
										src="${pageContext.request.contextPath}/assets/img/cate-${item.subCateNo}.jpg"><span>${item.subCateName}</span></a></li>
								</c:if>
								</c:forEach>
								
							</ul>
						</div>
					</div>

					<div class="category-menu-section clear">
						<a href="#" id="section5">
							<div class="category-banner-img">
								<img src="${pageContext.request.contextPath}/assets/img/cate500_banner.jpg" alt="건강간식이미지배너">
							</div>
						</a>
						<div>
							<ul>
								<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="0">
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=5"><img
										src="${pageContext.request.contextPath}/assets/img/cate_all.png"><span>전체</span></a></li>
										</c:forEach>
								<c:forEach var="item" items="${output}" varStatus="status">
								<c:if test="${item.mainCateNo == 5 }">
								
								
								<li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=${item.mainCateNo}&subCateNo=${item.subCateNo}"><img
										src="${pageContext.request.contextPath}/assets/img/cate-${item.subCateNo}.jpg"><span>${item.subCateName}</span></a></li>
								</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>
			</div>



		</section>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>


		
	</div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
        $(function() {
        	
        	$('category-menu-section ul li').click(function() {
                window.location.href='${pageContext.request.contextPath}/shop/section.do';
            });




            /*-----------------------김지효--------------------------*/

            /* 카테고리 메뉴 상단 고정 */

            var header = $('.swiper-wrapper').offset().top;


            $(window).scroll(function() {
                var window = $(this).scrollTop();

                if (header <= window){
                    $('.category-menu-nav').addClass('category-nav-fix');
                    $('.section-1').addClass('pd-top');

                }
                else{
                    $('.category-menu-nav').removeClass('category-nav-fix');
                    $('.section-1').removeClass('pd-top');
                }
            });

            /* 카테고리 메뉴 스와이퍼 플러그인 */

            var swiper = new Swiper('.swiper-container', {
                  slidesPerView: 4,
                  spaceBetween: 15,
                  freeMode: true,
                  navigation: {
                          nextEl: '.swiper-button-next',
                          prevEl: '.swiper-button-prev',
                        }

                });

            // 플러그인 css 수정
            $(".swiper-button-next").css("rignt", "0");
            $(".swiper-button-prev").css("left", "0");

            // $(".swiper-slide").removeAttr("style");
            $(".swiper-slide").attr("style", "width: 70px;");
            // $(".swiper-slide").css("width", "auto");


            /* <a>태그 클릭 시 부드럽게 이동 */
            $(".swiper-wrapper li a").on('click',function (e) {
                    e.preventDefault();

                    var targetHash = $(this).attr("href");
                    var fixHeight = $('.swiper-container').outerHeight();

                    $('html, body').stop().animate({
                        scrollTop: $(targetHash).offset().top - fixHeight
                    }, 300);
            });

            /* 스크롤 시 카테고리 메뉴 활성화 구현 */
            var section = $('.category-menu-section').outerHeight();
            var header_h = $('.swiper-wrapper').height();

            $(window).scroll(function() {
                var scroll = $(window).scrollTop();

                if (header_h < scroll){
                    $('.swiper-wrapper > li').removeClass('swiper-slide-active');
                    $('#cate-nav-1').addClass('swiper-slide-active');
                }

                if (header_h+section <= scroll && scroll > header_h) {
                    $('#cate-nav-2').addClass('swiper-slide-active');
                    $('#cate-nav-1').removeClass('swiper-slide-active');
                }

                if (header_h+(section*2) <= scroll && scroll > header_h+section){
                    $('#cate-nav-3').addClass('swiper-slide-active');
                    $('#cate-nav-2').removeClass('swiper-slide-active');
                }

                if (header_h+(section*3) <= scroll && scroll > header_h+(section*2)){
                    $('#cate-nav-4').addClass('swiper-slide-active');
                    $('#cate-nav-3').removeClass('swiper-slide-active');
                }

                if (header_h+(section*4) <= scroll && scroll > header_h+(section*3)){
                    $('#cate-nav-5').addClass('swiper-slide-active');
                    $('#cate-nav-4').removeClass('swiper-slide-active');
                }
            });




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