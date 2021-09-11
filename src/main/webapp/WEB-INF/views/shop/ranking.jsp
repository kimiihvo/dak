<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ranking.css">

</head>
<body>

	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">

		<header><%@ include file="/WEB-INF/views/common/header1.jsp"%></header>

		<main>
			<!-- 랭킹 페이지 전체 내용부 -->
			<div>
				<!-- 판매킹 / 알뜰킹 탭 리스트 -->
				<ul class="tabs">
					<li class="tab on"><a href="">판매킹</a></li>
					<li class="tab"><a
						href="${pageContext.request.contextPath}/shop/ranking_save.do">알뜰킹</a></li>
				</ul>
				<div class="tab-content">
					<div class="sell-king">
						<div class="sell-king-list-wrapper">
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<div class="sell-king-list swiper-container">
								<ul class="swiper-wrapper">
									<c:forEach var="item" items="${outputMain}" varStatus="status">
										<li class="cate_${item.mainCateNo} swiper-slide"><a
											href="">${item.mainCateName}</a></li>
									</c:forEach>

								</ul>
							</div>

							<div class="sell-king-content">
								<!-- 스테이크 훈제 탭 -->
								<ul class="product-list col-num-2 active">
									<c:forEach var="item" items="${output}" varStatus="status">
										<c:choose>
											<c:when test="${item.mainCateNo == 1 }">
												<c:set var="i" value="${i+1 }" />
												<li class="product-box">
												<a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
													<div class="box">
														<div class="img">
															<div class="no">
																<strong>${i}</strong>
															</div>
															<img src="${item.thumb}">
														</div>
														<div class="desc">
															<p class="name">${item.title }</p>
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
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
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
													</a>
												</li>

											</c:when>
										</c:choose>
									</c:forEach>
								</ul>

								<!-- 소세지/볼/큐브 탭 -->
								<ul class="product-list col-num-2">
									<c:forEach var="item" items="${output}">
										<c:choose>
											<c:when test="${item.mainCateNo == 2 }">
												<c:set var="r" value="${r+1 }" />
												<li class="product-box">
												<a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
													<div class="box">
														<div class="img">
															<div class="no">
																<strong>${r}</strong>
															</div>
															<img src="${item.thumb}">
														</div>
														<div class="desc">
															<p class="name">${item.title }</p>
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
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
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
													</a>
												</li>


											</c:when>

										</c:choose>
									</c:forEach>
								</ul>

								<!-- 소세지/볼/큐브 탭 -->
								<ul class="product-list col-num-2">
									<c:forEach var="item" items="${output}">
										<c:choose>
											<c:when test="${item.mainCateNo == 3 }">
												<c:set var="n" value="${n+1 }" />
												<li class="product-box">
												<a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
													<div class="box">
														<div class="img">
															<div class="no">
																<strong>${n}</strong>
															</div>
															<img src="${item.thumb}">
														</div>
														<div class="desc">
															<p class="name">${item.title }</p>
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
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
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
													</a>
												</li>


											</c:when>

										</c:choose>
									</c:forEach>
								</ul>

								<!-- 소세지/볼/큐브 탭 -->
								<ul class="product-list col-num-2">
									<c:forEach var="item" items="${output}">
										<c:choose>
											<c:when test="${item.mainCateNo == 4 }">
												<c:set var="c" value="${c+1 }" />
												<li class="product-box">
												<a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
													<div class="box">
														<div class="img">
															<div class="no">
																<strong>${c}</strong>
															</div>
															<img src="${item.thumb}">
														</div>
														<div class="desc">
															<p class="name">${item.title }</p>
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
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
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
													</a>
												</li>


											</c:when>

										</c:choose>
									</c:forEach>
								</ul>

								<!-- 소세지/볼/큐브 탭 -->
								<ul class="product-list col-num-2">
									<c:forEach var="item" items="${output}">
										<c:choose>
											<c:when test="${item.mainCateNo == 5 }">
												<c:set var="t" value="${t+1 }" />
												<li class="product-box">
												<a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
													<div class="box">
														<div class="img">
															<div class="no">
																<strong>${t }</strong>
															</div>
															<img src="${item.thumb}">
														</div>
														<div class="desc">
															<p class="name">${item.title }</p>
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
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
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
													</a>
												</li>


											</c:when>

										</c:choose>
									</c:forEach>
								</ul>

							</div>
						</div>
					</div>
				</div>
		</main>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
		<%@ include file="/WEB-INF/views/common/recent.jsp"%>

	</div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		$(function() {

			// --- 김지효 ---
			/** 클릭 시 메뉴 탭 숨김, 표시 처리 */
			$(document).on('click', ".top-menu", function() {
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".close-icon", function() {
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

			/** 클릭 시 서치 탭 숨김, 표시 처리 */
			$(document).on('click', ".search-account", function() {
				if ($("#search-layer").css("display") == "none") {
					$("#search-layer").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".search-layer-close", function() {
				if ($("#search-layer").css("display") == "block") {
					$("#search-layer").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

			/** 메인카테고리별 탭 클릭 이벤트 */
			// 기본으로 1번 카테고리에 active
			$(".cate_1").addClass("on");

			// 클릭 이벤트 
			$('.swiper-slide a').click(
					function(e) {
						e.preventDefault();
						var n = $('.swiper-slide a').index($(this));
						$('.swiper-slide').eq(n).addClass('on').siblings()
								.removeClass('on');
						$('.sell-king-content > ul').eq(n).addClass('active')
								.siblings().removeClass('active');
					});

			//카테고리 스와이퍼 개수 관련 
			var cate_idx = $('.sell-king-list .cate_1').index();
			if (cate_idx >= 3) {
				$(
						'.sell-king-list-wrapper .swiper_pagination_sub .swiper-pagination-bullet')
						.eq(cate_idx - 3).click();
			};

			var swiper_cat = new Swiper('.sell-king-list', {
				loop : false,
				slidesPerView : 'auto',
				freeMode : true,
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},

				intialSlide : cate_idx - 1
			});
			
			/* li 길이 맞추기 */
			var max_h=0;
			   $(".product-list li").each(function(){
			 var h = parseInt($(this).css("height"));
			    if(max_h<h){ max_h = h; }
			   });
			   $(".product-list li").each(function(){
			 $(this).css({height:max_h});
			   });

		});
	</script>
</html>