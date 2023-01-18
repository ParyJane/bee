window.onload = function() {
		idMessage = document.getElementById("idMessage");
		pwMessage = document.getElementById("pwMessage");
		pwReMessage = document.getElementById("pwReMessage");
		nameMessage = document.getElementById("nameMessage");
		emailMessage = document.getElementById("emailMessage");
		phoneMessage = document.getElementById("phoneMessage");
		addrMessage = document.getElementById("addrMessage");

		memberId = document.getElementById("memberId");
		memberPw = document.getElementById("memberPw");
		memberPwRe = document.getElementById("memberPwRe");
		memberName = document.getElementById("memberName");
		phone = document.getElementById("memberPhone");
		authBox = document.getElementById("authBox");
		authInput = document.getElementById("inputAuthNum");
		sendSms = document.getElementById("sendSms");
		addr = document.getElementById("addr_address");
		detailAddr = document.getElementById("addr_detailAddress");
		email = document.getElementById("memberEmail");
	}

	function check() {
		if(!idCheck()){
			memberId.focus();
			return false;
		} else if ($('#idCheckBtn').css('display') != 'none'){
			idCheckBtn.focus();
			idMessage.innerHTML = "중복확인을 눌러 중복확인을 진행해 주십시오";
			return false;
		} else if (!pwCheck()){
			memberPw.focus();
			return false;
		} else if (!pwReCheck()){
			memberPwRe.focus();
			return false;
		} else if (!nameCheck()) {
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
		} else if (!addrCheck()) {
			addr.focus();
			return false;
		} else if (!emailCheck()) {
			email.focus();
			return false;
		} else if ($('#emailCheckBtn').css('display') != 'none'){
			emailCheckBtn.focus();
			emailMessage.innerHTML = "중복확인을 눌러 중복확인을 진행해 주십시오";
			return false;
		} else {
			return true;
		}
	}

	function idCheck() {
		if ((/^[a-z][a-z0-9]{5,11}$/.test(memberId.value))) {
			idMessage.innerHTML = "";
			return true;
		} else{
			idMessage.style.color = "red";
			idMessage.innerHTML = "ID는 영 소문자 숫자 조합으로 최소 6글자 최대 12글자로 입력바랍니다.";

			return false;
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
	
	function addrCheck() {
		if (addr.value == "") //주소검사
		{
			addrMessage.style.color = "red";
			addrMessage.innerHTML = "주소찾기를 이용해 주소를 입력하여 주십시오";

			return false;
		} else if (detailAddr.value == ""){
			addrMessage.style.color = "red";
			addrMessage.innerHTML = "상세주소 입력 바랍니다.";

		} else {
			addrMessage.innerHTML = "";
			return true;
		}
	}

	function emailCheck() {
		if (!(/^[a-z0-9]{4,12}@/.test(email.value))) //이메일 검사
		{
			emailMessage.style.color = "red";
			emailMessage.innerHTML = "이메일을 재확인해주세요(@앞에는 영어 또는 숫자만 가능/첫시작은 소문자)";

			return false;
		} else {
			idMessage.innerHTML = "";
			return true;
		}
	}

	function addrSearch() {
		//여기다가 테마 변경 코드 넣기
		var themeObj = {
			bgColor : "#595959", //바탕 배경색
			searchBgColor : "#FFFFFF", //검색창 배경색
			contentBgColor : "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
			pageBgColor : "#FAFAFA", //페이지 배경색
			textColor : "#333333", //기본 글자색
			queryTextColor : "#222222", //검색창 글자색
			postcodeTextColor : "#FA4256", //우편번호 글자색
			emphTextColor : "#008BD3", //강조 글자색
			outlineColor : "#E0E0E0" //테두리
		};

		new daum.Postcode({
			theme : themeObj, //테마변경코드
			oncomplete : function(data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
								: data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					addr = addr + ' ' + extraAddr;

				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addr_postCode').value = data.zonecode;
				document.getElementById("addr_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr_detailAddress").focus();
			}
		}).open();
	}
	
	$(function() {
		$('#idCheckBtn').click(
				function() {
					if(idCheck()) {
						$.ajax({
							url: "/memberIdCheck.do",
							data: {
								memberId: $("#memberId").val()
							},
							type: "post",
							success: function(result){
								if(result == "true"){
									if(confirm("사용 가능한 ID입니다. 사용하시겠습니까?")){
										$('#memberId').attr('readonly', true);
										$('#idMessage').css('color', 'blue');
										$('#idMessage').html('중복확인 완료');	
										$('#idCheckBtn').css('display', 'none');
										$('#idChangeBtn').css('display', 'inline-block');
									}
								} else {
									alert("중복된 ID 입니다.");
									$('#idMessage').css('color', 'red');
									$('#idMessage').html('중복된 ID 입니다.');
								}
							}
						});	
					}
				});
		$('#idChangeBtn').click(
				function() {
					$('#memberId').attr('readonly', false);
					$('#idMessage').css('color', 'red');
					$('#idMessage').html('');	
					$('#idCheckBtn').css('display', 'inline-block');
					$('#idChangeBtn').css('display', 'none');
					$('#memberId').focus();
		});
	});
	
	$(function() {
		$('#emailCheckBtn').click(
				function() {
					if(emailCheck()) {
						$.ajax({
							url: "/memberEmailCheck.do",
							data: {
								memberEmail: $("#memberEmail").val()
							},
							type: "post",
							success: function(result){
								if(result == "true"){
									if(confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")){
										$('#memberEmail').attr('readonly', true);
										$('#emailMessage').css('color', 'blue');
										$('#emailMessage').html('중복확인 완료');	
										$('#emailCheckBtn').css('display', 'none');
										$('#emailChangeBtn').css('display', 'inline-block');
									}
								} else {
									alert("중복된 이메일 입니다.");
									$('#emailMessage').css('color', 'red');
									$('#emailMessage').html('중복된 이메일 입니다.');
								}
							}
						});	
					}
				});
		$('#emailChangeBtn').click(
				function() {
					$('#memberEmail').attr('readonly', false);
					$('#emailMessage').css('color', 'red');
					$('#emailMessage').html('');	
					$('#emailCheckBtn').css('display', 'inline-block');
					$('#emailChangeBtn').css('display', 'none');
					$('#memberEmail').focus();
		});
	});
	

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
						url: "/memberPhoneCheck.do",
						data: {
							receiver: $("#memberPhone").val()
						},
						type: "post",
						success: function(result){
							if(result == "true"){
								$('#authBox').removeAttr('style');
								$('#phoneMessage').html('');
								
								$.ajax({
									url: "/sendSms.do",
									data: {
										receiver: $("#memberPhone").val()
									},
									type: "post",
									success: function(getAuthNum){
										authNum = getAuthNum;
									}
								});	
							} else {
								alert("이미 가입된 전화번호 입니다.");
								$('#phoneMessage').css('color', 'red');
								$('#phoneMessage').html('이미 가입된 전화번호 입니다.');
							}
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