<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<!-- 메인 -->
</head>
<body>

	<!-- 서치 : 김지효 -->
	<div id="search">
		<%@ include file="/WEB-INF/views/common/search_layer.jsp"%>
	</div>

	<!-- 메뉴 탭 : 김지효 -->
	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%>
	</div>


	<!-- 헤더 : 최윤호 -->
	<div id="mainpage">
		<header>
			<div class="gnb">
				<h1>
					<span class="hide">닭킹랭컴</span><a href="${pageContext.request.contextPath}"><img
						src="${pageContext.request.contextPath}/assets/img/logo_303030.png"></a>
				</h1>
				<a href="${pageContext.request.contextPath}/shop/cart.do"
					class="top-shopcart"><img
					src="${pageContext.request.contextPath}/assets/img/cart_icon.png"
					alt="장바구니"> <span class="front-cart-row">0</span> </a> <a
					href="#" class="top-menu"><img
					src="${pageContext.request.contextPath}/assets/img/category_icon.png"
					alt="메뉴"></a>
			</div>
			<script>
			$(function() {
				$(document).ready(function(){
					$.get("${pageContext.request.contextPath}/shop/cart_count",{},
							 function(req) {
								$(".front-cart-row").html(req.count);
					});
				});
			});
	</script>
		</header>

		<div class="search-wrapper">
			<div class="search-account">
				<a href="#" class="search-bar">포만감 가-득한 곤약 모음전!</a>
			</div>
			<a href="${pageContext.request.contextPath}/mypage/mypage_index.do"
				class="account"></a>
		</div>



		<nav>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/shop/promotion.do">이달의특가</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/benefit_md.do">혜택정리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/shop_category.do">종류별</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/ranking_save.do">랭킹</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/express.do"><img
						src="${pageContext.request.contextPath}/assets/img/express_delivery.png"></a></li>
			</ul>
		</nav>

		</header>
		<!-- // 헤더 : 최윤호 -->
		<main>
			<section>
				<div class="v1">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide">
							<a href="${pageContext.request.contextPath}/shop/sale.do"><img
								src="${pageContext.request.contextPath}/assets/img/129.jpg"></a>
						</div>
						<div class="swiper-slide">
							<a href="${pageContext.request.contextPath}/shop/express.do"><img
								src="${pageContext.request.contextPath}/assets/img/130.jpg"></a>
						</div>
						<div class="swiper-slide">
							<a href="${pageContext.request.contextPath}/shop/ranking.do"><img
								src="${pageContext.request.contextPath}/assets/img/swiper3.jpg"></a>
						</div>
						<div class="swiper-slide">
							<a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=1"><img
								src="${pageContext.request.contextPath}/assets/img/133.jpg"></a>
						</div>
						<div class="swiper-slide">
							<a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=1"><img
								src="${pageContext.request.contextPath}/assets/img/134.jpg"></a>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/shop/express.do"
					class="main-ad"> 지금 주문하면 <span>내일 저녁</span>에 도착!
				</a>
			</section>
			<section class="all-category">
				<table>
					<tbody>
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_01.png">닭가슴살</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_02.png">간편한끼</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_03.png">도시락/샐러드</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_04.png">고구마/견과</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_05.png">즉석/간편식</a></td>
						</tr>
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_06.png">건강간식</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_07.png">소스/음료</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_08.png">계란/두부</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_09.png">정육/수산</a></td>
							<td><a
								href="${pageContext.request.contextPath}/shop/shop_category.do"><img
									src="${pageContext.request.contextPath}/assets/img/all_cate_11.png">1팩
									담기</a></td>
						</tr>
					</tbody>
				</table>
			</section>


			<section>
				<div class="v2">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						
						<div class="swiper-slide">
							<img
								src="${pageContext.request.contextPath}/assets/img/swiperv2.jpg">
						</div>
						<!-- <div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/assets/img/swiperv3.png">
						</div> -->
						<div class="swiper-slide">
							<img
								src="${pageContext.request.contextPath}/assets/img/swiperv4.jpg">
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</section>


			<!-- 타임세일 시작: 조원우 -->
			<div class="section">
				<!-- 타임세일 헤더 -->
				<div class="section-header">
					▶ TIME SALE ◀ <a
						href="${pageContext.request.contextPath}/shop/sale.do">더보기</a>
				</div>
				<!-- 타임세일 헤더-->
				<!-- 타임세일 본문 -->
				<div class="swiper-container">
					<ul class="swiper-wrapper">
						<c:choose>
							<%-- 타임세일 상품이 없을 경우 --%>
							<c:when test="${outputSale==null || fn:length(outputSale)==0}">
								<p>타임세일 상품이 없습니다.</p>
							</c:when>

							<%-- 타임세일 상품 있을 경우 반복해서 출력 --%>
							<c:otherwise>
								<c:forEach var="item" items="${outputSale}" varStatus="status">
									<li class="swiper-slide"><a
										href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
											<div class="box">
												<div class="img">
													<img src="${item.mainImg}">
													<!-- <div class="countdown-wrapper">
														<img src="${pageContext.request.contextPath}/assets/img/icon_timedeal.png"
															style="width: 18px"> <span class="time_box day"></span>&nbsp;&nbsp;일&nbsp;&nbsp;
														<span class="time_box hour"></span>&nbsp;&nbsp;:&nbsp;&nbsp;
														<span class="time_box minute"></span>&nbsp;&nbsp;:&nbsp;&nbsp;
														<span class="time_box second"></span>&nbsp;&nbsp;남음
													</div> -->
												</div>
												<div class="desc">
													<p class="name">${item.title}</p>
													<p class="price">
														<strong>16,000</strong>원
													</p>
													<p class="delivery">
														<c:choose>
															<c:when test="${'Y' eq item.express}">
																<img
																	src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
															</c:when>
															<c:when test="${'Y' eq item.freeShipping}">
																<img
																	src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
															</c:when>
														</c:choose>
													</p>
													<c:if test="${item.rct eq '0'}">
														<p class="rating">
															<img
																src="${pageContext.request.contextPath}/assets/img/rating0.png">
															(${item.rct})
														</p>
													</c:if>
													<c:if test="${item.rct ne '0'}">
														<p class="rating">
															<fmt:parseNumber var="pages" integerOnly="true"
																value="${item.rating/item.rct}" />
															<img
																src="${pageContext.request.contextPath}/assets/img/rating${pages}.png">
															(${item.rct})
														</p>
													</c:if>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</ul>
					<div class="swiper-pagination"></div>
				</div>
				<!-- // 타임세일 본문 -->
			</div>
			<!-- // 타임세일 끝! -->

			<!-- 새로나왔닭! 시작 -->
			<div class="section">
				<!-- 새로나왔닭! 헤더 -->
				<div class="section-header">
					새로나왔닭! <a href="${pageContext.request.contextPath}/shop/new.do">더보기</a>
				</div>
				<!-- // 새로나왔닭! 헤더 -->
				<div class="swiper-container multi">
					<ul class="swiper-wrapper">
						<c:choose>

							<%-- 신상품이 없을 경우 --%>
							<c:when test="${outputNew==null || fn:length(outputNew)==0}">
								<p>신상품이 없습니다.</p>
							</c:when>

							<%-- 신상품이 있을 경우 반복해서 출력 --%>
							<c:otherwise>
								<c:forEach var="item" items="${outputNew}" varStatus="status">
									<li class="swiper-slide"><a
										href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
											<div class="box">
												<div class="img">
													<img src="${item.thumb}">
												</div>
												<div class="desc">
													<p class="name">${item.title}</p>
													<p class="price">
														<strong><fmt:formatNumber value="${item.price}"
																pattern="#,###" /></strong>원
													</p>
													<p class="delivery">
														<c:choose>
															<c:when test="${'Y' eq item.express}">
																<img
																	src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
															</c:when>
															<c:when test="${'Y' eq item.freeShipping}">
																<img
																	src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
															</c:when>
														</c:choose>
													</p>
													<c:if test="${item.rct eq '0'}">
														<p class="rating">
															<img
																src="${pageContext.request.contextPath}/assets/img/rating0.png">
															(${item.rct})
														</p>
													</c:if>
													<c:if test="${item.rct ne '0'}">
														<p class="rating">
															<fmt:parseNumber var="pages" integerOnly="true"
																value="${item.rating/item.rct}" />
															<img
																src="${pageContext.request.contextPath}/assets/img/rating${pages}.png">
															(${item.rct})
														</p>
													</c:if>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</ul>
					<div class="swiper-pagination"></div>
				</div>
			</div>

			<div class="section">
				<div class="section-header section-header-center">지금 뜨는 HOT한
					상품!</div>
				<ul class="product-list">
					<c:forEach var="item" items="${outputSv}" varStatus="status">
						<li><a
							href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
								<div class="box">
									<div class="img">
										<img src="${item.mainImg}">
									</div>
									<div class="desc">
										<p class="name">${item.title}</p>
										<p class="price">
											<strong><fmt:formatNumber value="${item.price}"
													pattern="#,###" /></strong>원
										</p>
										<p class="delivery">
											<c:choose>
												<c:when test="${'Y' eq item.express}">
													<img
														src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
												</c:when>
												<c:when test="${'Y' eq item.freeShipping}">
													<img
														src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
												</c:when>
											</c:choose>
										</p>
										<c:if test="${item.rct eq '0'}">
											<p class="rating">
												<img
													src="${pageContext.request.contextPath}/assets/img/rating0.png">
												(${item.rct})
											</p>
										</c:if>
										<c:if test="${item.rct ne '0'}">
											<p class="rating">
												<fmt:parseNumber var="pages" integerOnly="true"
													value="${item.rating/item.rct}" />
												<img
													src="${pageContext.request.contextPath}/assets/img/rating${pages}.png">
												(${item.rct})
											</p>
										</c:if>
										<%-- <p class="icon">
											<img
												src="${pageContext.request.contextPath}/assets/img/new_tag.png">
											<img
												src="${pageContext.request.contextPath}/assets/img/limit.png"
												alt="한정수량">
										</p> --%>
									</div>
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- <section class="event">
				<h2 class="clear">
					다양한 이벤트 <a href="mypage/my_event.html">더보기</a>
				</h2>
				<div>
					<a href="#"><img src="${pageContext.request.contextPath}/assets/img/event1.jpg"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/assets/img/event2.jpg"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/assets/img/event3.png"></a>
				</div>
			</section> -->
		</main>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		
		
		<div>
			<%@ include file="/WEB-INF/views/common/recent.jsp"%>
		</div>
		
	</div>


	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
        $(function() {
        	
      

            var mySwiper = new Swiper('.v1', {
                loop: true,
                autoplay: {
                      delay: 2000,
                      disableOnInteraction: false,
                    },
            });

            var mySwiper2 = new Swiper('.v2', {
                pagination:
                  {
                    el: '.swiper-pagination',
                    clickable: true,
                  },
            });

            var swiper1 = new Swiper('.swiper-container', {
                spaceBetween: 15,
                centeredSlides: true,
                autoplay: {
                delay: 2500,
                disableOnInteraction: true,
                },
                pagination: {
                el: '.swiper-pagination',
                clickable: true,
                }
            });

            var swiper2 = new Swiper('.swiper-container.multi', {
                slidesPerView: 2,
                spaceBetween: 15,
                autoplay: {
                delay: 2500,
                disableOnInteraction: true,
                },
                pagination: {
                el: '.swiper-pagination',
                clickable: true,
                }
            });
            

            $('section.event div a').click(function(e) {
            	e.preventDefault();
            	window.location.href='mypage/my_event_detail.do';
            });

            $('.v1 .swiper-slide').click(function() {
        		window.location.href='mypage/my_event_detail.do';
        	});

            $('.v2 .swiper-slide:first-child').click(function() {
        		window.location.href='shop/express.do';
        	});
          
            $('.v2 .swiper-slide:last-child').click(function() {
        		window.location.href='mypage/coupon.do';
        	});


            // --- 김지효 ---
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
            $(document).on('click', ".top-menu", function(e) {
            
            	e.preventDefault();
                if($("#menutab").css("display")=="none"){
                    $("#menutab").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".close-icon", function(e) {
                if($("#menutab").css("display")=="block"){
                    $("#menutab").css("display", "none");
                    $("#mainpage").css("display", "block");
                	
                }e.preventDefault();
            });

            /** 클릭 시 서치 탭 숨김, 표시 처리 */
            $(document).on('click', ".search-account", function(e) {
            	e.preventDefault();
                if($("#search-layer").css("display")=="none"){
                    $("#search-layer").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".search-layer-close", function(e) {
                if($("#search-layer").css("display")=="block"){
                    $("#search-layer").css("display", "none");
                    $("#mainpage").css("display", "block");
                }e.preventDefault();
            });

            /** 종류별 브랜드별 탭 클릭 이벤트 */
            $(".tab-title > li").click(function (e) {
                if($(this).hasClass("on")){
                    $(".tab-title > li").not(this).removeClass("on");
                } else {
                    $(this).addClass("on");
                    $(".tab-title > li").not(this).removeClass("on");
                }
                e.preventDefault();
            });

            $(".tab-title > li:first-child").click(function(e) {
                $("#menu-list-wrap").css("display", "block");
                $("#menu-table-wrap").css("display", "none");
                e.preventDefault();
            });

            $(".tab-title > li:last-child").click(function(e) {
                $("#menu-table-wrap").css("display", "block");
                $("#menu-list-wrap").css("display", "none");
                e.preventDefault();
            });


        });
    </script>
</body>
</html>