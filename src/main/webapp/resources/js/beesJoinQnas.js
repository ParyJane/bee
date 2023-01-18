	$(function(){
			
			//사이드 네비 초기값
			$(".navi_li").eq(3).css('background','#F7D078').css('font-weight','700');
			
			
			//취소 버튼 눌렀을때
			$(".bees_joinQnas_btn").click(function(){
				
				var userNo = $(this).nextAll(".userNo").val();
				
				var result = confirm("정말 취소 하시겠습니까?");
				
				if(result){
					//취소 로직 구현
					$.ajax({
						url : "/joinQnaCancel.do",
						data : {"userNo" : userNo}, //key:value
						type : "post",
						success: function(data){
							if(data==0){
								/* alert("가입 신청이 취소되었습니다."); */
								window.location.reload();
							}else{
								alert("가입 신청 취소가 실패하였습니다.");
								window.location.reload();
							}
						},
						error : function(data){
							alert("실패");
						}
					});
					
				} 
			});
			
			//가입 현황
			$(".S").css('color','#F7D078');
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
		});