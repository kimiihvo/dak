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
	href="${pageContext.request.contextPath}/assets/css/section.css">


</head>
<body>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">
		<header>
			<div class="new-header-wrap">
				<div class="new-header">
					<div class="new-header-left">
						<a class="new-back-btn" href="#"> <img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"><span class="front-cart-row other-page">0</span>
						</a>
						<c:forEach var="item" items="${output}" varStatus="status"
							begin="0" end="0">
							
							<c:choose>
							<c:when test="${param.subCateNo == null}">
							<h2>${item.mainCateName}</h2>
								
							</c:when>
							<c:otherwise>
							
							<h2>${item.subCateName}</h2>
							</c:otherwise>
							</c:choose>


						</c:forEach>
					</div>

					<div class="new-header-right">
						<a class="search-account" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/search_icon.png"
							alt="검색버튼"></a> <a
							href="${pageContext.request.contextPath}/shop/cart.do"><img
							src="${pageContext.request.contextPath}/assets/img/cart_icon.png"
							alt="장바구니버튼"></a>
					</div>

				</div>
			</div>
		</header>

		<main id="wrap">
			<!-- 특급배송 페이지 본문 -->
			<section id="big_section">

				<div class="ts-section-wrap">
					<div class="ts-section">
						<div class="ts-section-mid clear">

							<span class="ts-total">총 <span class="prd-count"></span>개의
								상품
							</span>

							<div class="select">
								<a href="#"><img class="list-btn"
									src="${pageContext.request.contextPath}/assets/img/type1_on.png"
									alt="리스트형버튼"></a> <a href="#"><img class="gallery-btn"
									src="${pageContext.request.contextPath}/assets/img/type2_off.png"
									alt="갤러리형버튼"></a>
							</div>
						</div>
					</div>

					<div class="ts-list-gallery-wrap">
						<div class="ts-list-gallery clear">
							<ul>
								<c:choose>

									<%-- 상품이 없을 경우 --%>
									<c:when test="${output==null || fn:length(output)==0}">
										<p class="empty">카테고리에 상품이 없습니다.</p>
									</c:when>

									<%-- 상품이 있을 경우 반복해서 출력 --%>
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
																	<c:when test="${'Y' eq item.freeShipping}">
																		<img
																			src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
																	</c:when>
																	<c:otherwise>
																	</c:otherwise>
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
						</div>






					</div>
				</div>

				<div class="ts-list-list-wrap active">
					<div class="ts-list-list">
						<ul>
							<c:choose>

								<%-- 상품이 없을 경우 --%>
								<c:when test="${output==null || fn:length(output)==0}">
									<p class="empty">카테고리에 상품이 없습니다.</p>
								</c:when>

								<%-- 상품이 있을 경우 반복해서 출력 --%>
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
																	pattern="#,###" /></strong>원
															<c:choose>
																<c:when test="${'Y' eq item.express}">
																	<img class="delivery"
																		src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
																</c:when>
																<c:when test="${'Y' eq item.freeShipping}">
																	<img class="delivery"
																		src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
																</c:when>
																<c:otherwise>
																</c:otherwise>
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
					</div>
				</div>
			</section>
		</main>
	</div>


	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<%@ include file="/WEB-INF/views/common/recent.jsp"%>
	</div>


	<script type="text/javascript">
		$(function() {
			/* 뒤로가기 버튼 */
			$(".new-back-btn").click(function(e) {
				window.history.back();
				e.preventDefault();
			});

			/* 리스트형 갤러리형 클릭 이벤트 */
			$(".list-btn")
					.click(
							function(e) {
								$(".list-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type1_on.png");
								$(".gallery-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type2_off.png");
								$(".ts-list-list-wrap").addClass("active");
								$(".ts-list-gallery-wrap")
										.removeClass("active");
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
								$(".ts-list-gallery-wrap").addClass("active");
								$(".ts-list-list-wrap").removeClass("active");
								e.preventDefault();
							});

			/* 클릭시 활성화 클래스 추가 */
			$(".category-line > ul > li").click(
					function(e) {
						e.preventDefault();

						$(this).addClass("selected");
						$(".category-line > ul > li").not(this).removeClass(
								"selected");
					});

			$(document).on('click', ".top-menu", function(e) {
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
					e.preventDefault();
				}
			});

			$(document).on('click', ".close-icon", function(e) {
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
					e.preventDefault();
				}
			});

			$(document).on('click', ".search-account", function(e) {
				if ($("#search-layer").css("display") == "none") {
					$("#search-layer").css("display", "block");
					$("#mainpage").css("display", "none");
					e.preventDefault();
				}
			});

			$(document).on('click', ".search-layer-close", function(e) {
				if ($("#search-layer").css("display") == "block") {
					$("#search-layer").css("display", "none");
					$("#mainpage").css("display", "block");
					e.preventDefault();
				}
			});

			/* 개수 표시 */
			var count = $(".prd-list").length;

			$(".prd-count").html(count);
			   
		});
	</script>
</body>

</html>