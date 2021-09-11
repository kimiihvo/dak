<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp"%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/order.css">
</head>

<body>
    <div class="order">
    	<form method="post" id="orderForm" action="${pageContext.request.contextPath}/shop/order_ok.do">
	        <div>
	            <div class="order-head">
	                <h2 class="order-title2">주문/결제</h2>
	                <a class="order-back" href="javascript:history.back()"></a>
	            </div>
	            <div class="order-buyer">
	                <a href="#order-buyeri"><h3 class="order-buyerinfo clear">주문자 정보 <span>${m.memName}<img src="../assets/img/dropdown_1.png"></span></h3></a>
	
	                <div class="order-buyer-more" id="order-buyeri">
	                    <ul>
	                        <li><p>이름</p><p>${m.memName}</p></li>
	                        <li><p>휴대폰</p><p>${m.phone}</p></li>
	                        <li><p>이메일</p><p>${m.email}</p></li>
	                    </ul>  
	                    <div class="info-change">정보변경은 <em>마이랭닭 &gt; 회원정보수정</em>에서 가능합니다.</div>
	                </div>  
	            </div>
	        </div>
	
	        <div class="delivery-info">
	            <div class="delivery-info-head clear">
	                <h3>배송지 정보</h3>
	                <p>
	                    <input type="checkbox" id="check_stored"><label for="copy-info">기본 배송지 사용</label>
	                </p>
	            </div>
	
	            <div class="delivery-input">
	                <div>
	                    <div class="delivery-input-name">받는분<span class="star">*</span>
	                    </div>
	                    <div class="delivery-inputbox">
	                        <input type="text" name="addressee" id="delivery-input1" class="delivery-input1" value="" autocomplete="off">
	                    </div>
	                </div>
	                
	                <div>
	                    <div class="delivery-input-name">주소<span class="star">*</span>
	                </div>
	
	                <div class="delivery-inputbox">
	                    <input type="text" name="addressee_zip" id="delivery-input2" class="delivery-input2" value="" onclick="" readonly="true">
	                    <div class="postcode" onclick="sample()">우편번호 검색</div>
	                </div>
	            </div>
	
	                <div>
	                    <div class="delivery-input-name"></div>
	                    <div class="delivery-inputbox">
	                        <input type="text" name="addressee_addr1" id="delivery-input3" class="delivery-input3" value="" readonly="true" placeholder="기본주소" >
	                    </div>
	                </div>
	                
	                <div>
	                    <div class="delivery-input-name"></div>
	                    <div class="delivery-inputbox">
	                    <input type="text" name="addressee_addr2" id="delivery-input4" class="delivery-input4" value="" placeholder="상세주소" >
	                    </div>
	                </div>
	                
	                <div>
	                    <div class="delivery-input-name">휴대폰<span class="star">*</span></div>
	                    <div class="delivery-inputbox">
	                    	<c:set var="phone_" value="${a.phone}" />
	                        <select name="phone_select" id="phone-select" class="phone-select">
	                            <option value="010">010</option>
	                            <option value="011">011</option>
	                            <option value="016">016</option>
	                            <option value="017">017</option>
	                            <option value="018">018</option>
	                            <option value="019">019</option>
	                        </select>
	                        
	                        <input type="tel" name="addressee_cell_input" id="delivery-input5" class="delivery-input5" size="8" maxlength="8">
	                    </div>
	                </div>
	
	                <div>
	                    <div class="delivery-input-name">전화번호</div>
	                    <div class="delivery-inputbox">
	                        <input class="delivery-input6" type="tel" name="addressee_phone" class="" value="" size="11" maxlength="11"> 
	                    </div>
	                </div>      
	            </div>   
	        </div>
	
	        <div class="order-product">
	            <h3>주문상품</h3>
	            <a href="#order-productc">
	                <div class="order-product-content clear">
	                    <h4>주문품목 ${fn:length(cartItems)}개</h4>
	                    <div class="order-producti">
	                        <img src="../assets/img/general_icon_w.png">무료배송<img src="../assets/img/dropdown_1.png">
	                    </div>
	                </div>
	            </a>
	            <div id="order-productc" class="order-product-list">
	                <ul class="order-productc-box">
	                <c:set var="sum" value="0" />
	               		<c:forEach var="cart" items="${cartItems}" varStatus="status">
	               		<input type="hidden" name="cartnos" value="${cart.cartno}" />
		                    <li>
		                        <div>
		                            <div class="name">
		                                <p>${cart.title}</p>
		                            </div>
		                            <div class="content">
		                                <div class="img">
		                                    <img src="${cart.thumb}"/>
		                                </div>
		                                <div class="content-box">
		                                    <div class="pricef">개당 <fmt:formatNumber value="${cart.price}" />원</div>
		                                    <div class="content-box-qp">  
		                                        <span class="quantity">수량 ${cart.qty}개</span>
		                                        <span class="pricew"><fmt:formatNumber value="${cart.price * cart.qty}" />원</span>
		                                    </div>     
		                                </div>
		                            </div>
		                        </div>
		                    </li>
		                    <c:set var="sum" value="${sum + (cart.price * cart.qty)}" />
	                	</c:forEach>
	                </ul>  
	            </div>
	            <div class="delivery-option">
	                <h4>배송 요청사항</h4>
	                <select>
	                    <option value="">메세지를 선택해 주세요.</option>
	                    <option value="직접인력">직접입력</option>
	                    <option value="배송전 연락 부탁드립니다.">배송전, 연락 부탁 드립니다.</option>
	                    <option value="부재시, 전화 또는 문자 주세요.">부재시, 전화 또는 문자 주세요.</option>
	                    <option value="부재시, 경비(관리)실에 맡겨 주세요.">부재시, 경비(관리)실에 맡겨주세요.</option>
	                </select>  
	            </div>
	        </div> 
	
	        <div class="order-option">
	            <div class="order-coupon">
	                <a href="order-couponc"><h3>쿠폰/할인 사용 <img src="../assets/img/dropdown_1.png"></h3></a>
	            </div>
	            <div id="order-couponc">
            		<select name="couponToUse" id="couponToUse">
            			<option value="0" data-discount="0">쿠폰을 선택해 주세요!</option>
		            	<c:forEach var="coupon" items="${cList}" varStatus="status">
		            		<option value="${coupon.coupno}" data-discount="${coupon.discount}">쿠폰: ${coupon.title} / 할인금액: ${coupon.discount}</option>
	            		</c:forEach>
            		</select>
	            </div>
	            <div class="order-way">
	                <a href="order-wayc"><h3>결제 방법 <img src="../assets/img/dropdown_2.png"></h3></a>
	                <div id="order-wayc">
	                    <div class="order-way-ez">
	                        <p>간편결제</p>
	                        <ul>
	                            <li data-over=".order-way-forc li:nth-child(1)" class="hide pay-way" data-pay="랭킹페이">랭킹페이<img src="../assets/img/rankingpay_type1.png"></li>
	                            <li data-over=".order-way-forc li:nth-child(2)" class="hide pay-way" data-pay="랭킹카드">랭킹카드<img src="../assets/img/rankingcard_type1.png"></li>
	                        </ul>
	                    </div>   
	                    <div class="order-way-choice">
	                        <p>일반결제</p>
	                        <ul>
	                            <li class="select pay-way" data-over=".order-way-forc li:nth-child(3)" data-pay="신용카드">신용카드</li>
	                            <li class="pay-way" data-over=".order-way-forc li:nth-child(4)" data-pay="무통장입금">무통장입금</li>
	                            <li class="pay-way" data-over=".order-way-forc li:nth-child(5)" data-pay="휴대폰결제">휴대폰결제</li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(6)" data-pay="네이버페이" >네이버페이<img src="../assets/img/naverpay_type1.jpg"></li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(7)" data-pay="카카오페이">카카오페이<img src="../assets/img/kakaoPay_type1.jpg"></li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(8)" data-pay="토스">토스<img src="../assets/img/toss_type1.jpg"></li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(9)" data-pay="페이코">페이코<img src="../assets/img/payco_type1.jpg" data-over=".order-way-forc li:nth-child(10)"></li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(10)" data-pay="스마일페이">스마일페이<img src="../assets/img/smilePay_type1.png"></li>
	                            <li class="hide pay-way" data-over=".order-way-forc li:nth-child(11)" data-pay="페이나우">페이나우<img src="../assets/img/paynow_type1.png"></li>
	                        </ul>
	                    </div> 
	                </div>
	                <ul class="order-way-forc">
	                    <li>
	                        <div onclick="alert('준비중입니다.')">
	                            <div><img src="../assets/img/add_icon_type1.png">
	                                <div>카드 등록 / 결제</div>
	                            </div>
	                        </div>
	                    </li>
	                    <li>
	                        <select >
	                            <option value="0">일시불</option>
	                        </select>
	                    </li>
	                    <li class="select-show">        
	                        <div class="order-way1-card">
	                                <select>
	                                    <option value="">[필수] 카드사를 선택하세요.</option>
	                                    <option value="01">비씨카드</option>
	                                    <option value="02">국민카드</option>
	                                    <option value="04">삼성카드</option>
	                                    <option value="06">신한카드</option>
	                                    <option value="07">현대카드</option>
	                                    <option value="08">롯데카드</option>
	                                    <option value="11">시티카드</option>
	                                    <option value="12">농협카드</option>
	                                    <option value="13">수협카드</option>
	                                    <option value="14">평화카드</option>
	                                    <option value="15">우리카드</option>
	                                    <option value="16">하나(외환)카드</option>
	                                    <option value="21">광주카드</option>
	                                    <option value="22">전북카드</option>
	                                    <option value="23">제주카드</option>
	                                    <option value="37">카카오뱅크</option>
	                                    <option value="38">케이뱅크</option>
	                                </select>
	                        </div>
	                        <div class="order-way1-payonce">
	                            <select >
	                                <option value="0">일시불</option>
	                            </select>
	                        </div>
	
	                        <a class="none-way1-interest">무이자 할부 안내</a>
	                    </li>
	                    <li>
	                        <div class="order-way1-card">
	                                <select>
	                                    <option value="">[필수] 입금은행을 선택하세요.</option>
	                                    <option value="">기업</option>
	                                    <option value="">국민</option>
	                                    <option value="">농협</option>
	                                    <option value="">우리</option>
	                                    <option value="">SC제일</option>
	                                    <option value="">하나</option>
	                                    <option value="">대구</option>
	                                    <option value="">부산</option>
	                                    <option value="">우체국</option>
	                                    <option value="">신한</option>
	                                </select>
	                        </div>
	                        <div class="order-way1-payonce">
	                            <input type="text" placeholder="[필수] 입금자명을 입력하세요" >
	                        </div>
	                        <div class="order-way2-payonce"><input type="checkbox"><span>현금영수증 발행</span>
	                        </div>
	                        <div class="order-way2-payoncec">
	                            <select>
	                                    <option value="">휴대폰번호</option>
	                                    <option value="">사업자번호</option>  
	                            </select>
	                            <input type="number" placeholder="숫자만 입력하세요">
	                        </div>
	                        <div>
	                            * 주문 후 7일 이내 미 입금 시, 주문이 자동 취소됩니다.<br/>
	                            * 발급된 계좌에 입금자명과 금액을 정확하게 입금해주세요.
	                        </div>
	                    </li>
	                    <li>
	                        * 결제금액이 통신사 휴대폰 요금에 청구됩니다.<br/>
	                        * 월 결제 한도는 최대 50만원입니다.
	                    </li>
	                    <li>
	                        * 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.<br/>
	                        * 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.<br/>
	                        * 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크<br/>
	                        * 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권, KDB산업은행,씨티은행, SBI은행, 유안타증권, 유진투자증권<br/>
	                        * 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.
	                    </li>
	                    <li>
	                        * 카카오톡으로 간편하게 결제할 수 있습니다.<br/>
	                        * 등록된 카드 또는 카카오 머니로 결제하실 수 있습니다.
	                    </li>
	                    <li>
	                        * 토스 APP을 이용해 간편하게 결제할 수 있습니다.<br/>
	                        * 등록된 계좌로 결제하실 수 있습니다.
	                    </li>
	                    <li>
	                        * 페이코 아이디로 간편하게 결제할 수 있습니다.<br/>
	                        * 등록된 카드 또는 페이코 포인트로 결제하실 수 있습니다.
	                    </li>
	                    <li>
	                        * 스마일페이 아이디로 간편하게 결제하실 수 있습니다.<br/>
	                        * 등록된 카드 또는 스마일 포인트로 결제하실 수 있습니다.
	                    </li>
	                    <li>
	                        * 페이나우 APP을 이용해 간편하게 결제할 수 있습니다.<br/>
	                        * 등록된 카드 또는 계좌로 결제하실 수 있습니다.
	                    </li>
	                </ul>    
	            </div>
	            
	            <%-- Hidden Input 저장소! --%>
	    		<input type="hidden" name="dlvyFee" id="dlvyFee" />
	    		<input type="hidden" name="discount" id="discount" />
	    		<input type="hidden" name="totalPrice" id="totalPrice"/>
	    		<input type="hidden" name="pay" id="payWay" value="신용카드" />
	    		<input type="hidden" name="memno" value="${m.memno}"/>
	    		<c:if test="${sum >= 20000}">
		    		<c:set var="dlvFee" value="0" />
	    		</c:if>
	    		<c:if test="${sum < 20000}">
		    		<c:set var="dlvFee" value="2500" />
	    		</c:if>
	    		
	            <a href="#last-payc">
	                <div class="last-pay">
	                    <h3>최종 결제 금액</h3>
	                    <p><fmt:formatNumber value="${sum-discount+dlvFee}" pattern="#,###"/><span>원</span><img src="../assets/img/dropdown_1.png"></p>
	                </div>
	            </a>
	    		
	            <div id="last-payc">
	                <div class="last-paycc">상품금액</div>
	                <div class="last-paycc"><fmt:formatNumber value="${sum}" pattern="#,###"/><span>원</span></div>
	                <div class="last-paycc">배송비</div>
	                <div class="last-paycc deliveryFee"><fmt:formatNumber value="${dlvFee}" pattern="#,###"/><span>원</span></div>
	                <div class="last-paycc">할인금액</div>
	                <div class="last-paycc discountAmount">0<span>원</span></div>
	                <div class="last-paycc-b"> 
	                    <div>총 결제금액</div>
	                    <div>
	                        <div><span><fmt:formatNumber value="${sum+dlvFee}" pattern="#,###"/>원</span></div>
	                    </div>
	                </div>   
	            </div>
	        </div>
	
	        <div class="order-pay">
	            <a href="#order-payc1"><p>개인정보 제3자 제공 동의<span>내용보기 ▼</span></p></a>
	            <div id="order-payc1">   
	                [개인정보 제3자 제공]<br>
	                <br>
	                가. 회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
	                <br>
	                ① 이용자들이 사전에 동의한 경우<br>
	                <br>
	                ② 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독당국의 요구가 있는 경우<br>
	                <br>
	                나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통 및 배송 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.<br>
	                <br>
	                다. 그 밖에 개인정보 제3자 제공이 필요한 경우에는 이용자의 동의를 얻는 등 합당한 절차를 통하여 제3자에게 개인정보를 제공할 수 있습니다.<br>
	                <br>
	                라. 회사는 이용자들의 거래의 이행을 위하여 아래와 같이 개인정보를 공유할 수 있습니다.<br>
	                <br>
	                공유받는 자 : 입점업체<a href="../privacy_pop.php" target="_blank">[전체보기]</a><br>
	                <br>
	                공유하는 항목 :<br>
	                <br>
	                1) 구매자정보(구매자id, 구매자명, 구매자주소, 구매자전화번호, 구매자휴대전화번호)<br>
	                <br>
	                2) 상품 구매, 취소, 반품, 교환정보<br>
	                <br>
	                3) 수령인정보(수령인명, 휴대폰번호, 전화번호, 수령인주소)<br>
	                <br>
	                4) 송장정보<br>
	                <br>
	                공유받는자의 이용목적 :<br>
	                <br>
	                상품(서비스) 배송(전송), 반품, 교환, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매) 계약의 이행을 위해 필요한 업무의 처리<br>
	                <br>
	                보유 및 이용기간 :<br>
	                <br>
	                서비스 제공기간 (관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유 기간)<br>
	                <br>
	                [수집한 개인정보의 위탁]<br>
	                <br>
	                가. 회사는 원활한 서비스를 위해여 개인정보 취급을 타인에게 위탁할 수 있습니다.<br>
	                <br>
	                나. 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>
	                <br>
	                다. 회사의 이용자의 개인정보 위탁 처리 시 수탁업체 및 위탁 목적은 아래와 같습니다.<br>
	                <br>
	                ① 수탁업체 : 주식회사 LG유플러스, LG CNS, (주)케이지이니시스, NHN한국사이버결제 주식회사, NICE페이먼츠 주식회사, 엔에치엔페이코㈜, ㈜비바리퍼블리카, 주식회사 카카오페이<br>
	                <br>
	                위탁업무 내용 :　신용카드/계좌이체/가상계좌/무통장 결제처리, 에스크로, 현금영수증<br>
	                <br>
	                ② 수탁업체 : (주)한진, (주)KG옐로우캡 주식회사, 현대로지스틱스(주), 로젠(주), 우체국택배, KGB택배(주), 씨제이대한통운(주), (주)KG로지스, 인터넷우체국<br>
	                <br>
	                위탁업무 내용 : 상품(서비스) 배송(전송), 반품교환수거 서비스<br>
	                <br>
	                ③ 수탁업체 : (주)다날, 페이레터(주)<br>
	                <br>
	                위탁업무 내용 :　휴대폰 결제처리<br>         
	            </div>
	            <a href="#order-payc2"><p>결제대행서비스 이용 동의<span>내용보기 ▼</span></p></a>
	            <div id="order-payc2">
	                <a href="#order-payc21">전자금융거래 기본약관<span>▼</span></a>
	                <div id="order-payc21">
	                    제1조 (목적)<br>
	                    이 약관은 NICE페이먼츠 주식회사, 주식회사 LG유플러스, NHN한국사이버결제 주식회사, (주)다날 (이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.<br>
	                    <br>
	                    제2조 (용어의 정의)<br>
	                    이 약관에서 정하는 용어의 정의는 다음과 같습니다.<br>
	                    1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.<br>
	                    2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.<br>
	                    3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.<br>
	                    4. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.<br>
	                    5. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.<br>
	                    6. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.<br>
	                    7. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.<br>
	                    <br>
	                    제3조 (약관의 명시 및 변경)<br>
	                    1. 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br>
	                    2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.<br>
	                    3. 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.<br>
	                    4. 회사는 제3항의 공지를 할 경우 "이용자가 변경에 따라 변경에 동의하지 아니한 경우 공지 받은 날로부터 30일 이내에 계약을 해지할 수 있으며, 해지의사표시를 하지 아니한 경우 동의한 것으로 본다."라는 내용을 통지합니다.<br>
	                    <br>
	                    제4조 (전자지급결제대행서비스의 종류)<br>
	                    회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.<br>
	                    1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송, 수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.<br>
	                    2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.<br>
	                    3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.<br>
	                    4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', '상품권결제대행서비스', 등이 있습니다.<br>
	                    <br>
	                    제5조 (결제대금예치서비스의 내용)<br>
	                    1. 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.<br>
	                    2. 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.<br>
	                    3. 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.<br>
	                    4. 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급 받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.<br>
	                    5. 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리, 의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.<br>
	                    <br>
	                    제6조 (이용시간)<br>
	                    1. 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.<br>
	                    2. 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.<br>
	                    <br>
	                    제7조 (접근매체의 선정과 사용 및 관리)<br>
	                    1. 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.<br>
	                    2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.<br>
	                    3. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br>
	                    4. 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.<br>
	                    <br>
	                    제8조 (거래내용의 확인)<br>
	                    1. 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.<br>
	                    2. 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.<br>
	                    3. 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.<br>
	                    주소: 서울시 마포구 아현동 686 크레디트센터 8층<br>
	                    이메일 주소: nicepay@nicepay.co.kr<br>
	                    전화번호: 1661-0808 / 1661-7335<br>
	                    FAX: 02-312-3591<br>
	                    <br>
	                    제9조 (오류의 정정 등)<br>
	                    1. 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.<br>
	                    2. 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.<br>
	                    <br>
	                    제10조 (회사의 책임)<br>
	                    1. 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.<br>
	                    2. 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본 조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.<br>
	                    3. 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.<br>
	                    4. 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.<br>
	                    <br>
	                    제11조 (전자지급거래계약의 효력)<br>
	                    1. 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.<br>
	                    2. 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.<br>
	                    <br>
	                    제12조 (거래지시의 철회)<br>
	                    1. 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.<br>
	                    2. 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래 지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래 지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.<br>
	                    3. 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환 받을 수 있습니다.<br>
	                    <br>
	                    제13조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)<br>
	                    1. 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.<br>
	                    2. 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.<br>
	                    <br>
	                    제14조 (전자금융거래정보의 제공금지)<br>
	                    회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적 사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.<br>
	                    <br>
	                    제15조 (분쟁처리 및 분쟁조정)<br>
	                    1. 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.<br>
	                    담당자: 양다우<br>
	                    연락처(전화번호, 전자우편주소): 02-1661-0808(1661-7335) / nicepay@nicepay.co.kr<br>
	                    2. 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.<br>
	                    3. 이용자는 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.<br>
	                    <br>
	                    제16조 (회사의 안정성 확보 의무)<br>
	                    회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을 준수합니다.<br>
	                    <br>
	                    제17조 (약관 외 준칙 및 관할)<br>
	                    1. 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.<br>
	                    2. 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.<br>
	                </div>
	                <a href="#order-payc22">개인정보 수집 및 이용 동의 <span>▼</span></a>
	                <div id="order-payc22">
	                    NICE페이먼츠 주식회사, 주식회사 LG유플러스, NHN한국사이버결제 주식회사, (주)다날 (이하 “회사”)는 이용자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률" 및 “개인정보보호법”과 “전자상거래 등에서의 소비자 보호에 관한 법률”을 준수하고 있습니다. 회사는 전자지급결제대행 및 결제대금예치서비스(이하 “서비스”) 이용자로부터 아래와 같이 개인정보를 수집 및 이용합니다.<br>
	                    <br>
	                    1. 개인정보의 수집 및 이용목적<br>
	                    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
	                    - 서비스 제공 계약의 성립, 유지, 종료를 위한 본인 식별 및 실명확인, 각종 회원관리, 계약서 발송 등<br>
	                    - 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 각종 안내/고지<br>
	                    - 부정 이용방지 및 비인가 사용방지<br>
	                    - 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회(결제대금예치서비스 환불계좌정보 포함) 등 의사확인<br>
	                    - 이용 빈도 파악 및 인구통계학적 특성에 따른 서비스 제공 및 CRM <br>
	                    - 서비스 제공을 위한 각 결제수단 별 상점 사업자 정보 등록 <br>
	                    - 서비스 제공(거래승인 등) 및 관련 업무처리(민원, 개인정보 관리상태 점검 등)를 위해 이용자와 해당 결제수단에 관한 계약을 체결한 이용자의 해당 결제수단 발행자 (ex) 신용카드의 경우 해당 신용카드사)에게 이용자의 결제정보, 개인정보 보관내역 등 전송<br>
	                    - 회사가 제공하는 소비자보호법 메일 발송<br>
	                    (결제수단 발행자에 대한 상세 내용 아래 참조) <br>
	                    ※ 결제수단별 발행자 <br>
	                    가. 신용카드: 국민/비씨/롯데/삼성/NH농협/현대/신한/하나/우리 등 신용카드사 <br>
	                    나. 계좌이체: 은행(경남/광주/국민/기업/농협/대구/부산/산업/새마을금고/수협/신한/신협/외환/우리/우체국/전북/제주/하나/씨티/SC제일은행 등), 증권(동양/미래에셋/삼성/신한/한투/한화 등), 금융결제원, 엘지유플러스 주식회사<br>
	                    다. 가상계좌: 은행(국민/농협/우리/신한/하나/기업/우체국/외환/부산/대구 등), 세틀뱅크㈜, 케이아이비넷㈜<br>
	                    라. 휴대폰: (주)SKT/㈜KT/㈜LGU+/㈜KG모빌리언스/㈜다날/갤럭시아커뮤니케이션즈㈜<br>
	                    마. 현금영수증 발행: 국세청<br>
	                    바. 본인확인 인증: 케이아이비넷㈜/세틀뱅크㈜/㈜KG모빌리언스 <br>
	                    사. 간편결제 제휴사: 에스케이플래닛㈜/㈜엘지씨엔에스/㈜카카오/㈜신세계아이앤씨/엔에이치엔페이코㈜/엔에이치엔한국사이버결제㈜/삼성전자㈜/롯데멤버스㈜<br>
	                    아. 상품권: 한국문화진흥<br>
	                    - 기타 회사가 제공하는 이벤트 등 광고성 정보 전달(결제알림메일 내), 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 실제 마케팅 활동<br>
	                    <br>
	                    2. 수집하는 개인정보 항목 및 수집방법<br>
	                    1) 개인정보 수집항목<br>
	                    가. 필수 항목<br>
	                    - 이용자의 성명(가맹점의 경우, 대표자명 및 담당자명), 생년월일, 휴대폰번호(가맹점의 경우 대표자 휴대폰번호 및 담당자 휴대폰번호), 고유식별정보, 전화번호, 이메일주소(가맹점의 경우 대표자 이메일주소 및 담당자 이메일주소), 상호명, 사업자번호(법인번호), 업종 및 업태, 쇼핑몰URL, 사업장주소, 대표번호, 팩스번호, 거래대금지급정보(결제은행, 계좌번호, 계좌명) 및 상품 또는 용역 거래정보<br>
	                    - 상기 명시된 개인정보 수집항목 이외의 서비스 이용과정이나 서비스 처리과정에서 추가 정보(접속 IP/MAC Address, 쿠키, e-mail, 서비스 접속 일시, 서비스 이용기록, 불량 혹은 비정상 이용기록, 결제기록)들이 자동 혹은 수동으로 생성되어 수집 될 수 있습니다.<br>
	                    나. 선택 항목<br>
	                    - 필수항목 이외에 계약서류에 기재된 정보 또는 고객이 제공한 정보(결제대금예치서비스 환불계좌정보(은행명/계좌번호/예금주 등)<br>
	                    - 주소, 팩스번호 등<br>
	                    2) 개인정보 수집방법<br>
	                    - 홈페이지(NICEPAY 신규 서비스 신청 게시판), 서면양식, 팩스, E-Mail, 회사가 제공하는 전자금융서비스 결제창 및 업무제휴 계약을 체결한 제휴사로부터 이용자가 직접 제시한 정보를 수집<br>
	                    <br>
	                    3. 개인정보의 보유 및 이용기간<br>
	                    이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기 합니다. 단, 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에 의하여 보존할 필요가 있는 경우 관련 법령에서 정한 일정한 기간 동안 개인정보를 보존합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br>
	                    1) 계약 또는 청약 철회 등에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
	                    2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
	                    3) 건당 1만원 초과 전자금융거래에 관한 기록 : 5년 (전자금융거래법)<br>
	                    4) 소비자의 불만 또는 분쟁 처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
	                    5) 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)<br>
	                    6) 방문에 관한 기록 : 3년 (통신비밀보호법)<br>
	                    7) 건당 1만원 이하 전자금융거래에 관한 기록 : 1년 (전자금융거래법)<br>
	                    8) 본인확인에 관한 기록 : 6개월 (정보통신 이용촉진 및 정보보호 등에 관한 법률)<br>
	                    <br>
	                    4. 이용자의 개인정보의 수집 및 이용 거부<br>
	                    이용자는 회사의 개인정보 수집 및 이용 동의를 거부할 수 있습니다. 단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.<br>
	                    ※ 개인정보의 처리와 관련된 사항은 회사의 개인정보처리방침에 따릅니다.<br>      
	                </div> 
	
	                <a href="#order-payc23">개인정보 제공 및 위탁 동의<span>▼</span></a>
	                <div id="order-payc23">
	                    NICE페이먼츠 주식회사, 주식회사 LG유플러스, NHN한국사이버결제 주식회사, (주)다날 (이하 “회사”)는 이용자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률" 및 “개인정보보호법”과 “전자상거래 등에서의 소비자 보호에 관한 법률”을 준수하고 있습니다. 회사는 전자지급결제대행 및 결제대금예치서비스(이하 “서비스”) 이용자로부터 아래와 같이 개인정보를 제3자에게 제공 합니다.<br>
	                    <br>
	                    1. 개인정보 제공<br>
	                    회사는 이용자의 개인정보를 [개인정보의 수집 및 이용목적]에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
	                    - 이용자들이 사전에 동의한 경우(이용자가 사전에 동의한 경우란, 서비스 이용 등을 위하여 이용자가 자발적으로 자신의 개인정보를 제3자에게 제공하는 것에 동의하는 것을 의미합니다), 이러한 경우에도, 회사는 이용자에게 (1) 개인정보를 제공받는 자, (2) 그의 이용목적, (3) 제공되는 개인정보의 항목, (4) 개인정보의 보유 및 이용기간을 사전에 고지하고 이에 대해 명시적/개별적으로 동의를 얻습니다. 이와 같은 모든 과정에 있어서 회사는 이용자의 의사에 반하여 추가적인 정보를 수집하거나, 동의의 범위를 벗어난 정보를 제3자와 공유하지 않습니다.<br>
	                    - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
	                    - 개인 맞춤형 광고 서비스를 제공하기 위해 특정 개인을 식별할 수 없는 형태로 제휴사에 제공하는 경우<br>
	                    회사의 서비스 이행을 위하여 개인정보를 제3자에게 제공하고 있는 경우는 다음과 같습니다.<br>
	                    1) 이용 목적: 신용카드 결제<br>
	                    - 제공 받는자<br>
	                    가. 신용카드사: 국민/비씨/롯데/삼성/NH농협/현대/신한/하나/우리<br>
	                    나. 은행: 신한/SC제일/씨티/하나/농협/기업/국민/저축/수협/신협/우체국/새마을금고/대구/부산/경남/광주/전북/조흥/제주<br>
	                    다. VAN사: NICE정보통신/KIS정보통신/한국신용카드결제/코밴<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    2) 이용 목적: 계좌이체 결제<br>
	                    - 제공 받는자:<br>
	                    가. 은행: 경남/광주/국민/기업/농협/대구/부산/산업/새마을금고/수협/신한/신협/외환/우리/우체국/전북/제주/하나/씨티/SC제일은행<br>
	                    나. 증권: 동양/미래에셋/삼성/신한/한투/한화<br>
	                    다. 기타: 금융결제원/엘지유플러스 주식회사<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    3) 이용 목적: 가상계좌 결제<br>
	                    - 제공 받는자:<br>
	                    가. 은행: 국민/농협/우리/신한/하나/기업/우체국/외환/부산/대구<br>
	                    나. 기타: 케이아이비넷(주)/세틀뱅크㈜<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    4) 이용 목적: 휴대폰 결제<br>
	                    - 제공 받는자:<br>
	                    가. 이동통신사: (주)SKT/㈜KT/㈜LGU+/㈜KG모빌리언스<br>
	                    나. 기타: ㈜다날/갤럭시아커뮤니케이션즈㈜<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    5) 이용 목적: 현금영수증 발행<br>
	                    - 제공 받는자: 국세청<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    6) 이용 목적: 본인확인 인증<br>
	                    - 제공 받는자: 케이아이비넷㈜/세틀뱅크㈜/㈜KG모빌리언스<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    7) 이용 목적: 간편결제<br>
	                    - 제공 받는자:<br>
	                    에스케이플래닛㈜/㈜엘지씨엔에스/㈜카카오/㈜신세계아이앤씨/엔에이치엔페이코㈜/엔에이치엔한국사이버결제㈜/삼성전자㈜/롯데멤버스㈜<br>
	                    - 개인정보 항목: 결제정보<br>
	                    - 보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    8) 이용 목적: 상품권 결제<br>
	                    - 제공 받는자: 한국문화진흥<br>
	                    - 개인정보 항목: 결제정보<br>
	                    보유 및 이용기간: 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관).<br>
	                    2. 이용자의 개인정보 제3자 제공에 대한 거부<br>
	                    이용자는 회사의 개인정보의 제3자 제공에 대한 동의를 거부할 수 있습니다. 단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.<br>
	                    ※ 개인정보의 처리와 관련된 사항은 회사의 개인정보처리방침에 따릅니다.<br>    
	                </div> 
	            </div>
	            <p>구매조건 및 이용약관에 동의하며, 결제를 진행합니다.</p>
	            <a onclick="submitOrder()">결제하기</a>
	        </div>
        </form>
    </div>    
    



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function submitOrder() {
		$("#orderForm").submit();
	}

    function sample() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    //표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                document.getElementById('delivery-input2').value = data.zonecode;
                document.getElementById("delivery-input3").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("delivery-input4").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
    $(function(){
    	
    	
    	$("#totalPrice").val(${sum});
    	
    	if (${sum} < 20000) {
    		$("#dlvyFee").val("2500");
    	} else {
    		$("#dlvyFee").val("0");
    	}
    	
    	var beforeTotal = ${sum+dlvFee}
    	
    	$("#couponToUse").change(function() {
    		var discount_amount = $("#couponToUse option:selected").data("discount");
    		$("#discount").val(discount_amount);
    		$("div.discountAmount").html("-" + numberWithCommas(discount_amount) + "<span>원</span>");
    		$(".last-pay > p").html(numberWithCommas(beforeTotal-discount_amount) + "<span>원</span><img src='../assets/img/dropdown_1.png'>")
    		$(".last-paycc-b > div > div > span").html(numberWithCommas(beforeTotal-discount_amount) + "원");
    	});
    	
    	$("#check_stored").change(function() {
    		if (!$("#check_stored").attr("checked")) {
    			$("#check_stored").attr("checked", true);
    			$("#delivery-input1").val("${a.toName}");
    			$("#delivery-input2").val("${a.zcode}");
    			$("#delivery-input3").val("${a.adr1}");
    			$("#delivery-input4").val("${a.adr2}");
    			$("#phone-select").val("${fn:substring(phone_,0,3)}");
    			$("#delivery-input5").val("${fn:substring(phone_,3,11)}");
    		} else {
    			$("input#check_stored").attr("checked", false);
    			$("#delivery-input1").val("");
    			$("#delivery-input2").val("");
    			$("#delivery-input3").val("");
    			$("#delivery-input4").val("");
    			$("#phone-select").val("010");
    			$("#delivery-input5").val("");
    		}
    	});
    	
        $(".order-buyer > a").click(function(e){
            e.preventDefault();
            $(".order-buyer-more").slideToggle(300);

            if($(".order-buyerinfo img").attr('src')=="../assets/img/dropdown_1.png"){
                $(".order-buyerinfo img").attr('src',"../assets/img/dropdown_2.png");

            }else {
                $(".order-buyerinfo img").attr('src',"../assets/img/dropdown_1.png");
            } 
        });


        $(".order-product > a").click(function(e){
            e.preventDefault();
            $("#order-productc").slideToggle(300);
            if($(".order-producti>img:last-child").attr('src')=="../assets/img/dropdown_1.png"){
                $(".order-producti>img:last-child").attr('src',"../assets/img/dropdown_2.png");

            }else {
                $(".order-producti>img:last-child").attr('src',"../assets/img/dropdown_1.png");
            }
        });

        $(".order-coupon > a").click(function(e){
            e.preventDefault();
            $("#order-couponc").slideToggle(300);


            if($(".order-coupon img").attr('src')=="../assets/img/dropdown_1.png"){
                $(".order-coupon img").attr('src',"../assets/img/dropdown_2.png");

            }else {
                $(".order-coupon img").attr('src',"../assets/img/dropdown_1.png");
            }
           
        });

        $(".order-way > a").click(function(e){
            e.preventDefault();
            $("#order-wayc").slideToggle(300);

            if($(".order-way h3 img").attr('src')=="../assets/img/dropdown_1.png"){
                $(".order-way h3 img").attr('src',"../assets/img/dropdown_2.png");

            }else {
                $(".order-way h3 img").attr('src',"../assets/img/dropdown_1.png");
            }
           
        });

        $("#order-wayc li").click(function () {
            $(this).addClass("select");
            $("#order-wayc li").not(this).removeClass("select");
            var data = $(this).data('over');
            $(data).addClass("select-show");
            $(".order-way-forc li").not(data).removeClass("select-show");                
        });

        $('a[href="#last-payc"]').click(function(e){
            e.preventDefault();
            $("#last-payc").slideToggle(300);

            if($(".last-pay img").attr('src')=="../assets/img/dropdown_1.png"){
                $(".last-pay img").attr('src',"../assets/img/dropdown_2.png");

            }else {
                $(".last-pay img").attr('src',"../assets/img/dropdown_1.png");
            }
           
        });

        $('a[href="#order-payc1"]').click(function(e){
            e.preventDefault();
            $("#order-payc1").slideToggle(300);

             if($('a[href="#order-payc1"] span').html()=="내용보기 ▼"){

                $('a[href="#order-payc1"] span').html("내용감추기 ▲");

            }else {
                $('a[href="#order-payc1"] span').html("내용보기 ▼");
            }
           
        });

        $('a[href="#order-payc2"]').click(function(e){
            e.preventDefault();
            $("#order-payc2").slideToggle(300);

            if($('a[href="#order-payc2"] span').html()=="내용보기 ▼"){

                $('a[href="#order-payc2"] span').html("내용감추기 ▲");

            }else {
                $('a[href="#order-payc2"] span').html("내용보기 ▼");
            }
           
        });
        $("a[href='#order-payc21']").click(function(e){
            e.preventDefault();
            $("#order-payc21").slideToggle(300);

            if($('a[href="#order-payc21"] span').html()=="▼"){

                $('a[href="#order-payc21"] span').html("▲");

            }else {
                $('a[href="#order-payc21"] span').html("▼");
            } 
        });

        $("a[href='#order-payc22']").click(function(e){
            e.preventDefault();
            $("#order-payc22").slideToggle(300);

            if($('a[href="#order-payc22"] span').html()=="▼"){

                $('a[href="#order-payc22"] span').html("▲");

            }else {
                $('a[href="#order-payc22"] span').html("▼");
            } 
        });
        $("a[href='#order-payc23']").click(function(e){
            e.preventDefault();
            $("#order-payc23").slideToggle(300);

            if($('a[href="#order-payc23"] span').html()=="▼"){

                $('a[href="#order-payc23"] span').html("▲");

            }else {
                $('a[href="#order-payc23"] span').html("▼");
            } 
        });

        $("li.pay-way").click(function(e) {
        	$("#payWay").val($(this).data("pay"));
        });
     

    });


</script>
</body>

</html>