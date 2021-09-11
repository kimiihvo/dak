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
				<div class="content-main">
					<h3 class="hide">1:1문의검색폼</h3>
					<form role="form" id="search-form">
						<fieldset>
							<legend class="hide">1:1문의검색</legend>
							<div class="form-group">
								<select name="" id="">
									<option value="">닉네임</option>
								</select> <label class="hide">검색어</label> <input type="text" name="keyword"
									value="${keyword}">
							</div>
							<input class="btn btn-search" type="submit" value="검색"> 
						</fieldset>
					</form>
					<div>
						<h2>1:1문의내역관리</h2>
					</div>
					<div class="form-group">
						<label>정렬</label> 
						<select name="" id="search-select">
							<option value="전체">전체</option>
							<option value="답변 대기 중">답변 대기 중</option>
							<option value="답변완료">답변완료</option>
						</select>
					</div>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="text-center">문의번호</th>
								<th class="text-center">회원번호</th>
								<th class="text-center">닉네임</th>
								<th class="text-center">타이틀</th>
								<th class="text-center">등록일</th>
								<th class="text-center">상태</th>
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
											<td align="center">${item.oneno}</td>
											<td align="center">${item.memno}</td>
											<td align="center">${name}</td>
											<td align="center">${item.category}</td>
											<td align="center">${item.regDate}</td>
											<td align="center">${item.status}</td>
											<td align="center"><a
												href="${pageContext.request.contextPath}/admin/oneonone_view.do?oneno=${item.oneno}&status=${item.status}"><button type="button" class="btn btn-primary btn-block">선택</button></a></td>
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
					<c:url value="/admin/oneonone_list.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
						<c:param name="keyword" value="${keyword}" />
						<c:param name="status" value="${status}" />
					</c:url>
					<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
            [이전]
        </c:otherwise>
			</c:choose>

			<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}"
				end="${pageData.endPage}" >
				<%-- 이동할 URL 생성 --%>
				<c:url value="/admin/oneonone_list.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="keyword" value="${keyword}" />
					<c:param name="status" value="${status}" />
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
					<c:url value="/admin/oneonone_list.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
						<c:param name="keyword" value="${keyword}" />
						<c:param name="status" value="${status}" />
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
			$(document).on("change","#search-select" ,function(){
				var selected =$(this).find("option:selected").val();
				var keyword =$('#search-form').find("[name='keyword']").val();
				location.href ='${pageContext.request.contextPath}/admin/oneonone_list.do?status='+selected+'&keyword='+keyword;
				
			})
			function get_query(){
			    var url = document.location.href;
			    var qs = url.substring(url.indexOf('?') + 1).split('&');
			    for(var i = 0, result = {}; i < qs.length; i++){
			        qs[i] = qs[i].split('=');
			        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			    }
			    return result;
			}
			
			$(document).ready(function() { 
			var result = get_query();
			
			var status = result.status.replace(/[+]/gi,' ');
			console.log(status);
			$('#search-select').find('option[value=\"'+status+'\"]').prop('selected',true) 
			});
			
			
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