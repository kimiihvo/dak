<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="gnb">
	
   <h1>
       <span class="hide">닭킹랭컴</span><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo_303030.png"></a>
   </h1>
   <a href="${pageContext.request.contextPath}/shop/cart.do" class="top-shopcart"><img src="${pageContext.request.contextPath}/assets/img/cart_icon.png" alt="장바구니">
   <span class="front-cart-row">0</span></a>
   <a href="#" class="top-menu"><img src="${pageContext.request.contextPath}/assets/img/category_icon.png" alt="메뉴"></a>
</div>

<div class="search-wrapper">
    <div class="search-account">
       <a href="#" class="search-bar">포만감 가-득한 곤약 모음전!</a>
    </div>
    <a href="${pageContext.request.contextPath}/mypage/mypage_index.do" class="account"></a>
</div>



<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/shop/promotion.do">이달의특가</a></li>
        <li><a href="${pageContext.request.contextPath}/shop/benefit_md.do">혜택정리</a></li>
        <li><a href="${pageContext.request.contextPath}/shop/shop_category.do">종류별</a></li>
        <li><a href="${pageContext.request.contextPath}/shop/ranking_save.do">랭킹</a></li>
        <li><a href="${pageContext.request.contextPath}/shop/express.do"><img src="${pageContext.request.contextPath}/assets/img/express_delivery.png"></a></li>         
    </ul>
</nav>
