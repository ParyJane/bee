$(function() {
	$('#loginBtn').click(function() {
		if ($('#memberId').val() == "") {
			$('#idMessage').html('아이디를 입력하여 주십시오');
			$('#pwMessage').html('');
			$('#memberId').focus();
			return false;
		} else if ($('#memberPw').val() == "") {
			$('#idMessage').html('');
			$('#pwMessage').html('비밀번호를 입력하여 주십시오');
			$('#memberPw').focus();
			return false;
		} else {
			return true;
		}
		$('#memberPw').attr('readonly', false);
		$('#chPwBtn').css('display', 'none');
		$('#changeMessage').css('display', 'none');
	});
});