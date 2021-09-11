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
	href="${pageContext.request.contextPath}/assets/css/detail.css">

</head>
<body>
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
					alt="장바구니">  <span class="front-cart-row">0</span>  </a> <a
					class="back" href="javascript:history.back()" onclick=""></a>
			</div>
		</header>

		<main>
			<div id="product-content">
				<form id="addForm"
					action="${pageContext.request.contextPath}/mypage/wish_list">
					<input type="hidden" name="prdno" id="prdno"
						value="${output.prdno}"> <input type="hidden" name="title"
						id="title" value="${output.title}">
					<section class="product-info">
						<div class="product-img">
							<img src="${output.mainImg}">
						</div>
						<div class="product-desc">
							<div class="desc1 clear">
								<h3 class="desc-name">${output.title}</h3>
								<div class="desc-price">
									<!-- <span class="discount">25<span>%</span></span> -->
									<span class="price"><strong><fmt:formatNumber
												value="${output.price}" pattern="#,###" /></strong>원</span>
									<p class="pack-price">
										(100g당:
										<fmt:parseNumber
											value="${output.price / output.weight * 100 }"
											integerOnly="true" var="weightPrice" />
											<fmt:formatNumber
												value="${weightPrice}" pattern="#,###" />
										원)
									</p>
									<c:if test="${output.rct eq '0'}">
										<div class="rating">
											<a href=""> <img
												src="${pageContext.request.contextPath}/assets/img/rating0.png">
											</a> <span class="review-count">(${output.rct})</span>
										</div>
									</c:if>
									<c:if test="${output.rct ne '0'}">
										<div class="rating">
										<fmt:parseNumber var= "pages" integerOnly= "true" value= "${output.rating/output.rct}" />
											<a href=""> <img
												src="${pageContext.request.contextPath}/assets/img/rating${pages}.png">
											</a> <span class="review-count">(${output.rct})</span>
										</div>
									</c:if>
								</div>
								<div class="button-right">
									<button class="wish-btn" type="submit">
										<c:choose>
											<c:when test="${output.prdno eq wishOutput.prdno}">
												<img class="wish-img" alt="찜이미지"
													src="${pageContext.request.contextPath}/assets/img/wish_on.png">
											</c:when>
											<c:otherwise>
												<img class="wish-img" alt="찜이미지"
													src="${pageContext.request.contextPath}/assets/img/wish_off.png">
											</c:otherwise>

										</c:choose>

									</button>
								</div>
							</div>
							<ul class="desc2">
								<li class="desc-delivery clear">
									<div>
										<p>배송방법</p>
									</div>
									<div>
										<c:if test="${'Y' eq output.express}">
											<img
												src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
											
										</c:if>
										<c:if test="${'Y' eq output.freeShipping}">
											<img
												src="${pageContext.request.contextPath}/assets/img/free_delivery.png" />
										</c:if>
										<%-- <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
                                    <span>/</span>
                                    <img src="${pageContext.request.contextPath}/assets/img/free_delivery.png"> --%>
									</div>
								</li>
								<!-- <li class="desc-extra clear">
									<div>
										<p>추가혜택</p>
									</div>
									<div>
										<ul>
											<li>1% 적립</li>
											<li>2개 사면 10개 더주지롱</li>
										</ul>
									</div>
								</li> -->
							</ul>
						</div>
					</section>
				</form>

				<!-- <section class="best-review">

                </section> -->

				<section class="product-board">
					<div class="tab-wrapper">
						<ul class="tab-list clear">
							<li class="tab tab1 active"><a onclick="">상세정보</a></li>
							<li class="tab tab2"><a onclick="">구매후기</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<!-- 상품 상세정보 -->
						<div class="product-detail">
							<img src="${output.detailImg}">
							
						</div>
						<div class="detail-more">
							<span class="open">상품정보 더보기<img
								src="${pageContext.request.contextPath}/assets/img/dropdown_1.png"
								alt="상품정보 더보기"></span> <span class="close">상품정보 접기<img
								src="${pageContext.request.contextPath}/assets/img/dropdown_2.png"
								alt="상품정보 접기"></span>
						</div>

						<!-- 구매후기 -->
						<div class=""></div>

					</div>
				</section>
			</div>

			<!-- 리뷰 구현 부분 -->

			<div id="review" class="tabcnt_detail tabcnt_detail1 detail_qnarev">
				<div class="crema-hide clear">
					<div class="wrap_inner clear">
						<div class="title_btn">
							<h3>
								구매후기 <span class="count_review"></span>
							</h3>
						</div>
						<div class="tit_btm_wr">
							<!-- <div class="btn">
                                <span class="box_btn  blue2"><a href="/mypage/order_list.php">후기쓰기</a></span>
                            </div> -->
							<a class="review-wr"
								href="${pageContext.request.contextPath}/mypage/order_list.do">후기쓰기</a>
						</div>
					</div>
					<div class="qnarev_list clear" id="detail_review_ajax_list">
						<ul id="review_area" class="list_qnarev clear">
							<li class="subject-none comment_Y pic more clear">상품 후기가
								없습니다.</li>
						</ul>
					</div>
					<div class="box_btn block more more_v_btn" id="more">
						<div class="review-more">더보기</div>
					</div>
				</div>
			</div>



			<!-- // Review -->
			<form id="cartAdd"
				action="${pageContext.request.contextPath}/shop/cart_add_ok">
				<input type="hidden" name="prdno" value="${output.prdno}">
				<div class="fixed_area">

					<!-- 구매하기상단 화살표 -->
					<span class="arrow" onclick="toggle_area();"></span>

					<div class="area1">

						<!-- 상품옵션
                    <div id="option_man_div" class="buy_select_type">
                        <span id="option_man_div_text1" class="buy_select_type_text">상품옵션선택</span>
                        <span class="buy_select_type_arrow"></span>
                    </div>

                    상품옵션
                    <div id="option_man_div2" class="buy_select_type">
                        <span id="option_man_div_text2" class="buy_select_type_text">추가 옵션 선택</span>
                        <span class="buy_select_type_arrow"></span>
                    </div>

                    멀티옵션 -->

						<div class="multi_opt">
							<ul id="detail_multi_option2" class="selected_list">
								<li class="wing_multi_option_0" data-idx="0">
									<div class="inner">
										<div class="opt_name"></div>
										<div class="opt_price">
											<div class="qty">
												<a href="#" onclick="changeQty(-1); return false;"
													class="ea_down"></a> <input type="number" id="qty" name="qty"
													value="1" class="form_input" readonly>
												<a href="#" onclick="changeQty(+1); return false;"
													class="ea_up"></a>
											</div>
											<div class="prc">
												<span class="multi_option_prc_0"><fmt:formatNumber
														value="${output.price}" pattern="#,###" /></span> 원
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>

						<!-- // 멀티옵션 -->

						<div class="opt_total">
							<span class="title">총 금액</span> <strong><span
								id="detail_multi_option_prc" class="sell_prc_str_total"><fmt:formatNumber
										value="${output.price}" pattern="#,###" /></span> 원</strong>

						</div>


						<div class="btn">
							<div class="btn_col clear">
								<!-- <span id="cartBtn" class="box_btn large block radius dgray"><a
									id="cartBtn" href=""> -->
								<button class="add-cart" type="submit">장바구니 담기</button>
								<!-- </a> -->
								<!-- </span> -->
								 <span class="box_btn large block radius orange"><a
									href="#" onclick="orderSubmit(); return false;">바로구매</a></span>
							</div>
						</div>
					</div>

					<div class="area" onclick="toggle_area();">
						<div class="box_btn block orange radius">
							<span>구매하기</span>
						</div>
					</div>
				</div>
			</form>
			<form id="orderForm" method="post"
					action="${pageContext.request.contextPath}/shop/order.do">
					<input type="hidden" name="prdno" value="${output.prdno}">
					<input type="hidden" id="orderQty" name="qty" value="${output.prdno}">
			</form>

		</main>
	</div>

	<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>



	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>


	<script id="review-item" type="text/x-handlebars-template">
	{{#each item}}
							<li class="subject comment_Y pic more clear">
                                <div class="hey">
                                    <div class="info">
                                        <span class="grade"><img src="${pageContext.request.contextPath}/assets/img/rating{{memRating}}.png"></span>
                                    </div>
                                    <div class="writer"><span class="name">{{nick}}</span><span>{{regDate}}</span></div><br/>
                                    <div class="cnt_more">
                                        <div class="cnt review-left">{{content}}</div>
 										<div class="review-right">
                                    		<span class="thumb "><img src="{{img}}"></span>
                               		 	</div>
                                    </div>
                                </div>
                               
                            </li>
	{{/each}}
	</script>


	<script type="text/javascript">
		$(function() {
			$(document).ready(function() {

				$('.tab2').click(function() {

					var offset = $('#review').offset(); //선택한 태그의 위치를 반환

					$('html').animate({
						scrollTop : offset.top
					}, 400);

				});

			});
		});

		function get_query() {
			var url = document.location.href;
			var qs = url.substring(url.indexOf('?') + 1).split('&');
			for (var i = 0, result = {}; i < qs.length; i++) {
				qs[i] = qs[i].split('=');
				result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			}
			return result;
		}
		let nowPage = 1;

		$(function() {
			var prdno = get_query();
			get_list();
			function get_list() {
				prdno.page = nowPage;
				$.get("${pageContext.request.contextPath}/shop/review_list",
						prdno, function(req) {
							var template = Handlebars.compile($("#review-item")
									.html());
							var html = template(req);
							if (req.meta.totalCount != 0) {
								$(".subject-none").hide();
							}
							$(".count_review").text(req.meta.totalCount);
							$("#review_area").append(html);
							$(".cnt_more img").not('img[src^="/"]').parents('.hey').css( "display", "block" );
							$(".cnt_more img").not('img[src^="/"]').parents('.cnt_more').find('.cnt').removeClass('review-left');
							$(".cnt_more img").not('img[src^="/"]').parent().parent().remove();
							if (req.meta.totalPage <= nowPage) {
								$("#more").hide();
							}
						});
			}
			$("#more").click(function(e) {
				nowPage++;
				get_list();

			});
		});

		function tabmove(no) {
			var pos = $('.product-boar .tab-wrapper').offset();
			var duration = '400';
			$('html, body').animate({
				scrollTop : pos.top
			}, duration);
		}

		var obj = $('.fixed_area');
		var area = $('.fixed_area .area');
		var area1 = $('.fixed_area .area1');
		var area2 = $('.fixed_area .area2');
		var area3 = $('.fixed_area .area3');
		var area_stat = '0';

		function toggle_area() {
			// 상품 옵션 창이 떠 있는 경우
			if (area_stat == '2') {
				area1.slideDown('fast');
				area2.slideUp('fast');
				area3.slideUp('fast');
				area_stat = '1';
			} else {
				if (obj.hasClass('is_show')) {
					obj.removeClass('is_show');
					area.slideDown('fast');
					area1.slideUp('fast');
					area2.slideUp('fast');
					area3.slideUp('fast');
					area_stat = '0';
				} else {
					obj.addClass('is_show');
					area.slideUp('fast');
					area1.slideDown('fast');
					area_stat = '1';
				}
			}
		}

		//상품옵션 클릭
		$("#option_man_div").click(function() {
			area1.slideUp('fast');
			area2.slideDown('fast');
			area3.slideUp('fast');
			area_stat = '2';
		});

		//상품옵션 클릭
		$("#option_man_div2").click(function() {
			area1.slideUp('fast');
			area2.slideUp('fast');
			area3.slideDown('fast');
			area_stat = '2';
		});

		//상품옵션선택
		$(".opt_li_list").click(function() {
			area1.slideDown('fast');
			area2.slideUp('fast');
			area3.slideUp('fast');
			area_stat = '1';

		});

		$(function() {

			var scroll_expand = 0;

			// 상품정보 더보기 버튼
			$('.detail-more').on('click', function() {
				if ($('.product-board .tab-content').hasClass('expand')) {
					$('.product-board .tab-content').removeClass('expand');
					$(window).scrollTop(scroll_expand);
				} else {
					$('.product-board .tab-content').addClass('expand');
					scroll_expand = $(window).scrollTop();
				}
			});

			$('.tab-wrapper .tab-list .tab').click(function() {
				$(this).addClass('active').siblings().removeClass('active');
			});

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
									/* if (json.rt == "OK") {
										window.location = "${pageContext.request.contextPath}/mypage/wish_list.do";
									} */

								},
								error : function() {
									alert("로그인이 필요합니다.");
									window.location = "${pageContext.request.contextPath}/member/login.do";

								}
							});

			// #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
			$("#cartAdd")
				.ajaxForm({
					// 전송 메서드 지정
					method : "POST",
					// 서버에서 200 응답을 전달한 경우 실행됨
					success : function(json) {
						console.log(json);
						// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
						if (json.rt == "OK") {
							var result = confirm("장바구니로 이동하시겠습니까?");
							if (result){
								window.location = "${pageContext.request.contextPath}/shop/cart.do";
								
							}
						}

					},
					error: function(){
						alert("로그인이 필요합니다.");
						window.location = "${pageContext.request.contextPath}/member/login.do";

					}
			});
			
			$(".wish-img").click(function () {
				
				if ($(".wish-img").attr("src")=="${pageContext.request.contextPath}/assets/img/wish_on.png"){
                	$(".wish-img").attr("src","${pageContext.request.contextPath}/assets/img/wish_off.png");
				} else {
                	$(".wish-img").attr("src","${pageContext.request.contextPath}/assets/img/wish_on.png");
					
				}
            }); 
		});
		
		function orderSubmit() {
			$("#orderQty").val($("#qty").val());
			$("#orderForm").submit();
		}
		
		var quantity = Number($('#qty').val());	
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		function changeQty(num) {
			quantity = eval(quantity + num);
			if (quantity < 1) {
				alert("상품갯수는 최소 1개입니다.");
				quantity = 1;
			}
			$("#qty").val(quantity);
			var detailTotal = Number(${output.price}) * quantity;
			$("#detail_multi_option_prc").html(numberWithCommas(detailTotal));
			
		}
	</script>
</body>

</html>