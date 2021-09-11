<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/adminhead.jsp" %>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/adminnav.jsp" %>
		<div class="content-wrap">
			<div class="content">
				<form class="form-horizontal" role="form"
					enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/admin/member_view_ok.do?memno=${output.memno}">
					<fieldset>
						<legend>회원정보</legend>
						<div class="form-group">
							<label class="col-md-2 control-label">회원번호</label>
							<div class="col-md-10">
								<input type="number" class="form-control"
									value="${output.memno}" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">아이디</label>
							<div class="col-md-10">
								<input type="text" class="form-control" value="${output.memId}" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">회원명</label>
							<div class="col-md-10">
								<input type="text" class="form-control"
									value="${output.memName}" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">닉네임</label>
							<div class="col-md-10">
								<input type="text" class="form-control"  disabled value="${output.nick}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">휴대폰번호</label>
							<div class="col-md-10">
								<input type="text" class="form-control" disabled
									value="${output.phone}" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">이메일</label>
							<div class="col-md-10">
								<input type="email" class="form-control" id="subject" disabled
									value="${output.email}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">생년월일</label>
							<div class="col-md-10">
								<input type="date" class="form-control" id="subject" disabled
									value="${output.birthdate}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">성별</label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="subject" disabled
									value="${output.gender }">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">가입일</label>
							<div class="col-md-10">
								<input type="date" class="form-control" 
									value="${output.regDate}" disabled>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-2 col-md-10">
								 <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/member_list.do';"class="btn btn-primary btn-block">목록으로 이동</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<script type="text/javascript">
		
		$(function() {

			// 첫번째 열어놓기
			$(".menu>ul>li").not(":eq(2)").find("li").hide();

			var menu = $(".menu>ul>li>a");

			/** 링크에 대한 클릭 이벤트 처리 */
			menu.click(function() {

				// 펼칠 내용 영역 선택
				var target = $(this).parent().find("li");

				// 나머지 내용 영역을 선택
				var other = menu.not(this).parent().find("li");

				// 애니메이션으로 열고 닫기 처리
				target.slideToggle(300);
				other.slideUp(300);

				// 링크 페이지 이동 중지
				return false;
			});

		});
	</script>
</body>
</html>