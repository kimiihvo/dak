<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/member_edit_check.css">
</head>

<body>

    <header>
		<%@ include file="/WEB-INF/views/common/header2.jsp" %>
    </header>


    <section>
        <div class= "member-edit-header-wrap">
            <div class= "member-edit-header">
                <h2><a class= "member-edit-back-btn" href="${pageContext.request.contextPath}/mypage/mypage_index.do"><img src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png" alt="뒤로가기버튼"></a>
                회원정보수정</h2>
            </div>
        </div>

        <form name="member-edit-check" class="member-edit-section-wrap" action="${pageContext.request.contextPath}/mypage/member_edit_check_ok.do" method="post">
            <div class="member-edit-section">
            	
            	<input type="hidden" name="memId" value="${m.memId}" />
            	
                <p>
                    <span class="star">*</span>
                    고객님의 안전한 정보보호를 위하여 비밀번호를 다시 한번 확인합니다.
                </p>
                <p>
                    <span class="star">*</span>
                    비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.
                </p>
                <div class="pwd-check">
                    <input class="pwd" type="password" name="memPw" placeholder="비밀번호">
                </div>


                <div class="edit-btn clear">

                    <span>
                        <a href="#">
                            <input type="submit" value="확인">
                        </a>
                    </span>
                    <span>
                        <a href="${pageContext.request.contextPath}/mypage/mypage_index.do">취소</a>
                    </span>

                </div>


            </div>
        </form>




    </section>


    <footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>






    <script type="text/javascript">
        $(function() {

            /* 뒤로가기 버튼 */
            $(".member-edit-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });



        });
    </script>
</body>

</html>