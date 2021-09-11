<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <form class="form-horizontal" role="form" enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/admin/order_view_ok.do?odrno=${output.odrno}">
                    <fieldset>
                        <legend>주문정보</legend>
                        <div class="form-group">
                            <label for="accountn" class="col-md-1 control-label">회원번호</label>
                            <div class="col-md-5">
                                <input type="number" class="form-control" id="accountn" value="${output.memno}" disabled>
                            </div>
                            <label for="accountna" class="col-md-1 control-label">회원명</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="accountna" value="${output.memName}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="orphone" class="col-md-1 control-label">휴대폰번호</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="orphone" value="${output.phone}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-md-1 control-label">상태</label>
                            <c:if test="${output.status eq '주문완료'}">
                            <div class="col-md-5">
                                 <select name="status">
                                    <option value="주문취소">주문취소</option>
                                    <option value="주문완료" selected>주문완료</option>
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                            </div>
                            </c:if>
                            <c:if test="${output.status eq '배송대기'}">
                            <div class="col-md-5">
                                 <select name="status" >
                                    <option value="주문취소" >주문취소</option>
                                    <option value="주문완료" >주문완료</option>
                                    <option value="배송대기" selected>배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                            </div>
                            </c:if><c:if test="${output.status eq '배송중'}">
                            <div class="col-md-5">
                                 <select name="status" >
                                    <option value="주문취소">주문취소</option>
                                    <option value="주문완료" selected>주문완료</option>
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중" selected>배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                            </div>
                            </c:if>
                            <c:if test="${output.status eq '배송완료'}">
                            <div class="col-md-5">
                                 <select name="status" >
                                    <option value="주문취소">주문취소</option>
                                    <option value="주문완료">주문완료</option>
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료" selected>배송완료</option>
                                </select>
                            </div>
                            </c:if>
                             <c:if test="${output.status eq '주문취소'}">
                            <div class="col-md-5">
                                 <select name="status" >
                                    <option value="주문취소" selected>주문취소</option>
                                    <option value="주문완료">주문완료</option>
                                    <option value="배송대기">배송대기</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                            </div>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="orway" class="col-md-1 control-label">결제방식</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="orway" value="${output.pay}" disabled>
                            </div>
                        </div>
                        <hr/>
                        <div class="form-group">
                            <label for="DlvyName" class="col-md-1 control-label">수취인</label>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="DlvyName" name="dlvyName" value="${output.dlvyName}">
                            </div>
                            <label for="DlvyAdr" class="col-md-1 control-label">배송지</label>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="DlvyAdr" name="dlvyAdr"  value="${output.dlvyAdr}">
                            </div>
                            <label for="DlvyTel" class="col-md-1 control-label">수취인 연락처</label>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="DlvyTel" name="dlvyTel" value="${output.dlvyTel}" >
                            </div>
                        </div>
                        
                        <hr/>
						<c:forEach var="item" items="${output2}" varStatus="st">
							<div class="form-group">
	                            <label for="prodno" class="col-md-1 control-label" >상품번호</label>
	                            <div class="col-md-1">
	                                <input type="text" class="form-control" id="prodno" value="${item.prdno }" disabled>
	                            </div>
	                            <label for="prodti" class="col-md-1 control-label">상품명</label>
	                            <div class="col-md-5">
	                                <input type="text" class="form-control" id="prodti" value="${item.title }" disabled>
	                            </div>
	                            <label for="prodqty" class="col-md-1 control-label">수량</label>
	                            <div class="col-md-1">
	                                <input type="text" class="form-control" id="prodqty" value="${item.qty }" disabled>
	                            </div>
	                            <label for="prodprice" class="col-md-1 control-label">합계 금액</label>
	                            <div class="col-md-1">
	                                <input type="text" class="form-control" id="prodprice" value="${item.qty * item.price}" disabled>
	                            </div>
                        	</div>
						</c:forEach>
						<div class="form-group">
                            <label  class="col-md-1 control-label">배송비</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control"  value="${output.fee}" disabled>
                            </div>
                            <label  class="col-md-1 control-label">할인액</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control"  value="${output.disAmount}" disabled>
                            </div>
                            <label  class="col-md-1 control-label">최종금액</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control"  value="${output.toPrice}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-6">
                                <button type="submit" class="btn btn-primary btn-block" >수정</button>
                                <button type="button" class="btn btn-primary btn-block" onclick="location.href ='${pageContext.request.contextPath}/admin/order_list.do';">목록</button>
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
       
        $(function(){

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