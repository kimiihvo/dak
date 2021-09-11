<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="../assets/css/find.css">
</head>

<body>

    <header>
    </header>

    <main>
        <div id="find" class="box_member">
            <div>
                <h2 class="title"><a href="javascript:history.back()"></a>아이디/비밀번호 찾기</h2>
            </div>

            <div class="tabs">
                <ul class="tab_login tabmenu">
                    <li class="tab tab_find1 active"><a href="#">아이디</a></li>
                    <li class="tab tab_find2"><a href="#">비밀번호</a></li>
                </ul>
            </div>
            <div class="tab_contents">
                <div class="tab_content active">
                    <!-- 아이디 찾기 ! -->
                    <form method="post" action="${pageContext.request.contextPath}/member/find_id_ok.do">
                        <fieldset class="find_field">
                            <div class="fld">
                                <label for="find_id_name">이름</label>
                                <input type="text" name="memName" id="find_id_name" class="form_input member">
                            </div>
                            <div class="fld find_id_item_3">
                                <label for="find_id_cell">휴대폰번호</label>
                                <input type="text" name="phone[]" maxlength="3" id="find_id_cell" class="form_input member number_first">
                                <input type="text" name="phone[]" maxlength="4" id="find_id_cell2" class="form_input member number">
                                <input type="text" name="phone[]" maxlength="4" id="find_id_cell3" class="form_input member number">
                            </div>

                            <span class="box_btn block large strong orange"><input type="submit" value="확인"></span>
                        </fieldset>
                    </form>
                </div>

                <div class="tab_content">
                    <!-- 비밀번호 찾기! -->
                    <form method="post" action="${pageContext.request.contextPath}/member/find_pw_ok.do">
                    	<fieldset>
        					<legend class="hidden">비밀번호 찾기</legend>
        					<div class="fld">
        						<label for="find_pwd_id">아이디</label>
        						<input type="text" name="memId" id="find_pwd_id" class="form_input member">
        					</div>
        					<div class="fld">
        						<label for="find_pwd_name">이름</label>
        						<input type="text" name="memName" id="find_pwd_name" class="form_input member">
        					</div>
        					<div class="fld find_pw_item_2">
        						<label for="find_pwd_email">이메일</label>
        						<input type="text" name="email" id="find_pwd_email" class="form_input member">
        					</div>
        					<span class="box_btn block large orange strong"><input type="submit" value="확인"></span>
        				</fieldset>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <footer>
    </footer>


    <script type="text/javascript">

        // 아이디 비밀번호 찾기 상단부 탭 처리
        $('#find .tabmenu .tab a').on('click',function(e){
            e.preventDefault();
            var n = $('#find .tabmenu .tab a').index($(this));
            $('#find .tabmenu .tab').eq(n).addClass('active').siblings().removeClass('active');
            $('#find .tab_contents .tab_content').eq(n).addClass('active').siblings().removeClass('active');
        });

        $(function() {

        });
    </script>
</body>

</html>