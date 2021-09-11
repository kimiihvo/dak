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
	href="${pageContext.request.contextPath}/assets/css/search_result.css">

</head>
<body>

	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">

		<header>
			<%@ include file="/WEB-INF/views/common/header1.jsp"%>
		</header>


		<section>
			<div class="sr-header-wrap">
				<div class="sr-header">
					<h2>상품 검색</h2>

					<h4>

						<span>${keyword}</span> 에 대한 총 <span class="count">0</span>건
						검색결과입니다.
					</h4>



				</div>
			</div>

			<div class="sr-section-wrap">

				<div class="sr-section-1">

					<div class="sr-section">
						<h3 class="ea">
							일반상품 <span>(<span class="count">0</span>)
							</span>
						</h3>


						<%-- <div class="express-check">


						<input type="checkbox" id="express-check"> <label
							for="express-check"> <img
							src="${pageContext.request.contextPath}/assets/img/express_delivery.png"
							alt="특급배송">
						</label>

					</div>
 --%>

					</div>



					<div class="sr-list-list-wrap">
						<div class="sr-list-list clear">
							<ul>
								<c:choose>
									<c:when test="${output == null || fn:length(output) == 0}">
										<p class="empty">조회결과가 없습니다.</p>
									</c:when>
									<%-- 조회결과가 있는  경우 --%>
									<c:otherwise>
										<c:forEach var="item" items="${output}" varStatus="status">
											<li class="prd-list"><a
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

															
														</div>
													</div>
											</a></li>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
					</div>

					<!-- <div class="more">
					<a href="#">상품 더보기</a>
				</div>
			</div> -->

					<%-- <div class="sr-section-2">

				<div class="sr-section">
					<h3 class="ea">
						일반상품 <span>(<span class="count">0</span>)
						</span>
					</h3>


					<div class="express-check">


						<input type="checkbox" id="express-check"> <label
							for="express-check"> <img
							src="${pageContext.request.contextPath}/assets/img/express_delivery.png"
							alt="특급배송">
						</label>

					</div>


				</div>



				<div class="sr-list-gallery-wrap active">
					<div class="sr-list-gallery clear">
						<ul>
							<c:choose>
								<c:when test="${output == null || fn:length(output) == 0}">
								<p> 조회결과가 없습니다. </p>
								</c:when>
								조회결과가 있는  경우
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<li class="prd-list">
										<a href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
											<div class="box clear">
												<div class="img">
													<img
														src="${pageContext.request.contextPath}/assets/img/goguma.jpg">
												</div>
												<div class="desc">
													<p class="name">${item.title}</p>
													<p class="price">
														<strong><fmt:formatNumber value="${item.price}"
																pattern="#,###" /></strong>원
													</p>
													<p class="delivery">
														<img
															src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
													</p>
													<p class="rating">
														<img
															src="${pageContext.request.contextPath}/assets/img/rating${item.rating}.png">
														(<span>233</span>)
													</p>
													<p class="icon">
														<img
															src="${pageContext.request.contextPath}/assets/img/new.png"
															alt="신상품">

													</p>
												</div>
											</div>
											</a>
										</li>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>

					</div>
				</div>

				<!-- <div class="more">
					<a href="#">상품 더보기</a>
				</div> -->

			</div> --%>









				</div>
		</section>


		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
		<%@ include file="/WEB-INF/views/common/recent.jsp"%>

	</div>

	<script src="../assets/js/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		$(function() {

			/* 개수 표시 */
			var count = $(".prd-list").length;

			$(".count").html(count);

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

		});
	</script>
</body>
</html>