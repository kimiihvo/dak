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
				<div class="content-main elip">
					<div>
						<h3 class="hide">쿠폰관리검색폼</h3>
						<form method="get"
							action="${pageContext.request.contextPath}/admin/coupon_list.do">
							<fieldset>
								<legend class="hide">쿠폰검색</legend>

								<div class="form-group">
									<select name="title" id="">
										<option value="title">쿠폰명</option>
										<!-- <option value="code">쿠폰코드</option>
                                        <option value="memno">멤버번호</option> -->
									</select> <label class="hide">검색어</label> <input type="search"
										name="keyword" id="keyword" value="${keyword}">
								</div>
								<input class="btn btn-search" type="submit" value="검색">
							</fieldset>
						</form>
					</div>
					<div>
						<h2>전체쿠폰관리</h2>
					</div>

					<table class="table table-bordered table-striped"
						style="table-layout: fixed">
						<thead>
							<tr>
								<!-- <th class="text-center">
	                                <input type="checkbox" name="">
	                            </th> -->
								<th class="text-center">쿠폰번호</th>
								<th class="text-center">멤버번호</th>
								<th class="text-center" width="15%">쿠폰코드</th>
								<th class="text-center" width="20%">쿠폰이름</th>
								<th class="text-center">등록일</th>
								<th class="text-center">만료일</th>
								<th class="text-center">할인가격</th>
								<th class="text-center">사용여부</th>
								<th class="text-center">주문최소금액</th>
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
									<c:forEach var="item" items="${output}" varStatus="st">
										<c:set var="name" value="${item.title}" />
										<c:if test="${keyword !=''}">
											<c:set var="mark" value="<mark>${keyword}</mark>" />
											<c:set var="name" value="${fn:replace(name,keyword,mark) }" />
										</c:if>

										<tr>
											<td align="center">${item.coupno}</td>
											<td align="center">${item.memno}</td>
											<td align="center">${item.code}</td>
											<td align="center">${name}</td>
											<td align="center">${item.regDate}</td>
											<td align="center">${item.expDate}</td>
											<td align="center">${item.discount}</td>
											<td align="center">${item.isUsed}</td>
											<td align="center">${item.orderOver}</td>
											<td align="center"><a
												href="${pageContext.request.contextPath}/admin/coupon_edit.do?coupno=${item.coupno}"><button type="button" class="btn btn-primary btn-block">선택</button></a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<div class="paging">
						<!-- 페이지 번호 구현 -->
						<%-- 이전 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 이전 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.prevPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/admin/coupon_list.do" var="prevPageUrl">
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
							<c:url value="/admin/coupon_list.do" var="pageUrl">
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
								<c:url value="/admin/coupon_list.do" var="nextPageUrl">
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



					<div class="text-center">
						<a class="btn btn-default"
							href="${pageContext.request.contextPath}/admin/coupon_add.do">쿠폰등록</a>
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
			$(".menu>ul>li").not(":eq(4)").find("li").hide();

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