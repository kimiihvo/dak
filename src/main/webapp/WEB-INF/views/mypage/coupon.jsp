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
	href="${pageContext.request.contextPath}/assets/css/coupon.css">
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
			<div class="coupon-header-wrap">
				<div class="coupon-header">
					<h2>
						<a class="coupon-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 쿠폰
					</h2>
				</div>
			</div>


			<div class="coupon-section-wrap">
				<div class="coupon-section">

					<div class="coupon-menu">
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/order_list.do">구매내역</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/wish_list.do">찜한상품</a></li>

							<li><a class="active" href="">쿠폰</a></li>
						</ul>
					</div>



					<form id="addForm"
						action="${pageContext.request.contextPath}/mypage/coupon"
						class="register clear">

						<h3>쿠폰등록</h3>

						<input class="coupon-num" type="text" name="code"
							placeholder="'EZEN20205'를 입력해보세요!">

						<div class="register-btn">
							<input type="submit" value="등록">
						</div>

					</form>

					<div class="coupon-top">
						<span>사용<span class="coup-status">가능</span> 쿠폰 총 <span
							class="count">1</span>장
						</span> <select id="cou-exp">
							<option value="1">사용가능 쿠폰</option>
							<option value="2">사용만료 쿠폰</option>
						</select>
					</div>

					<div id="ajax-coupon">
						<c:choose>

							<c:when test="${output==null || fn:length(output)==0}">
								<p class="empty">사용 가능한 쿠폰이 없습니다.</p>
							</c:when>

							<c:otherwise>


								<c:forEach var="item" items="${output}" varStatus="status">
									<c:if test="${item.isUsed == 'N'}">
										<div class="coupon-list-wrap">
											<a href="${pageContext.request.contextPath}">
												<div class="coupon-list">



													<div class="coupon-list-left">
														<p class="name">${item.title}</p>
														<p class="howmuch">
															<span><fmt:formatNumber value="${item.discount}"
																	pattern="#,###" /></span>원 할인
														</p>
														<p class="notice">
															<fmt:formatNumber value="${item.orderOver}"
																pattern="#,###" />
															원 이상 구매시 적용
														</p>
														<p class="expire">
															유효기간 : <span class="expiration-date">${item.expDate}</span>

															까지



														</p>

													</div>

													<div class="coupon-list-right">



														<p class="d">

															<c:choose>
																<c:when test="${ 'N' eq item.isUsed }">
																	<span class="d-day">미사용</span>

																</c:when>
																<c:otherwise>
																	<span class="d-day">사용만료</span>
																</c:otherwise>
															</c:choose>

														</p>
														<p class="go">
															<c:choose>
																<c:when test="${ 'N' eq item.isUsed }">
																	<img
																		src="${pageContext.request.contextPath}/assets/img/p_cpn_arrow.png"
																		alt="바로가기버튼이미지">
																	<span>바로가기</span>
																</c:when>
																<c:otherwise>
																	<img
																		src="${pageContext.request.contextPath}/assets/img/unable_cpn.png"
																		alt="바로가기버튼이미지">
																</c:otherwise>
															</c:choose>
														</p>

													</div>
												</div>
											</a>
										</div>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>



					<div id="ajax-coupon-disabled">
						<c:choose>
							<c:when test="${outputExp == null}">
								<p class="empty">사용 만료된 쿠폰이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${outputExp}" varStatus="status">
									<div class="coupon-list-wrap">
										<a href="${pageContext.request.contextPath}">
											<div class="coupon-list">
												<div class="coupon-list-left">
													<p class="name">${item.title}</p>
													<p class="howmuch">
														<span><fmt:formatNumber value="${item.discount}"
																pattern="#,###" /></span>원 할인
													</p>
													<p class="notice">
														<fmt:formatNumber value="${item.orderOver}"
															pattern="#,###" />
														원 이상 구매시 적용
													</p>
													<p class="expire">
														유효기간 : <span class="expiration-date">${item.expDate}</span>

														까지



													</p>

												</div>

												<div class="coupon-list-right">
													<p class="d">
														<span class="d-day">사용만료</span>
													</p>
													<p class="go">
														<img
															src="${pageContext.request.contextPath}/assets/img/unable_cpn.png"
															alt="바로가기버튼이미지">
													</p>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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

			/* 뒤로가기 버튼 */
			$(".coupon-back-btn").click(function(e) {
				e.preventDefault();
				window.history.back();
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

			/** 에이작스 구현 */
			
			// #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
			$("#addForm")
					.ajaxForm(
							{
								// 전송 메서드 지정
								method : "POST",
								// 서버에서 200 응답을 전달한 경우 실행됨
								success : function(json) {
									console.log(json);

									// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
									if (json.rt == "OK") {
										window.location = "${pageContext.request.contextPath}/mypage/coupon.do";
									}
								}
							});

			/* 개수 표시 */
			var count = $("#ajax-coupon .coupon-list-wrap").length;

			$(".count").html(count);
			
			
			

			$("#cou-exp").change(function(e) {
				e.preventDefault();
				
				var choice = $(this).find("option:selected")
				.val();
				
				// 선택값이 없다면 처리 중단
				if(!choice){
					return false;
				}

				if (choice == 2) {
					$("#ajax-coupon").css("display", "none");
					$("#ajax-coupon-disabled").css("display", "block");
					$(".coup-status").html("만료");
					 var count = $("#ajax-coupon-disabled .coupon-list-wrap").length;
					 $(".count").html(count);
					 $(".count").css("color", "#666");
					 
				} else {
					$("#ajax-coupon-disabled").css("display", "none");
					$("#ajax-coupon").css("display", "block");
					 $(".coup-status").html("가능");
					 var count = $("#ajax-coupon .coupon-list-wrap").length;
					 $(".count").html(count);
					 $(".count").css("color", "#ff6001");
				}
			});

		});
	</script>
</body>
</html>