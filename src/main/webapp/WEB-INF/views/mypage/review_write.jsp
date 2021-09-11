<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/order_list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/order_list_detail.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/review_write.css">

</head>
<body>

	<div id="menu"><%@ include
			file="/WEB-INF/views/common/menutab.jsp"%></div>

	<div id="mainpage">

		<header><%@ include file="/WEB-INF/views/common/header2.jsp"%></header>


		<section>
			<div class="odr-list-header-wrap">
				<div class="odr-list-header">
					<h2>
						<a class="odr-list-back-btn" href="#"><img
							src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
							alt="뒤로가기버튼"></a> 후기작성하기
					</h2>
				</div>
			</div>


			<div class="odr-list-section-wrap">
				<div class="odr-list-section">
					<p class="review-notice">
						- 상품과 관련 없는 내용이 포함된 후기는 <strong>예고없이 블라인드</strong> 처리될 수 있습니다.
					</p>

					<div class="review-wr-cnt-wrap">
						<div class="review-wr-cnt">
							<ul class="odr-detail-ul">

								<li class="list-cnt clear">
									<div class="cnt-img">
										<img src="${product.thumb}" alt="상품썸네일이미지">
									</div>
									<div class="cnt-right">
										<p class="prd-name">${product.title}</p>
									</div>
								</li>

							</ul>
							<form enctype="multipart/form-data" method="POST"
								action="${pageContext.request.contextPath}/mypage/review_write_ok.do?prdno=${product.prdno}&odrno=${list.get(0)}">
								<div class="review-rating">
									<h2>평점</h2>
									<div class="rating-val">
										<a class="rating_star star-1" href="#"><img
											src="${pageContext.request.contextPath}/assets/img/star2.png"
											alt="별점"></a> 
											
											<a class="rating_star star-2" href="#">
											<img
											src="${pageContext.request.contextPath}/assets/img/star2.png"
											alt="별점"></a> 
											
											<a class="rating_star star-3" href="#"><img
											src="${pageContext.request.contextPath}/assets/img/star2.png"
											alt="별점"></a> 
											
											<a class="rating_star star-4" href="#"><img
											src="${pageContext.request.contextPath}/assets/img/star2.png"
											alt="별점"></a> 
											
											<a class="rating_star star-5" href="#">
												<img src="${pageContext.request.contextPath}/assets/img/star2.png"
											alt="별점">
											</a> 
											<input type="hidden" name="memRating" id="memRating" value="5"
											>
											
									</div>
								</div>
								<div class="review-txt">
									<h2>구매후기</h2>
									<textarea required id="content" name="content"  name="content"
										placeholder="구매후기를 작성해주세요"></textarea><div id="content_cnt">(0 / 200)</div>
								</div>

								<div class="filebox">
									<label for="file-btn">파일 첨부</label> <input id="file-btn"
										type="file" name="img"> <input type="text"
										class="file-name" placeholder="선택된 파일 없음" readonly>
								</div>
								<p class="caution1 caution">* 구매하신 상품 관련 문의는 '1:1문의'를 이용해주세요.</p>
								<p class="caution2 caution">* 상품과 무관한 사진(캡쳐사진 포함), 내용은 통보없이 삭제될 수
									있습니다.</p>
								<button type="submit" class="submit">작성하기</button>
							</form>
						</div>
					</div>



				</div>
			</div>

		</section>

		<footer><%@ include file="/WEB-INF/views/common/footer.jsp"%></footer>

	</div>

	<script type="text/javascript">
		$(function() {
			
				$(document).on('change','#file-btn',function() {
						var fileValue = $("#file-btn").val().split("\\");
						var fileName = fileValue[fileValue.length-1]; 
						$('.file-name').val(fileName);	
					});
				
			    $(document).ready(function() {
			        $('#content').on('keyup', function() {
			            $('#content_cnt').html("("+$(this).val().length+" / 200)");
			 
			            if($(this).val().length >200) {
			                $(this).val($(this).val().substring(0, 200));
			                $('#content_cnt').html("(200 / 200)");
			            }
			        });
			    });

				/* 뒤로가기 버튼 */
				$(".odr-list-back-btn").click(function(e){
					e.preventDefault();
						window.history.back();
					});
				
				offStar="${pageContext.request.contextPath}/assets/img/star_off.png";
				star="${pageContext.request.contextPath}/assets/img/star2.png";
				$(".star-1").click(function(e){
					e.preventDefault();
					$(".star-1 > img").attr('src',star);
					$(".star-2 > img").attr('src',offStar);
					$(".star-3 > img").attr('src',offStar);
					$(".star-4 > img").attr('src',offStar);
					$(".star-5 > img").attr('src',offStar);
					$("#memRating").val(1);
				});
				$(".star-2").click(function(e){
					e.preventDefault();
					if($(".star-1 > img").attr('src')==star &&$(".star-3 > img").attr('src')==offStar) {
						if($(".star-2 > img").attr('src')==star){
							$(".star-2 > img").attr('src',offStar);
							$("#memRating").val(1);
						}else{
							$(".star-2 > img").attr('src',star);
						    $("#memRating").val(2);
						}
					}else {
							$(".star-1 > img").attr('src',star);
							$(".star-2 > img").attr('src',star);
							$(".star-3 > img").attr('src',offStar);
							$(".star-4 > img").attr('src',offStar);
							$(".star-5 > img").attr('src',offStar);
							$("#memRating").val(2);
						}
					
				});
				$(".star-3").click(function(e){
					e.preventDefault();
					if($(".star-2> img").attr('src')==star &&$(".star-4 > img").attr('src')==offStar) {
						if($(".star-3 > img").attr('src')==star){
							$(".star-3 > img").attr('src',offStar);
							$("#memRating").val(2);
						}else{$(".star-3 > img").attr('src',star);
						    $("#memRating").val(3);
						}
					
						}else {
							$(".star-1 > img").attr('src',star);
							$(".star-2 > img").attr('src',star);
							$(".star-3 > img").attr('src',star);
							$(".star-4 > img").attr('src',offStar);
							$(".star-5 > img").attr('src',offStar);
							$("#memRating").val(3);
						}
					
				});
				$(".star-4").click(function(e){
					e.preventDefault();
					if($(".star-3> img").attr('src')==star &&$(".star-5 > img").attr('src')==offStar) {
						if($(".star-4 > img").attr('src')==star){
							$(".star-4 > img").attr('src',offStar);
							$("#memRating").val(3);
						}else{$(".star-4 > img").attr('src',star);
						    $("#memRating").val(4);
						}
						}else {
							$(".star-1 > img").attr('src',star);
							$(".star-2 > img").attr('src',star);
							$(".star-3 > img").attr('src',star);
							$(".star-4 > img").attr('src',star);
							$(".star-5 > img").attr('src',offStar);
							$("#memRating").val(4);
						}
					
				});
				$(".star-5").click(function(e){
					e.preventDefault();
					if($(".star-4> img").attr('src')==star) {
						if($(".star-5> img").attr('src')==star){
						$(".star-5 > img").attr('src',offStar);
						$("#memRating").val(4);
						}else {
							$(".star-5 > img").attr('src',star);
							$("#memRating").val(5);
						}
				}else {
					$(".star-1 > img").attr('src',star);
					$(".star-2 > img").attr('src',star);
					$(".star-3 > img").attr('src',star);
					$(".star-4 > img").attr('src',star);
					$(".star-5 > img").attr('src',star);
					$("#memRating").val(5);
				}
					
				});
				
				
				
				/** 클릭 시 메뉴 탭 숨김, 표시 처리 */
				$(document).on('click', ".top-menu", function(e) {
					e.preventDefault();
					if($("#menutab").css("display")=="none"){
						$("#menutab").css("display", "block");
						$("#mainpage").css("display", "none");
					}
				});

				$(document).on('click', ".close-icon", function(e) {
					e.preventDefault();
					if($("#menutab").css("display")=="block"){
						$("#menutab").css("display", "none");
						$("#mainpage").css("display", "block");
					}
				});


			});
		</script>
</body>
</html>