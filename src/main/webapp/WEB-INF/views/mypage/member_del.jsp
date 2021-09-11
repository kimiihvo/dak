<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/member_del.css">
</head>

<body>

    <header>
		<%@ include file="/WEB-INF/views/common/header2.jsp" %>
    </header>


    <section>
        <div class= "member-del-header-wrap">
            <div class= "member-del-header">
                <h2><a class= "member-del-back-btn" href="#"><img src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png" alt="뒤로가기버튼"></a>
                회원탈퇴</h2>
            </div>
        </div>

        <form name="member-del-check" class="member-del-section-wrap" action="${pageContext.request.contextPath}/mypage/member_del_ok.do" method="post">
            <div class="member-del-section">
                <p>
                    <span class="star">*</span>
                    탈퇴하실 경우 구매내역 확인은 물론 로그인 후 가능한 모든 기능은 사용하실 수 없습니다.
                </p>
                <p>
                    <span class="star">*</span>
                    탈퇴하신 후에 회원 정보의 복구는 불가능하며, 보유하신 쿠폰이나 적립금도 모두 무효화됩니다.
                </p>
                <p>
                    <span class="star">*</span>
                    탈퇴하신 후 동일한 이메일, 휴대폰 번호로 재가입은 탈퇴일로부터 90일 이후 가능합니다.
                </p>
                <div class="pwd-check">
                    <input class="pwd" type="password" name="memPw" placeholder="비밀번호">
                </div>

                <div class="counsel-content">
                    <textarea name="outWhy" rows="10" placeholder="탈퇴사유"></textarea>
                </div>


                <div class="del-btn clear">

                    <span>
                        <a href="#">
                            <input type="submit" value="확인">
                        </a>
                    </span>
                    <span>
                        <a href="${pageContext.request.contextPath}">취소</a>
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
            $(".member-del-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });

        });
    </script>
</body>

</html>