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
                <form class="form-horizontal" method="POST" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/product_reg_ok.do">
                    <fieldset>
                        <legend>상품 등록</legend>
                        <div class="form-group">
                            <label for="productn" class="col-md-2 control-label">상품명</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="title" placeholder="상품명을 입력하세요." required> 
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Main-Category</label>
                            <div class="col-md-4" class="form-group">
                                <select id="parent" name="main">
                                    <option> 메인 카테고리를 선택하세요.</option>
                                </select>
                            </div>
                            <label class="col-md-2 control-label">Sub-Category</label>
                            <div class="col-md-4" class="form-group" >
                                <select id="child" name="sub">
                                    <option> 서브 카테고리를 선택하세요.</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="control-label col-md-2">가격</label>
                            <div class="col-md-2">
                                <input type="text" name="price" class="form-control"  placeholder="가격을 입력하세요." required>
                            </div>
                        </div>
                         <div class="form-group">
                            <label  class="col-md-2 control-label">중량</label>
                            <div class="col-md-2">
                                <input type="text" name="weight" class="form-control"  placeholder="중량을 입력하세요.(g)" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-md-2 control-label">배송방법</label>
                            <div class="col-md-10">
                                <select name="deli" >
                                    <option value="1">특급배송</option>
                                    <option value="2">무료배송</option>
                                    <option value="3">배송비</option>
                                </select>
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">메인이미지</label>
                            <div class="col-md-10 ">
                                <input type="file" name="mainImg" class="form-control" required >
                            </div>
                            <label for="" class="col-md-2 control-label">디테일이미지</label>
                            <div class="col-md-10 3">
                                <input type="file" name="detailImg" class="form-control" required >
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" class="btn btn-primary btn-block">등록</button>
                                <button type="button" class="btn btn-primary btn-block" onclick="location.href ='${pageContext.request.contextPath}/admin/product_list.do';">목록</button>
                            </div>
                        </div>
                 </fieldset>
            </form>
        </div>
    </div>         
  </div>
 	
	
	
	
	
    <!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script id="main-cate-tmpl" type="text/x-handlebars-template">
	{{#each .}}
	<option value="{{mainCateNo}}">{{mainCateName}}</option>
	{{/each}}
	</script>
	
	<script id="sub-cate-tmpl" type="text/x-handlebars-template">
	{{#each .}}
	<option value="{{subCateNo}}">{{subCateName}}</option>
	{{/each}}
	</script>
	
    <script type="text/javascript">
        function goback() {
                window.history.back();
            }
        
        
        $(function(){
    		$(document).ready(function() { 
    			
    			$.get("${pageContext.request.contextPath}/admin/main_cate", function(json) {
            		var template = Handlebars.compile($("#main-cate-tmpl").html());
            		var html = template(json);
            		$("#parent").append(html);
    			})
        	})
        })
        
        $(function() {
        	$(document).on('change','#parent',function(){
        		$("#parent>option:first").hide();
        		$("#child").empty();
        		var choice = $(this).find("option:selected").val();
        		console.log(choice);
        		if (!choice) {
        			return false;
        		}
        		
        		$.get("${pageContext.request.contextPath}/admin/sub_cate", {param:choice}, function(req) {
            		var template =Handlebars.compile($("#sub-cate-tmpl").html());
            		var html = template(req);
            		$("#child").append(html);
            	})
        	})
        })
       
        $(function(){
            // 첫번째 열어놓기
            $(".menu>ul>li").not(":eq(0)").find("li").hide();

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