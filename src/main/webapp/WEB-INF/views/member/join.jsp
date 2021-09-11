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
<link rel="stylesheet" type="text/css" href="../assets/css/join.css">
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>

	<div id="menu">
		<%@ include file="/WEB-INF/views/common/menutab.jsp"%>
	</div>

	<div id="search">
		<%@ include file="/WEB-INF/views/common/search_layer.jsp"%>
	</div>

	<div id="mainpage">

		<header>
			<%@ include file="/WEB-INF/views/common/header2.jsp"%>
		</header>


		<main>
			<div id="join_input">

				<h2>
					<a href="javascript:history.back()"></a>회원가입
				</h2>

				<div class="form-wrapper">
					<form method="post" name="joinFrm" id="join_form" action="${pageContext.request.contextPath}/member/join_ok.do">
						<fieldset class="member_info">
							<legend class="hidden">기본 정보</legend>
							<div class="box">

								<span class="join_div_tit">아이디/비밀번호 <span class="star">*</span></span>

								<div class="addbtn">
									<input type="text" name="mId" id="mId"
										class="form_input" onchange="resetIdCheck();"
										placeholder="아이디"> <a href="#" class="check" onclick="idCheck(); return false;">중복확인</a>
								</div>

								<div>
									<input type="password" name="mPw" id="mPw"
										class="form_input" placeholder="비밀번호">
								</div>

								<div class="chk_pw">
									<input type="password" name="mPw_re" id="mPw_re"
										class="form_input" placeholder="비밀번호 확인">
									<p class="error_msg">비밀번호와 확인 비밀번호가 다릅니다.</p>
								</div>

								<span class="join_div_tit">회원정보 <span class="star">*</span></span>

								<div>
									<input type="text" name="mName" id="mName"
										class="form_input" placeholder="이름">
								</div>

								<div class="addbtn">
									<input type="text" name="nick" maxlength="12"
										id="nick" class="form_input" placeholder="닉네임" onchange="resetNickCheck();"> <a
										href="#" onclick="nickCheck(); return false;"
										class="check">중복확인</a>
								</div>

								<div>
									<input type="text" name="phone" id="phone"
										class="form_input remove_dash" placeholder="휴대폰번호 ( ' - ' 제외한 숫자만 입력부탁 드립니닭!)">
								</div>

								<span class="join_div_tit">이메일 <span class="star">*</span></span>

								<div class="email">
									<input type="text" name="email1" value="" id="email1"
										class="form_input first"><span>@</span><input
										type="text" name="email2" id="email2" value="" class="form_input second">
									<select name="email3" id="email3"
										onchange="changeEmail()">
										<option value="" selected>직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</div>

								<span class="join_div_tit">생년월일 <span class="star">*</span></span>
								<div class="birth">
									<!-- <label>생년월일</label> -->
									<div class="select">
										<select name="birth1" id="birth1" onchange="" class="">
											<option value="">년</option>
											<option value="2006">2006</option>
											<option value="2005">2005</option>
											<option value="2004">2004</option>
											<option value="2003">2003</option>
											<option value="2002">2002</option>
											<option value="2001">2001</option>
											<option value="2000">2000</option>
											<option value="1999">1999</option>
											<option value="1998">1998</option>
											<option value="1997">1997</option>
											<option value="1996">1996</option>
											<option value="1995">1995</option>
											<option value="1994">1994</option>
											<option value="1993">1993</option>
											<option value="1992">1992</option>
											<option value="1991">1991</option>
											<option value="1990">1990</option>
											<option value="1989">1989</option>
											<option value="1988">1988</option>
											<option value="1987">1987</option>
											<option value="1986">1986</option>
											<option value="1985">1985</option>
											<option value="1984">1984</option>
											<option value="1983">1983</option>
											<option value="1982">1982</option>
											<option value="1981">1981</option>
											<option value="1980">1980</option>
											<option value="1979">1979</option>
											<option value="1978">1978</option>
											<option value="1977">1977</option>
											<option value="1976">1976</option>
											<option value="1975">1975</option>
											<option value="1974">1974</option>
											<option value="1973">1973</option>
											<option value="1972">1972</option>
											<option value="1971">1971</option>
											<option value="1970">1970</option>
											<option value="1969">1969</option>
											<option value="1968">1968</option>
											<option value="1967">1967</option>
											<option value="1966">1966</option>
											<option value="1965">1965</option>
											<option value="1964">1964</option>
											<option value="1963">1963</option>
											<option value="1962">1962</option>
											<option value="1961">1961</option>
											<option value="1960">1960</option>
											<option value="1959">1959</option>
											<option value="1958">1958</option>
											<option value="1957">1957</option>
											<option value="1956">1956</option>
											<option value="1955">1955</option>
											<option value="1954">1954</option>
											<option value="1953">1953</option>
											<option value="1952">1952</option>
											<option value="1951">1951</option>
											<option value="1950">1950</option>
											<option value="1949">1949</option>
											<option value="1948">1948</option>
											<option value="1947">1947</option>
											<option value="1946">1946</option>
											<option value="1945">1945</option>
											<option value="1944">1944</option>
											<option value="1943">1943</option>
											<option value="1942">1942</option>
											<option value="1941">1941</option>
											<option value="1940">1940</option>
											<option value="1939">1939</option>
											<option value="1938">1938</option>
											<option value="1937">1937</option>
											<option value="1936">1936</option>
											<option value="1935">1935</option>
											<option value="1934">1934</option>
											<option value="1933">1933</option>
											<option value="1932">1932</option>
											<option value="1931">1931</option>
											<option value="1930">1930</option>
											<option value="1929">1929</option>
											<option value="1928">1928</option>
											<option value="1927">1927</option>
											<option value="1926">1926</option>
											<option value="1925">1925</option>
											<option value="1924">1924</option>
											<option value="1923">1923</option>
											<option value="1922">1922</option>
											<option value="1921">1921</option>
											<option value="1920">1920</option>
											<option value="1919">1919</option>
											<option value="1918">1918</option>
											<option value="1917">1917</option>
											<option value="1916">1916</option>
											<option value="1915">1915</option>
											<option value="1914">1914</option>
											<option value="1913">1913</option>
											<option value="1912">1912</option>
											<option value="1911">1911</option>
											<option value="1910">1910</option>
											<option value="1909">1909</option>
											<option value="1908">1908</option>
											<option value="1907">1907</option>
											<option value="1906">1906</option>
											<option value="1905">1905</option>
											<option value="1904">1904</option>
											<option value="1903">1903</option>
											<option value="1902">1902</option>
											<option value="1901">1901</option>
											<option value="1900">1900</option>
										</select> <select name="birth2" id="birth2" onchange="" class="">
											<option value="">월</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select> <select name="birth3" id="birth3" onchange="" class="">
											<option value="">일</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select>
									</div>
								</div>

								<span class="join_div_tit">성별 </span>

								<div class="type2">
									<div>
										<label for="sex_male" class="sex_male checked ">남자</label> <label
											for="sex_female" class="sex_female ">여자</label> <input
											type="radio" name="gender" value="M" id="sex_male"
											checked="checked"> <input type="radio" name="gender"
											value="F" id="sex_female">
									</div>
								</div>
							</div>
							
							<input type="hidden" value="0" name="isIdChecked" id="isIdChecked">
							<input type="hidden" value="0" name="isNickChecked" id="isNickChecked">
							
						</fieldset>

						<fieldset class="agree">
							<legend>약관 및 서비스 동의</legend>
							<div class="box">

								<div class="total">
									<label for="all_agree"><input type="checkbox"
										name="all_agree" id="all_agree">전체동의</label>
								</div>

								<div class="in_chk" data-ctr-class="agree_area">

									<div class="toggle toggle_agree">
										<p class="check">
											<label for="ck_agree"><input type="checkbox"
												name="ck_agree" id="ck_agree"><span
												class="custom_check"></span><span>[필수]</span> 회원가입약관동의</label>
										</p>
										<div id="cnt_agree" class="cnt">
											<iframe name="" src="" ></iframe>
										</div>
									</div>
									<div class="toggle toggle_privacy">
										<p class="check">
											<label for="ck_privacy"><input type="checkbox"
												name="ck_privacy" id="ck_privacy"><span
												class="custom_check"></span><span>[필수]</span> 개인정보처리방침 동의</label>
										</p>

										<div id="cnt_privacy" class="cnt">
											<table class="tbl_row">
												<tbody>
													<tr>
														<th>수집하는 개인정보 항목</th>
														<td class="tal">회원가입시(회원제 서비스 제공)<br> 필수 : 아이디,
															비밀번호, 이름, 닉네임, 휴대폰번호, 이메일, 생년월일<br> 선택 : 성별
														</td>
													</tr>
													<tr>
														<th>수집 및 이용목적</th>
														<td class="tal">회원관리 및 이용자 식별<br> - 회원 가입의사 확인,
															회원제 서비스 제공, 회원자격 유지관리, 만 14세 미만여부 확인
														</td>
													</tr>
													<tr>
														<th>보유 및 이용기간</th>
														<td>회원가입시 부터 탈퇴하거나, 회원에서 제명된 때까지<br> *동의를 거부할 수
															있으나 거부시 회원가입이 불가능합니다.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="choice">
										<div>
											<label for="join_mailing"> <input type="checkbox"
												name="mailing" value="Y" id="join_mailing"><span
												class="custom_check"></span><span>[선택]</span> 이메일 수신동의
												<p>(할인쿠폰,이벤트,기획전,특가 상품정보)</p>
											</label>
										</div>
										<div>
											<label for="join_sms"> <input type="checkbox"
												name="sms" value="Y" id="join_sms"><span
												class="custom_check"></span><span>[선택]</span> SMS 수신동의
												<p>(할인쿠폰,이벤트,기획전,특가 상품정보)</p>
											</label>
										</div>
									</div>
									<div class="notice">
										<p>※ 회원정보 수정에서 언제든지 수신거부 하실 수 있습니다.</p>
										<p>※ 상품 구매정보는 수신동의 여부 관계없이 받아 보실 수 있습니다.</p>
									</div>
								</div>
							</div>
						</fieldset>
						<span class="box_btn block large orange strong"><input
							type="submit" onclick="return joinCheck();" value="회원가입"></span>
					</form>
				</div>
			</div>
		</main>




		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
	
	<script src="${pageContext.request.contextPath}/assets/js/Join.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/additional-methods.min.js"></script>
	<script type="text/javascript">
	
		function resetIdCheck() {
			$("#isIdChecked").val("0");
		}
		
		function resetNickCheck() {
			$("#isNickChecked").val("0");
		}
		
		/** 아이디 중복검사 */
		function idCheck() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/id_check.do",
				type : "post",
				dataType : "json",
				data : {"memId" : $("#mId").val()},
				success : function(data) {
					if (data == 1) {
						alert("이미 존재하는 아이디입니닭 ㅠ_ㅠ");
					} else if (data == 0) {
						$("#isIdChecked").val("1");
						alert("사용가능한 아이디입니닭!");
					} else if (data == 2) {
						alert("아이디를 입력해 주세요");
					} else if (data == 3) {
						alert("아이디는 영문과 숫자만 가능합니다.");
					}
				}
			})
		}
		
		/** 닉네임 중복검사 */
		function nickCheck() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/nick_check.do",
				type : "post",
				dataType : "json",
				data : {"nick" : $("#nick").val()},
				success : function(data) {
					if (data == 1) {
						alert("이미 존재하는 닉네임입니닭 ㅠ_ㅠ");
					} else if(data == 0) {
						$("#isNickChecked").val("1");
						alert("사용가능한 닉네임입니다!");
					} else if (data == 2) {
						alert("닉네임을 입력해 주세요");
					}
				}
			})
		}
		
		/** 필수약관 동의 확인 */
		function joinCheck() {
			if (!$("#ck_agree").is(":checked") || !$("#ck_privacy").is(":checked")) {
				alert("필수약관에 동의해야만 회원가입이 가능합니다.")
				return false;
			}
		}
		
		function changeEmail() {
			var selectedEmail = $("#email3 option:selected").val();
			if (selectedEmail == "") {
				$("#email2").attr("disabled", false);
				$("#email2").removeClass("readonly");
			} else {
				$("#email2").val("");
				$("#email2").attr("disabled", true);
				$("#email2").addClass("readonly");
			}
		}
				
        $(function() {
           Join.init();

           $("#join_form").validate({
	           /** 입력 검사 규칙! */
	           rules: {
	               mId: { required: true, alphanumeric: true },
	               mPw: { required: true, minlength: 8, maxlength: 20 },
	               mPw_re: { required: true, equalTo: "#mPw" },
	               mName: { required: true },
	               nick: "required",
	               phone: { required: true, number: true },
	               gender: "required"
	           },
	           /** 규칙이 맞지 않을 경우의 메세지 */
	           messages: {
	               mId: {
	                   required: "아이디를 입력하세요.",
	                   alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
	               },
	               mPw: {
	                   required: "비밀번호를 입력하세요.",
	                   minlength: "비밀번호는 8글자 이상 입력하셔야 합니다.",
	                   maxlength: "비밀번호는 최대 20글자까지 가능합니다."
	               },
	               mPw_re: {
	                   required: "비밀번호 확인값을 입력하세요.",
	                   equalTo: "비밀번호 확인이 잘못되었습니다."
	               },
	               mName: {
	                   required: "이름을 입력하세요."
	               },
	               nick: {
	                   required: "닉네임을 입력하세요."
	               },
	               phone: {
					   required: "휴대폰 번호를 입력하세요.",
					   number: "휴대폰번호는 - 없이 입력해주세요."
	               }
	           }
			}); // end vadiate()
           
	        // 약관동의 버튼
	        $('.in_chk .toggle').on('click',function(){
	            if($(this).hasClass('on')){
	                $(this).removeClass('on');
	            }else{
	                $(this).addClass('on');
	            }
	        });
	
	        //성별 남자,여자
	        $('.type2 > div label').on('click',function(){
	            if(!$(this).hasClass('checked')) $(this).addClass('checked').siblings().removeClass('checked');
	        });
           
        });
        
    </script>

</body>

</html>