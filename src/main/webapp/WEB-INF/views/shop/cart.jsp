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
	href="${pageContext.request.contextPath}/assets/css/cart.css">

</head>
<body>

	<header>
		<div class="cart-header-wrap">
			<div class="cart-header">
				<a class="cart-back-btn" href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
					alt="뒤로가기버튼"></a>
				<h2>장바구니</h2>
			</div>
		</div>
	</header>


	<section>

		<div class="cart-section-wrap">
			<form method="post"
				action="${pageContext.request.contextPath}/shop/cart_edit_ok.do">

				<div class="cart-section">


					<div class="cart-top">
						<!-- <input type="checkbox" id="cart-check-all" checked="checked">
						<label for="cart-check-all">전체선택 (<span class="count">...</span>)
						</label>  -->
						<!-- <a class="cart-del" href="#"><span>선택삭제</span></a> -->
						<%-- <button class="checked-del" type="submit"
							formaction="${pageContext.request.contextPath}/shop/cart_selected_delete_ok.do">전체삭제</button> --%>
						<span>총 <span class="prd-count">0</span>개의 물건</span>
						<a href="${pageContext.request.contextPath}/shop/cart_delete_list_ok.do" class="selectDelete_btn">전체삭제</a>
					</div>


					<div class="cart-list-wrap">
						<ul class="cart-list-ul">
							<c:choose>

								<%-- 장바구니에 담긴 상품이 없을 경우 --%>
								<c:when test="${output==null || fn:length(output)==0}">
									<p>장바구니에 담긴 상품이 없습니다.</p>
								</c:when>

								<%-- 장바구니에 담긴 상품이 있을 경우 반복해서 출력 --%>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<li class="cart-list"><input type="hidden" name="prdno"
											id="prdno" value="${item.prdno}">
											<div>
												<div class="brand-check">
													<span class="brand-name">${item.title}</span>
													<!-- <span
														class="brand-count">1개 상품</span> -->
												</div>

												<div class="prd_box">
													<div class="prd-name-wrap">
														<%-- <input type="checkbox" id="prd-name" name="cart-check"
															value="${item.cartno}" data-cartno="${item.cartno}"
															class="cart-check" checked> <label for="prd-name">${item.title}</label> --%>
													</div>

													<div class="prd-desc-wrap clear">
														<div class="prd-desc-left">
															<div class="prd_img">
																<img
																	src="${item.thumb}">
															</div>
														</div>
														<div class="prd-desc-right">
															<div class="prd-desc-1">
																<span><a
																	href="${pageContext.request.contextPath}/shop/cart_delete_ok.do?cartno=${item.cartno}"
																	class="prd-del"><img
																		src="${pageContext.request.contextPath}/assets/img/del_btn_type2.png"
																		alt="상품개별삭제버튼"></a></span>
															</div>
															<div class="prd-qty">
																<a class="prd-qty-minus" href=""> <img
																	src="${pageContext.request.contextPath}/assets/img/bullet_minus.png"
																	alt="마이너스버튼">
																</a> <input type="number" class="qty" id="qty" name="qty"
																	value="${item.qty}" readonly> <a
																	class="prd-qty-plus" href="#"> <img
																	src="${pageContext.request.contextPath}/assets/img/bullet_plus.png"
																	alt="플러스버튼">
																</a>
																<button class="edit-submit" type="submit">수정</button>
																<p class="prd-price-wrap">
																	<%-- <span class="prd-price"><fmt:formatNumber
																			value="${item.price * item.qty}" pattern="#,###" /></span>원 --%>
																</p>
															</div>
														</div>
													</div>
												</div>
												<div class="delivery-charge clear">
													<%-- <span>배송비 : </span>
													<c:choose>
														<c:when test="${'N' eq item.freeShipping}">
															<span class="dlv-price" id="dlv-prc-cart">3,000원</span>
														</c:when>
														<c:otherwise>
															<span class="dlv-price" id="dlv-prc-cart">0원</span>
														</c:otherwise>
													</c:choose> --%>
													<span class="price-right"><span class="prd-price"><fmt:formatNumber
																			value="${item.price * item.qty}" pattern="#,###" /></span>원</span>
												</div>
											</div></li>

									</c:forEach>
								</c:otherwise>
							</c:choose>


						</ul>
					</div>





					<div class="sum">
						<div class="cart-sum">
							<div>
								<span>상품금액</span> <span class="sum-cart-float"> <span
									class="sum-cart-price">24,000</span><span>원</span>
								</span>
							</div>
							<div>
								<span>배송비</span> <span class="sum-cart-float"> <span
									class="sum-dlv-price" id="dlv-prc-cart">0</span><span>원</span>
								</span>

							</div>
						</div>

						<div class="total-sum clear">
							<div>
								<span>총 주문금액</span> <span class="sum-cart-float"> <span
									class="sum-cart-price-total">25,000</span><span>원</span>
								</span>
							</div>
							<!-- <div class="order-point">
								( <span class="point">250</span> <span>P 적립예정 )</span>
							</div> -->
						</div>
					</div>

				</div>

				<div class="cart-footer">

					<button class="odr-submit" type="submit"
						formaction="${pageContext.request.contextPath}/shop/order.do">상품
						주문하기</button>
					<div class="cart-btn">
						<!-- <span><a href="#"><span>상품 주문하기</span></a></span>  -->
						<span><a href="${pageContext.request.contextPath}"><span
								class="cart-btn-continue">쇼핑 계속하기</span></a></span>
					</div>


				</div>
			</form>
		</div>


		<div class="empty">
			<img
				src="${pageContext.request.contextPath}/assets/img/empty_shop_cart.png">
			<p>
				장바구니에 <br> 담겨있는 상품이 없습니다.
			</p>


			<span><a href="${pageContext.request.contextPath}"><span
					class="cart-btn-continue">쇼핑 계속하기</span></a></span>


		</div>

	</section>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	<%@ include file="/WEB-INF/views/common/recent.jsp"%>


	<script type="text/javascript">
        $(function() {

            /* 장바구니에 물건이 없을 경우 empty */

            if ($(".cart-list-wrap").find(".cart-list").children().length==0){
                    $(".empty").css("display", "block");
                    $(".cart-section-wrap").css("display", "none");
            }



           <%-- /* 뒤로가기 버튼 */
            $(".cart-back-btn").click(function(){
                    window.history.back();
            });--%>

            /* 장바구니 계산 */

            var total = 0;
            var dlv_total = 0;

            // 함수
            function calcTotal (){

                total = 0;
                dlv_total = 0;

                $(".cart-list-ul li").each(function(){

                    /* var delivery = parseInt($(this).find(".dlv-price").text().replace(",","")); */
                    
                    /* console.log(delivery); */
                    
                    var each_price = parseInt($(this).find(".prd-price").text().replace(",",""));
                    
                    var each_qty = $(this).find(".qty").val();
                    
                    console.log(each_price);
                    console.log(each_qty);

                    var origin_each_price = each_price / each_qty;

                    total += origin_each_price * each_qty;
                    /* dlv_total += delivery; */

                    /* var grand_total = total + dlv_total; */
                    /* var point = grand_total * 0.01;
                    point = Number(point).toLocaleString("en"); */

                    /* grand_total = Number(grand_total).toLocaleString("en"); */
                    var real_total = Number(total).toLocaleString("en");
                    
                    var dlv = 3000;

                    if(total > 30000) {
                    	$(".sum-cart-price").html(real_total);
                        $(".sum-dlv-price").html(Number(dlv_total).toLocaleString("en"));
                        $(".sum-cart-price-total").html(real_total);

                    } else {
	                    $(".sum-cart-price").html(real_total);
	                    $(".sum-dlv-price").html(Number(dlv).toLocaleString("en"));
	                    $(".sum-cart-price-total").html(Number(total+dlv).toLocaleString("en"));
                    	
                    }


                });
            }
            // 함수 끝
            

            if($(".cart-list-ul li").length){
                calcTotal();
            }
            
            $("input").change(function(){
            	calcTotal();
            });


            /* 상품 수량 +, - */
            /* 마이너스 버튼 */
            $(".prd-qty-minus").click(function(e){

                e.preventDefault();

                var prd_price = $(this).parents(".cart-list").find(".prd-price").text().replace(",","");

                // 클릭한 마이너스 버튼 근처의 input val 가져옴
                var prd_qty = $(this).next().val();

                //수량이 0으로 내려갈 때
                if (prd_qty<2){
                    alert("상품의 수량은 0일 수 없습니다.");
                    return;
                }

                // 가져온 val에 -1
                $(this).next().val(parseInt(prd_qty)-1);

                // 변한 val 담음
                var now_qty = $(this).next().val();

                // 1개의 상품 금액 담기
                var origin_price = prd_price/prd_qty;

                // 상품 금액과 변한 val를 계산하여 출력
                var total_prd_price = parseInt(origin_price)*now_qty;
                var total = Number(total_prd_price).toLocaleString("en");
                $(this).parents(".cart-list").find(".prd-price").html(total);

                // 합계 재계산
                calcTotal();

            });

            /* 플러스 버튼 */
            $(".prd-qty-plus").click(function(e){

                e.preventDefault();

                // 클릭한 플러스 버튼 근처의 상품 금액 가져옴
                var prd_price = $(this).parents(".cart-list").find(".prd-price").text().replace(",","");
                
                console.log(prd_price);


                // 클릭한 플러스 버튼 근처의 input val 가져옴
                var prd_qty = $(this).prev().val();
                console.log(prd_qty);

                // 가져온 val에 +1
                $(this).prev().val(parseInt(prd_qty)+1);

                // 변한 val 담음
                var now_qty = $(this).prev().val();

                // 1개의 상품 금액 담기
               	var origin_price = prd_price/prd_qty;

                // 상품 금액과 변한 val를 계산하여 출력
                var total_prd_price = parseInt(origin_price)*now_qty;
                var total = Number(total_prd_price).toLocaleString("en");

                /* $(this).next().next().find(".prd-price").html(total); */
                $(this).parents(".cart-list").find(".prd-price").html(total);

                // 합계 재계산
                calcTotal();

            });


            /* 체크박스 전체선택 */

            $("#cart-check-all").change(function(){
                $(".cart-check").prop("checked", $(this).prop("checked"));
            });



            /* 상품 삭제 */

            //상품 개별 삭제 버튼
            $(".prd-del").click(function(){
                /* var result = confirm("상품을 정말 삭제하시겠습니까?");

                if(result){
                    $(this).parents().remove(".cart-list");
                } */

                // 장바구니가 비었을 때 .empty 활성화
                if ($(".cart-list-wrap").find(".cart-list").children().length==0){
                    $(".empty").css("display", "block");
                    $(".cart-section-wrap").css("display", "none");
                }

            });

            // 선택삭제 버튼
            $(".cart-del").click(function(){
                var result = confirm("선택상품을 정말 삭제하시겠습니까?");

                if(result){
                    $(".cart-list-wrap").find("input[name='cart-check']:checked").parents(".cart-list").remove();
                    //상품 삭제
                    alert("삭제되었습니다.");
                }


                // 장바구니가 비었을 때 .empty 활성화
                if ($(".cart-list-wrap").find(".cart-list").children().length==0){
                    $(".empty").css("display", "block");
                    $(".cart-section-wrap").css("display", "none");
                }

            });
            
            /* 개수 표시 */
			var count = $(".cart-list").length;

			$(".prd-count").html(count);
            
			/* $(".selectDelete_btn").click(function(){
            	
            	var confirm_val = confirm("정말 삭제하시겠습니까?");
            	
            	if(confirm_val) {
            		
            	   var checkArr = new Array();
            	   
            	   $("input[name='cart-check']:checked").each(function(){
            		   
            		   checkArr.push($(this).attr("data-cartno"));
            	   });
            	    
            	   $.ajax({
            	    	url : "${pageContext.request.contextPath}/shop/cart_delete",
            	    	
            	    	type : "post",
            	    	
            	    	data : { chbox : checkArr },
            	    	
            	    	success : function(){
            	     	
            	    		location.href = "${pageContext.request.contextPath}/shop/cart.do";
            	    	},
            	    
            	    	error : function(){
            	    	
            	    		alert("삭제에 실패했슴다..");
            	    
            	    	}
            	   
            	   });
            	  
            	} 
            	  
            	  console.log(checkArr);
            }); */


        });
    </script>
</body>
</html>