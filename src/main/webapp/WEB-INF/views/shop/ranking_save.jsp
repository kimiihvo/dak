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
	href="${pageContext.request.contextPath}/assets/css/ranking.css">

</head>
<body>

	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">

		<header><%@ include file="/WEB-INF/views/common/header1.jsp"%></header>

		<main>
			<!-- 랭킹 페이지 전체 내용부 -->
			<div>
				<!-- 판매킹 / 알뜰킹 탭 리스트 -->
				<ul class="tabs">
					<li class="tab"><a
						href="${pageContext.request.contextPath}/shop/ranking.do">판매킹</a></li>
					<li class="tab on"><a href="">알뜰킹</a></li>
				</ul>
				<div class="tab-content grey">
					<div class="save-king">
						<div class="save-king-header">
							<p>
								알뜰킹은 각 브랜드의 <br>100g 최저가 제품을 기준으로 선정됩니다.
							</p>
						</div>
						<ul class="save-king-content">
							<!-- 스테이크 훈제 탭 -->
							<li class="save-1">
								<div class="save-box">
									<div class="save-box-title">닭가슴살</div>
									<ul class="save-box-body">
										<!-- 상품 1 -->
										<c:choose>
											<c:when test="${output == null || fn:length(output) == 0}">
											</c:when>
											<%-- 조회결과가 있는  경우 --%>
											<c:otherwise>

												<c:forEach var="item" items="${output}" varStatus="status">
													<li><a
														href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
															<ul>
																<li class="list">
																	<ul>
																		<li class="bp_title"><div class="num_con one">
																				<span>${status.count}</span>
																			</div> <span>${item.title}</span></li>
																		<li class="bp"><span>최저</span> <strong><fmt:parseNumber
																					value="${item.price / item.weight * 100 }"
																					integerOnly="true" var="weightPrice"/>
																					
																					<fmt:formatNumber
												value="${weightPrice}" pattern="#,###" /></strong> <span class="unit">원</span></li>
																	</ul>
																</li>

																<li class="has_img_li">
																	<div class="box">
																		<div class="img">
																			<div class="prdimg">
																				<img src="${item.thumb}">
																			</div>
																		</div>
																		<div class="info2">
																			<p class="name"></p>
																			<p class="price">
																				<strong><fmt:formatNumber
																						value="${item.price}" pattern="#,###" /></strong>원
																			</p>
																			<p class="delivery"></p>
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
																			<p class="icon"></p>
																		</div>
																	</div>
																</li>
															</ul>
													</a></li>
												</c:forEach>
											</c:otherwise>
										</c:choose>


									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</main>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
		<%@ include file="/WEB-INF/views/common/recent.jsp"%>

	</div>
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

			/** 종류별 브랜드별 탭 클릭 이벤트 */
			$(".tab-title > li").click(function() {
				if ($(this).hasClass("on")) {
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