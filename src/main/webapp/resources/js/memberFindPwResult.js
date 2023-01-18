window.onload = function() {
		pwMessage = document.getElementById("pwMessage");
		pwReMessage = document.getElementById("pwReMessage");

		memberPw = document.getElementById("memberPw");
		memberPwRe = document.getElementById("memberPwRe");
	}

	function check() {
		if (!pwCheck()){
			memberPw.focus();
			return false;
		} else if (!pwReCheck()){
			memberPwRe.focus();
			return false;
		} else {
			return true;
		}
	}

	function pwCheck() {
		if ((/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
				.test(memberPw.value))) //비밀번호 검사
		{
			pwMessage.style.color = "blue";
			pwMessage.innerHTML = "유효한 비밀번호입니다.";
			return true;
		} else {
			pwMessage.style.color = "red";
			pwMessage.innerHTML = "비밀번호는 소문자,특수문자,숫자를 조합하여 8~16글자로 입력 바랍니다.";

			return false;
		}
	}

	function pwReCheck() {
		if (!(memberPw.value == memberPwRe.value)) //PW와 PW_RE 비교 검사
		{
			pwReMessage.style.color = "red";
			pwReMessage.innerHTML = "비밀번호와 비밀번호 확인 값은 같아야 합니다.";

			return false;
		} else if (memberPwRe.value == "" || memberPw.value == "") {
			pwReMessage.style.color = "red";
			pwReMessage.innerHTML = "비밀번호를 입력해 주십시오";

			return false;
		} else {
			pwReMessage.style.color = "blue";
			pwReMessage.innerHTML = "비밀번호 동일";
			return true;
		}
	}
