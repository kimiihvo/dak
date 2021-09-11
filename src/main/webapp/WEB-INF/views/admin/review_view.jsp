<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/adminhead.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/adminnav.jsp"%>
		<div class="content-wrap">
			<div class="content">
				<div class="media col-md-offset-1 col-md-10">
					<a class="pull-left" href="#"><c:if test="${output.img ne null }"> <img
						class="media-object center-block"
						src="${output.img}" width="60"
						height="60"></c:if>
					</a>
					<div class="media-body">
						<div class="clearfix">
							<small class="reg">${output.regDate }</small> <img
								src="${pageContext.request.contextPath}/assets/img/rating${output.memRating}.png"
								width="60">
						</div >
							<p>${output.content}</p>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-offset-1 col-md-10">
						<button type="button"
							onclick="location.href ='${pageContext.request.contextPath}/admin/review_delete_ok.do?reviewno=${output.reviewno}';"
							class="btn btn-primary btn-block">삭제</button>
						<button type="button"
							onclick="location.href ='${pageContext.request.contextPath}/admin/review_list.do';"
							class="btn btn-primary btn-block">목록으로 이동</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<script type="text/javascript">
		$(function() {

			// 첫번째 열어놓기
			$(".menu>ul>li").not(":eq(3)").find("li").hide();

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