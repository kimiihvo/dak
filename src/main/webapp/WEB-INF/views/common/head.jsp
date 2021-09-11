<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0"/>
    <title>닭킹랭컴</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon-32.ico">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon-64.ico">
	<link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
	<link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon-32.ico">
	<link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon-64.ico">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script>
	$(function() {
		$(document).ready(function(){
			$.get("${pageContext.request.contextPath}/shop/cart_count",{},
					 function(req) {
						$(".front-cart-row").html(req.count);
			});
		});
	});
</script>