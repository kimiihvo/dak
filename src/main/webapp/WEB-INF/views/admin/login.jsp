<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<title>닭킹랭컴 관리자</title>
		<!-- bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- admin CSS파일 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin.css">
		
	</head>
	<body>
		<div class="container">
			<form role="form" method="POST" action="${pageContext.request.contextPath}/admin/login_ok.do">
				<fieldset class="login">
					<legend class="hide">닭킹랭컴 관리자 로그인</legend>
					<div class="form-group">
						<label for="user_id">아이디</label>
						<input type="text" id="user_id" class="form-control" autofocus name="memId" placeholder="아이디를 입력하세요." required/>
					</div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input type="password" id="user_pw" class="form-control" name="memPw" placeholder="비밀번호를 입력하세요." required />
					</div>
					<button type="submit" class="btn btn-primary btn-block">
						로그인
					</button>
				</fieldset>
			</form>
		</div>
	</body>
</html >