Join = {

    init:function(){
        // 전체 동의
        var all_agree = $("[name='all_agree']");
        var ck_agree = $("[name='ck_agree']"); // 필수 약관동의
        var ck_privacy = $("[name='ck_privacy']"); // 필수 개인정보처리동의
        var mailing = $("[name='mailing']"); // 선택 이메일동의
        var sms = $("[name='sms']"); // 선택 sms 동의

        // 회원가입 페이지 접근시 우선 실행
        Join.agreeCheckConfirm();

        // 전체 동의 체크 변경시
        all_agree.change(function(){
            if( $(this).is(':checked') == true ){
                ck_agree.prop('checked', true);
                ck_privacy.prop('checked', true);
                mailing.prop('checked', true);
                sms.prop('checked', true);
            } else {
                ck_agree.prop('checked', false);
                ck_privacy.prop('checked', false);
                mailing.prop('checked', false);
                sms.prop('checked', false);
            }

            Join.agreeCheckConfirm();
        });

        // 동의 체크박스 변경시 처리
        $("[data-ctr-class=\"agree_area\"] [type=\"checkbox\"]").change(function(){
            Join.agreeCheckConfirm();
        });
    }

    , agreeCheckConfirm:function(){
        var all_agree = $("[name='all_agree']"); // 전체 동의 버튼
        var allCheck = true; // 전체 체크 여부
        $("[data-ctr-class=\"agree_area\"] [type=\"checkbox\"]").each(function(){
            if( $(this).is(':checked') == false ){
                allCheck = false;
                $(this).parent('label').removeClass('on');
            } else {
                $(this).parent('label').addClass('on');
            }
        });

        // 전체 체크 되어있으면 전체동의 선택처리
        if( allCheck == false ){
            all_agree.prop('checked', false);
            all_agree.parent('label').removeClass('on');
        } else {
            all_agree.prop('checked', true);
            all_agree.parent('label').addClass('on');
        }
    }
};