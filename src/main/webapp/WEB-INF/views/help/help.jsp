<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/help.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">
		<header><%@ include file="/WEB-INF/views/common/header2.jsp"%>
		</header>


		<main>
			<div id="content">
				<!-- 페이지 TITLE -->
				<section>
					<h2 class="title">
						<a href="javascript:history.back()"></a> 고객센터
					</h2>
				</section>

				<!-- 이용안내 EBST 7 -->
				<section>
					<div class="sec-best7">
						<h3>이용안내 BEST 7</h3>
						<div class="best7-list swiper-container">
							<ul class="swiper-wrapper clear">
								<li class="swiper-slide"><a>특급배송 서비스 안내</a></li>
								<li class="swiper-slide"><a>배송 조회 확인 안내</a></li>
								<li class="swiper-slide"><a>앱다운로드 후 쿠폰발행</a></li>
								<li class="swiper-slide"><a>앱에서 로그인이 안될 때</a></li>
								<li class="swiper-slide"><a>주문상품 언제 수령하나요</a></li>
								<li class="swiper-slide"><a>한가지 제품만 왔어요</a></li>
								<li class="swiper-slide"><a href="">주문취소 방법</a></li>
							</ul>
						</div>
					</div>
				</section>

				<!-- 자주묻는 질문 BEST -->
				<section>
					<div class="sec-faq">
						<h3>자주묻는 질문 BEST</h3>
						<div class="faq-board"></div>
						<div class="tab-area">
							<ul class="tab tab-faq">
								<li class="active"><a href="#">상품관련</a></li>
								<li><a href="#">주문결제</a></li>
								<li><a href="#">배송</a></li>
								<li><a href="#">기타</a></li>
							</ul>
						</div>
						<div class="tab-cnt">
							<ul>
								<!-- 상품관련 li -->
								<li class="active">
									<div class="swiper-container faq faq1">
										<ul class="swiper-wrapper">
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>혼합구성으로 선택했는데 구성을 변경하고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
														따라서 혼합 구성 내 내품 변경을 불가합니다. 특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나,
														골라담기 상품으로 구매 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>구매한 제품의 옵션을 변경하고 싶어요!</span>
												</div>
												<div class="faq-answer">
													<span>주문완료 후 옵션 변경은 불가합니다. 주문 취소 후 재 주문을 해주셔야합니다.
														주문은 실시간으로 확인 후 출고가 진행되기 때문에 취소 가능여부는 고객센터로 연락주셔서 확인
														부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>증정품이 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 매월 증정 이벤트가 변경되고 있습니다. 각 제품 별 상세페이지 내 이벤트
														내용이 기재되어 있으며, 기준에 맞게 주문하셨는지 확인을 부탁드립니다. 만약, 기준에 맞게 주문하셨음에도
														증정품을 못받으셨을 경우에는 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.
														업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다. 랭킹닭컴
														고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면
														친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~ 18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>냉동식품을 해동 후 그냥 먹어도 되나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형별로 해동 후 바로 먹어도 되는 상품이 있고, 가열하여 섭취해야 하는
														상품도 있어, 자세한 해동 및 섭취방법은 각 상품별 상세페이지 및 패키지에 안내가 되어 있으니, 참고
														부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>원하는 사은품으로 직접 고를 수 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>사은품은 기존에 지정된 맛 또는 랜덤으로 발송되는 부분이기때문에 직접 지정해서 받기
														어려운 점 참고부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품을 잘못 선택했습니다. 교환 or 반품이 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>냉장, 냉동 식품의 경우 변심에 의한 교환, 반품이 어렵습니다. 식품 특성상 회수
														입고 후 전량 폐기가 되는 품목이기 때문에 교환, 반품 접수가 어려운 점 이용에 참고 바랍니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>야채 주문하였는데, 제품이 다 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>채소의 2주~4주 패키지 제품은 주문 후 처음 제품을 받으신 요일에 2~4주동안에
														걸쳐 제품을 수령하시는 상품입니다. 자세한 내용은 상세페이지에 제품 별 상세 안내가 되어 있으니 참고
														바랍니다. 예) 프레쉬홈 한팩 샐러드 2주구성 제품 주문시 → 1주차 4팩 / 2주차 4팩 총 2주간 두
														번에 나누어 배송</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>신선애 100g / 200g / 1kg 포장은 동일한 상품인가요?</span>
												</div>
												<div class="faq-answer">
													<span>해당상품은 내용물은 동일합니다.소포장이 사용하시기 용이하신 경우에는 100g,
														200g 상품으로 구매 부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품 조리방법이 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형마다 해동 및 조리방법이 다르므로,상세한 해동 및 조리방법은 각 상품별
														상세페이지에 안내가 되어 있으니 참고 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품에서 뼈가 나왔습니다!</span>
												</div>
												<div class="faq-answer">
													<span>제품 가공시 겉에 있는 뼈나 힘줄등은 모두 제거 하고 있지만&nbsp;정말 간혹
														닭가슴살 안에 뼈가 박혀있는 경우가 있습니다.&nbsp;모두 수작업으로 선별하여 뼈등은 제거하고 있지만
														닭가슴살 안에 있는 경우는 발견이 쉽지 않습니다&nbsp;회원님들도 육안으로 보이지 않기때문에 드실때
														아는것이며,&nbsp;금속검출기에 검출되지 않고, 정말 간혹 있는일이라 전부 해체하여 검수하기도 힘든
														상황입니다&nbsp;닭가슴살의 특성상 고객님들의 오해를 불러 일으키는것 같습니다.&nbsp;선별작업에서
														최대한 나오지 않도록 꼼꼼히 신경쓰고 있으나 더욱더 신경쓰도록 요청 하겠습니다.&nbsp;상세페이지 하단
														닭뼈관련 주의문구와 포장지 뒷면 닭뼈관련 안내글 참고 부탁드립니다.</span>
												</div>
											</li>
										</ul>
										<div class="swiper-pagination swiper-pagination1"></div>
										<script type="text/javascript">
											$(function() {
												$('.faq1 .faq-question')
														.on(
																'click',
																function(e) {
																	$(this)
																			.parent()
																			.toggleClass(
																					'on');
																});
											});
										</script>
									</div>
								</li>

								<!-- 주문결제 li -->
								<li class="">
									<div class="swiper-container faq faq2">
										<ul class="swiper-wrapper">
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>배송 주소를 잘 못 입력해서 수령을 못했어요. 어떻게 하나요?</span>
												</div>
												<div class="faq-answer">
													<span>식품의 특성상 출고 후 교환 및 반품은 불가합니다. 배송된 주소에서 제품을
														수령해주셔야하며, 해당 배송지에 배송이 불가하여 물류센터로 반송된 경우, 식품의 가치가 떨어져 재배송
														또는 환불이 불가합니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>주문을 취소하고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 주문 완료 후 빠른 출고를 위해 구매 내역에서 취소가 불가합니다. 주문
														취소를 원하시는 경우 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.
														업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다. 랭킹닭컴
														고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면
														친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~ 18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>이미 결제를 했는데 결제 방식을 바꾸고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>결제 완료 후에는 결제방식 변경 가능여부 확인을 위해 고객센터 또는 1:1문의,
														실시간채팅에 문의를 주시길 바랍니다. 변경이 가능한 경우 기존 주문건을 취소하시고 재주문을 통해 결제
														방법 변경이 가능합니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>거래확인서(거래명세서)를 발급 받고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>거래확인서 발급 절차는 아래와 같습니다. 1. [마이페이지] → [구매내역] →
														해당 주문 [구매상세보기] 클릭 2. 주문내역 하단 [거래확인서] 클릭 3. 거래확인서 확인 팝업창에서
														거래확인서 확인 및 인쇄가 가능합니다. (팝업이 뜨지 않는 경우 팝업 허용 필요)</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>여러가지 상품을 주문하면 배송비가 개별 책정되는데, 왜그런건가요?</span>
												</div>
												<div class="faq-answer">
													<span>닭킹랭컴에서 판매하는 상품은 각 브랜드별 출고지가 다릅니다. 때문에 브랜드별 배송비
														기준에 따라 배송료가 별도로 붙을 수 있으며 제품별 수령하시는 택배사도 모두 다릅니다. 한 곳에서 모아서
														배송 나갈 경우 신선식품의 경우 신선도가 떨어지는 최대 단점이 있어 공장에서 직배송시스템을 운영중이니
														구매해주시는 상품별 무료배송 기준을 상세페이지에서 꼭 참고해 주시길 바랍니다. ※총구매금액과 배송비 책정
														부분은 무관하오며, 상품별 무료배송 기준은 각각 상세페이지 하단에서 참고 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>비회원으로도 구매 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>비회원으로도 구매가 가능합니다. 구매를 원하시는 제품들을 장바구니에 담아주신 후
														[상품 주문하기] 클릭하시면 [비회원 주문] 탭이 있습니다. [비회원 주문] 탭 하단에 개인정보 수집동의
														후 비회원으로 주문하기 버튼을 눌러주시면 됩니다. 회원가입을 하시면, 다양한 혜택이 준비되어 있으니
														가능한 회원가입 후 구매 부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>부분취소 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 주문 완료 후 빠른 출고를 위해 구매내역에서 취소가 불가합니다. 주문하신
														상품 중 일부 취소를 원하시는 경우 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후
														안내드리겠습니다. 업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변
														드리겠습니다. 랭킹닭컴 고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을
														참고하여 연락 주시면 친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~
														18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>무이자 할부 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>주문서 작성시 결제수단의 신용카드를 선택하시면 아래 신용카드 무이자 할부에 대한
														안내 이미지를 확인하실 수 있습니다. 카드사 별 무이자 개월 수 등 자세히 안내되어 있으니 참고
														바랍니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>익스플로러 외 브라우져(크롬,사파리,파이어폭스)에서도 결제가 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴에서는 결제 프로그램(모듈)을 설치 및 사용허가 해주시면 크롬, 사파리,
														파이어폭스에서도 결제가 가능합니다. 프로그램 설치 진행이 어려우신 경우 랭킹닭컴
														고객센터(02-6405-8088)로 연락주세요.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>전자결제시 오류가 발생해요.</span>
												</div>
												<div class="faq-answer">
													<span>상품 주문 및 결제가 원활하게 이루어지지 않는 경우, 회원님의 상황을 정확하게 확인
														후 해결방법을 안내드리고 있습니다. 번거로우시더라도 랭킹닭컴 고객센터(02-0000-0000)로 연락
														주시면 이용에 불편없도록 조치해드리겠습니다. 또한 주문 진행 시 사용하시는 방법을 PC(브라우저 버전
														포함), 모바일(안드로이드 or ios)이신지 여부와 어플 혹은 웹브라우저를 이용하여 진행중이신지 자세히
														알려주시면 보다 신속히 확인 도와드리겠습니다.</span>
												</div>
											</li>
										</ul>
										<div class="swiper-pagination swiper-pagination2"></div>
										<script type="text/javascript">
											$(function() {
												$('.faq2 .faq-question')
														.on(
																'click',
																function(e) {
																	$(this)
																			.parent()
																			.toggleClass(
																					'on');
																});
											});
										</script>
									</div>
								</li>

								<!-- 배송 li -->
								<li class="">
									<div class="swiper-container faq faq3">
										<ul class="swiper-wrapper">
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>혼합구성으로 선택했는데 구성을 변경하고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
														따라서 혼합 구성 내 내품 변경을 불가합니다. 특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나,
														골라담기 상품으로 구매 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>구매한 제품의 옵션을 변경하고 싶어요!</span>
												</div>
												<div class="faq-answer">
													<span>주문완료 후 옵션 변경은 불가합니다. 주문 취소 후 재 주문을 해주셔야합니다.
														주문은 실시간으로 확인 후 출고가 진행되기 때문에 취소 가능여부는 고객센터로 연락주셔서 확인
														부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>증정품이 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 매월 증정 이벤트가 변경되고 있습니다. 각 제품 별 상세페이지 내 이벤트
														내용이 기재되어 있으며, 기준에 맞게 주문하셨는지 확인을 부탁드립니다. 만약, 기준에 맞게 주문하셨음에도
														증정품을 못받으셨을 경우에는 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.
														업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다. 랭킹닭컴
														고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면
														친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~ 18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>냉동식품을 해동 후 그냥 먹어도 되나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형별로 해동 후 바로 먹어도 되는 상품이 있고, 가열하여 섭취해야 하는
														상품도 있어, 자세한 해동 및 섭취방법은 각 상품별 상세페이지 및 패키지에 안내가 되어 있으니, 참고
														부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>원하는 사은품으로 직접 고를 수 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>사은품은 기존에 지정된 맛 또는 랜덤으로 발송되는 부분이기때문에 직접 지정해서 받기
														어려운 점 참고부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품을 잘못 선택했습니다. 교환 or 반품이 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>냉장, 냉동 식품의 경우 변심에 의한 교환, 반품이 어렵습니다. 식품 특성상 회수
														입고 후 전량 폐기가 되는 품목이기 때문에 교환, 반품 접수가 어려운 점 이용에 참고 바랍니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>야채 주문하였는데, 제품이 다 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>채소의 2주~4주 패키지 제품은 주문 후 처음 제품을 받으신 요일에 2~4주동안에
														걸쳐 제품을 수령하시는 상품입니다. 자세한 내용은 상세페이지에 제품 별 상세 안내가 되어 있으니 참고
														바랍니다. 예) 프레쉬홈 한팩 샐러드 2주구성 제품 주문시 → 1주차 4팩 / 2주차 4팩 총 2주간 두
														번에 나누어 배송</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>신선애 100g / 200g / 1kg 포장은 동일한 상품인가요?</span>
												</div>
												<div class="faq-answer">
													<span>해당상품은 내용물은 동일합니다.소포장이 사용하시기 용이하신 경우에는 100g,
														200g 상품으로 구매 부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품 조리방법이 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형마다 해동 및 조리방법이 다르므로,상세한 해동 및 조리방법은 각 상품별
														상세페이지에 안내가 되어 있으니 참고 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품에서 뼈가 나왔습니다!</span>
												</div>
												<div class="faq-answer">
													<span>제품 가공시 겉에 있는 뼈나 힘줄등은 모두 제거 하고 있지만&nbsp;정말 간혹
														닭가슴살 안에 뼈가 박혀있는 경우가 있습니다.&nbsp;모두 수작업으로 선별하여 뼈등은 제거하고 있지만
														닭가슴살 안에 있는 경우는 발견이 쉽지 않습니다&nbsp;회원님들도 육안으로 보이지 않기때문에 드실때
														아는것이며,&nbsp;금속검출기에 검출되지 않고, 정말 간혹 있는일이라 전부 해체하여 검수하기도 힘든
														상황입니다&nbsp;닭가슴살의 특성상 고객님들의 오해를 불러 일으키는것 같습니다.&nbsp;선별작업에서
														최대한 나오지 않도록 꼼꼼히 신경쓰고 있으나 더욱더 신경쓰도록 요청 하겠습니다.&nbsp;상세페이지 하단
														닭뼈관련 주의문구와 포장지 뒷면 닭뼈관련 안내글 참고 부탁드립니다.</span>
												</div>
											</li>
										</ul>
										<div class="swiper-pagination swiper-pagination3"></div>
										<script type="text/javascript">
											$(function() {
												$('.faq3 .faq-question')
														.on(
																'click',
																function(e) {
																	$(this)
																			.parent()
																			.toggleClass(
																					'on');
																});
											});
										</script>
									</div>
								</li>

								<!-- 포인트 li -->
								<li class="">
									<div class="swiper-container faq faq4">
										<ul class="swiper-wrapper">
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>배송 주소를 잘 못 입력해서 수령을 못했어요. 어떻게 하나요?</span>
												</div>
												<div class="faq-answer">
													<span>식품의 특성상 출고 후 교환 및 반품은 불가합니다. 배송된 주소에서 제품을
														수령해주셔야하며, 해당 배송지에 배송이 불가하여 물류센터로 반송된 경우, 식품의 가치가 떨어져 재배송
														또는 환불이 불가합니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>주문을 취소하고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 주문 완료 후 빠른 출고를 위해 구매 내역에서 취소가 불가합니다. 주문
														취소를 원하시는 경우 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.
														업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다. 랭킹닭컴
														고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면
														친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~ 18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>이미 결제를 했는데 결제 방식을 바꾸고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>결제 완료 후에는 결제방식 변경 가능여부 확인을 위해 고객센터 또는 1:1문의,
														실시간채팅에 문의를 주시길 바랍니다. 변경이 가능한 경우 기존 주문건을 취소하시고 재주문을 통해 결제
														방법 변경이 가능합니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>거래확인서(거래명세서)를 발급 받고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>거래확인서 발급 절차는 아래와 같습니다. 1. [마이페이지] → [구매내역] →
														해당 주문 [구매상세보기] 클릭 2. 주문내역 하단 [거래확인서] 클릭 3. 거래확인서 확인 팝업창에서
														거래확인서 확인 및 인쇄가 가능합니다. (팝업이 뜨지 않는 경우 팝업 허용 필요)</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>여러가지 상품을 주문하면 배송비가 개별 책정되는데, 왜그런건가요?</span>
												</div>
												<div class="faq-answer">
													<span>닭킹랭컴에서 판매하는 상품은 각 브랜드별 출고지가 다릅니다. 때문에 브랜드별 배송비
														기준에 따라 배송료가 별도로 붙을 수 있으며 제품별 수령하시는 택배사도 모두 다릅니다. 한 곳에서 모아서
														배송 나갈 경우 신선식품의 경우 신선도가 떨어지는 최대 단점이 있어 공장에서 직배송시스템을 운영중이니
														구매해주시는 상품별 무료배송 기준을 상세페이지에서 꼭 참고해 주시길 바랍니다. ※총구매금액과 배송비 책정
														부분은 무관하오며, 상품별 무료배송 기준은 각각 상세페이지 하단에서 참고 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>비회원으로도 구매 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>비회원으로도 구매가 가능합니다. 구매를 원하시는 제품들을 장바구니에 담아주신 후
														[상품 주문하기] 클릭하시면 [비회원 주문] 탭이 있습니다. [비회원 주문] 탭 하단에 개인정보 수집동의
														후 비회원으로 주문하기 버튼을 눌러주시면 됩니다. 회원가입을 하시면, 다양한 혜택이 준비되어 있으니
														가능한 회원가입 후 구매 부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>부분취소 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 주문 완료 후 빠른 출고를 위해 구매내역에서 취소가 불가합니다. 주문하신
														상품 중 일부 취소를 원하시는 경우 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후
														안내드리겠습니다. 업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변
														드리겠습니다. 랭킹닭컴 고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을
														참고하여 연락 주시면 친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~
														18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>무이자 할부 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>주문서 작성시 결제수단의 신용카드를 선택하시면 아래 신용카드 무이자 할부에 대한
														안내 이미지를 확인하실 수 있습니다. 카드사 별 무이자 개월 수 등 자세히 안내되어 있으니 참고
														바랍니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>익스플로러 외 브라우져(크롬,사파리,파이어폭스)에서도 결제가 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴에서는 결제 프로그램(모듈)을 설치 및 사용허가 해주시면 크롬, 사파리,
														파이어폭스에서도 결제가 가능합니다. 프로그램 설치 진행이 어려우신 경우 랭킹닭컴
														고객센터(02-6405-8088)로 연락주세요.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>전자결제시 오류가 발생해요.</span>
												</div>
												<div class="faq-answer">
													<span>상품 주문 및 결제가 원활하게 이루어지지 않는 경우, 회원님의 상황을 정확하게 확인
														후 해결방법을 안내드리고 있습니다. 번거로우시더라도 랭킹닭컴 고객센터(02-0000-0000)로 연락
														주시면 이용에 불편없도록 조치해드리겠습니다. 또한 주문 진행 시 사용하시는 방법을 PC(브라우저 버전
														포함), 모바일(안드로이드 or ios)이신지 여부와 어플 혹은 웹브라우저를 이용하여 진행중이신지 자세히
														알려주시면 보다 신속히 확인 도와드리겠습니다.</span>
												</div>
											</li>
										</ul>
										<div class="swiper-pagination swiper-pagination4"></div>
										<script type="text/javascript">
											$(function() {
												$('.faq4 .faq-question')
														.on(
																'click',
																function(e) {
																	$(this)
																			.parent()
																			.toggleClass(
																					'on');
																});
											});
										</script>
									</div>
								</li>

								<!-- 기타 li -->
								<li class="">
									<div class="swiper-container faq faq5">
										<ul class="swiper-wrapper">
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>혼합구성으로 선택했는데 구성을 변경하고 싶습니다.</span>
												</div>
												<div class="faq-answer">
													<span>혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.
														따라서 혼합 구성 내 내품 변경을 불가합니다. 특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나,
														골라담기 상품으로 구매 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>구매한 제품의 옵션을 변경하고 싶어요!</span>
												</div>
												<div class="faq-answer">
													<span>주문완료 후 옵션 변경은 불가합니다. 주문 취소 후 재 주문을 해주셔야합니다.
														주문은 실시간으로 확인 후 출고가 진행되기 때문에 취소 가능여부는 고객센터로 연락주셔서 확인
														부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>증정품이 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>랭킹닭컴은 매월 증정 이벤트가 변경되고 있습니다. 각 제품 별 상세페이지 내 이벤트
														내용이 기재되어 있으며, 기준에 맞게 주문하셨는지 확인을 부탁드립니다. 만약, 기준에 맞게 주문하셨음에도
														증정품을 못받으셨을 경우에는 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.
														업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다. 랭킹닭컴
														고객센터 상담시간은 아래와 같습니다. 상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면
														친절히 안내해 드리겠습니다. [전화 및 1:1문의 업무] 평일 09:00 ~ 18:00</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>냉동식품을 해동 후 그냥 먹어도 되나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형별로 해동 후 바로 먹어도 되는 상품이 있고, 가열하여 섭취해야 하는
														상품도 있어, 자세한 해동 및 섭취방법은 각 상품별 상세페이지 및 패키지에 안내가 되어 있으니, 참고
														부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>원하는 사은품으로 직접 고를 수 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>사은품은 기존에 지정된 맛 또는 랜덤으로 발송되는 부분이기때문에 직접 지정해서 받기
														어려운 점 참고부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품을 잘못 선택했습니다. 교환 or 반품이 가능한가요?</span>
												</div>
												<div class="faq-answer">
													<span>냉장, 냉동 식품의 경우 변심에 의한 교환, 반품이 어렵습니다. 식품 특성상 회수
														입고 후 전량 폐기가 되는 품목이기 때문에 교환, 반품 접수가 어려운 점 이용에 참고 바랍니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>야채 주문하였는데, 제품이 다 오지 않았습니다.</span>
												</div>
												<div class="faq-answer">
													<span>채소의 2주~4주 패키지 제품은 주문 후 처음 제품을 받으신 요일에 2~4주동안에
														걸쳐 제품을 수령하시는 상품입니다. 자세한 내용은 상세페이지에 제품 별 상세 안내가 되어 있으니 참고
														바랍니다. 예) 프레쉬홈 한팩 샐러드 2주구성 제품 주문시 → 1주차 4팩 / 2주차 4팩 총 2주간 두
														번에 나누어 배송</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>신선애 100g / 200g / 1kg 포장은 동일한 상품인가요?</span>
												</div>
												<div class="faq-answer">
													<span>해당상품은 내용물은 동일합니다.소포장이 사용하시기 용이하신 경우에는 100g,
														200g 상품으로 구매 부탁드리겠습니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품 조리방법이 있나요?</span>
												</div>
												<div class="faq-answer">
													<span>상품 유형마다 해동 및 조리방법이 다르므로,상세한 해동 및 조리방법은 각 상품별
														상세페이지에 안내가 되어 있으니 참고 부탁드립니다.</span>
												</div>
											</li>
											<li class="swiper-slide faq-li">
												<div class="faq-question">
													<span>제품에서 뼈가 나왔습니다!</span>
												</div>
												<div class="faq-answer">
													<span>제품 가공시 겉에 있는 뼈나 힘줄등은 모두 제거 하고 있지만&nbsp;정말 간혹
														닭가슴살 안에 뼈가 박혀있는 경우가 있습니다.&nbsp;모두 수작업으로 선별하여 뼈등은 제거하고 있지만
														닭가슴살 안에 있는 경우는 발견이 쉽지 않습니다&nbsp;회원님들도 육안으로 보이지 않기때문에 드실때
														아는것이며,&nbsp;금속검출기에 검출되지 않고, 정말 간혹 있는일이라 전부 해체하여 검수하기도 힘든
														상황입니다&nbsp;닭가슴살의 특성상 고객님들의 오해를 불러 일으키는것 같습니다.&nbsp;선별작업에서
														최대한 나오지 않도록 꼼꼼히 신경쓰고 있으나 더욱더 신경쓰도록 요청 하겠습니다.&nbsp;상세페이지 하단
														닭뼈관련 주의문구와 포장지 뒷면 닭뼈관련 안내글 참고 부탁드립니다.</span>
												</div>
											</li>
										</ul>
										<div class="swiper-pagination swiper-pagination5"></div>
										<script type="text/javascript">
											$(function() {
												$('.faq5 .faq-question')
														.on(
																'click',
																function(e) {
																	$(this)
																			.parent()
																			.toggleClass(
																					'on');
																});
											});
										</script>
									</div>
								</li>
							</ul>
						</div>
						<a href="${pageContext.request.contextPath}/help/faq.do"
							class="more">전체보기</a>
					</div>
				</section>

				<!-- 1:1 문의 -->
				<section>
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
													src="${pageContext.request.contextPath}/assets/img/ico_cs_done.png">
											</c:if> <c:if test="${item.status eq '답변 대기 중' }">
												<img
													src="${pageContext.request.contextPath}/assets/img/ico_cs_ing.png">
											</c:if> <span>${item.title}</span>
									</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:if test="${not empty output}">
						<li><a
							href="${pageContext.request.contextPath}/mypage/oneonone.do">
								문의 내역 더보기 <img class="arrow"
								src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png">
						</a></li>
						</c:if>
					</ul>
					</div></div>
				</section>

				<!-- 전화상담 안내문 -->
				<section>
					<div class="sec-call">
						<a href="tel:02-6405-8088">
							<table>
								<tbody>
									<tr>
										<td rowspan="2" width="42px"><img class="call-img"
											src="${pageContext.request.contextPath}/assets/img/ico_cs_call.png"
											width="30" alt="고객센터"></td>
										<td class="cs_call"><span>전화상담</span> <span
											class="call_number">02.1234.5678</span></td>
									</tr>
									<tr>
										<td><span>평일 09:30 ~ 18:30</span> <span>(쉬는시간 매시
												20분~30분)</span></td>
									</tr>
								</tbody>
							</table>
						</a>
					</div>
				</section>

				<!-- 공지사항 -->
				<section class="notice">
					<div class="sec-notice">
						<h3>공지사항</h3>
						<div class="box_board">
							<div class="swiper-container notice">
								<ul class="swiper-wrapper">
									<li class="swiper-slide">랭킹닭컴 멤버쉽 완전정복~! 회원 혜택부터 등급별 안내까지,
										지금 바로 확인하세요!</li>
									<li class="swiper-slide">2020년 연말연시 배송 안내</li>
									<li class="swiper-slide">돌아와요 회원님, 휴면회원 분들께 "1만원 할인쿠폰"을
										드립니다.</li>
									<li class="swiper-slide">랭킹닭컴 멤버쉽 완전정복~! 회원 혜택부터 등급별 안내까지,
										지금 바로 확인하세요!</li>
									<li class="swiper-slide">2020년 연말연시 배송 안내</li>
								</ul>
							</div>
						</div>
						<a href="${pageContext.request.contextPath}/help/notice.do"
							class="more">더보기</a>
					</div>
				</section>

			</div>
		</main>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>

	<script type="text/javascript">
		$(function() {

			// --- 김지효 ---
			/** 클릭 시 메뉴 탭 숨김, 표시 처리 */

			$(document).on('click', ".top-menu", function() {
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".close-icon", function() {
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

			/** 클릭 시 서치 탭 숨김, 표시 처리 */
			$(document).on('click', ".search-account", function() {
				if ($("#search-layer").css("display") == "none") {
					$("#search-layer").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".search-layer-close", function() {
				if ($("#search-layer").css("display") == "block") {
					$("#search-layer").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});

			/** 종류별 브랜드별 탭 클릭 이벤트 */
			$(".tab-title > li").click(function() {
				if ($(this).hasClass("on")) {
					$(".tab-title > li").not(this).removeClass("on");
				} else {
					$(this).addClass("on");
					$(".tab-title > li").not(this).removeClass("on");
				}
			});

			$(".tab-title > li:first-child").click(function() {
				$("#menu-list-wrap").css("display", "block");
				$("#menu-table-wrap").css("display", "none");
			});

			$(".tab-title > li:last-child").click(function() {
				$("#menu-table-wrap").css("display", "block");
				$("#menu-list-wrap").css("display", "none");
			});

			/** ------------------- 탭처리 -------------------- */
			$(".best7-list .swiper-slide").click(function(e) {
				e.preventDefault();
				window.location.href = "notice_detail.do";
			})

			$('.tab-area .tab li').on(
					'click',
					function(e) {
						if ($(this).hasClass('active'))
							return;
						$('.faq-li').removeClass('on');
						var n = $(this).index();
						e.preventDefault();
						$(this).addClass('active').siblings().removeClass(
								'active');
						$('.tab-cnt>ul>li').eq(n).addClass('active').siblings()
								.removeClass('active');
					});

			/** ------------------- Swiper -------------------- */
			var best7_swiper = new Swiper('.swiper-container.best7-list', {
				slidesPerView : 'auto',
			});

			var swiper_notice = new Swiper('.swiper-container.notice', {
				loop : true,
				direction : 'vertical',
				spaceBetween : 10,
				speed : 600,
				autoplay : {
					delay : 3500,
					disableOnInteraction : false,
				}
			});

			$('.swiper-container.faq').each(
					function(index, element) {
						var faq_swiper = new Swiper(".swiper-container.faq"
								+ (index + 1), {
							slidesPerColumn : 3,
							slidesPerColumnFill : "row",
							pagination : {
								el : '.swiper-pagination' + (index + 1),
								clickable : true,
							},
							observer : true,
							observeParents : true,
						});

						faq_swiper.on('slideChange', function() {
							$('.faq-li').removeClass('on');
						});
					});

		});
	</script>
</body>
</html>