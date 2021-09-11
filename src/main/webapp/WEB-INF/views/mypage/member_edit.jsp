<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/member_edit.css">
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
</head>
	
<body>
    <main>
        <div id="join_input">

            <h2><a href="${pageContext.request.contextPath}/mypage/mypage_index.do"></a>회원정보수정</h2>

            <div class="form-wrapper">
                <form name="joinFrm" id="join_form" method="post" action="${pageContext.request.contextPath}/mypage/member_edit_ok.do">
                    <fieldset class="member_info">
                        <legend class="hidden">기본 정보</legend>
                        <div class="box">

                            <span class="join_div_tit">아이디/비밀번호 <span class="star">*</span></span>

                            <div class="addbtn">
                                <input type="text" value="${m.memId}" id="user_id" class="form_input readonly" readonly>
                            </div>

                            <div>
                                <input type="password" name="mPw" id="user_pw" class="form_input" placeholder="비밀번호">
                            </div>

                            <div class="chk_pw">
                                <input type="password" name="user_pw_re" id="user_pw_re" class="form_input" placeholder="비밀번호 확인">
                                <p class="error_msg">비밀번호와 확인 비밀번호가 다릅니다.</p>
                            </div>

                            <span class="join_div_tit">회원정보 <span class="star">*</span></span>

                            <div>
                                <input type="text" name="mName" id="user_name" class="form_input readonly" value="${m.memName}" readonly>
                            </div>

                            <div class="addbtn">
                                <input type="text" name="nick" maxlength="12" id="nick" value="${m.nick}" class="form_input" placeholder="닉네임">
                                <a href="#" onclick="nickCheck(); return false;" class="check">중복확인</a>
                            </div>

                            <div>
                                <input type="text" name="phone" id="phone" value="${m.phone}" class="form_input remove_dash" placeholder="휴대폰번호">
                            </div>

                            <span class="join_div_tit">이메일 <span class="star">*</span></span>

                            <div class="email">
                            <c:set var="emailValue" value="${m.email}" />
                                <input type="text" name="email1" value="${fn:substringBefore(emailValue, '@')}" id="email1" class="form_input first"><span>@</span>
                                <input type="text" name="email2" value="${fn:substringAfter(emailValue, '@')}" id="email2" class="form_input second">
                                <select name="email3" id="email3" onchange="changeEmail();">
                                    <option value="" selected>직접입력</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                </select>
                            </div>

                            <span class="join_div_tit">생년월일 <span class="star">*</span></span>
                            <div class="birth">
                            <c:set var="birthdate" value="${m.birthdate}" />
                                <!-- <label>생년월일</label> -->
                                <div class="select">
                                    <select name="birth1" id="birth1" value="${fn:substring(birthdate, 0, 4)}">
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
                                    </select>
                                    <select name="birth2" id="birth2" value="${fn:substring(birthdate, 5, 2)}">
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
                                    </select>
                                    <select name="birth3" id="birth3"  value="${fn:substring(birthdate, 8, 2)}">
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

                            <!-- <span class="join_div_tit">성별 </span>

                            <div class="type2">
                                <div>
                                    <label for="sex_male" class="sex_male checked ">남자</label>
                                    <label for="sex_female" class="sex_female ">여자</label>
                                    <input type="radio" name="gender" value="M" id="sex_male" checked="checked">
                                    <input type="radio" name="gender" value="F" id="sex_female">
                                </div>
                            </div> -->
                        </div>
                    </fieldset>

                    <fieldset class="agree">
                        <legend>약관 및 서비스 동의</legend>
                        <div class="box">

                            <div class="in_chk" data-ctr-class="agree_area">
								<div class="choice">
                                    <div>
                                        <label for="join_mailing">
                                            <input type="checkbox" name="mailing" value="Y" id="join_mailing"><span class="custom_check"></span><span>[선택]</span> 이메일 수신동의
                                            <p>(할인쿠폰,이벤트,기획전,특가 상품정보)</p>
                                        </label>
                                    </div>
                                    <div>
                                        <label for="join_sms">
                                            <input type="checkbox" name="sms" value="Y" id="join_sms"><span class="custom_check"></span><span>[선택]</span> SMS 수신동의
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
                    <span class="box_btn block large orange strong"><input type="submit" value="수정완료"></span>
                </form>
                <div class="withdraw">탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요.<span class="box_btn small"><a href="${pageContext.request.contextPath}/mypage/member_del.do">회원탈퇴</a></span>
        		</div>
            </div>
        </div>
    </main>
    
    <footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>

    <script src="../assets/js/jquery.validate.min.js"></script>
    <script src="../assets/js/additional-methods.min.js"></script>
    <script src="../assets/js/Join.js"></script>
    <script type="text/javascript">
		
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
						alert("사용가능한 닉네임입니다!");
					}
				}
			})
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
			
			$("#birth1").val("${fn:substring(birthdate, 0, 4)}").prop("selected", true);
			$("#birth2").val("${fn:substring(birthdate, 5, 7)}").prop("selected", true);
			$("#birth3").val("${fn:substring(birthdate, 8, 10)}").prop("selected", true);
        	
            /** 입력 검사 규칙! */
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
        });
		
           
        //비밀번호 input focus
        $("#join_pw").focus(function(){

            $(this).siblings("p").css("display","block");    //아래 설명글 보여주기

        });

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


        $('#join_pw2').blur(function(){
            var pwd = $('input[name^="pwd["]');
            if(pwd[0].value!=pwd[1].value && pwd[1].value !='') {
                $('.chk_pw .error_msg').show();
                console.log('blur')
            //  pwd[0].value = pwd[1].value = '';
                pwd[1].value = '';
                pwd[1].focus();
                return false;
            }else{
                $('.chk_pw .error_msg').hide();
            }
        });


    </script>
</body>

</html>