<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/review_list.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/one_on_one.css">

</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/header2.jsp"%>
	</header>
<section>
			<div class="counsel-header-wrap">
				<div class="counsel-header">
					<h2>
						<a class="review-list-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 내가 쓴 후기
					</h2>
				</div>
			</div>

			<div class="counsel-section-wrap">
				<div class="counsel-section">

					<div class="counsel-menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/order_list.do">구매내역</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/wish_list.do">찜한상품</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/coupon.do">쿠폰</a></li>
						</ul>
					</div>

					<div class="counsel-wrap">
						<h3>상품 후기</h3>
						<div class="counsel-list clear">
							<ul>
								<c:choose>
									<c:when test="${review==null || fn:length(review)==0}">
										<li class="review-nothing">작성한 후기가 없습니다.</li>
									</c:when>
									<c:otherwise>
									<c:forEach var="item" items="${review}" varStatus="st">
										<c:if test="${item.img ne null }">
										<li id="review_area">
										 	<div >
												<div class="info">
													<span class="grade"><img
														src="${pageContext.request.contextPath}/assets/img/rating${item.memRating}.png"></span>
												<span>${item.regDate}</span>
												</div>
												<div class="review-title">
													<span>${item.title}</span>
												</div>
												<div class="cnt_more">
													<div class="cnt review-left">${item.content }</div>
													<div class="review-right">
														<span class="thumb "><img
														src="${item.img}"></span>
													</div>
												</div>
											</div>
											
										</li>
										</c:if>
										<c:if test="${item.img eq null }">
										<li id="review_area">
										 	<div class="review">
												<div class="info">
													<span class="grade"><img
														src="${pageContext.request.contextPath}/assets/img/rating${item.memRating}.png"></span>
												<span>${item.regDate}</span>
												</div>
												<div class="review-title">
													<span>${item.title}</span>
												</div>
												<div class="cnt_more">
													<div class="cnt">${item.content }</div>
												</div>
											</div>
										</li>
										</c:if>
									</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					</div>
					<div class="paging">
						<%-- 이전 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 이전 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.prevPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/mypage/review_list.do" var="prevPageUrl">
									<c:param name="page" value="${pageData.prevPage}" />
								</c:url>
								<a href="${prevPageUrl}">[이전]</a>
							</c:when>
							<c:otherwise>
            [이전]
        </c:otherwise>
						</c:choose>

						<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
						<c:forEach var="i" begin="${pageData.startPage}"
							end="${pageData.endPage}" varStatus="status">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/mypage/review_list.do" var="pageUrl">
								<c:param name="page" value="${i}" />
							</c:url>

							<%-- 페이지 번호 출력 --%>
							<c:choose>
								<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
								<c:when test="${pageData.nowPage == i}">
									<strong>[${i}]</strong>
								</c:when>
								<%-- 나머지 페이지의 경우 링크 적용함 --%>
								<c:otherwise>
									<a href="${pageUrl}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<%-- 다음 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 다음 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.nextPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/mypage/review_list.do" var="nextPageUrl">
									<c:param name="page" value="${pageData.nextPage}" />
								</c:url>
								<a href="${nextPageUrl}">[다음]</a>
							</c:when>
							<c:otherwise>
            [다음]
        </c:otherwise>
						</c:choose>
					</div>

					<div class="counsel-btn clear">
						<span> <a href="/ezen-android2020-5/help/faq.html">FAQ</a>
						</span> <span> <a
							href="${pageContext.request.contextPath}/mypage/oneonone_write.do">1:1문의하기</a>
						</span>

					</div>




				</div>
		</section>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>




	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script type="text/javascript">
		$(function() {

			/* 뒤로가기 버튼 */
			$(".review-list-back-btn").click(function(e) {
				e.preventDefault();
				window.history.back();
			});
		});
	</script>
</body>
</html>