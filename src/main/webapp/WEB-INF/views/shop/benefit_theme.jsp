<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/benefit_theme.css">
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
	                <li>
	                    <a href="${pageContext.request.contextPath}/shop/benefit_theme.do">테마추천</a>
	                </li>
	            </ul>
	        </div>
	        <div class="theme-box">
	        <div class="theme-select">
	            <select>
	                <option value="1" selected>진-짜 잘나가는건 나야, 둘이 될 순 없어</option>
	                <option value="2">추운 겨울, 따뜻함이 생각날 때</option>
	            </select>
	            
	        </div>
	        </div>
	        <section>
	            <article class="theme-art">
	                <img src="${pageContext.request.contextPath}/assets/img/theme2.jpg" alt=""/>
	                <h2>
	                    테마 추천 상품
	                </h2>
	                <ul class="product-theme">
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-1.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-2.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-3.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-4.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-5.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="detail.html">
	                            <div class="box clear">
	                                <div class="img">
	                                    <img src="${pageContext.request.contextPath}/assets/img/themelist2-6.jpg">
	                                </div>
	                                <div class="desc">
	                                    <p class="name">맛있닭 닭가슴살 한끼 순대</p>
	                                    <div class="price-deli">
	                                        <p class="price" >
	                                            <strong>16,000</strong>원
	                                        </p>
	                                        <p class="delivery">
	                                            <img src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
	                                        </p>
	                                    </div>
	                                    <p><span class="pack_price">(1팩당 : 3,327원~3,900원)</span></p>
	                                    <p class="rating">
	                                        <img src="${pageContext.request.contextPath}/assets/img/rating5.png"> (111)
	                                    </p>
	                                    <p class="op-icon">
	                                        <img src="${pageContext.request.contextPath}/assets/img/plus_dum.png">
	                                    </p>
	                                </div>
	                            </div>
	                        </a>
	                    </li>
	                </ul>
	            </article>
	        </section> 
	    </main>
	
	    <footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>
	    <%@ include file="/WEB-INF/views/common/recent.jsp"%>
	</div>	

    <script type="text/javascript">
        $(function() {

            $(".theme-select > select").change(function(){
                var theme = $(this).val();

                if (theme == 1){
                $(location).attr('href','${pageContext.request.contextPath}/shop/benefit_theme.do');
                
                }
                else
                {
                $(location).attr('href','${pageContext.request.contextPath}/shop/benefit_theme2.do');
                
            }

           });


            // 상단 헤더 fix 기능 구현 --- 최윤호----
            var lastScrollTop = 0;
            
            $(window).scroll(function(event){
            	var st = $(this).scrollTop();

                if (st > lastScrollTop && st >= 186){
                    $('.theme-box').addClass('theme-box-fix');

                }
                else{
                        if(st <= lastScrollTop && st >= 186 ) {
                            $('.theme-box').addClass('theme-box-fix');
                        }
                         else{
                            $('.theme-box').removeClass('theme-box-fix');
                             ;
                        }
                }

                lastScrollTop = st;
            });

       



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