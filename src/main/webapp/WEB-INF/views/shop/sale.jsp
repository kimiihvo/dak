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
	href="${pageContext.request.contextPath}/assets/css/sale.css">
</head>
<body>

	<header>
		<div class="ts-header-wrap">
			<div class="ts-header">
				<div class="ts-header-left">


					<a class="ts-back-btn" href="#"> <img
						src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
						alt="뒤로가기버튼">
					</a>

					<h2>▶ TIME SALE ◀</h2>
				</div>

				<div class="ts-header-right">
					<!-- <a href="#"><img src="${pageContext.request.contextPath}/assets/img/search_icon.png" alt="검색버튼"></a> -->
					<a href="${pageContext.request.contextPath}/shop/cart.do"><img
						src="${pageContext.request.contextPath}/assets/img/cart_icon.png"
						alt="장바구니버튼"><span class="front-cart-row other-page">0</span></a>
				</div>

			</div>
		</div>

	</header>


	<section>
		<div class="ts-section-wrap">

			<div class="ts-banner">
				<img
					src="${pageContext.request.contextPath}/assets/img/timesale_banner.jpg"
					alt="타임세일배너">
			</div>

			<div class="ts-section">

				<div class="ts-section-top">

					<%-- <input type="checkbox" id="express-check"> <label
						for="express-check"> <img
						src="${pageContext.request.contextPath}/assets/img/express_delivery.png"
						alt="특급배송">
					</label> --%>

				</div>

				<div class="ts-section-mid clear">

					<span class="ts-total">총 <span class="prd-count">3</span>개의
						상품
					</span>

					<div class="select">
						<!-- <select>
							<option value="" selected>추천순</option>
							<option>신상품순</option>
							<option>판매량순</option>
							<option>낮은가격순</option>
							<option>높은가격순</option>
						</select> -->

						<a href="#"><img class="list-btn"
							src="${pageContext.request.contextPath}/assets/img/type1_off.png"
							alt="리스트형버튼"></a> <a href="#"><img class="gallery-btn"
							src="${pageContext.request.contextPath}/assets/img/type2_on.png"
							alt="갤러리형버튼"></a>
					</div>
				</div>
			</div>

			<div class="ts-list-gallery-wrap active">
				<div class="ts-list-gallery clear">
					<ul>




						<c:choose>

							<%-- 타임세일 상품이 없을 경우 --%>
							<c:when test="${output==null || fn:length(output)==0}">
								<p>타임세일 중인 상품이 없습니다.</p>
							</c:when>

							<%-- 타임세일 상품이 있을 경우 반복해서 출력 --%>
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
													<p class="timer">
														<span class="day"></span>일 <span class="hour"></span>시간 <span
															class="min"></span>분 <span class="sec"></span>초 남음
													</p>
													<p class="icon">
														<img
															src="${pageContext.request.contextPath}/assets/img/limit.png"
															alt="한정수량">
													</p>
												</div>
											</div>
									</a></li>

								</c:forEach>
							</c:otherwise>
						</c:choose>

					</ul>

				</div>
			</div>

			<div class="ts-list-list-wrap">
				<div class="ts-list-list">
					<ul>
						<c:choose>

							<%-- 타임세일 상품이 없을 경우 --%>
							<c:when test="${output==null || fn:length(output)==0}">
								<p>타임세일 중인 상품이 없습니다.</p>
							</c:when>

							<%-- 타임세일 상품이 있을 경우 반복해서 출력 --%>
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

													<p class="timer">
														<span class="day"></span>일 <span class="hour"></span>시간 <span
															class="min"></span>분 <span class="sec"></span>초 남음
													</p>

													<p class="icon">
														<img
															src="${pageContext.request.contextPath}/assets/img/limit.png"
															alt="한정수량">
													</p>
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



	</section>


	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<%@ include file="/WEB-INF/views/common/recent.jsp"%>




	<script src="../assets/js/swiper-bundle.min.js"></script>
	<script type="text/javascript">
        $(function() {

            /* 뒤로가기 버튼 */
            $(".ts-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });


            /* 리스트형 갤러리형 클릭 이벤트 */
            $(".list-btn").click(function (e) {
                $(".list-btn").attr("src","${pageContext.request.contextPath}/assets/img/type1_on.png");
                $(".gallery-btn").attr("src","${pageContext.request.contextPath}/assets/img/type2_off.png");
                $(".ts-list-list-wrap").addClass("active");
                $(".ts-list-gallery-wrap").removeClass("active");
                e.preventDefault();
            });

            $(".gallery-btn").click(function (e) {
                $(".gallery-btn").attr("src","${pageContext.request.contextPath}/assets/img/type2_on.png");
                $(".list-btn").attr("src","${pageContext.request.contextPath}/assets/img/type1_off.png");
                $(".ts-list-gallery-wrap").addClass("active");
                $(".ts-list-list-wrap").removeClass("active");
                e.preventDefault();
            });

            /* 남은 시간 구현 */

            function remaindTime() {
                var now = new Date(); //현재 날짜
                var end = new Date(2021,8,19); // 끝나는 날짜

                var nt = now.getTime(); // 현재 날짜 초 단위

                var et = end.getTime(); // 종료 날짜 초 단위


                 sec =parseInt(et - nt) / 1000;
                 day  = parseInt(sec/60/60/24);
                 sec = (sec - (day * 60 * 60 * 24));
                 hour = parseInt(sec/60/60);
                 sec = (sec - (hour*60*60));
                 min = parseInt(sec/60);
                 sec = parseInt(sec-(min*60));

                if(hour<10){hour="0"+hour;}
                if(min<10){min="0"+min;}
                if(sec<10){sec="0"+sec;}

                $(".day").html(day);
                $(".hour").html(hour);
                $(".min").html(min);
                $(".sec").html(sec);
            }


            // 반복
             setInterval(remaindTime,1000);

            // 남은 시간 구현 끝

     	
            
       		/* 개수 표시 */
              var count = $(".prd-list").length;
       			console.log(count);
              $(".prd-count").html(count);
              

        });
    </script>
</body>

</html>