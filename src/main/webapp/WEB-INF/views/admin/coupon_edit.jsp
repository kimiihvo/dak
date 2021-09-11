<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <form class="form-horizontal" method="POST" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/coupon_edit_ok.do">
                    <input type="hidden" name="coupno" value="${output.coupno}">
                    <fieldset>
                        <legend>쿠폰수정</legend>
                        <div class="form-group">
                            <label for="productn" class="col-md-2 control-label">쿠폰명</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="title" name="title" value="${output.title}" placeholder="쿠폰명을 입력하세요.">
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="code" class="col-md-2 control-label">쿠폰코드</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="code" name="code" value="${output.code}" placeholder="코드를 입력하세요">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="memno" class="col-md-2 control-label">멤버번호</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="memno" value="${output.memno}" placeholder="멤버번호를 입력하세요">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="expDate" class="col-md-2 control-label">만료일</label>
                            <div class="col-md-3">
                                <input type="date" class="form-control" id="expDate" name="expDate" value="${output.expDate}"> 
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="discount" class="col-md-2 control-label">할인금액</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="discount" name="discount" value="${output.discount}" placeholder="할인금액을 입력하세요">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="orderOver" class="col-md-2 control-label">주문최소금액</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="orderOver" name="orderOver" value="${output.orderOver}" placeholder="주문최소금액을 입력하세요">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="isUsed" class="col-md-2 control-label">사용여부</label>
                            <div class="radio-box">
                            
                           	<c:choose>
                           	<c:when test="${'Y' eq output.isUsed}">
                                <input type="radio" class="radio-input"  name="isUsed" value="Y" checked>&nbsp;사용완료
                                <input type="radio" class="radio-input"  name="isUsed" value="N">&nbsp;미사용
                           	
                           	</c:when>
                           	<c:otherwise>
                  	
                                <input type="radio" class="radio-input"  name="isUsed" value="Y">&nbsp;사용완료
                                <input type="radio" class="radio-input"  name="isUsed" value="N" checked>&nbsp;미사용
                           	</c:otherwise>
                           	
                           </c:choose>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" class="btn btn-primary btn-block">수정</button>
                                <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/coupon_delete_ok.do?coupno=${output.coupno}';" class="btn btn-primary btn-block">삭제</button>
                                <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/coupon_add.do';"class="btn btn-primary btn-block">쿠폰등록페이지로 이동</button>
                                <button type="button" class="btn btn-primary btn-block" onclick="location.href ='${pageContext.request.contextPath}/admin/coupon_list.do';">목록으로 이동</button>
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