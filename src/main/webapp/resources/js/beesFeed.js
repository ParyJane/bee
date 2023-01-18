$(function() {

	$('.comment-modify-submit-btn').click(function(){
		var commentCont = $(this).parent().parent().prev().find('.comment-cont-modify').val();
		var commentNo = ($(this).attr('id')).replace('mc','');
		console.log(commentNo);
		$.ajax({
			url:"/updateComment.do",
			type:"get",
			data:{"commentCont":commentCont,"commentNo":commentNo},
			success:function(data){
				if(data>0){
					alert("댓글이 성공적으로 수정되었습니다.");
					location.reload();
				}else{
					alert("댓글 수정에 실패하였습니다. ");
					location.reload();
				}
			},
			error:function(){
				
			}
			
		})
		
	})
	$('.recomment-modify-submit-btn').click(function(){
		var commentCont = $(this).parent().parent().prev().find('.recomment-cont-modify').val();
		var commentNo = ($(this).attr('id')).replace('mc','');
		console.log(commentNo);
		$.ajax({
			url:"/updateComment.do",
			type:"get",
			data:{"commentCont":commentCont,"commentNo":commentNo},
			success:function(data){
				if(data>0){
					alert("댓글이 성공적으로 수정되었습니다.");
					location.reload();
				}else{
					alert("댓글 수정에 실패하였습니다. ");
					location.reload();
				}
			},
			error:function(){
				
			}
			
		})
		
	})
	$('.comment-del-btn').click(function(){
								
									var commentNo = ($(this).attr('id')).replace("cd","");
									if(confirm('댓글을 삭제하시겠습니까?')){
									$.ajax({
										url:"/deleteComment.do",
										type:"get",
										data:{"commentNo":commentNo},
										success:function(data){
											
											if(data>0){
												alert("댓글이 성공적으로 삭제되었습니다.");
												location.reload();
											}else{
												alert("댓글 삭제에 실패하였습니다. ");
												location.reload();
											}
											
										},
										error:function(){
											
										}
										
									})
									
								}else{
									
								}
								
							})
							$('.recomment-del-btn').click(function(){
							
									var commentNo = Number(($(this).attr('id')).replace("cd",""));
									if(confirm('댓글을 삭제하시겠습니까?')){
									$.ajax({
										url:"/deleteComment.do",
										type:"get",
										data:{"commentNo":commentNo},
										success:function(data){
											
											if(data>0){
												alert("댓글이 성공적으로 삭제되었습니다.");
												location.reload();
											}else{
												alert("댓글 삭제에 실패하였습니다. ");
												location.reload();
											}
											
										},
										error:function(){
											
										}
										
									})
									
								}
								
							})
	$('.item-select-btn').click(function() {

		if ($(this).attr('fill') == 'lightgray') {

			$(this).attr('fill', '#F7D078');
			$(this).prev().attr('checked', 'true');
			$('.item-select-btn').not($(this)).attr('fill', 'lightgray');

		} else {

			$(this).attr('fill', 'lightgray');
			$(this).prev().removeAttr('checked');

		}

	})
	
	$('.vote-reset').click(function(){
		var labels = $(this).closest('.vote-box').find('.item-select-btn');
		labels.attr('fill','lightgray');
		$(this).closest('.vote-box').find('checkbox').removeAttr('checked');
								
	})
						
						


	$('.comment-open').click(function() {

		$(this).prev().css('display', 'block');
		$(this).css('display', 'none');
		$(this).closest('table').next().css('display', 'block');

	})

	$('.comment-close').click(function() {

		$(this).next().css('display', 'block');
		$(this).css('display', 'none');
		$(this).closest('table').next().css('display', 'none');
	})

	$('.recomment-btn').click(function() {

		$(this).parent().parent().next().css('display', 'table-row');
		$(this).parent().parent().css('display', 'none');

	})

	$('.recomment-reset-btn').click(function() {

		$(this).parent().parent().prev().css('display', 'table-row');
		$(this).parent().parent().css('display', 'none');

	})

	$('.comment-modify-btn').click(
			function() {

				$(this).parent().parent().prev().css('display', 'none');
				$(this).parent().parent().css('display', 'none');
				$(this).parent().parent().next().next().css('display',
						'table-row');
				$(this).parent().parent().next().next().next().css('display',
						'table-row');
				var text = $(this).parent().parent().next().next().children().children().val();
				$(this).parent().parent().next().next().next().children().find('p').html(text.length+"/200");

			});

	$('.comment-modify-reset-btn').click(
			function() {

				$(this).parent().parent().prev().css('display', 'none');
				$(this).parent().parent().css('display', 'none')
				$(this).parent().parent().prev().prev().prev().css('display',
						'table-row');
				$(this).parent().parent().prev().prev().prev().prev().css(
						'display', 'table-row');

			})
			
	$('.recomment-modify-btn').click(
			function() {
				
				$(this).parent().parent().prev().css('display', 'none');
				$(this).parent().parent().css('display', 'none');
				$(this).parent().parent().next().next().css('display',
						'table-row');
				$(this).parent().parent().next().next().next().css('display',
						'table-row');
				
				var text = $(this).parent().parent().next().next().children().eq(1).children().val();
				$(this).parent().parent().next().next().next().children().eq(1).children().eq(2).html(text.length+"/200");

			});

	$('.recomment-modify-reset-btn').click(
			function() {

				$(this).parent().parent().prev().css('display', 'none');
				$(this).parent().parent().css('display', 'none')
				$(this).parent().parent().prev().prev().prev().css('display',
						'table-row');
				$(this).parent().parent().prev().prev().prev().prev().css(
						'display', 'table-row');

			})

	$('.feed-navi-block').children().mouseover(function() {

		$(this).css('background-color', 'lightgray');

	})

	$('.feed-navi-block').children().mouseout(function() {

		$(this).css('background-color', 'white');

	})

	$('.feed-setting').click(function() {

		var $feedNavi = $(this).parent().next().next()
		if ($feedNavi.css('visibility') == 'hidden') {
			$feedNavi.css('visibility', 'visible');
			
		} else {
			$feedNavi.css('visibility', 'hidden');
		}
	})

	

	$('.write-function-icon').mouseover(function() {

		$(this).prev().css('visibility', 'visible');

	})

	$('.write-function-icon').mouseout(function() {

		$(this).prev().css('visibility', 'hidden');
	})

	

$('.sche-box').find('p').click(
		function() {
			
			var scheduleNo = $(this).closest('.sche-cont-box').attr('id');
			
			$.ajax({
				url : '/scheduleSelectOne.do',
				data : {'scheduleNo':scheduleNo},
				type : "post",
				success : function(data){
					
					$('#sche-detail-title').html(data.scheduleTitle);
					
					if(data.scheduleStartDate == " " || data.scheduleEndDate == " "){
						if(data.scheduleEndDate == " "){
							$('#sche-detail-date').html(data.transEndDate);
						}else{
							$('#sche-detail-date').html(data.transStartDate);
						}
					
					}else{
							$('#sche-detail-date').html(data.transStartDate+" - "+data.transEndDate);	
					}
					if(data.profileImg==null){
					$('#sche-detail-writer-profile').css('background-color','coral');	
					}else{
					$('#sche-detail-writer-profile').css('background','url(/resources/image/profile/'+data.profileImg+')');
					$('#sche-detail-writer-profile').css('background-size','cover');}
					
					$('#sche-detail-writer-profile').next().html(data.userName);
					$('#sche-detail-note').html(data.scheduleCont);
					
				},
				error : function(){
					
					 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				}
				
			})
			
			$('#sche-detail-modal').css(
					'top',
					Math.max(0, (($(window).height() - $(
							'#sche-detail-modal').outerHeight()) / 2)
							+ $(window).scrollTop())
							+ 'px');
			$('#sche-detail-modal').css(
					'left',
					Math.max(0, (($(window).width() - $(
							'#sche-detail-modal').outerWidth()) / 2)
							+ $(window).scrollLeft())
							+ 'px');
			$('#feed-modal-bg').css('height',
					($(window).height() + $(window).scrollTop()) + 'px');
			$('#sche-detail-box').html()
			
			
			$('#feed-modal-bg').css('display', 'block');
			$('#sche-detail-modal').css('display', 'block');
			
			
})

	

	$('#sche-detail-modal-close').click(function() {

		$('#feed-modal-bg').css('display', 'none');
		$('#sche-detail-modal').css('display', 'none');

	})

	$('#sche-detail-modal-button').click(function() {

		$('#feed-modal-bg').css('display', 'none');
		$('#sche-detail-modal').css('display', 'none');

	})
	
	$('.comment-input-box').keyup(function(){
		
		var text = $(this).val();
		$(this).next().html(text.length+"/200");
		
		if(text.length>200){
			$(this).val(text.substring(0,200));
			$(this).next().css('color','red');
		}
	})
	
	$('.recomment-input-text').keyup(function(){
		
		var text = $(this).val();
		$(this).next().html(text.length+"/200");
		
		if(text.length>200){
			$(this).val(text.substring(0,200));
			$(this).next().css('color','red');
		}
	})
	
	
	
	$('.recomment-cont-modify').keyup(function(){
		
		
		var text = $(this).val();
		$(this).parent().parent().next().children().eq(1).children().eq(2).html(text.length+"/200");
		
		if(text.length>200){
			$(this).val(text.substring(0,200));
			$(this).parent().parent().next().children().eq(1).children().eq(2).css('color','red');
		}
	})
	
	$('.comment-cont-modify').keyup(function(){
		
		
		var text = $(this).val();
		$(this).parent().parent().next().children().children().eq(2).html(text.length+"/200");
		
		if(text.length>200){
			$(this).val(text.substring(0,200));
			$(this).parent().parent().next().children().children().eq(2).css('color','red');
		}
	})

})