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
	href="${pageContext.request.contextPath}/assets/css/recent_view_list.css">

</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/header2.jsp"%>
	</header>


	<section>

		<div class="rv-header-wrap">
			<div class="rv-header">
				<a class="rv-back-btn" href="#"><img
					src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
					alt="뒤로가기버튼"></a>
				<h2>최근본상품</h2>
			</div>
		</div>

		<div class="recent-view-wrap">
			<div class="recent-view">
				<div class="recent-view-top">
					<span>총 <span class="recent-count">0</span>개
					</span> <a class="all-del"
						href="${pageContext.request.contextPath}/shop/recent_view_list_del_all.do"><img
						src="${pageContext.request.contextPath}/assets/img/icon_del_all.png">전체삭제</a>

				</div>

				<div class="recent-view-list">
					<ul>
						<c:choose>

							<c:when test="${prdList==null || fn:length(prdList)==0}">
								<div class="empty">

									<p>최근 본 상품이 없습니다.</p>


									<span><a href="${pageContext.request.contextPath}"><span
											class="rv-btn-continue">쇼핑 계속하기</span></a></span>


								</div>

							</c:when>


							<c:otherwise>
								<c:forEach var="item" items="${prdList}" varStatus="status">
									<li class="recent-prd">
										<form id="addForm"
											action="${pageContext.request.contextPath}/mypage/wish_list">
											<a
												href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
												<input type="hidden" name="prdno" value="${item.prdno}">
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
															<%-- <a href="#"><img
														src="${pageContext.request.contextPath}/assets/img/icon_cart2.png"></a>
														 <button class="wish-btn" type="submit">찜</button>
													<a href="#">
													
													<img
														src="${pageContext.request.contextPath}/assets/img/icon_wish2.png"></a> --%>
															<a class="del-btn" href="${pageContext.request.contextPath}/shop/recent_view_list_del.do?prdno=${item.prdno}"><img
																src="${pageContext.request.contextPath}/assets/img/icon_trash2.png"></a>
														</p>

													</div>
												</div>
											</a>
										</form>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

			</div>
		</div>





	</section>









	<script type="text/javascript">
		$(function() {

			/* 뒤로가기 버튼 */
			$(".rv-back-btn").click(function(e) {
				e.preventDefault();
				window.history.back();
			});

			/* 상품 삭제 */
			$(".all-del").click(function() {
				var result = confirm('"최근 본 상품 목록"을 비우시겠습니까?');

				if (result) {
					//상품 삭제
					alert("삭제되었습니다.");
				}
			});

			// #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
			/* $("#addForm").ajaxForm({
					// 전송 메서드 지정
					method : "POST",
					// 서버에서 200 응답을 전달한 경우 실행됨
					success : function(json) {
						console.log(json);
						// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
						/* if (json.rt == "OK") {
							window.location = "${pageContext.request.contextPath}/mypage/wish_list.do";
						} */

			/* },
			error: function(){
				alert("로그인이 필요합니다.");
				window.location = "${pageContext.request.contextPath}/member/login.do";


			}
			}); */

			/* 장바구니가 비었을 때 .empty 활성화 및 개수 표시 */
			var count = $(".recent-prd").length;

			console.log(count);

			if (count == 0) {
				$(".recent-prd").css("display", "none");
				$(".recent-count").html(count);
			} else {
				$(".recent-count").html(count);
			}

		});
	</script>
</body>

</html>