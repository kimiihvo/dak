<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp"%>
   
    <style type="text/css">
    	header nav ul li:first-child a {
    	border-bottom: 2px solid #ff6601;
		}
        article a { display: block; }
        article a img { width: 100%; }
    </style>

</head>
<body>
    
<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>
	<div id="search"><%@ include
			file="/WEB-INF/views/common/search_layer.jsp"%></div>

	<div id="mainpage">

	<header>
		<%@ include file="/WEB-INF/views/common/header1.jsp"%>
	</header>

        <main>
            <section>
                
                 <article>
                    <a href="${pageContext.request.contextPath}/shop/sale.do">
                         <img src="${pageContext.request.contextPath}/assets/img/s2.jpg" alt="">
                    </a>
                </article>
                
                 <article>
                    <a href="${pageContext.request.contextPath}/shop/new.do">
                        <img src="${pageContext.request.contextPath}/assets/img/s4.jpg" alt="">
                    </a>
                </article>
                 <article>
                    <a href="${pageContext.request.contextPath}/shop/ranking_save.do">
                        <img src="${pageContext.request.contextPath}/assets/img/s5.jpg" alt="">
                    </a>
                </article>
                 <article>
                    <a href="${pageContext.request.contextPath}/shop/sale.do">
                        <img src="${pageContext.request.contextPath}/assets/img/s6.jpg" alt="">
                    </a>
                </article>
                

            </section>
        </main>

    <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
	<%@ include file="/WEB-INF/views/common/recent.jsp"%>
    
    </div>
        
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