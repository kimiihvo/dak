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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/order_list.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/order_list_detail.css">
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
</head>
<body>

	<div id="menu"><%@ include file="/WEB-INF/views/common/menutab.jsp"%></div>

	<div id="mainpage">

		<header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>


		<section>
			<div class="odr-list-header-wrap">
				<div class="odr-list-header">
					<h2>
						<a class="odr-list-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png" alt="뒤로가기버튼"></a> 구매상세보기
					</h2>
				</div>
			</div>


			<div class="odr-list-section-wrap">
				<div class="odr-list-section">

					<div class="odr-list-menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
							<li><a class="active" href="${pageContext.request.contextPath}/mypage/order_list.do">구매내역</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/wish_list.do">찜한상품</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/coupon.do">쿠폰</a></li>
						</ul>
					</div>

					<div class="odr-list-list-wrap">
						<div class="odr-list-list clear">
							<div class="odr-list-list-content">
								<div class="odr-detail clear">

									<div class="list-top">
										<span class="odr-date">${ol.regDate}</span> <span class="odrno">주문번호: ${ol.odrno}</span>
									</div>

									<ul class="odr-detail-ul">
										<c:forEach var="prd" items="${po}" varStatus="status">
										<!-- 상품 반복 구간 -->
										<li class="list-cnt clear">
										<a href="${pageContext.request.contextPath}/shop/detail.do?prdno=${prd.prdno}">
											<div class="cnt-img">
												<img src="${prd.thumb}" alt="상품썸네일이미지">
											</div>
											<div class="cnt-right">
												<p class="prd-name">${prd.title}</p>
												<div class="cnt-bottom">
													<span class="qty">${prd.qty}<span>개</span></span> <span
														class="price"><fmt:formatNumber	value="${prd.qty * prd.price}" pattern="#,###" /><span>원</span></span> <span
														class="status">주문완료</span>
												</div>
											</div>
											</a>
									<div class="review-wr-btn">
										<a href="${pageContext.request.contextPath}/mypage/review_write.do?prdno=${prd.prdno}&odrno=${ol.odrno}">후기작성</a> <a class="dlv-check" href="#">배송조회</a>
									</div>
										</li>
										</c:forEach>
										<!-- 상품 반복 구간 끝 -->
									</ul>

									<div class="purchase">
										<p>
											<span class="left">주문금액</span> <span class="right"><fmt:formatNumber value="${ol.toPrice + ol.disAmount}" pattern="#,###" /></span>
										</p>
										<p>
											<span class="left">배송비</span> <span class="right"><fmt:formatNumber value="${ol.fee}" pattern="#,###" /></span>
										</p>
										<p>
											<span class="left">쿠폰할인</span> <span class="right">-<fmt:formatNumber value="${ol.disAmount}" pattern="#,###" /></span>
										</p>
										<p class="t-price">
											<span class="left">총 결제금액</span> <span class="right"><fmt:formatNumber	 value="${ol.toPrice + ol.fee}" pattern="#,###" /></span>
										</p>
									</div>
									<div class="pay">
										<p class="pay-pay">
											<span class="left">결제방법</span> <span class="right">${ol.pay}</span>
										</p>
										<p class="pay-date">
											<span class="left">입금일자</span> <span class="right">${ol.regDate}</span>
										</p>
										<p class="pay-name">
											<span class="left">이름</span> <span class="right">${ol.dlvyName}</span>
										</p>
										<p class="pay-phone">
											<span class="left">휴대폰번호</span> <span class="right">${ol.dlvyTel}</span>
										</p>
										<p class="pay-adr">
											<span class="left">주소</span> <span class="right">${ol.dlvyAdr}</span>
										</p>
									</div>

									<a class="go-odr-list" href="${pageContext.request.contextPath}/mypage/order_list.do">주문목록</a>
									
									<br>
									
									<a class="delete-odr-list" href="${pageContext.request.contextPath}/mypage/order_delete_ok.do?odrno=${ol.odrno}">주문취소</a>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</section>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>

	</div>

	<script type="text/javascript">
	
			$(function() {

				/* 뒤로가기 버튼 */
				$(".odr-list-back-btn").click(function(e){
					e.preventDefault();
						window.history.back();
					});
				
				
				
				/** 클릭 시 메뉴 탭 숨김, 표시 처리 */
				$(document).on('click', ".top-menu", function(e) {
					e.preventDefault();
					if($("#menutab").css("display")=="none"){
						$("#menutab").css("display", "block");
						$("#mainpage").css("display", "none");
					}
				});

				$(document).on('click', ".close-icon", function(e) {
					e.preventDefault();
					if($("#menutab").css("display")=="block"){
						$("#menutab").css("display", "none");
						$("#mainpage").css("display", "block");
					}
				});


			});
		</script>
</body>

</html>