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
	href="${pageContext.request.contextPath}/assets/css/order_list.css">
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
			<div class="odr-list-header-wrap">
				<div class="odr-list-header">
					<h2>
						<a class="odr-list-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 구매내역
					</h2>
				</div>
			</div>


			<div class="odr-list-section-wrap">
				<div class="odr-list-section">

					<div class="odr-list-menu">
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/mypage/order_list.do">구매내역</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/wish_list.do">찜한상품</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/coupon.do">쿠폰</a></li>
						</ul>
					</div>


					<div class="odr-list-date-wrap">
						<h4>구매조회</h4>
						<form action="" class="odr-list-date">
							<ul>
								<li><a href="${pageContext.request.contextPath}/mypage/order_list.do?range=1w">1주일</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/order_list.do?range=1m">1개월</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/order_list.do?range=3m">3개월</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/order_list.do?range=6m">6개월</a></li>
								<li><a >기간설정</a></li>
							</ul>
						</form>
						
					</div>


					<!-- 기간설정 아코디언 컨텐츠 -->
					<form method="get" action="${pageContext.request.contextPath}/mypage/order_list.do">
					<div id="odr-list-date-inner" class="odr-list-date-inner clear">
						<input name="range" value="custom" hidden="true">
						<div class="from-to">
							<ul class="before when">
								<li class="year"><select name="before-year"
									id="before-year">
										<option value="" selected>-년도선택-</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
								</select></li>
								<li class="month"><select name="before-month"
									id="before-month">
										<option value="" selected>-월-</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select></li>
								<li class="date"><select name="before-date"
									id="before-date">
										<option value="" selected>-일-</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
								</select></li>
								<li class="when-text">부터</li>
							</ul>
							<ul class="after when">
								<li class="year"><select name="after-year" id="after-year">
										<option value="" selected>-년도선택-</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
								</select></li>
								<li class="month"><select name="after-month"
									id="after-month">
										<option value="" selected>-월-</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select></li>
								<li class="date"><select name="after-date" id="after-date">
										<option value="" selected>-일-</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
								</select></li>
								<li class="when-text">까지</li>
							</ul>
						</div>
						<div class="inner-btn">
							<span> <input type="submit" value="조회하기">
							</span>
						</div>

					</div>
					</form>

					<!-- 기간설정 아코디언 컨텐츠 끝 -->


					<div class="odr-list-list-wrap">
						<div class="odr-list-list clear">
							<ul class="tab-ul">
								<li class="active tab-li"><a href="#">전체주문내역</a></li>
								<li><a href="#">취소 / 반품</a></li>
							</ul>
							<div class="odr-list-list-content" id="allList">
								<c:if test="${empty ol}">
									<p class="empty">주문내역이 존재하지 않습니다.</p>
								</c:if>

								<ul class="for-each-ul">
									<c:forEach var="order" items="${ol}" varStatus="status">
									<c:set var="odrno">${order.odrno}</c:set>
									<c:if test="${order.status ne '주문취소'}">
									<li class="for-each-li">
									<a href="${pageContext.request.contextPath}/mypage/order_list_detail.do?odrno=${order.odrno}">
											<div class="list-top">
												<span class="odr-date">${order.regDate}</span> <span class="odrno">주문번호: ${order.odrno}&nbsp;></span>
											</div> <!-- 여기서 또 포문 (주문번호에 있는 상품 개수 만큼) -->
											<c:forEach var="prd" items="${requestScope[odrno]}" varStatus="status">
											<div class="list-cnt clear">
												<div class="cnt-img">
													<img src="${prd.thumb}" alt="상품썸네일이미지">
												</div>
												<div class="cnt-right">
													<p class="prd-name">${prd.title}</p>
													<div class="cnt-bottom">
														<span class="qty">${prd.qty}<span>개</span></span> <span
															class="price"><fmt:formatNumber	value="${prd.qty * prd.price}" pattern="#,###" /><span>원</span></span> <span
															class="status">${order.status}</span>
													</div>
												</div>
											</div>
											</c:forEach>
									</a>
									</li>
									</c:if>
									</c:forEach>
									<!-- 포문 반복 끝 -->
								</ul>



							</div>
							<div class="odr-list-list-content" id="cancelList" style="display: none;">
								<c:if test="${empty ol}">
									<p class="empty">주문내역이 존재하지 않습니다.</p>
								</c:if>

								<ul class="for-each-ul">
									<c:forEach var="order" items="${ol}" varStatus="status">
									<c:set var="odrno">${order.odrno}</c:set>
									<c:if test="${order.status eq '주문취소'}">
									<li class="for-each-li">
									<a href="${pageContext.request.contextPath}/mypage/order_list_detail.do?odrno=${order.odrno}">
											<div class="list-top">
												<span class="odr-date">${order.regDate}</span> <span class="odrno">${order.odrno}&nbsp;></span>
											</div> <!-- 여기서 또 포문 (주문번호에 있는 상품 개수 만큼) -->
											<c:forEach var="prd" items="${requestScope[odrno]}" varStatus="status">
											<div class="list-cnt clear">
												<div class="cnt-img">
													<img src="${prd.thumb}" alt="상품썸네일이미지">
												</div>
												<div class="cnt-right">
													<p class="prd-name">${prd.title}</p>
													<div class="cnt-bottom">
														<span class="qty">${prd.qty}<span>개</span></span> <span
															class="price"><fmt:formatNumber	value="${prd.qty * prd.price}" pattern="#,###" /><span>원</span></span> <span
															class="status">${order.status}</span>
													</div>
												</div>
											</div>
											</c:forEach>
									</a>
									</li>
									</c:if>
									</c:forEach>
									<!-- 포문 반복 끝 -->
								</ul>



							</div>
						</div>
					</div>

				</div>
			</div>

		</section>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>

	</div>










	<script type="text/javascript">
	
		$.urlParam = function(name){
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		    if (results==null){
		       return null;
		    }
		    else{
		       return results[1] || 0;
		    }
		}	
	
        $(function() {
        	
        	var current = $.urlParam('range');
        	console.log(current);
        	if (current == null || current =='1w') {
        		$(".odr-list-date-wrap .odr-list-date > ul > li").eq(0).addClass("active");
        	} else if (current == '1m') {
        		$(".odr-list-date-wrap .odr-list-date > ul > li").eq(1).addClass("active");
        	} else if (current == '3m') {
        		$(".odr-list-date-wrap .odr-list-date > ul > li").eq(2).addClass("active");
        	} else if (current == '6m') {
        		$(".odr-list-date-wrap .odr-list-date > ul > li").eq(3).addClass("active");
        	} else if (current == 'custom') {
        		$(".odr-list-date-wrap .odr-list-date > ul > li").eq(4).addClass("active");
        	}

            /* 뒤로가기 버튼 */
            $(".odr-list-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });
            
            /* 클릭시 활성화 클래스 추가 */
            $(".odr-list-date > ul > li").click(function (e) {
            	e.preventDefault();
                $(this).addClass("active");
                $(".odr-list-date > ul > li").not(this).removeClass("active");
            });

            $(".odr-list-list > ul > li").click(function (e) {
            	e.preventDefault();
                if ($(this).hasClass("active") == false) {
                	
                	$(this).addClass("active");
                	$(".odr-list-list > ul > li").not(this).removeClass("active");
                	
                	if($("#allList").css("display") == "none"){   
                        $('#allList').show();  
    	             } else {  
    	                $('#allList').hide();  
    	             }
    	         	if($("#cancelList").css("display") == "none"){   
    	            	$('#cancelList').show();  
    		        } else {  
    		        	$('#cancelList').hide();  
    		        }  
   	            }
            });
                
                

            /* 기간설정 아코디언 컨텐츠 */
            $(".odr-list-date > ul > li:last-child").click(function(e){
            	e.preventDefault();
                if($("#odr-list-date-inner").css("display")=="none"){
                    $("#odr-list-date-inner").slideToggle(200);
                    $("#odr-list-date-inner").css("display", "block");
                } else {
                    $("#odr-list-date-inner").slideToggle(200);

                }

            });
            
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
            $(document).on('click', ".top-menu", function(e) {
            	e.preventDefault();
                if($("#menutab").css("display")=="none"){
                    $("#menutab").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".close-icon", function() {
                if($("#menutab").css("display")=="block"){
                    $("#menutab").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });
    
        });
	</script>
</body>

</html>