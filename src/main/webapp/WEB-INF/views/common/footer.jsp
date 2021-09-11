<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="friend">
    <div>
        <h3>
          닭킹랭컴 닭대리와 친구맺기
        </h3>
    </div>
    <div class="icon">
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/facebook_icon.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/instagram_icon.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/naverblog_icon.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/naverpost_icon.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/kakaotalk_icon.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/kakaostory_icon.jpg"></a>
    </div>
</div>

<div class="address-top">
    <div class="clear">
        <a href="${pageContext.request.contextPath}/help/notice.do">공지사항</a>
        <a href="${pageContext.request.contextPath}/help/notice.do">이용약관</a>
        <a href="${pageContext.request.contextPath}/help/notice.do">개인정보처리방침</a>
    </div>
    <div>
    	<c:choose>
        	<c:when test="${login eq null}">
        		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
        	</c:when>
	        <c:otherwise>
	        	<a href="${pageContext.request.contextPath}/member/logout_ok.do">로그아웃</a>
	        </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/help/help.do">고객센터</a>
        <a href="${pageContext.request.contextPath}">전체보기</a>
    </div>
</div>

<address>

	
    5조 닭킹랭컴 : 조원우, 김지효, 최윤호  <span>개인정보보호책임자 : 5조</span><br/>
    사업자등록번호 : 000-00-00000 <a href="#">사업자정보확인></a><br/>
    통신판매신고 : 제2020-서울서초-에이스퀘어<br/>
    서울특별시 서초구 에이스퀘어 빌딩 3층 이젠IT<br/><br/>

    <span class="address-call">고객센터 : </span><span class="address-num">02-000-0000</span><br/>
    Email:admin@gmail.com<br/>
    호스팅 제공 : 닭킹랭컴<br/>
    <br/>
    <a style="text-decoration: none" href="${pageContext.request.contextPath}/admin/login.do">&copy;</a> All right reserved
    <br/>
    <br/>
	* 취업을 위한 학생용 포트폴리오 사이트 입니다.
</address>


<script>
	$(".icon > a:first-child").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 페이스북입니다!");
	});
	$(".icon > a:nth-child(2)").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 인스타그램입니다!");
	});
	$(".icon > a:nth-child(3)").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 블로그입니다!");
	});
	$(".icon > a:nth-child(4)").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 포스트입니다!");
	});
	$(".icon > a:nth-child(5)").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 카카오톡입니다!");
	});
	$(".icon > a:last-child").click(function(e) {
		e.preventDefault();
		alert("닭킹랭컴 카카오스토리입니다!");
	});
</script>