<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/one_on_one_write.css">
</head>
<body>

    <header>
	<%@ include file="/WEB-INF/views/common/header2.jsp" %>
    </header>


    <section>
        <div class= "counsel-header-wrap">
            <div class= "counsel-header">
                <h2><a class= "counsel-back-btn" href="#"><img src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png" alt="뒤로가기버튼"></a>
                1:1문의</h2>
            </div>
        </div>
        <div class= "counsel-section-wrap">
            <div class="counsel-section">
                <h3>1:1 문의하기</h3>


                <form name="counsel" class="counsel-wrap" enctype="multipart/form-data" action="${pageContext.request.contextPath}/mypage/oneonone_write_ok.do" method="POST">
                    <div class="counsel-form">
                        <div class="counsel-write">
                            <div class="counsel-select">
                                <select name="category">
                                    <option value="1">상품관련</option>
                                    <option value="2">주문 및 결제</option>
                                    <option value="3">배송관련</option>
                                    <option value="4">취소/반품</option>
                                    <option value="5">기타</option>
                                </select>
                            </div>

                            <div class="counsel-title">
                                <input type="text" id="title" name="title" placeholder="제목" required>
                                <div id="title_cnt">(0 / 25)</div>
                            </div>
                            <div class="counsel-content">
                                <textarea name="content" id="content" rows="10" placeholder="문의내용" required></textarea>
                            	<div id="content_cnt">(0 / 500)</div>
                            </div>
                            <div class="filebox">
                                <label for="file-btn">파일 첨부</label>
                                <input id="file-btn" type="file" name="img">
                                <input type="text" class="file-name" placeholder="선택된 파일 없음" readonly>
                            </div>
                        </div>

                    </div>

                    <div class="counsel-btn clear">
                        <span>
                            <a href="${pageContext.request.contextPath}/mypage/mypage_index.do">돌아가기</a>
                        </span>
                        <span>
                            <a>
                                <input type="submit" value="문의하기">
                            </a>
                        </span>

                    </div>

                </form>




        </div>
	</div>
    </section>

    <footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>



    <script type="text/javascript">
        $(function() {

            /* 뒤로가기 버튼 */
            $(".counsel-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });
            

			$(document).on('change','#file-btn',function(e) {
				e.preventDefault();
					var fileValue = $("#file-btn").val().split("\\");
					var fileName = fileValue[fileValue.length-1]; 
					$('.file-name').val(fileName);	
				});

		    $(document).ready(function() {
		        $('#content').on('keyup', function() {
		            $('#content_cnt').html("("+$(this).val().length+" / 500)");
		 
		            if($(this).val().length >500) {
		                $(this).val($(this).val().substring(0, 500));
		                $('#content_cnt').html("(500 / 500)");
		            }
		        });
		    });
		    $(document).ready(function() {
		        $('#title').on('keyup', function() {
		            $('#title_cnt').html("("+$(this).val().length+" / 25)");
		 
		            if($(this).val().length >25) {
		                $(this).val($(this).val().substring(0, 25));
		                $('#title_cnt').html("(25 / 25)");
		            }
		        });
		    });


        });
    </script>
</body>
</html>