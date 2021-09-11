<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="nav">
	<div class="profile">
		<img src="${pageContext.request.contextPath}/assets/img/love.jpeg">
		<h1>닭킹랭컴 관리자</h1>
	</div>
	<div class="menu">
		<ul>
			<li class="clear"><a href="">상품관리<img
					src="${pageContext.request.contextPath}/assets/img/ranking_arrow_btm.png"></a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/admin/product_list.do">전체상품관리</a></li>

				</ul></li>
			<li class="clear"><a href="">주문관리<img
					src="${pageContext.request.contextPath}/assets/img/ranking_arrow_btm.png"></a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/admin/order_list.do">전체주문관리</a></li>

				</ul></li>
			<li class="clear"><a href="">회원관리<img
					src="${pageContext.request.contextPath}/assets/img/ranking_arrow_btm.png"></a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/admin/member_list.do">전체회원관리</a></li>
				</ul></li>
			<li class="clear"><a href="">게시판관리<img
					src="${pageContext.request.contextPath}/assets/img/ranking_arrow_btm.png"></a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/admin/oneonone_list.do">1:1문의
							내역 조회</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/review_list.do">후기조회
							및 수정</a></li>
				</ul>
			</li>
			<li class="clear"><a href="">쿠폰관리<img
					src="${pageContext.request.contextPath}/assets/img/ranking_arrow_btm.png"></a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/admin/coupon_list.do">전체쿠폰관리</a></li>
				</ul>
				</li>
		</ul>
	</div>
</div>
