
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
	href="${pageContext.request.contextPath}/assets/css/express.css">

</head>
<body>

	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">

		<header><%@ include file="/WEB-INF/views/common/header1.jsp"%></header>

		<main id="wrap">
			<!-- 특급배송 페이지 본문 -->
			<section id="big_section">
				<div class="express-top">
					<div class="img">
						<a href="#"> <img
							src="${pageContext.request.contextPath}/assets/img/express_bg_01.jpg">
						</a>
					</div>
					<ul class="express-icon clear">
						<li class="icon icon1">
							<div>
								<img
									src="${pageContext.request.contextPath}/assets/img/ex_icon1.png">
								<span>서비스 안내</span>
							</div>
						</li>
						<li class="icon icon2">
							<div>
								<img
									src="${pageContext.request.contextPath}/assets/img/ex_icon2.png">
								<span>휴무일 안내</span>
							</div>
						</li>
						<li class="icon icon3">
							<div>
								<img
									src="${pageContext.request.contextPath}/assets/img/ex_icon3.png">
								<span>배송가능지역</span>
							</div>
						</li>
					</ul>
				</div>

				<!-- 모달 창 구현 부분 -->

				<!-- 1. 서비스 안내 버튼 클릭 -->
				<div class="icon1_layer_wrap popupLayer" style="display: none;">
					<div class="icon1_layer_area">
						<img
							src="${pageContext.request.contextPath}/assets/img/ex_notice_01.jpg"
							border="0">
					</div>
					<div class="layer_close_area" onclick="layerClose();">
						<img
							src="${pageContext.request.contextPath}/assets/img/close_btn_type2.png"
							class="layer_close">
					</div>
				</div>

				<!-- 2. 특급배송 휴무일 안내 버튼 클릭 -->
				<div class="icon2_layer_wrap popupLayer" style="display: none;">
					<div class="icon2_layer_area">
						<h4>특급배송 휴무일 안내</h4>
						<div class="notice_con">
							<div class="notice">
								<p>
									새벽, 당일배송 서비스는<br>평일, 공휴일 주문시 이용 가능합니다!
								</p>
							</div>
						</div>
						<div class="area_con">
							<table>
								<tbody>
									<tr>
										<th scope="col">새벽배송</th>
										<th scope="col">당일배송</th>
									</tr>
									<tr>
										<td>
											<div>
												<strong>토요일 </strong>주문 시<br>이용불가
											</div>
											<div class="sub_notice">
												(토요일 주문시<br> 월요일 새벽 도착)
											</div>
										</td>
										<td><div>
												<strong>토/일요일</strong> 주문 시<br>이용 불가
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="notice_b1">* 섬/공단/학교/학교 기숙사/병원/관공서는 새벽배송 불가</p>
					</div>
					<div class="layer_close_area" onclick="layerClose();">
						<img
							src="${pageContext.request.contextPath}/assets/img/close_btn_type2.png"
							class="layer_close">
					</div>
				</div>

				<!-- 3. 배송가능지역 버튼 클릭 -->
				<div class="icon3_layer_wrap popupLayer" style="display: none;">
					<div class="icon3_layer_area">
						<h4>특급배송 가능지역 안내</h4>
						<div class="icon3_top_con" style="display: none;">
							<div class="notice_con">
								<div class="ex_icon">
									<img
										src="${pageContext.request.contextPath}/assets/img/ex_icon.png"
										alt="가능지역공지" width="43">
								</div>
								<div class="notice">
									<p class="strong">꼭 확인해 주세요</p>
									<p>특급배송은 서울 및 인천, 경기 일부지역에 한해 이용 가능합니다</p>
								</div>
							</div>
							<div class="area_con">
								<table>
									<tbody>
										<tr>
											<td class="area_first">
												<div>
													<table class="area1">
														<tbody>
															<tr>
																<th colspan="2" scope="col">전체 가능 지역</th>
															</tr>
															<tr>
																<td>서울</td>
																<td>안양시</td>
															</tr>
															<tr>
																<td>부천시</td>
																<td>구리시</td>
															</tr>
															<tr>
																<td>성남시</td>
																<td>수원시</td>
															</tr>
															<tr>
																<td>광명시</td>
																<td>의정부시</td>
															</tr>
															<tr>
																<td>시흥시</td>
																<td>안산시</td>
															</tr>
															<tr>
																<td colspan="2" class="area_notice">(안산시흥 공단지역 제외)</td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
											<td class="area_last">
												<div>
													<table class="area2">
														<tbody>
															<tr>
																<th colspan="2" scope="col">일부 가능 지역</th>
															</tr>
															<tr>
																<td>용인시</td>
																<td>하남시</td>
															</tr>
															<tr>
																<td>광주시</td>
																<td>인천광역시</td>
															</tr>
															<tr>
																<td>고양시</td>
																<td>파주시</td>
															</tr>
															<tr>
																<td>화성시</td>
																<td>의왕시</td>
															</tr>
															<tr>
																<td>군포시</td>
																<td>김포시</td>
															</tr>
															<tr>
																<td>남양주시</td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<p class="notice_b">* 특급배송 일부 가능 지역의 더 자세한 주소지 확인 아래 더 자세히 보기
								버튼 혹은 주소검색을 통해 확인하세요.</p>
							<div class="ex_more_view">
								특급배송 가능지역 더 자세히 보기<img
									src="${pageContext.request.contextPath}/assets/img/icon_b_more.png"
									alt="특급배송 가능지역 더 자세히 보기">
							</div>
						</div>

						<!-- 특급배송 가능지역 더 자세히 보기 -->
						<div class="icon3_bottom_con" style="display: none;">
							<h5>특급배송 전체 가능 지역</h5>
							<div class="ex_list">
								서울, 안양시, 부천시, 구리시, 성남시, 수원시, 광명시,<br>의정부시, 안산시, 시흥시(안산시흥
								공단지역제외)
							</div>
							<h5>특급배송 일부 가능 지역</h5>
							<div>
								<table class="ex_list_table">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="60%">
									</colgroup>
									<tbody>
										<tr>
											<th rowspan="4">고양시</th>
										</tr>
										<tr>
											<th class="strong">덕양구</th>
											<td>주교동, 성사동, 토당동, 행신동, 화정동, 도내동, 능곡동</td>
										</tr>
										<tr>
											<th class="strong">일산동구</th>
											<td>백석동, 마두동, 식사동, 중산동, 정발산동, 장항동, 풍동, 풍산동</td>
										</tr>
										<tr>
											<th class="strong">일산서구</th>
											<td>일산동, 주엽동, 탄현동, 대화동, 송산동, 덕이동, 가좌동</td>
										</tr>
										<tr>
											<th colspan="2">용인시</th>
											<td>수지구 고기동, 처인구 제외 전지역</td>
										</tr>
										<tr>
											<th colspan="2">과천시</th>
											<td>관문동 제외 전지역</td>
										</tr>
										<tr>
											<th colspan="2">하남시</th>
											<td>신장동, 덕풍동, 풍산동, 창우동, 위례신도시(학암동), 미사동, 망월동, 선동, 천현동,
												학암동</td>
										</tr>
										<tr>
											<th colspan="2">광주시</th>
											<td>고산리, 능평리, 매산리, 문형리, 신형리, 양벌리, 추자리</td>
										</tr>
										<tr>
											<th colspan="2">인천광역시</th>
											<td>미추홀구, 서구, 남동구, 연수구, 부평구, 계양구</td>
										</tr>
										<tr>
											<th colspan="2">파주시</th>
											<td>동패동, 금촌동, 문발동, 와동동, 목동동, 야당동, 다율동</td>
										</tr>
										<tr>
											<th colspan="2">화성시</th>
											<td>기산동, 영천동, 오산동, 능동, 동탄동, 진안동, 반송동, 청계동, 반월동, 병점동, 석우동</td>
										</tr>
										<tr>
											<th colspan="2">의왕시</th>
											<td>포일동, 오전동, 내손동, 고천동</td>
										</tr>
										<tr>
											<th colspan="2">군포시</th>
											<td>당동, 당정동, 산본동, 금정동, 군포1동, 군포2동, 재궁동, 오금동, 수리동, 궁내동,
												광정동</td>
										</tr>
										<tr>
											<th colspan="2">김포시</th>
											<td>양곡리(양곡택지개발지구), 고촌읍, 양촌읍, 장기동, 운양동, 감정동, 북변동, 사우동,
												풍무동, 구래동, 마산동, 김포1동, 김포2동</td>
										</tr>
										<tr>
											<th colspan="2">남양주시</th>
											<td>금곡동, 다산1동, 다산2동, 도농동, 별내동, 별내면, 와부읍, 이패동, 지금동, 진건읍,
												진접읍, 퇴계원면, 평내동, 호평동</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //특급배송 가능지역 더 자세히 보기 -->
					</div>
					<div class="layer_close_area" onclick="layerClose();">
						<img
							src="${pageContext.request.contextPath}/assets/img/close_btn_type2.png"
							alt="특급배송가능지역안내" class="layer_close">
					</div>
				</div>

				<div class="express-zone" onclick="sample2_execDaumPostcode()">
					<p class="title">특급배송 가능 지역을 꼭 확인하세요!</p>
					<div class="zone">
						<span>배송 가능지역 확인</span> <img
							src="${pageContext.request.contextPath}/assets/img/search_icon2.png"
							alt="특급배송 가능지역 확인">
					</div>
				</div>

				<div>
					<div style="display: none;">
						<input type="text" id="sample2_postcode" placeholder="우편번호">
						<input type="button" onclick="sample2_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text"
							id="sample2_address" placeholder="주소"><br> <input
							type="text" id="sample2_detailAddress" placeholder="상세주소">
						<input type="text" id="sample2_extraAddress" placeholder="참고항목">
					</div>

					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
							onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>

					<script
						src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 화면을 넣을 element
						var element_layer = document.getElementById('layer');

						function closeDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_layer.style.display = 'none';
						}

						function sample2_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample2_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample2_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample2_postcode').value = data.zonecode;
											document
													.getElementById("sample2_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample2_detailAddress")
													.focus();

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_layer.style.display = 'none';

											alert("특급배송 가능지역 입니다.");
										},
										width : '100%',
										height : '100%',
										maxSuggestItems : 5
									}).embed(element_layer);

							// iframe을 넣은 element를 보이게 한다.
							element_layer.style.display = 'block';

							// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
							initLayerPosition();

						}

						// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						function initLayerPosition() {
							var width = 300; //우편번호서비스가 들어갈 element의 width
							var height = 400; //우편번호서비스가 들어갈 element의 height
							var borderWidth = 5; //샘플에서 사용하는 border의 두께

							// 위에서 선언한 값들을 실제 element에 넣는다.
							element_layer.style.width = width + 'px';
							element_layer.style.height = height + 'px';
							element_layer.style.border = borderWidth
									+ 'px solid';
							// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
									+ 'px';
							element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
									+ 'px';
						}
					</script>
				</div>

				<div class="ts-section-wrap">
					<div class="ts-section">
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
								</select>  -->
								<a href="#"><img class="list-btn"
									src="${pageContext.request.contextPath}/assets/img/type1_on.png"
									alt="리스트형버튼"></a> <a href="#"><img class="gallery-btn"
									src="${pageContext.request.contextPath}/assets/img/type2_off.png"
									alt="갤러리형버튼"></a>
							</div>
						</div>
					</div>

					<div class="ts-list-gallery-wrap">
						<div class="ts-list-gallery clear">
							<ul>
								<c:choose>

									<%-- 특급배송 상품이 없을 경우 --%>
									<c:when test="${output==null || fn:length(output)==0}">
										<p>특급배송 상품이 없습니다.</p>
									</c:when>

									<%-- 특급배송 상품이 있을 경우 반복해서 출력 --%>
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
																			src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
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

					<div class="ts-list-list-wrap active">
						<div class="ts-list-list">
							<ul>
								<c:choose>

									<%-- 특급배송 상품이 없을 경우 --%>
									<c:when test="${output==null || fn:length(output)==0}">
										<p>신상품이 없습니다.</p>
									</c:when>

									<%-- 특급배송 상품이 있을 경우 반복해서 출력 --%>
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
																		pattern="#,###" /></strong>원
																<c:choose>
																	<c:when test="${'Y' eq item.express}">
																		<img class="delivery"
																			src="${pageContext.request.contextPath}/assets/img/express_delivery.png" />
																	</c:when>
																	<c:when
																		test="${'Y' eq item.freeShipping && 'N' eq item.express}">
																		<img class="delivery"
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
		</main>


		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
		<%@ include file="/WEB-INF/views/common/recent.jsp"%>
	</div>


	<script type="text/javascript">
		$(function() {

			$('.category-line .list li a').click(
					function(e) {
						e.preventDefault();
						$(this).parent().addClass('selected').siblings()
								.removeClass('selected');
					});

			$(document).ready(function() {
				$('header nav ul li').eq(4).addClass('on');
			});

			// --- 김지효 ---
			/** 클릭 시 메뉴 탭 숨김, 표시 처리 */
			$(document).on('click', ".top-menu", function(e) {
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
				}
				e.preventDefault();
			});

			$(document).on('click', ".close-icon", function(e) {
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
				}
				e.preventDefault();
			});

			/** 클릭 시 서치 탭 숨김, 표시 처리 */
			$(document).on('click', ".search-account", function(e) {
				if ($("#search-layer").css("display") == "none") {
					$("#search-layer").css("display", "block");
					$("#mainpage").css("display", "none");
				}
				e.preventDefault();
			});

			$(document).on('click', ".search-layer-close", function(e) {
				if ($("#search-layer").css("display") == "block") {
					$("#search-layer").css("display", "none");
					$("#mainpage").css("display", "block");
				}
				e.preventDefault();
			});

			/** 종류별 브랜드별 탭 클릭 이벤트 */
			$(".tab-title > li").click(function(e) {
				if ($(this).hasClass("on")) {
					$(".tab-title > li").not(this).removeClass("on");
				} else {
					$(this).addClass("on");
					$(".tab-title > li").not(this).removeClass("on");
				}
				e.preventDefault();
			});

			$(".tab-title > li:first-child").click(function(e) {
				$("#menu-list-wrap").css("display", "block");
				$("#menu-table-wrap").css("display", "none");
				e.preventDefault();
			});

			$(".tab-title > li:last-child").click(function(e) {
				$("#menu-table-wrap").css("display", "block");
				$("#menu-list-wrap").css("display", "none");
				e.preventDefault();
			});

			$('.swiper-slide a').click(
					function(e) {
						e.preventDefault();
						var n = $('.swiper-slide a').index($(this));
						$('.swiper-slide').eq(n).addClass('on').siblings()
								.removeClass('on');
						$('.sell-king-content > ul').eq(n % 2).addClass(
								'active').siblings().removeClass('active');
					});

		});

		function searchLayerOpen() {
			$("header").show();
			if ($('#searchLayer').html() == "") {
				$("#searchLayer").load();
			}

			$('#searchLayer').addClass('on');
			od_popup_Open();
			$('#ht-custom').hide();
			$('.basic_search').focus();
		}

		function searchLayerClose() {
			$('#searchLayer').removeClass('on');
			layerClose();
			$('#ht-custom').show();
		}

		//레이어창 닫기버튼
		function layerClose() {
			$(".popupLayer").hide();
			$("#dimmedLayer").hide();
		}

		$(function() {

			// 서비스 안내 레이어창
			$(".icon1").click(function() {
				$(".icon1_layer_wrap").show();
			});

			//특급배송 휴무일 안내 레이어창
			$(".icon2").click(function() {
				$(".icon2_layer_wrap").show();
			});

			//특급배송 가능지역 안내 레이어창
			$(".icon3").click(function() {
				$(".icon3_layer_wrap").show();
				$(".icon3_top_con").show();
			});

			//특급배송 가능지역 더 자세히 보기
			$(".ex_more_view").click(function() {
				$(".icon3_top_con").hide();
				$(".icon3_bottom_con").show();
			});

			//우편번호 찾기 레이어창
			$(".express_zone").click(function() {
				search_zip();
			});

			//우편번호 찾기 탭메뉴
			$(".zip_li").click(function() {
				$(".zip_li").removeClass("select");
				$(this).addClass("select");
			});

			//우편번호 검색어 삭제
			var $ipt = $('#address_dong'), $clearIpt = $('.control_clear_add');

			/* 리스트형 갤러리형 클릭 이벤트 */
			$(".list-btn")
					.click(
							function(e) {

								$(".list-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type1_on.png");
								$(".gallery-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type2_off.png");
								$(".ts-list-list-wrap").addClass("active");
								$(".ts-list-gallery-wrap")
										.removeClass("active");
								e.preventDefault();
							});

			$(".gallery-btn")
					.click(
							function(e) {
								$(".gallery-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type2_on.png");
								$(".list-btn")
										.attr("src",
												"${pageContext.request.contextPath}/assets/img/type1_off.png");
								$(".ts-list-gallery-wrap").addClass("active");
								$(".ts-list-list-wrap").removeClass("active");
								e.preventDefault();
							});

			

				/* 개수 표시 */
				var count = $(".prd-list").length;

				$(".prd-count").html(count);
				/* li 길이 맞추기 */
				
		});
	</script>
</body>