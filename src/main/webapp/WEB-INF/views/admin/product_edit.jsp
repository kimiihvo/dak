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
                <form class="form-horizontal" method="POST" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/product_edit_ok.do?prdno=${output.prdno}">
                    <fieldset>
                        <legend>상품 수정</legend>
                        <div class="form-group">
                            <label for="productn" class="col-md-2 control-label">상품명</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" value="${output.title }" name="title" placeholder="상품명을 입력하세요.">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Main-Category</label>
                            <div class="col-md-4" class="form-group">
                                <select id="parent" name="main">
                                    <option value="${output.mainCateNo }" selected> ${output.mainCateName }</option>
                                </select>
                            </div>
                            <label class="col-md-2 control-label">Sub-Category</label>
                            <div class="col-md-4" class="form-group" >
                                <select id="child" name="sub">
                                    <option value="${output.subCateNo }" selected>  ${output.subCateName }</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="control-label col-md-2">가격</label>
                            <div class="col-md-2">
                                <input type="text" name="price"  value="${output.price}" class="form-control"  placeholder="가격을 입력하세요.">
                            </div>
                        </div>
                         <div class="form-group">
                            <label  class="col-md-2 control-label">중량</label>
                            <div class="col-md-2">
                                <input type="text" name="weight"  value="${output.weight }" class="form-control"  placeholder="중량을 입력하세요.">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-md-2 control-label">배송방법</label>
                            <c:if test="${output.express eq 'Y'and output.freeShipping ne 'Y'}">
                            <div class="col-md-10">
                                <select name="deli" >
                                    <option value="1" selected >특급배송</option>
                                    <option value="2">무료배송</option>
                                    <option value="3">배송비</option>
                                </select>
                            </div>
                            </c:if>
                            <c:if test="${output.freeShipping eq 'Y' and output.express ne 'Y'}">
                            <div class="col-md-10">
                                <select name="deli" >
                                    <option value="1">특급배송</option>
                                    <option value="2" selected >무료배송</option>
                                    <option value="3">배송비</option>
                                </select>
                            </div>
                            </c:if>
                            <c:if test="${output.freeShipping ne 'Y' and output.express ne 'Y'}">
                            <div class="col-md-10">
                                <select name="deli" >
                                    <option value="0">특급배송</option>
                                    <option value="1">무료배송</option>
                                    <option value="2" selected >배송비</option>
                                </select>
                            </div>
                            </c:if>
                        </div>
                       
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">메인변경</label>
                            <div class="col-md-10">
                                <input type="file" name="mainImg" class="form-control" >
                            </div>
                            <label for="" class="col-md-2 control-label">메인이미지</label>
                            <div class="col-md-10">
                            	<img src="${output.mainImg }" width="200">
                            </div>
                            <label for="" class="col-md-2 control-label">디테일변경</label>
                            <div class="col-md-10">
                                <input type="file" name="detailImg" class="form-control" >
                            </div>
                             <label for="" class="col-md-2 control-label">디테일이미지</label>
                            <div class="col-md-10 scroll">
                            	<img src="${output.detailImg }" width="200">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" class="btn btn-primary btn-block">수정</button>
                                <button type="button" id="del-item" class="btn btn-primary btn-block">삭제</button>
                                <button type="button" onclick="location.href ='${pageContext.request.contextPath}/admin/product_reg.do';"class="btn btn-primary btn-block">상품등록페이지로 이동</button>
                                <button type="button" class="btn btn-primary btn-block" onclick="location.href ='${pageContext.request.contextPath}/admin/product_list.do';" >목록으로 이동</button>
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
      
    $(function(){
    	    var check= false;
			var isclickc = false;
    		var isclickp = false;
    		$(document).on('click','#child',function(){
    			if(!isclickc) {
	    			$("#child").empty();
	         		var choice = $("#parent").find("option:selected").val();
	         		if (!choice) {
	         			return false;
         			}
	    			$.get("${pageContext.request.contextPath}/admin/sub_cate",{param:choice}, function(req) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	             		var template = Handlebars.compile($("#sub-cate-tmpl").html());
	             		var html = template(req);
	             		$("#child").append(html);
	             	});
    			}
    			isclickc = true;
    		});
       	   	$(document).on('click','#parent',function() {
       	   		if(!isclickp) {
       	   		$("#parent").empty();
            		$.get("${pageContext.request.contextPath}/admin/main_cate", function(json) {
                		var template = Handlebars.compile($("#main-cate-tmpl").html());
                		var html = template(json);
                		$("#parent").append(html);
                		check=true;
        			});
       	   	  	}
       	   		if(check==true){
		       	   	$("#child").empty();
		     		var choice = $("#parent").find("option:selected").val();
		     		if (!choice) {
		     			return false;
		     		}
		     		$.get("${pageContext.request.contextPath}/admin/sub_cate",{param:choice}, function(req) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		         		var template = Handlebars.compile($("#sub-cate-tmpl").html());
		         		var html = template(req);
		         		$("#child").append(html);
		         	});
       	   		}
       	   			check=false;
            		isclickp = true;
            	});
       		$(document).on('change','#parent',function() {
         		$("#child").empty();
         		var choice = $("#parent").find("option:selected").val();
         		if (!choice) {
         			return false;
         		}
         		$.get("${pageContext.request.contextPath}/admin/sub_cate",{param:choice}, function(req) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
             		var template = Handlebars.compile($("#sub-cate-tmpl").html());
             		var html = template(req);
             		$("#child").append(html);
             	});
         	});
           
           	
       		$(document).ready(function(){ 
       			$('#del-item').click(function() {
       				var result = confirm('정녕 삭제하실 건가요?'); 
       				if(result) {
       					location.href ='${pageContext.request.contextPath}/admin/product_delete_ok.do?prdno=${output.prdno}';
       				}
       				else { return false; } 
       				
       			}); 
       			
       		});
       		
       		
       		
	
             	
            

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