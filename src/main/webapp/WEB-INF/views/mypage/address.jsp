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
	href="${pageContext.request.contextPath}/assets/css/my_address.css">

</head>
<body>

	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%>
	</div>





	<div id="my-adr-inner-add" class="my-adr-inner">
		<div class="myadr-inner-header-wrap">
			<div class="myadr-inner-header">
				<h2>
					<a class="myadr-back-btn" href="#" > <img class="inner-close"
						src="${pageContext.request.contextPath}/assets/img/close_type2.png"
						alt="닫기버튼">
					</a> 배송지추가
				</h2>
			</div>
		</div>

		<form method="post" action="${pageContext.request.contextPath}/mypage/address_add_ok.do" >
		
		<div class="myadr-inner-form-wrap">
			<div class="myadr-inner-form">

				<table>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>

					<tbody>

						<tr>
							<th>받는 분 <span class="star">*</span>
							</th>
							<td><input type="text" name="toName" maxlength="10"></td>
						</tr>

						<tr>
							<th>주소 <span class="star">*</span>
							</th>
							<td><input type="text" name="zcode" id="postcode1" readonly> <a
								id="post-search" href="#">우편번호 검색</a></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" name="adr1" id="adr-1" class="placeholder"
								readonly placeholder="기본주소"> <input type="text" name="adr2"
								id="adr-2" class="placeholder" placeholder="상세주소"></td>
						</tr>

						<tr>
							<th>휴대폰 <span class="star">*</span>
							</th>
							<td class="adr-phone">
							<select name="phone1" class="phone-010">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>
							
							<input type="text" name="phone2" placeholder="휴대폰 번호를 (-) 빼고 입력해주세요"></td>
						</tr>

						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="checkbox" name="isDefault" value="Y" id="default-adr"> <label
								for="default-adr">기본배송지로 등록</label></td>
						</tr>
					</tbody>
				</table>


			</div>

			<div>
				<div class="myadr-inner-btn">
					<button class="adr-add-btn" type="submit">확인</button>
					
				</div>
			</div>
			</div>
		</form>

	</div>




	<%-- <div id="my-adr-inner-edit" class="my-adr-inner">
		<div class="myadr-inner-header-wrap">
			<div class="myadr-inner-header">
				<h2>
					<a class="myadr-back-btn" href="#"> <img class="inner-close"
						src="${pageContext.request.contextPath}/assets/img/close_type2.png"
						alt="닫기버튼">
					</a> 배송지수정
				</h2>
			</div>
		</div>
		
		<form method="post" action="${pageContext.request.contextPath}/mypage/address_edit_ok.do">
		<div class="myadr-inner-form-wrap">
			<div class="myadr-inner-form">

				<table>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>

					<tbody>

						<tr>
							<th>받는 분 <span class="star">*</span>
							</th>
							<td><input type="text" id="" maxlength="10" value="${i.toName }">
							</td>
						</tr>

						<tr>
							<th>주소 <span class="star">*</span>
							</th>
							<td><input type="text" readonly id="postcode2" value="${i.zcode}">
								<a id="post-search" href="#">우편번호 검색</a></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" id="adr-3" class="placeholder"
								readonly placeholder="기본주소" value="서울특별시 서초구 서초대로77길 55(서초동)">
								<input type="text" id="adr-4" class="placeholder"
								placeholder="상세주소" value="3층 이젠아이티아카데미"></td>
						</tr>

						<tr>
							<th>휴대폰 <span class="star">*</span>
							</th>
							<td class="adr-phone"><select class="phone-010">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> <input type="text" value="00000000"></td>
						</tr>

						<tr>
							<th>전화번호</th>
							<td><input type="text" id=""></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="checkbox" id="default-adr"> <label
								for="default-adr">기본배송지로 등록</label></td>
						</tr>
					</tbody>
				</table>


			</div>

			<div>
				<div class="myadr-inner-btn">
					<a href="#">확인</a>
				</div>
			</div>
		</div>
		</form>

	</div> --%>




	<div id="mainpage">
		<header>
			<%@ include file="/WEB-INF/views/common/header2.jsp"%>
		</header>


		<section>
			<div class="myadr-header-wrap clear">
				<div class="myadr-header">
					<a class="myadr-back-btn" href="#"><img
						src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png"
						alt="뒤로가기버튼"></a>
					<h2>배송지관리</h2>
				</div>
			</div>

			<div class="myadr-section">

				<div class="myadr-section-top">
					<a class="add-adr" href="#">신규 배송지 추가</a>
				</div>


				<c:choose>

					<c:when test="${output==null || fn:length(output)==0}">
						<p class="empty">등록된 배송지가 없습니다.</p>
					</c:when>

					<c:otherwise>
						<c:forEach var="item" items="${output}" varStatus="status">
						

							<div class="myadr-section-mid">
							
							<input type="hidden" value="${item.adrno}">

								<div class="myadr-section-mid-row-1">
									<span class="myadr-name"> ${item.toName} </span> <span
										class="myadr-phone">${item.phone}</span>
								</div>

								<div class="myadr-section-mid-row-2">
									<span class="myadr-adr"> ${item.adr1}&nbsp;${item.adr2}
									</span>
									<c:if test="${'Y' eq item.express}">
										<img
											src="${pageContext.request.contextPath}/assets/img/express_delivery.png">
									</c:if>
								</div>

								<div class="myadr-section-mid-row-3">
									<a class="edit-adr" href="${pageContext.request.contextPath}/mypage/address_edit.do?adrno=${item.adrno}">수정</a> 
									<a class="del-adr" href="${pageContext.request.contextPath}/mypage/address_delete_ok.do?adrno=${item.adrno}">삭제</a>
									<c:if test="${'Y' eq item.isDefault}">
										<a class="default-address" href="">기본배송지</a>
									</c:if>
								</div>


							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>






		</section>



		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>





		<!-- 최근 본 상품 및 최상단으로 이동 버튼 -->
		<div id="recent-bar" class="recent-viewed-wrapper">
			<div class="recent-viewed">
				<a href="#"><img
					src="${pageContext.request.contextPath}/assets/img/new_06.jpg"></a>
				<span class="recent-count">9</span>
			</div>
			<a href="#"><div class="top-btn"></div></a>

		</div>
	</div>


	<script src="../assets/js/swiper-bundle.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
        $(function() {

            /*-----------------------김지효--------------------------*/
            
            /* 뒤로가기 버튼 */
            $(".myadr-back-btn").click(function(e){
            	e.preventDefault();
                    window.history.back();
                });


            /** 클릭 시 배송지추가 탭 숨김, 표시 처리 */
            $(".add-adr").click(function (e) {
            	e.preventDefault();
                if($("#my-adr-inner-add").css("display")=="none"){
                    $("#my-adr-inner-add").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(".inner-close").click(function (e) {
            	e.preventDefault();
                if($("#my-adr-inner-add").css("display")=="block"){
                    $("#my-adr-inner-add").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });

            /** 클릭 시 배송지수정 탭 숨김, 표시 처리 */
            $(".edit-adr").click(function (e) {
            	e.preventDefault();
                if($("#my-adr-inner-edit").css("display")=="none"){
                    $("#my-adr-inner-edit").css("display", "block");
                    $("#mainpage").css("display", "none");
                }
            });

            $(".inner-close").click(function (e) {
            	e.preventDefault();
                if($("#my-adr-inner-edit").css("display")=="block"){
                    $("#my-adr-inner-edit").css("display", "none");
                    $("#mainpage").css("display", "block");
                }
            });


            // 최근상품 구역 구현 --- 조원우 ---
            var original_top = $(window).scrollTop();
            var scroll_direction;
            $(window).scroll(function(){
                var current_top = $(window).scrollTop();
                if(original_top < current_top)
                {
                    $('#recent-bar').css("bottom", "-46px");
                }
                else
                {
                    $('#recent-bar').css("bottom", "10px");
                }
                original_top = current_top;

            });
            // --- 조원우 ---
            function postcode() {

                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    }
                }).open();

            }


            /* 우편번호 검색 */

            $("#my-adr-inner-add #post-search,#my-adr-inner-add #new-adr,#my-adr-inner-add #adr-1").click(function(){
                new daum.Postcode({

                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            // document.getElementById("sample6_extraAddress").value = extraAddr;

                        } else {
                            // document.getElementById("sample6_extraAddress").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $('#postcode1').val(data.zonecode);
                        $('#adr-1').val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        $('#adr-2').focus();
                    }

                }).open();
            });
            
            $("#my-adr-inner-edit #post-search,#my-adr-inner-edit #new-adr,#my-adr-inner-edit #adr-1").click(function(){
                new daum.Postcode({

                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            // document.getElementById("sample6_extraAddress").value = extraAddr;

                        } else {
                            // document.getElementById("sample6_extraAddress").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $('#postcode2').val(data.zonecode);
                        $('#adr-3').val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        $('#adr-4').val("");
                        $('#adr-4').focus();
                    }

                }).open();
            });

            // 우편번호 검색 끝


            /* 배송지 삭제 */
            $(".del-adr").click(function(e){
            	e.preventDefault();
                var result = confirm("삭제하시겠습니까?");

                if(result){
                    //상품 삭제
                    alert("삭제되었습니다.");
                }else{
                	
                	return false;
                }

            });
            // 배송지 삭제 끝

            /* 배송지 수정 */
            $("#my-adr-inner-edit .myadr-inner-btn").click(function(e){
            	e.preventDefault();
                var result = confirm("배송지를 수정하시겠습니까?");

                if(result){
                	
                    location.reload();
                } else{
                	
                	return false;
                }


            });
            // 배송지 수정 끝
            
            /** 클릭 시 메뉴 탭 숨김, 표시 처리 */
			$(document).on('click', ".top-menu", function(e) {
				e.preventDefault();
				if ($("#menutab").css("display") == "none") {
					$("#menutab").css("display", "block");
					$("#mainpage").css("display", "none");
				}
			});

			$(document).on('click', ".close-icon", function(e) {
				e.preventDefault();
				if ($("#menutab").css("display") == "block") {
					$("#menutab").css("display", "none");
					$("#mainpage").css("display", "block");
				}
			});







        });
    </script>
</body>

</html>