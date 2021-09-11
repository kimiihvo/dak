<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 최근 본 상품 및 최상단으로 이동 버튼 -->
<div id="recent-bar" class="recent-viewed-wrapper">
	<div class="recent-viewed">
		<a href="${pageContext.request.contextPath}/shop/recent_view_list.do"><img src="${pageContext.request.contextPath}/assets/img/new_06.jpg"></a>
		<span class="recent-count"></span>
	</div>
	<div class="top-btn">
		<a></a>
	</div>
</div>

<script>
$(function (){
	$(document).ready(function() {

		$('.top-btn').click(function() {

			$('html').animate({
				scrollTop : 0
			}, 400);

		});
	});
	$('.recent-viewed').click(function(e) {
    	e.preventDefault();
    	window.location.href='${pageContext.request.contextPath}/shop/recent_view_list.do';
    });

	var original_top = $(window).scrollTop();
	var scroll_direction;
	$(window).scroll(function(){
	    var current_top = $(window).scrollTop();
	    if(original_top < current_top)
	    {
	        $('#recent-bar').css("bottom", "-46px");
	    }
	    else
	    {
	        $('#recent-bar').css("bottom", "10px");
	    }
	    original_top = current_top;
	    // console.log(scroll_direction);
	});
	
	// --- 조원우 ---
	
	var didScroll;
	var lastScrollTop = 0;
	var header = $('header').outerHeight();
	var nav =  $('nav').outerHeight();
	
	
	$(window).scroll(function(event){
	   	hasScrolled();
	});
	
	
	
	function hasScrolled() {
	    var st = $(this).scrollTop();
	
	    if (st > lastScrollTop && st >= header+nav){
	        $('nav').addClass('nav-fix'); //1
	        $('.gnb').removeClass('gnb-fix');//2
	    }
	    else {
	            $('nav').removeClass('nav-fix');//2
	
	            if(st <= lastScrollTop && st >= header) {
	                $('.gnb').addClass('gnb-fix');//1
	                $('nav').addClass('nav-fix2');
	            }
	             else{
	                $('.gnb').removeClass('gnb-fix');
	                 $('nav').removeClass('nav-fix2');
	            }
	    }
	
	    lastScrollTop = st;
	}
	
});
</script>