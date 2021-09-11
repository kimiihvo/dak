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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/new.css">
</head>

<body>
	<div id="mainpage">
		<header>
			<div class="new-header-wrap">
				<div class="new-header">
					<div class="new-header-left">


						<a class="new-back-btn" href="#"> <img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼">
						</a>

						<h2>신상품</h2>
					</div>

					<div class="new-header-right">
						<!-- <a class="search-account" href="#"><img src="${pageContext.request.contextPath}/assets/img/search_icon.png" alt="검색버튼"></a> -->
						<a href="${pageContext.request.contextPath}/shop/cart.do"><img
							src="${pageContext.request.contextPath}/assets/img/cart_icon.png"
							alt="장바구니버튼"><span class="front-cart-row other-page">0</span></a>
					</div>

				</div>
			</div>
		</header>


		<section>
			<div class="new-section-wrap">

				<div class="new-banner">
					<img
						src="${pageContext.request.contextPath}/assets/img/9999_banner.jpg"
						alt="신상품배너">
				</div>

				<div class="new-section">

					<div class="new-section-top">

						<%-- <input type="checkbox" id="express-check"> <label
							for="express-check"> <img
							src="${pageContext.request.contextPath}/assets/img/express_delivery.png"
							alt="특급배송">
						</label> --%>

					</div>

					<div class="new-section-mid clear">

						<span class="new-total">총 <span class="prd-count">3</span>개의
							상품
						</span>

						<div class="select">
							<!-- <select id="order-by">
								<option value="0" selected>추천순</option>
								<option value="1">신상품순</option>
								<option value="2">판매량순</option>
								<option value="1">낮은가격순</option>
								<option value="2">높은가격순</option>
							</select>  -->
							<a href="#"><img class="list-btn"
								src="${pageContext.request.contextPath}/assets/img/type1_off.png"
								alt="리스트형버튼"></a> <a href="#"><img class="gallery-btn"
								src="${pageContext.request.contextPath}/assets/img/type2_on.png"
								alt="갤러리형버튼"></a>
						</div>
					</div>
				</div>





				<div class="new-list-gallery-wrap active">
					<div class="new-list-gallery clear">
						<ul>
							<c:choose>

								<%-- 신상품이 없을 경우 --%>
								<c:when test="${output==null || fn:length(output)==0}">
									<p>신상품이 없습니다.</p>
								</c:when>

								<%-- 신상품이 있을 경우 반복해서 출력 --%>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<li class="prd-list"><a
											href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
												<div class="box clear">
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
														<p class="icon">
															<img
																src="${pageContext.request.contextPath}/assets/img/new.png"
																alt="신상품">
														</p>
													</div>
												</div>
										</a></li>

									</c:forEach>
								</c:otherwise>
							</c:choose>

						</ul>

					</div>
				</div>


				<div class="new-list-list-wrap">
					<div class="new-list-list clear">
						<ul>
							<c:choose>

								<%-- 신상품이 없을 경우 --%>
								<c:when test="${output==null || fn:length(output)==0}">
									<p>신상품이 없습니다.</p>
								</c:when>

								<%-- 신상품이 있을 경우 반복해서 출력 --%>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<li><a
											href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
												<div class="box-list clear">
													<div class="img">
														<img src="${item.thumb}">
													</div>
													<div class="desc">
														<p class="name">${item.title}</p>
														<p class="price">
															<strong><fmt:formatNumber value="${item.price}"
																	pattern="#,###" /></strong>원 <img class="delivery"
																src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
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

														<p class="icon">
															<img
																src="${pageContext.request.contextPath}/assets/img/new.png"
																alt="신상품"> <img class="mdpick"
																src="${pageContext.request.contextPath}/assets/img/mdpick.png"
																alt="MD추천">
														</p>
													</div>
												</div>
										</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
				</div>
			</div>


		</section>


		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<%@ include file="/WEB-INF/views/common/recent.jsp"%>
	</div>

	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>





	<script type="text/javascript">
		$(function() {

			/* 뒤로가기 버튼 */
			$(".new-back-btn").click(function(e) {
				e.preventDefault();
				window.history.back();
			});


			/* 카테고리 매뉴 클릭시 활성화 클래스 추가 */
			$(".list-btn")
					.click(
							function(e) {
								$(".list-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type1_on.png");
								$(".gallery-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type2_off.png");
								$(".new-list-list-wrap").addClass("active");
								$(".new-list-gallery-wrap").removeClass(
										"active");
								e.preventDefault();
							});

			$(".gallery-btn")
					.click(
							function(e) {
								
								$(".gallery-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type2_on.png");
								$(".list-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type1_off.png");
								$(".new-list-gallery-wrap").addClass("active");
								$(".new-list-list-wrap").removeClass("active");
								e.preventDefault();
							});

			/** 클릭 시 서치 탭 숨김, 표시 처리 */
			$(".search-account").click(function() {
				if ($("#search-layer").css("display") == "none") {
					$("#search-layer").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(".search-layer-close").click(function() {
				if ($("#search-layer").css("display") == "block") {
					$("#search-layer").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

			$('.box').click(function() {
				window.location.href = 'detail.html';
			});

			$('.box-list').click(function() {
				window.location.href = 'detail.html';
			});

			
			/* 개수 표시 */
			var count = $(".prd-list").length;
			$(".prd-count").html(count);
		});
	</script>
</body>

</html>