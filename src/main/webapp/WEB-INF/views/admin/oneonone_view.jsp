<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <form class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath}/admin/oneonone_view_ok.do?oneno=${output.oneno}&comRegDate=${output.comRegDate}">
                    <fieldset>
                        <legend>1:1답변</legend>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-3">
                                닉네임 : ${output.nick}
                            </div> 
                            <div class="col-md-3">
                                 작성일 : ${output.regDate} 
                            </div>
                            <div class="col-md-3">
                                 분류: ${output.category} 
                            </div>
                            <div class="col-md-offset-2 col-md-3">
                                 제목: ${output.title} 
                            </div> 
                            
                            <div class="col-md-offset-2 col-md-10 oneonone">
                            	
                                <div id="qcontent">Q. ${output.content}
                               </div>
                                <div><img src="${output.file}"/></div>
                            </div>

                        </div>
                        <c:if test="${output.comRegDate eq null}">
                        <div class="form-group">
                            <label for="content" class="col-md-2 control-label">답변</label>
                            <div class="col-md-10">
                                <textarea id="content" class="form-control" rows="6" placeholder="내용을 입력하세요." name="comContent"></textarea>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${output.comRegDate ne null}">
                        <div class="form-group">
                            <label for="content" class="col-md-2 control-label">관리자 답변</label>
                            <div class="col-md-10">
                                <textarea required id="content" class="form-control" rows="6" placeholder="내용을 입력하세요." name="comContent">${output.comContent}</textarea>
                            </div>
                        </div>
                        </c:if>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" class="btn btn-primary btn-block">작성 및 수정</button>
                                <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/oneonone_delete_ok.do?oneno=${output.oneno}';" class="btn btn-primary btn-block">삭제</button>
                                <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/oneonone_list.do';"class="btn btn-primary btn-block">목록으로 이동</button>
                                
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
        function goback() {
                window.history.back();

            }
        $(function(){

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