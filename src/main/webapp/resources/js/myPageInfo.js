		



	$(function(){
			
			//사이드 네비 초기값 ------------------------------------------------------
			$(".navi_li").eq(0).css('background','#F7D078').css('font-weight','700');
			
			//사이드 네비 클릭하면 css변경 ------------------------------------------------------
			$(".navi_li").click(function(){
				$(this).css('background','#F7D078');
				$(this).eq(0).css('font-weight','700');
				$(this).siblings().css('background','white'); //siblings() 나를 제외한 형제 요소들 모두 선택
				$(this).siblings().css('font-weight','400');
			});
			
			

			//생년월일 select ------------------------------------------------------
			var toDay = new Date();
			var year  = toDay.getFullYear();
			var month = (toDay.getMonth()+1);
			var day   = toDay.getDate();
			
			var birthday = $("#myBirth").val();
			
			var strY = "";
			var strM = "";
			var strD = "";
			
			for(var i=1900; i<=year; i++) {
				if (birthday.substring(0,4) == i) {
					strY += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				} else {
					strY += "<option value='" + i + "' >" + i + "</option>";
				}
				
			}
			
			for(var i=1; i<=12; i++){
				
				var val = "";
				if (i < 10) {
					val = "0" + new String(i);
				} else {
					val = new String(i);
				} 
				
				if (birthday.substring(4,6) == val) {
					strM += "<option value='" + val + "' selected='selected'>" + val + "</option>";
				} else {
					strM += "<option value='" + val + "' >" + val + "</option>";
				}
			}
			
			for(var i=1; i<=31; i++){
				var val = "";
				if (i < 10) {
					val = "0" + new String(i);
				} else {
					val = new String(i);
				} 
				
				if (birthday.substring(6,8) == val) {
					strD += "<option value='" + val + "' selected='selected'>" + val + "</option>";
				} else {
					strD += "<option value='" + val + "' >" + val + "</option>";
				}
			}
			
			$("#YEAR").html(strY);
			$("#MONTH").html(strM);
			$("#DAY").html(strD);
			
			
			
			//정보 변경 버튼 누르면 확인/취소 버튼 나오기 ------------------------------------------------------
			$(".myInfo_modify_btn").click(function(){
				
				if($(this).val()=='변경'){
					
					$(this).val('취소').css('color','white').css('background-color','#50401B');
					$(this).prev().attr('type','button');
					
					switch($(this).attr('id')){
						case 'memberBirth' : $(this).parent().prev().children().eq(0).css('display','none'); 
											 $(this).parent().prev().children().eq(1).css('display','block'); break
						case 'memberGender' : $(this).parent().prev().children().eq(0).css('display','none'); 
						 					  $(this).parent().prev().children().eq(1).css('display','block'); break
						case 'memberPhone' :$(this).parent().prev().children().eq(0).css('display','none'); 
											$(this).parent().prev().children().eq(1).css('display','block');
											$('#member_phone_certified').show(); break
						case 'memberEmail' :  $(this).parent().prev().children().eq(0).css('display','none'); 
											  $(this).parent().prev().children().eq(1).css('display','block'); break
					}
					
				} else if($(this).val()=='취소'){
					
					$(this).val('변경').css('color','#50401B').css('background-color','white');
					$(this).prev().attr('type','hidden');
					
					switch($(this).attr('id')){
						case 'memberBirth' : $(this).parent().prev().children().eq(0).css('display','block'); 
											 $(this).parent().prev().children().eq(1).css('display','none'); break
						case 'memberGender' :  $(this).parent().prev().children().eq(0).css('display','block'); 
						 					   $(this).parent().prev().children().eq(1).css('display','none'); break
						case 'memberPhone' : $(this).parent().prev().children().eq(0).css('display','block'); 
											 $(this).parent().prev().children().eq(1).css('display','none');
											 $('#memberPoneM').val('');
											 $('#member_phone_certified_input').val('');
											 $('#member_phone_certified').hide(); break
						case 'memberEmail' : $(this).parent().prev().children().eq(0).css('display','block'); 
											 $(this).parent().prev().children().eq(1).css('display','none'); 
											 $('#memberEmailInput').val('');break
					}
					
				}
			});
			
			
			//확인 or 인증 버튼 누르면 해당 로직 실행 -------------------------------------------
			//생일
			$("#memberBirthModify").click(function(){
				
				var myYear = $("#YEAR").val();
				var myMonth = $("#MONTH").val();
				var myDay = $("#DAY").val();
				
				var myB = myYear + myMonth + myDay;
				
				$.ajax({
					url : "/memberBirthModify.do",
					data : {"memberBirth" : myB}, //key:value
					type : "post",
					success: function(data){
						if(data==0){
							window.location.reload();
						}else{
							alert("수정을 실패했습니다.");
						}
					},
					error : function(data){
						alert("실패");
					}
				});
				
			});
			
			
			//성별수정 -----------------------------------------------------
			$("#memberGenderModify").click(function(){
				var gender = $("#memberGender").val();
				
				$.ajax({
					url : "/memberGenderModify.do",
					data : {"memberGender" : gender}, //key:value
					type : "post",
					success: function(data){
						if(data==0){
							window.location.reload();
						}else{
							alert("수정을 실패했습니다.");
						}
					},
					error : function(data){
						alert("실패");
					}
				});
				
			});
			
			
			
			//휴대폰번호변경 -----------------------------------------------------
			$("#memberPhoneModify").click(function(){
				var phone = $("#memberPoneM").val();
				
					if (phone == ""){
						alert("핸드폰 번호입력 후 인증절차를 진행하여 주십시오");
						
					} else if (!(/^(010[1-9][0-9]{7})$/.test(phone))){
						alert("핸드폰번호는 010으로 시작해 11자리로 입력해주세요(- 제외하고 입력)");
						
					} else {
						//핸드폰 번호 중복 확인
						$.ajax({
							url: "/myPhoneCheck.do",
							data: {"memberPhone":phone},
							type: "post",
							success: function(result){
								if(result == 0){
									
									$.ajax({
										url: "/memberPhoneModify.do",
										data: {"memberPhone":phone},
										type: "post",
										success: function(data){
											if(data==2){
												window.location.reload();
											} else {
												alert("변경을 실패했습니다.");
											}
										}
									});
									
								} else {
									alert("이미 가입된 전화번호 입니다.");
									 $("#memberPoneM").val('');
								}
							}
						});
					}
				
			});
			
			
			
			
			//이메일 -----------------------------------------------------
			$("#memberEmailModify").click(function(){
				
				var memberEmailVal = $("#memberEmailInput").val();
					
					$.ajax({
						url : "/memberEmailModify.do",
						data : {"memberEmail" : memberEmailVal}, //key:value
						type : "post",
						success: function(data){
							if(data==0){
								window.location.reload();
							}else{
								alert("수정을 실패했습니다.");
							}
						},
						error : function(data){
							alert("실패");
						}
					});
					
				});
				
			
			
			
			//비밀번호(모달) -----------------------------------------------------
			$('#member_pw_modify_modal_submit').click(function () {
				var memberPwM = $("#member_pw_modify_modal_input").val();
				var memberRePwM = $("#member_repw_modify_modal_input").val();
				
				if((/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test(memberPwM))){
					
					if(memberPwM == memberRePwM){
						
						$.ajax({
							url : "/memberPwModify.do",
							data : {"memberPw" : memberPwM}, //key:value
							type : "post",
							success: function(data){
								if(data==0){
									alert("비밀번호를 변경했습니다.");
									window.location.reload();
								}else{
									alert("비밀번호를 변경을 실패했습니다.");
								}
							},
							error : function(data){
								alert("실패");
							}
						});
						
					}else{
						alert("변경할 비밀번호를 확인해주세요");
					}
				}else{
					alert("비밀번호 조건을 확인해주세요");
				}
				
				
				
				
			});
			
			
			
			//회원탈퇴 -----------------------------------------------------
			$('#myInfo_del_modal_submit').click(function () {
				//1. 비밀번호 확인하고
				
				var memberDelPw = $("#myInfo_del_modal_pw_check").val();
				var memberPwCheck;
				
				$.ajax({
					url : "/memberPwCheck.do",
					data : {"memberPw" : memberDelPw}, //key:value
					type : "post",
					success: function(data){
						if(data==0){
							location.href="/memberDelYN.do";
						}else{
							alert("비밀번호가 올바르지 않습니다.");
						}
					},
					error : function(data){
						alert("실패");
					}
				});
				
				//2. member_del_yn변경  ajax
				if(memberPwCheck==true){
					alert("비밀번호가 올바르지 않습니다.");
				}
					
				
			});
			
			
			
			
			//프로필 모달 버튼 ------------------------------------------------------
			$('.myInfo_profile_btn').click(function () {
				$('.modal_bg').css('display','block');
				$('#member_profile_modal').css('display', 'block');
			});

			$('#member_profile_modal_close').click(function () {
				$('.modal_bg').css('display','none');
				$('#member_profile_modal').css('display', 'none');
				$('#member_profile_modal_name').val('');
			});
			
			$('#member_profile_modal_reset').click(function () {
				var originImg = $("#originImg").val();
				$('.modal_bg').css('display','none');
				$('#member_profile_modal').css('display', 'none');
				$('#member_profile_modal_name').val('');
				$("#member_profile_img").css("background-image","url("+originImg+")");
			});

			
			
			//비밀번호 변경 모달 ------------------------------------------------------
			$('.myInfo_pw_modify_btn').click(function () {
				$('.modal_bg').css('display','block');
				$('#member_pw_modify_modal').css('display', 'block');
			});

			$('#member_pw_modify_modal_close').click(function () {
				$('.modal_bg').css('display','none');
				$('#member_pw_modify_modal').css('display', 'none');
				$('#member_pw_modify_modal_input').val('');
				$('#member_repw_modify_modal_input').val('');
			});
			
			$('#member_pw_modify_modal_reset').click(function () {
				$('.modal_bg').css('display','none');
				$('#member_pw_modify_modal').css('display', 'none');
				$('#member_pw_modify_modal_input').val('');
				$('#member_repw_modify_modal_input').val('');
			});

			
			

			
			
			//탈퇴 버튼 클릭 ------------------------------------------------------
			$(".myInfo_del_yn").click(function(){
				
				var result = confirm("정말 탈퇴 하시겠습니까?");
				if(result){
					//탈퇴 페이지 모달 ------------------------------------------------------
					$('.modal_bg').css('display','block');
					$('#myInfo_del_modal').css('display', 'block');
					
					$('#myInfo_del_modal_close').click(function () {
						$('.modal_bg').css('display','none');
						$('#myInfo_del_modal').css('display', 'none');
						$('#myInfo_del_modal_pw_check').val('');
					});
					
					$('#myInfo_del_modal_reset').click(function () {
						$('.modal_bg').css('display','none');
						$('#myInfo_del_modal').css('display', 'none');
						$('#myInfo_del_modal_pw_check').val('');
					});
					
				} 
				
			});
			
			
			//프로필 사진 미리보기 -----------------------------------------------------
			$("#member_profile_icon").click(function(){
				$("#file").click();
			});
			
			$(document).ready(function() {
			    $("#file").on("change", handleImgFileSelect);
			}); 

			function handleImgFileSelect(e) {
			    var files = e.target.files;
			    var filesArr = Array.prototype.slice.call(files);

			    filesArr.forEach(function(f) {
			        if(!f.type.match("image.*")) {
			            alert("이미지 파일만 첨부해주세요.");
			            return;
			        }

			        var sel_file = f;
			        var reader = new FileReader();
			        reader.onload = function(e) {
			           
			        	var imgSrc = e.target.result;
			           
			        	$("#member_profile_img").css("background-image","url("+imgSrc+")");
			        }
			        reader.readAsDataURL(f);
			    });
			}
			
			
		});
			
