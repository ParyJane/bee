window.onload = function() {
	nameMessage = document.getElementById("nameMessage");
	phoneMessage = document.getElementById("phoneMessage");

	memberName = document.getElementById("memberName");
	phone = document.getElementById("memberPhone");
	authBox = document.getElementById("authBox");
	authInput = document.getElementById("inputAuthNum");
	sendSms = document.getElementById("sendSms");
	
	}

function check() {
	if (!nameCheck()) {
		memberName.focus();
		return false;
	} else if (!phoneCheck()) {
		phone.focus();
		return false;
	} else if (authBox.style.display != "none"){
		authInput.focus();
		phoneMessage.style.color = "red";
		phoneMessage.innerHTML = "인증절차를 진행하여 주십시오";
		return false;
	} else if (sendSms.style.display != "none" ) {
		sendSms.focus();
		phoneMessage.style.color = "red";
		phoneMessage.innerHTML = "인증절차를 진행하여 주십시오";
		return false;
	} else {
		return true;
	}
}



function nameCheck() {
	if (!(/[가-힣]+$/.test(memberName.value))) //이름 검사
	{
		nameMessage.style.color = "red";
		nameMessage.innerHTML = "이름은 한글(최소1글자)만 가능합니다.";

		return false;
	} else {
		nameMessage.innerHTML = "";
		return true;
	}
}

function phoneCheck() {
	if (phone.value == "") //폰 검사
	{
		phoneMessage.style.color = "red";
		phoneMessage.innerHTML = "핸드폰 번호입력 후 인증절차를 진행하여 주십시오";

		return false;
	} else if (!(/^(010[1-9][0-9]{7})$/.test(phone.value))){
		phoneMessage.style.color = "red";
		phoneMessage.innerHTML = "핸드폰번호는 010으로 시작해 11자리로 입력해주세요(- 제외하고 입력)";

		return false;
	} else {
		phoneMessage.value = "";
		return true;
	}
}

function authNumCheck() {
	if(authInput.value == "") {
		phoneMessage.style.color = "red";
		phoneMessage.innerHTML = "인증번호 입력 바람";

		return false;
	} else {
		return true;
	}
}
	
	$(function() {
		var authNum;
		$('#sendSms').click(function() {
			if($('#authInputBox').css('display') == 'inline-block'){
				alert('인증번호를 확인하세요.');
			} else {
				if($('#memberPhone') == "" || !(/^(010[1-9][0-9]{7})$/.test(phone.value))){
					$('#phoneMessage').html('핸드폰번호를 제대로 작성하세요.');
				} else {
					$.ajax({
						url: "/sendSms.do",
						data: {
							receiver: $("#memberPhone").val()
						},
						type: "post",
						success: function(getAuthNum){
							authNum = getAuthNum;
							$('#authBox').removeAttr('style');
							$('#phoneMessage').html('');
						}
					});	
				}
			}
		});
		$('#smsCheck').click(
				function() {
					if ($("#inputAuthNum").val() == authNum) {
						alert("번호 인증 성공");
						$('#phoneMessage').css('color', 'blue');
						$('#phoneMessage').html('인증완료');
						$('#memberPhone').attr('readonly', true);
						$('#sendSms').css('display', 'none');
						$('#changePhone').css('display', 'inline-block');
						$('#authBox').attr('style','display:none');
					} else {
						alert("옳바르지 않은 인증번호 입니다.");
					}
				});
		$('#changePhone').click(
				function() {
					$('#phoneMessage').html('');
					$('#memberPhone').attr('readonly', false);
					$('#memberPhone').val('');
					$('#inputAuthNum').val('');
					$('#sendSms').css('display', 'inline-block');
					$('#changePhone').css('display', 'none');
				});
	});