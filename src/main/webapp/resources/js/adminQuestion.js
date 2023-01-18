$(function(){
			
			//footer위치조절
			var higth = $("body").height();
			if(higth<754){
				$("#footer").css('position','absolute').css('bottom','0');
			}
			
			
			var questionNo;
			var questionTitle;
			var questionCont;
			var memberNo;
			
			//글 제목 클릭(questionTable) ---------------------------------------------------------
			$(".member_question_title").click(function() {
				$('.modal_bg').css('display', 'block');
				$('#admin_question_modal').css('display', 'block');
						
				questionNo = $(this).nextAll(".questionNo").val();
				
				//모달에 1:1 문의 글 불러오기
				$.ajax({
					url : "/selectOneQuestion.do",
					data : {"questionNo" : questionNo}, //key:value
					type : "post",
					success: function(data){
						questionTitle = data[0];
						questionCont = data[1].replace(/\&#10;/g,'<br>');
						
						$("#admin_question_modal_title").text(data[0]);
						$("#admin_question_modal_text").html("<p>"+questionCont+"</p>"); 
						
						if(data[2]=='Y'){
							$("#admin_question_modal_submit_Y").attr('type','button');	
							$("#admin_question_modal_submit").attr('type','hidden');	
						}else{
							$("#admin_question_modal_submit_Y").attr('type','hidden');
							$("#admin_question_modal_submit").attr('type','button');
						}  
						
						memberNo = data[3];
						
					},
					error : function(data){
						alert("실패");
					}
				});
						
			});
			
			
			
			//모달  ////////////////////////////////////////////////////////////////////////
			
			var answerCont;
			
			//1:1 문의 확인(admin_question)---------------------------------------------
			//닫기 버튼
			$('#admin_question_modal_close').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_question_modal').css('display', 'none');
			});
			
			//답변하기 버튼
			$('#admin_question_modal_submit').click(function() {
				$('#admin_question_modal').css('display', 'none');
				$('#admin_answer_modal').css('display',	'block');
				$("#admin_answer_modal_title").text("RE : "+questionTitle);
				
			});
			
			
			//1:1 답번 작성(admin_answer)---------------------------------------------
			//닫기 버튼
			$('#admin_answer_modal_close').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_modal').css('display', 'none');
				$('#admin_answer_modal textarea').val('');
			});
			
			//취소버튼
			$('#admin_answer_modal_reset').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_modal').css('display', 'none');
				$('#admin_answer_modal textarea').val('');
			});
			
			//답변등록 버튼
			$('#admin_answer_modal_submit').click(function() {
				
				answerCont = $('#admin_answer_modal textarea').val().replace(/\n/g,'<br>');
				
				$.ajax({
					url : "/insertAnswer.do",
					data : {"questionNo" : questionNo, "answerCont" : answerCont, "memberNo" : memberNo}, //key:value
					type : "post",
					success: function(data){
						if(data==0){
							window.location.reload();
						}
						else{
							alert("실패");
						}
					},
						error : function(data){
							alert("실패");
					}
				});
			});
			
			
			
			
			//테이블///////////////////////////////////////////////////////////////////////
			var tableQuestionNo;
			var tableMemberNo;
			var tableQuestionTitle;
			var tableAnswerCont;
			var answerModifyCont
			
			
			//답변 버튼 ---------------------------------------------------------------------
			//닫기 버튼
			$('#admin_answer_tableVer_close').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_tableVer').css('display', 'none');
				$('#admin_answer_tableVer textarea').val('');
			});
			$('#admin_answer_tableVer_reset').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_tableVer').css('display', 'none');
				$('#admin_answer_tableVer textarea').val('');
			});
			$('#admin_answer_view_modal_close').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_view_modal').css('display', 'none');
			});
			
			//1:1 답번 작성(admin_answer_tableVer)
			//답변하기
			$(".answer_n_btn").click(function() {
				$('.modal_bg').css('display', 'block');
				$('#admin_answer_tableVer').css('display', 'block');
				
				tableQuestionNo = $(this).parent(0).parent(0).children("#tableQuestionNo").text();
				tableMemberNo = $(this).parent(0).parent(0).children("#tableMemberNo").val(); 
				tableQuestionTitle = $(this).parent(0).parent(0).children(".member_question_title").text(); 
				$("#admin_answer_tableVer_title").text("RE : "+tableQuestionTitle);
				
			});
			
			//누르면 답변 작성 되는거다!!!
			$('#admin_answer_tableVer_submit').click(function() {
				
				tableAnswerCont = $('#adminTableAnswerCont').val().replace(/\n/g,'<br>');
				
				$.ajax({
					url : "/insertAnswer.do",
					data : {"questionNo" : tableQuestionNo, "answerCont" : tableAnswerCont, "memberNo" : tableMemberNo}, //key:value
					type : "post",
					success: function(data){
						if(data==0){
							window.location.reload();
						}
						else{
							alert("실패");
						}
					},
						error : function(data){
							alert("실패");
					}
				});
				
			});
			
			//1:1 답번 확인(admin_answerView)---------------------------------------------
			//답변 완료클릭시 답변 내용 보여주기
			$(".answer_y_btn").click(function() {
				$('.modal_bg').css('display', 'block');
				$('#admin_answer_view_modal').css('display', 'block');
				
				tableQuestionNo = $(this).parent(0).parent(0).children("#tableQuestionNo").text();
				tableQuestionTitle = $(this).parent(0).parent(0).children(".member_question_title").text(); 
				$("#admin_answer_view_modal_title").text("RE : "+tableQuestionTitle);
				
				//모달에 1:1 답변 글 불러오기
				$.ajax({
					url : "/selectOneAnswer.do",
					data : {"questionNo" : tableQuestionNo}, //key:value
					type : "post",
					success: function(data){
						
						tableAnswerCont = data[0].replace(/\n/g,'<br>');
						$("#admin_answer_view_modal_text").html("<p>"+tableAnswerCont+"</p>"); 
						
						/* answerModifyCont = data[0].replace(/\&#10;/g,'<br>'); */
						answerModifyCont = data[0].replace(/<br>/g, '&#10;');
						$("#admin_answer_modify_modal_title").text("RE : "+tableQuestionTitle);
						$("#admin_question_modify_modal_text").html('<textarea name="adminAnswerModify">'+answerModifyCont+'</textarea>');
						
					},
					error : function(data){
						alert("실패");
					}
				});
				
			});
			
			//답변 삭제 (admin_answer_view_modal_submit)
			$("#admin_answer_view_modal_submit").click(function() {
				
				var result = confirm("정말 삭제하시겠습니까?");
				if (result) {

					$.ajax({
						url : "/answerDelete.do",
						data : {"questionNo" : tableQuestionNo}, //key:value
						type : "post",
						success: function(data){
							if(data=="true"){
								alert("삭제되었습니다.");
								window.location.reload();
							}
							else{
								alert("실패");
							}
						},
							error : function(data){
								alert("실패");
						}
					});
				}
			});
			

			
			//1:1 답번 수정(admin_answerModify)---------------------------------------------
			//닫기버튼
			$('#admin_answer_modify_modal_close').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_modify_modal').css('display', 'none');
				$('#admin_answer_modify_modal textarea').val('');
			});
			
			///이거 누르면 수정하기 모달로 이동
			$('#admin_answer_view_modal_reset').click(function() {
				$('.modal_bg').css('display', 'block');
				$('#admin_answer_view_modal').css('display', 'none');
				$('#admin_answer_modify_modal').css('display', 'block');
			});
			
			//답변 수정 취소하기
			$('#admin_answer_modify_modal_reset').click(function() {
				$('.modal_bg').css('display', 'none');
				$('#admin_answer_modify_modal').css('display', 'none');
				$('#admin_answer_modify_modal textarea').val('');
			});
			
			//답변 수정하기 //////////////////////////////////////////////////////////////////////////////////////////////////////
			$("#admin_answer_modify_modal_submit").click(function() {
				
				answerModifyCont = $("#admin_answer_modify_modal textarea").val().replace(/\n/g,'<br>');
				
					$.ajax({
						url : "/answerModify.do",
						data : {"questionNo" : tableQuestionNo, "answerCont" : answerModifyCont}, //key:value
						type : "post",
						success: function(data){
							if(data=="true"){
								alert("수정되었습니다.");
								window.location.reload();
							}
							else{
								alert("실패");
							}
						},
							error : function(data){
								alert("실패");
						}
					});
					
			});
			
			
			
			
			
			//질문 삭제/복구 버튼 클릭 ------------------------------------------------
			//삭제하기
			$(".qna_del_n_btn").click(function() {
				
				tableQuestionNo = $(this).parent(0).parent(0).children("#tableQuestionNo").text();
				tableMemberNo = $(this).parent(0).parent(0).children("#tableMemberNo").val(); 
				
				var result = confirm("정말 삭제하시겠습니까?");
				if (result) {
					
					$.ajax({
						url : "/questionDelete.do",
						data : {"questionNo" : tableQuestionNo}, //key:value
						type : "post",
						success: function(data){
							if(data=="true"){
								window.location.reload();
							}
							else{
								alert("실패");
							}
						},
							error : function(data){
								alert("실패");
						}
					});
				}
			});
			
			//복구하기
			$(".qna_del_y_btn").click(function() {
				
				tableQuestionNo = $(this).parent(0).parent(0).children("#tableQuestionNo").text();
				tableMemberNo = $(this).parent(0).parent(0).children("#tableMemberNo").val(); 
					
					$.ajax({
						url : "/questionRollback.do",
						data : {"questionNo" : tableQuestionNo}, //key:value
						type : "post",
						success: function(data){
							if(data=="true"){
								window.location.reload();
							}
							else{
								alert("실패");
							}
						},
							error : function(data){
								alert("실패");
						}
					});

				});

			
			
		});