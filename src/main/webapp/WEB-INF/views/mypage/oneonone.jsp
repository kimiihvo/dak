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
	href="${pageContext.request.contextPath}/assets/css/one_on_one.css">
</head>
<body>

	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%>
	</div>

	<div id="mainpage">

		<header>
			<%@ include file="/WEB-INF/views/common/header2.jsp"%>
		</header>


		<section>
			<div class="counsel-header-wrap">
				<div class="counsel-header">
					<h2>
						<a class="counsel-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 1:1문의
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
						<h3>문의 내역</h3>
						<div class="counsel-list clear">
							<ul>
								<c:choose>
									<c:when test="${output==null || fn:length(output)==0}">
										<li class="empty">문의하신 내역이 없습니다.</li>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${output}" varStatus="st">
											<li>
												<div class="box clear">
													<p class="row-1">
														<span class="about">${item.category}</span> <span
															class="date">${item.regDate}</span> <span class="state">${item.status}</span>
													</p>
													<p class="title">${item.title}</p>
												</div>
												<ul class="answer">
													<li>└ Q. ${item.content}<br />
													<br /> <c:if test="${item.file ne null}">
															<img src="${item.file}" />
														</c:if> <br />A.<c:if test="${item.comContent eq null}">
															
													<span class="ans">&lt;곧 관리자의 답변이 달릴 예정입니다.&gt;</span></c:if> ${item.comContent}</li>
												</ul>
											</li>
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
								<c:url value="/mypage/oneonone.do" var="prevPageUrl">
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
							<c:url value="/mypage/oneonone.do" var="pageUrl">
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
								<c:url value="/mypage/oneonone.do" var="nextPageUrl">
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
						<span> <a href="${pageContext.request.contextPath}/help/faq.do">FAQ</a>
						</span> <span> <a
							href="${pageContext.request.contextPath}/mypage/oneonone_write.do">1:1문의하기</a>
						</span>

					</div>




				</div>
		</section>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>



	<script src="assets/js/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		$(function() {

			/* 뒤로가기 버튼 */
			$(".counsel-back-btn").click(function(e) {
				e.preventDefault();
				window.history.back();
			});

			/* 문의내역 클릭시 답변 아코디언 */

			$(".counsel-list>ul>li>ul>li").hide();

			$(".box").click(function() {

				// 펼칠 내용 영역 선택
				var target = $(this).next().find("li");

				// 나머지 내용 영역을 선택
				var other = $(".box").not(this).next().find("li");

				// 애니메이션으로 열고 닫기 처리
				target.slideToggle(200);
				other.slideUp(200);

				// 링크 페이지 이동 중지
				return false;
			});

			$(document).on('click', ".top-menu", function(e) {
				e.preventDefault();
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".close-icon", function(e) {
				e.preventDefault();
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

		});
	</script>
</body>
</html>