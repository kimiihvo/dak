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
	href="${pageContext.request.contextPath}/assets/css/mypage_index.css">

</head>
<body>
	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%>
	</div>

	<div id="mainpage">

		<header>
			<div class="gnb">
				<h1>
					<span class="hide">닭킹랭컴</span><a
						href="${pageContext.request.contextPath}"><img
						src="${pageContext.request.contextPath}/assets/img/logo_303030.png"></a>
				</h1>
				<a href="${pageContext.request.contextPath}/shop/cart.do"
					class="top-shopcart"><img
					src="${pageContext.request.contextPath}/assets/img/cart_icon.png"
					alt="장바구니"><span class="front-cart-row">0</span></a> <a href="#"
					class="top-menu"><img
					src="${pageContext.request.contextPath}/assets/img/category_icon.png"
					alt="메뉴"></a>
			</div>
			<script>
				$(function() {
					
						$.get("${pageContext.request.contextPath}/shop/cart_count",{},
								 function(req) {
									$(".front-cart-row").html(req.count);
						});
					});
			</script>
		</header>


		<section>
			<div class="myidx-header-wrap">
				<div class="myidx-header">
					<h2>마이페이지</h2>
				</div>
			</div>


			<div class="mypage">
				<div class="myinfo clear">
					<div class="member clear">
						<div class="icon">
							<img src="${pageContext.request.contextPath}/assets/img/9.png">
						</div>
						<p class="id">${m.nick}</p>
						<p class="name">
							<span class="my-idx-name"></span>${m.memName}<span>님</span>

						</p>
						<p class="edit">
							<a
								href="${pageContext.request.contextPath}/mypage/member_edit_check.do">정보수정</a>

						</p>

					</div>



				</div>

				<div class="myidx-menu-1">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/mypage/order_list.do">
								<img
								src="${pageContext.request.contextPath}/assets/img/my_icon1.png"
								alt="구매내역아이콘"> 구매내역 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">

						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/mypage/address.do">
								<img
								src="${pageContext.request.contextPath}/assets/img/my_icon6.png"
								alt="배송지관리아이콘"> 배송지관리 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/mypage/coupon.do"> <img
								src="${pageContext.request.contextPath}/assets/img/my_icon3.png"
								alt="쿠폰아이콘"> 쿠폰 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/mypage/wish_list.do">
								<img
								src="${pageContext.request.contextPath}/assets/img/my_icon4.png"
								alt="찜한상품아이콘"> 찜한상품 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/mypage/review_list.do">
								<img
								src="${pageContext.request.contextPath}/assets/img/my_icon5.png">
								내가 쓴 후기 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
					</ul>
				</div>

				<div class="myidx-menu-2">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/mypage/my_event.do">
								이벤트 참여 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
						<li><a href="${pageContext.request.contextPath}/help/help.do">
								고객센터 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
					</ul>
				</div>

				<div class="myidx-recent">
					<div class="recent-top">
						<a href="${pageContext.request.contextPath}/mypage/order_list.do">
							<h3>최근 주문 상품</h3>

							<p>
								더보기 <img class="arrow"
									src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"
									alt="최근주문상품더보기버튼">
							</p>
						</a>
					</div>
					
					<c:if test="${empty po}">
					<div class="no-recent-list">
						<p>최근 주문내역이 없습니다.</p>
					</div>
					</c:if>					
					<c:if test="${not empty po}">
					<div class="recent-list">
						<ul>
						<c:forEach var="prd" items="${po}" varStatus="status">
							<li><a
								href="${pageContext.request.contextPath}/mypage/order_list.do">
									<div class="box-list clear">
										<div class="img">
											<img
												src="${prd.thumb}">
										</div>
										<div class="desc">
											<p class="odr-num">${prd.odrno}</p>
											<p class="status">주문완료</p>
											<p class="name">${prd.title}</p>

										</div>
									</div>
							</a></li>
						</c:forEach>
						</ul>

					</div>

					</c:if>
				</div>

				<div class="one-on-one">
					<div class="one-on-one-top">

						<h3>
							1:1 문의 <a
								href="${pageContext.request.contextPath}/mypage/oneonone_write.do">
								문의하기 </a>
						</h3>

					</div>
					<div class="one-on-one-list">
						<ul>
							<c:choose>
								<c:when test="${output==null || fn:length(output)==0}">
									<li class="onenone">문의하신 내역이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="st">
										<li><a
											href="${pageContext.request.contextPath}/mypage/oneonone.do">
												<c:if test="${item.status eq '답변완료' }">
												<img
													src="${pageContext.request.contextPath}/assets/img/ico_cs_done.png"></c:if>
												<c:if test="${item.status eq '답변 대기 중' }">
												<img
													src="${pageContext.request.contextPath}/assets/img/ico_cs_ing.png"></c:if>
												<span>${item.title}</span>
										</a></li>
										</c:forEach>
								</c:otherwise>
							</c:choose>
							<li><a
								href="${pageContext.request.contextPath}/mypage/oneonone.do">
									문의 내역 더보기 <img class="arrow"
									src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
							</a></li>
						</ul>

					</div>

				</div>

			</div>

		</section>

		<footer>

			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>







	<script type="text/javascript">
		$(function() {

			/* 헤더 상단 고정 */

			var header = $('.gnb').outerHeight();

			$(window).scroll(function() {
				var window = $(this).scrollTop();

				if (header <= window) {
					$('.myidx-header-wrap').addClass('title-fix');
					$('.mypage').addClass('pd-top');

				} else {
					$('.myidx-header-wrap').removeClass('title-fix');
					$('.mypage').removeClass('pd-top');
				}
			});

			/** 클릭 시 메뉴 탭 숨김, 표시 처리 */
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