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
				<div class="content-main">
					<h3 class="hide">회원관리검색폼</h3>
					<form role="form" class="">
						<fieldset>
							<legend class="hide">회원검색</legend>
							<div class="form-group">
								<select name="" id="">
									<option value="">닉네임</option>
								</select> 
								<label class="hide">검색어</label> <input type="text" name="keyword"
									value="${keyword }">
							</div>
							<input class="btn btn-search" type="submit" value="검색">
						</fieldset>
					</form>
					<div>
						<h2>전체회원내역조회</h2>
					</div>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="text-center">회원번호</th>
								<th class="text-center">아이디</th>
								<th class="text-center">회원명</th>
								<th class="text-center">닉네임</th>
								<th class="text-center">휴대폰번호</th>
								<th class="text-center">이메일</th>
								<th class="text-center">성별</th>
								<th class="text-center">생년월일</th>
								<th class="text-center">가입일</th>
								<th class="text-center"></th>
							
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${output==null || fn:length(output)==0}">
									<tr>
										<td colspan="11" align="center">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="st">
										<c:set var="name" value="${item.nick}" />
										<c:if test="${keyword !=''}">
											<c:set var="mark" value="<mark>${keyword}</mark>" />
											<c:set var="name" value="${fn:replace(name,keyword,mark) }" />
										</c:if>

										<tr>
											<td align="center">${item.memno}</td>
											<td align="center">${item.memId}</td>
											<td align="center">${item.memName}</td>
											<td align="center">${name}</td>
											<td align="center">${item.phone}</td>
											<td align="center">${item.email}</td>
											<td align="center">${item.gender}</td>
											<td align="center">${item.birthdate}</td>
											<td align="center">${item.regDate}</td>
											<td align="center"><a
												href="${pageContext.request.contextPath}/admin/member_view.do?memno=${item.memno}"><button type="button" class="btn btn-primary btn-block">선택</button></a></td>
										
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="paging">
			<!-- 페이지 번호 구현 -->
			<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/admin/member_list.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
            [이전]
        </c:otherwise>
			</c:choose>

			<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}"
				end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/admin/member_list.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>

				<%-- 페이지 번호 출력 --%>
				<c:choose>
					<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
					<c:when test="${pageData.nowPage == i}">
						<strong>[${i}]</strong>
					</c:when>
					<%-- 나머지 페이지의 경우 링크 적용함 --%>
					<c:otherwise>
						<a href="${pageUrl}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/admin/member_list.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					<a href="${nextPageUrl}">[다음]</a>
				</c:when>
				<c:otherwise>
            [다음]
        </c:otherwise>
			</c:choose>
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