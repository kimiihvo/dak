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
	href="${pageContext.request.contextPath}/assets/css/wish_list.css">

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
			<div class="wish-list-header-wrap">
				<div class="wish-list-header">
					<h2>
						<a class="wish-list-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 찜한상품
					</h2>
				</div>
			</div>


			<div class="wish-list-section-wrap">
				<div class="wish-list-section">

					<div class="wish-list-menu">
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/order_list.do">구매내역</a></li>
							<li><a class="active" href="">찜한상품</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/coupon.do">쿠폰</a></li>
						</ul>
					</div>

					<div class="wish-list-banner">
						<img src="${pageContext.request.contextPath}/assets/img/wish.png">
						<p>
							<span class="star">*</span> 주문하기 전 옵션 상품을 꼭 확인하시고 주문하시기 바랍니다.
						</p>
						<p>
							<span class="star">*</span> 품절된 상품이 있을 경우 주문을 진행하실 수 없습니다.
						</p>
					</div>
					<form method="post"
						action="${pageContext.request.contextPath}/shop/cart_selected_add_ok.do">
						<div class="wish-list-box-wrap" id="wish-list">
							<div class="wish-list-box clear">
								<ul>
									<c:choose>

										<c:when test="${output==null || fn:length(output)==0}">
											<li id="empty">관심상품에 등록된 상품이 없습니다.</li>
										</c:when>


										<c:otherwise>
											<c:forEach var="item" items="${output}" varStatus="status">


												<li class="wish-prd"><input type="hidden" name="wishno"
													value="${item.wishno}"> <input type="hidden"
													name="prdno" value="${item.prdno}"> <a
													href="${pageContext.request.contextPath}/shop/detail.do?prdno=${item.prdno}">
														<div class="box clear">
															<div class="img">

																<%-- <img src="${pageContext.request.contextPath}/assets/img/goguma.jpg"> --%>
																<img src="${item.thumb}">

															</div>

															<div class="desc">
																<p class="title">${item.title}</p>
																<p class="price-wrap">
																	<input type="checkbox" name="wish-check"
																		class="wish-check" value="${item.prdno}"
																		data-wishno="${item.wishno}"> <label
																		for="wish-check">판매가</label> <span class="price"><fmt:formatNumber value="${item.price}"
																	pattern="#,###" /></span>
																</p>

															</div>
														</div>
												</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>

							</div>

							<c:choose>

								<c:when test="${output==null || fn:length(output)==0}">
								</c:when>
								<c:otherwise>
									<div class="wish-btn-1 clear">
										<!-- <a href="#">장바구니 담기</a> -->
										<button class="add-cart" type="submit">장바구니 담기</button>
									</div>
								</c:otherwise>
							</c:choose>
					</form>
					<div class="wish-btn-2 clear">
						
						<c:choose>

							<c:when test="${output==null || fn:length(output)==0}">
							</c:when>
							<c:otherwise>
								<a class="sel-del">선택삭제</a>
							</c:otherwise>
						</c:choose>

					</div>

					<!-- </form> -->




					<c:choose>

						<c:when test="${output==null || fn:length(output)==0}">
						</c:when>
						<c:otherwise>
							<div class="paging">
								<ul>
									<li><a href="#"><</a></li>
									<li><b>1</b></li>
									<li><a href="#">></a></li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>


					<div class="wish-btn-3 clear">
						<span class="go-main"> <a
							href="${pageContext.request.contextPath}">메인으로</a>
						</span> <span class="go-myindex"> <a
							href="${pageContext.request.contextPath}/mypage/mypage_index.do">목록으로</a>
						</span>


					</div>




				</div>
			</div>
	</div>
	</section>


	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>

	</div>


	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>


	<script type="text/javascript">
		$(function() {

			

			/* 뒤로가기 버튼 */
			$(".wish-list-back-btn").click(function(e) {
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

			

			$(".sel-del").click(function(e) {
				e.preventDefault();
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if (confirm_val) {

					var checkArr = new Array();
	
					$("input[name='wish-check']:checked").each(
							function() {
	
								checkArr.push($(this).attr(
										"data-wishno"));
							});
	
					$.ajax({
								url : "${pageContext.request.contextPath}/mypage/wish_list_delete",
	
								type : "post",
	
								data : {
									chbox : checkArr
								},
	
								success : function() {
	
									location.href = "${pageContext.request.contextPath}/mypage/wish_list.do";
								},
	
								error : function() {
	
									alert("선택된 상품이 없습니다.");
	
								}
	
							});
	
				}
	
				console.log(checkArr);
			});

		});
	</script>
</body>

</html>