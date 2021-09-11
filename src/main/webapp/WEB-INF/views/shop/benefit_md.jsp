<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/benefit_md.css">
</head>
<body>
	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>
  	<div id="mainpage">
  	
  	
      <header><%@ include file="/WEB-INF/views/common/header1.jsp"%></header>
      <main>
          <div class="nav-benefit">
              <ul>
                  <li>
                      <a href="${pageContext.request.contextPath}/shop/benefit_md.do">MD추천</a>
                  </li>
              </ul>
          </div>
          <section>
              <article>
                  <img src="${pageContext.request.contextPath}/assets/img/md1.jpg" alt="식단관리"/>
              </article>
              <article>
                  <img src="${pageContext.request.contextPath}/assets/img/md2.jpg" alt="식단관리"/>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/promotion.do"><img src="${pageContext.request.contextPath}/assets/img/md3.jpg" alt="랭킹닭컴 1월 혜택"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=13"><img src="${pageContext.request.contextPath}/assets/img/md4.jpg" alt="2021년 새해를 맞아"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=25"><img src="${pageContext.request.contextPath}/assets/img/md5.jpg" alt="맛있게 골라 먹는 다이어트 도시락"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=13"><img src="${pageContext.request.contextPath}/assets/img/md6.jpg" alt="랭킹닭컴 판매량1위 상품"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=14"><img src="${pageContext.request.contextPath}/assets/img/md7.jpg" alt="입안 가득 채우는 부드러움"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=15"><img src="${pageContext.request.contextPath}/assets/img/md8.jpg" alt="소문난 도시락 맛집, 바로 여기"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=16"><img src="${pageContext.request.contextPath}/assets/img/md9.jpg" alt="더 맛있고 간편한 한입 소시지"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=17"><img src="${pageContext.request.contextPath}/assets/img/md10.jpg" alt="떡볶이로 다이어트?"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=18"><img src="${pageContext.request.contextPath}/assets/img/md11.jpg" alt="진짜 도시락"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=19"><img src="${pageContext.request.contextPath}/assets/img/md12.jpg" alt="고구마와 치즈의 환상 케미"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=20"><img src="${pageContext.request.contextPath}/assets/img/md13.jpg" alt="입문자들을 위한 2주 플랜"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=21"><img src="${pageContext.request.contextPath}/assets/img/md14.jpg" alt="우리집 식탁을 간편하게"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=22"><img src="${pageContext.request.contextPath}/assets/img/md15.jpg" alt="뭘 골라도 다 맛있다."></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=23"><img src="${pageContext.request.contextPath}/assets/img/md16.jpg" alt="양념치킨 맛 완벽 재현!"></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/detail.do?prdno=24"><img src="${pageContext.request.contextPath}/assets/img/md17.jpg" alt="국내산 통밀로 만들었어요."></a>
              </article>
              <article>
                  <a href="${pageContext.request.contextPath}/shop/promotion.do"><img src="${pageContext.request.contextPath}/assets/img/md18.jpg" alt="식단관리의 시작"></a>
              </article>
          </section>  
      </main>

      <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>

      <div><%@ include file="/WEB-INF/views/common/recent.jsp"%></div>
      
    <script type="text/javascript">
            
        $(function() {

            // --- 김지효 ---
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
            $(document).on('click','.top-menu',function () {
                if($("#menutab").css("display")=="none"){
                	
                    $("#menutab").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });
            $(document).on('click','.close-icon',function () {
                if($("#menutab").css("display")=="block"){
                    $("#menutab").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 클릭 시 서치 탭 숨김, 표시 처리 */
            $(document).on('click','.search-account',function () {
                if($("#search-layer").css("display")=="none"){
                    $("#search-layer").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });
            $(document).on('click','.search-layer-close',function () {
                if($("#search-layer").css("display")=="block"){
                    $("#search-layer").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 종류별 브랜드별 탭 클릭 이벤트 */
            $(document).on('click','.tab-title > li',function () {
                if($(this).hasClass("on")){
                    $(".tab-title > li").not(this).removeClass("on");
                } else {
                    $(this).addClass("on");
                    $(".tab-title > li").not(this).removeClass("on");
                }
            });
             $(document).on('click','.tab-title > li:first-child',function () {
                $("#menu-list-wrap").css("display", "block");
                $("#menu-table-wrap").css("display", "none");
            });
             $(document).on('click','.tab-title > li:last-child',function () {
                $("#menu-table-wrap").css("display", "block");
                $("#menu-list-wrap").css("display", "none");
            });


        });
    </script>
</body>
</html>