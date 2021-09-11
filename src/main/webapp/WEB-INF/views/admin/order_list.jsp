<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<div class="content-main">
					<h3 class="hide">주문관리검색폼</h3>
					<form role="form" action="${pageContext.request.contextPath}/admin/order_list.do">
						<fieldset>
							<legend class="hide">주문검색</legend>
							<div class="form-group">
								<select name="" id="">
									<option value="">회원명</option>
								</select> <label class="hide">검색어</label> <input type="text" name="keyword" value="${keyword}">
							</div>
							<input class="btn btn-search" type="submit" value="검색">
						</fieldset>
					</form>
				</div>
				<div>
					<h2>전체주문내역조회</h2>
				</div>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center">주문번호</th>
							<th class="text-center">회원번호</th>
							<th class="text-center">회원명</th>
							<th class="text-center">총구매금액</th>
							<th class="text-center">결제방식</th>
							<th class="text-center">주문일</th>
							<th class="text-center">상태</th>
							<th class="text-center"></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${output==null || fn:length(output)==0}">
								<tr>
									<td colspan="9" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="name" value="${item.memName}" />
									<c:if test="${keyword !=''}">
										<c:set var="mark" value="<mark>${keyword}</mark>" />
										<c:set var="name" value="${fn:replace(name,keyword,mark) }" />
									</c:if>

									<c:url value="/admin/order_view.do" var="viewUrl">
										<c:param name="odrno" value="${item.odrno}" />
									</c:url>
									<tr>
										<td align="center">${item.odrno}</td>
										<td align="center">${item.memno}</td>
										<td align="center">${name}</td>
										<td align="center">${item.toPrice}</td>
										<td align="center">${item.pay}</td>
										<td align="center">${item.regDate}</td>
										<td align="center">${item.status}</td>
										<td align="center"><a href="${viewUrl}"><button type="button" class="btn btn-primary btn-block">선택</button></a></td>
	                                    </tr>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="paging">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/admin/order_list.do" var="prevPageUrl">
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
					<c:url value="/admin/order_list.do" var="pageUrl">
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
						<c:url value="/admin/order_list.do" var="nextPageUrl">
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
			$(".menu>ul>li").not(":eq(1)").find("li").hide();

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