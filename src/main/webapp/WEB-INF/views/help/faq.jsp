<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/faq.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">
	    <header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>

	    <main>
	        <div id="content">
	            <!-- 페이지 TITLE -->
	            <section class="title-wrapper">
	                <h2 class="title"><a href="javascript:history.back()" onclick=""></a>FAQ/1:1문의</h2>
	            </section>

	            <!-- FAQ 게시판 -->
	            <section>
	                <div class="faq-board">
	                    <div class="board-header">
	                        <span>FAQ 자주묻는 질문</span>
	                        <a href="${pageContext.request.contextPath}/mypage/oneonone.do">1:1문의하기</a>
	                    </div>

	                    <div class="board-cat">
	                        <ul class="clear">
	                            <li class="active"><a href="">전체보기</a></li>
	                            <li><a href="">상품관련</a></li>
	                            <li><a href="">주문 및 결제</a></li>
	                            <li><a href="">배송관련</a></li>
	                            <li><a href="">포인트</a></li>
	                            <li><a href="">기타</a></li>
	                        </ul>
	                    </div>

	                    <div class="board-body">
	                        <ul class="board-list">
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [배송관련] 특급배송을 주문했는데 공동현관에 배송됐습니다. 왜그런가요?</p>
	                                    <p class="stat">닭대리 | 2020-07-01</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          공동현관 출입 불가 시, 공동현관 또는 경비실에 배송될 수 있습니다.<br>분실될 우려가 있으니 공동현관 출입 방법을 정확히 남겨주세요.<br><br>공동현관 출입 방법을 선택해주시더라도<br>배송시간에 경비 호출 부재 및 비밀번호 오기재로 인해 대응배송될 수 있습니다.<br><br>공동현관 비밀번호는 배송 완료 후 안전하게 삭제됩니다.
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [주문 및 결제] 배송 주소를 잘 못 입력해서 수령을 못했어요. 어떻게 하나요?</p>
	                                    <p class="stat">닭대리 | 2020-05-04</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          식품의 특성상 출고 후 교환 및 반품은 불가합니다.<br>배송된 주소에서 제품을 수령해주셔야하며,<br>해당 배송지에 배송이 불가하여 물류센터로 반송된 경우,<br>식품의 가치가 떨어져 재배송 또는 환불이 불가합니다.
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [배송관련] 배송을 받았는데 주문내역에서는 배송중이라고 되어있습니다.</p>
	                                    <p class="stat">랭킹닭컴 | 2019-10-07</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          주문 상태는 자동으로 변경되고 있으며,<br>실제 배송이 완료되더라도 배송사고등의 문제가 있을 경우 처리를 위해 5일 뒤 배송완료처리가 됩니다.<br>배송완료처리와 동시에 포인트가 적립되는 점 이용에 참고를 바랍니다.
	                                    </div>
	                                </div>
	                            </li><li>
	                                <div class="subject">
	                                    <p class="title">  [상품관련] 혼합구성으로 선택했는데 구성을 변경하고 싶습니다.</p>
	                                    <p class="stat">랭킹닭컴 | 2019-10-07</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          혼합구성 상품은 해당 제품의 맛을 골고루 느껴보실 수 있도록 구성된 상품입니다.<br>따라서 혼합 구성 내 내품 변경을 불가합니다.<br>특정 맛의 구매를 원하실 경우 각 맛을 따로 주문하시거나, 골라담기 상품으로 구매 부탁드립니다.
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [상품관련] 구매한 제품의 옵션을 변경하고 싶어요!</p>
	                                    <p class="stat">랭킹닭컴 | 2019-10-07</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          주문완료 후 옵션 변경은 불가합니다.<br>주문 취소 후 재 주문을 해주셔야합니다.<br>주문은 실시간으로 확인 후 출고가 진행되기 때문에<br>취소 가능여부는 고객센터로 연락주셔서 확인 부탁드립니다.
	                                    </div>

	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [포인트] 생일쿠폰은 어떻게 받나요?</p>
	                                    <p class="stat">서나래 | 2019-07-30</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          생일 쿠폰은 생일 7일 전 쿠폰함에 자동으로 발급됩니다.<br>발급 후 30일 이내 쿠폰 사용이 가능합니다.<br><br>생일쿠폰 : 인기 브랜드 5% 할인쿠폰<br>변경 내용 : 생일 7일 전 쿠폰함 발급, 발급 후 30일 이내 쿠폰 사용 (기존 : 생일 당일 다운로드 시 사용 가능)<br>사용가능 브랜드 : 랭킹닭컴 랭킹 상위 17개 브랜드에서 사용 가능(쿠폰함에서 확인 가능)
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [기타] 신규회원 혜택은 무엇이 있나요?</p>
	                                    <p class="stat">서나래 | 2019-07-30</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          신규가입시 가입축하 적립금 1,000점 혜택이 있으며,<br>회원이 되시면 생일축하쿠폰, 등급별 적립혜택, 리뷰적립금, 매월 이벤트 참여해주시면 선물을 받으실 기회가 다양하게 준비되어있습니다. <br>★가입 후 첫 앱다운시 2,000원 할인쿠폰도 증정드리고 있는 점 이용에 참고를 바랍니다.
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [상품관련] 증정품이 오지 않았습니다.</p>
	                                    <p class="stat">서나래 | 2019-07-30</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          랭킹닭컴은 매월 증정 이벤트가 변경되고 있습니다.<br>각 제품 별 상세페이지 내 이벤트 내용이 기재되어 있으며,<br>기준에 맞게 주문하셨는지 확인을 부탁드립니다.<br><br>만약,<br>기준에 맞게 주문하셨음에도 증정품을 못받으셨을 경우에는<br>1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.<br>업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다.<br><br>랭킹닭컴 고객센터 상담시간은 아래와 같습니다.<br>상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면 친절히 안내해 드리겠습니다.<br><br>[전화 및 1:1문의 업무]<br> 평일 09:00 ~ 18:00<br><br>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [포인트] 상품평은 어떻게 남기고, 포인트는 얼마나 적립되나요?</p>
	                                    <p class="stat">서나래 | 2019-07-30</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          구매하신 상품에 10일이내 상품평을 남기실 수 있으며,<br>일반 리뷰 작성 시 50포인트, 포토리뷰 작성 시 150포인트가 적립됩니다.<br>상품과 무관한 사진(캡쳐사진 포함), 내용은 통보없이 삭제 및 적립이 회수될 수 있습니다.
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="subject">
	                                    <p class="title">  [주문 및 결제] 주문을 취소하고 싶습니다.</p>
	                                    <p class="stat">서나래 | 2019-07-26</p>
	                                </div>
	                                <div class="content">
	                                    <div class="answer">
	                                          랭킹닭컴은 주문 완료 후 빠른 출고를 위해 구매 내역에서 취소가 불가합니다.<br>주문 취소를 원하시는 경우 1:1문의, 실시간채팅 또는 고객센터로 연락주시면 확인 후 안내드리겠습니다.<br>업무시간 이후의 경우 실시간채팅 또는 1:1문의에 남겨주시면 순차적으로 답변 드리겠습니다.<br><br>랭킹닭컴 고객센터 상담시간은 아래와 같습니다.<br>상담을 원하시는 고객님께서는 해당 시간을 참고하여 연락 주시면 친절히 안내해 드리겠습니다.<br><br>[전화 및 1:1문의 업무]<br>평일 09:00 ~ 18:00<br><br>[실시간채팅]<br>평일 09:00~21:00<br>토요일 09:00 ~ 15:00<br>일요일 13:00 ~ 21:00
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                        <div class="box-btn block">
	                            <a href="#" onclick="alert('마지막 페이지 입니다.'); return false;">더 보기</a>
	                        </div>
	                    </div>
	                </div>
	            </section>

	    </main>

	    <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
	</div>

    <script type="text/javascript">


        $(function() {

            $('.board-list .subject').click(function(e) {
                $(this).next().toggle();
            });

            $('.board-cat li a').click(function(e) {
            	e.preventDefault();
                $(this).parent().addClass('active').siblings().removeClass('active');
            })

         	// --- 김지효 ---
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
            $(document).on('click', ".top-menu", function() {
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

            /** 클릭 시 서치 탭 숨김, 표시 처리 */
            $(document).on('click', ".search-account", function() {
                if($("#search-layer").css("display")=="none"){
                    $("#search-layer").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(document).on('click', ".search-layer-close", function() {
                if($("#search-layer").css("display")=="block"){
                    $("#search-layer").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 종류별 브랜드별 탭 클릭 이벤트 */
            $(".tab-title > li").click(function () {
                if($(this).hasClass("on")){
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

        });
    </script>
</body>
</html>