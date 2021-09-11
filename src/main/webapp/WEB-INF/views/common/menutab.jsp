<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="menutab">
        <!-- 헤더부분 -->
        <div class="menu-header">
            <div class="menu-header-1 clear">
                <div class="menu-header-left">
                <c:choose>
                	<c:when test="${login eq null}">
                    	<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
                	</c:when>
                	<c:otherwise>
                    <span class="membership">${login.nick}님</span>
                	</c:otherwise>
                </c:choose>

                </div>
                <div class="menu-header-right">
                    <a href="${pageContext.request.contextPath}/shop/cart.do"><img src="${pageContext.request.contextPath}/assets/img/cart_icon3.png" class="cart-icon" alt="장바구니">
                    <span class="front-cart-row menutab-cart">0</span></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/assets/img/close_icon.png" class="close-icon" alt="닫기"></a>
                </div>
            </div>

            <div class="menu-header-2">
                <ul class="menu-navbar clear">
                    <li><a href="${pageContext.request.contextPath}/mypage/mypage_index.do">마이랭킹</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/order_list.do">주문/배송</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/coupon.do">쿠폰</a></li>
                    <li><a href="${pageContext.request.contextPath}/help/help.do">고객센터</a></li>
                </ul>
            </div>
        </div>
        <!-- //헤더부분 끝-->


        <!-- 본문부분 -->
        <div class="menu-content">

            <div class="tab-content">
                <div id="menu-list-wrap">
                    <div class="menu-list">
                        <div class="tab-banner"><a href="#"><img src="${pageContext.request.contextPath}/assets/img/ranking-land.jpg" alt="1팩골라담기배너"></a></div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/shop/new.do"><img src="${pageContext.request.contextPath}/assets/img/tab-icon1.png" alt="아이콘">신상품
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/sale.do"><img src="${pageContext.request.contextPath}/assets/img/all_cate_04.png" alt="아이콘">타임세일
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=1"><img src="${pageContext.request.contextPath}/assets/img/tab-icon2.png" alt="아이콘">닭가슴살
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=2"><img src="${pageContext.request.contextPath}/assets/img/tab-icon3.png" alt="아이콘">간편한끼
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=3"><img src="${pageContext.request.contextPath}/assets/img/tab-icon4.png" alt="아이콘">도시락/샐러드
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=4"><img src="${pageContext.request.contextPath}/assets/img/tab-icon5.png" alt="아이콘">간편식
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                            <li><a href="${pageContext.request.contextPath}/shop/section.do?mainCateNo=5"><img src="${pageContext.request.contextPath}/assets/img/tab-icon6.png" alt="아이콘">건강간식
                            <img class="arrow" src="${pageContext.request.contextPath}/assets/img/mypage_arrow.png"></a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <!-- //본문부분 끝-->


        <!-- 푸터부분-->
        <div class="menu-footer">
            <div class="tab-btm">
                <div class="tab-banner">
                    <a href="${pageContext.request.contextPath}/shop/new.do">
                        <img src="${pageContext.request.contextPath}/assets/img/new_mar.jpg" alt="신상품배너">
                    </a>
                </div>
            </div>
            <div class="tab-btm-1">
            	<c:if test="${login ne null}">
                <a href="${pageContext.request.contextPath}/member/logout_ok.do" class="menu-logout">로그아웃</a>
            	</c:if>
                <a href="${pageContext.request.contextPath}/mypage/my_event.do" class="tab-event">이벤트 & 당첨자 발표 ></a>
            </div>
        </div>
    </div>