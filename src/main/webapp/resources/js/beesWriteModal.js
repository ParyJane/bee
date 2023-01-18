$(function(){


$.writeModalOpen=function(){
		$('#write-modal').css('top', Math.max(0,(($(window).height()-$('#write-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
		$('#write-modal').css('left', Math.max(0,(($(window).width()-$('#write-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
		$('#write-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
		$('#write-modal-bg').css('display', 'block');
		$('#write-modal').css('display', 'block');
		$('body').css('overflow','hidden');
};

$('#write-modal-close').click(function () {

$('#write-modal-bg').css('display', 'none');
$('#write-modal').css('display', 'none');
$('#write-modal-cont').children().html("");
$('#write-modal-footer').children('input').val("");
$('body').css('overflow','auto');

})


$('.write-function-icon').mouseover(function () {

$(this).prev().css('visibility', 'visible');

})

$('.write-function-icon').mouseout(function () {

$(this).prev().css('visibility', 'hidden');
})


$('.write-function-icon').click(function(){

    if($('.write-modal-del-btn').length>1){


            $('#write-modal-cont-div').children('div').find('*').remove();
            $('#write-modal-cont-div').children('div').remove();
            $('#write-modal-submit').attr('name','0');

    }else{


    }

})



$('#item-add-btn').click(function(){

$(this).before('<input>');
test = $(this).prev();
test.attr({
    type: "text",
    class: "vote-modal-items",
    placeholder: "항목입력"
});
$(this).before('<input>');
btn = $(this).prev();
btn.attr({
    type: "button",
    class: "hidden-item-del-btn",
    value: "x"
});


})

$('.item-del-btn').click(function(){

console.log($('.item-del-btn').val());
$(this).prev().remove();
$(this).remove();

});

$('#vote-modal-cont').on('click','.hidden-item-del-btn',function(){

$(this).prev().remove();
$(this).remove();
});


$('.anonymous-btn').click(function(){

if($(this).attr('fill')=='lightgray'){

$(this).attr('fill','#F7D078');
$(this).prev().attr('checked','true');
$('.item-select-btn').not($(this)).attr('fill','lightgray');

}else{

$(this).attr('fill','lightgray');
$(this).prev().removeAttr('checked');

}

})

$('#vote-modal-btn').click(function () {

$('#vote-modal').css('top', Math.max(0,(($(window).height()-$('#vote-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
$('#vote-modal').css('left', Math.max(0,(($(window).width()-$('#vote-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
$('#dual-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
$('#dual-modal-bg').css('display','block');
$('#vote-modal').css('display', 'block');

})

$('#vote-modal-close').click(function () {

$('#vote-modal').css('display', 'none');
$('#dual-modal-bg').css('display','none');
})




$('#sche-modal-btn').click(function () {

$('#sche-modal').css('top', Math.max(0,(($(window).height()-$('#sche-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
$('#sche-modal').css('left', Math.max(0,(($(window).width()-$('#sche-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
$('#dual-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
$('#dual-modal-bg').css('display','block');
$('#sche-modal').css('display', 'block');

})

$('#sche-modal-close').click(function () {

$('#sche-modal').css('display', 'none');
$('#dual-modal-bg').css('display','none');


})

$('#input-image').on("change",handlerImgFileSelect);
$('#input-file').on("change",handlerFileSelect);

function handlerFileSelect(e){
        
        var files = e.target.files;
        var fileArr = Array.prototype.slice.call(files);
        
        fileArr.forEach(function(f){

            var fileName = f.name;
            
            if(fileName.length>30){
                fileName = fileName.substring(0,27)+"...";
            }

            var file_html = '<div class="modal-function-box" contentEditable="false"><button type="button" class="write-modal-del-btn" >삭제</button><div class="file-icon-box">'+
                '<div class="file-icon"></div></div><div class="file-cont-box">'+
                '<p class="file-info">파일</p>'+'<p class="file-title">'+fileName+'</p></div></div>';
            $('#write-modal-cont').children().append(file_html);


        })

    }


function handlerImgFileSelect(e){
    var imageFiles = e.target.files;
    var imageFilesArr = Array.prototype.slice.call(imageFiles);

        imageFilesArr.forEach(function(f){

            var imgFile;

            if(!f.type.match("image.*")){
                alert("이미지 파일만 업로드 가능합니다.");
                return;
            }

            imgFile = f;
            imgName = f.name;
            console.log(imgName);
            var reader = new FileReader();
            reader.onload = function(e){

                var img_html = '<div class="modal-function-image" style="height:100%" contentEditable="false"><button type="button" class="write-modal-del-btn">삭제</button><img max-height="100%;" src="'+e.target.result+'"class="modal-image-viewer" id="'+imgName+'"/></div>';
                $('#write-modal-cont').children().append(img_html);

            }

            reader.readAsDataURL(f);


    })
}

    var scheData;

$('#sche-modal-submit').click(function(){
	
$('#write-modal-submit').attr('name','schedule');

if($('#sche-modal-title').val()!='' && $('#sche-modal-note').val()!='' && $('#sche-start-date').val()!='' && $('#sche-end-date')!=''){
scheData = '<div class="modal-function-box" contentEditable="false"><button type="button" class="write-modal-del-btn" >삭제</button><div class="sche-icon-box"><div class="sche-icon"></div></div>'+
'<div class="sche-cont-box"><p class="sche-title">'+$('#sche-modal-title').val()+'</p><p class="sche-date">'+$('#sche-start-date').val()+'~'+$('#sche-end-date').val()+'</p></div>'
+'<input type="hidden" name="scheduleTitle" value="'+'"></div>';

$('#write-modal-cont').children().append(scheData);
$('#sche-modal').css('display','none');
$('#dual-modal-bg').css('display','none');

}else{

    alert("입력정보가 올바르지 않습니다. 다시 한번 확인해주세요.");

}

})


$('#write-modal-cont').children().click(function(){

    // modal-function-box
    $('.modal-function-box').on('click',function(){

    if($(this).children().css('visibility')=='hidden'){
        
        $(this).css('border','3px solid #f7d078');
        $(this).children('.write-modal-del-btn').css('visibility','visible');

        $(this).children('button').on('click', function(){
        

        $('#write-modal-cont-div').children('div').children('*').remove();
        $('#write-modal-cont-div').children('div').remove();
        $('#sche-modal').children('input').val("");
        $('#vote-modal').children('input').val("");
        $('#input-file').val("");

        })

    }else{
        $(this).css('border','lightgray');
        $(this).children('.write-modal-del-btn').css('visibility','hidden');
    }

    })

    $('.modal-image-viewer').on('click',function(){

        if($(this).prev().css('visibility')=='hidden'){
        
        $(this).css('border','3px solid #f7d078');
        var width = Number($(this).css('width').replace('px', ""))-60;
        $(this).prev().css('margin-left',width+"px");
        $(this).prev().css('visibility','visible');
        $('.modal-image-viewer').not(this).css('border','1px solid lightgray');
        $('.modal-image-viewer').not(this).prev().css('visibility','hidden');
        
        $(this).prev('button').on('click',function(){
        
            $deleteData = $(this).parent();
            $deleteData.find('*').remove();
            $deleteData.remove();

        // 이미지 삭제 로직.

        })

    }else{
        $(this).css('border','1px solid lightgray');
        $(this).prev().css('visibility','hidden');

    }

    })

})


	var voteData;

	$('#vote-modal-submit').click(function(){

		$('#write-modal-submit').attr('name','vote');

		var modalItemArr = new Array();
		
	    $('.vote-modal-items').each(function(){

	    if($(this).val()!=''){
	        modalItemArr.push($(this).val());
	    }
	    })

	    
	if($('.vote-modal-title').val()!='' && modalItemArr.length>1){
	voteData = '<div class="modal-function-box" contentEditable="false"><button type="button" class="write-modal-del-btn" >삭제</button><div class="vote-icon-box"><div class="vote-icon"></div></div><div class="vote-info-box">'+
	        '<p class="vote-state">투표 등록</p><p class="vote-title">'+$('.vote-modal-title').val()+'</p></div></div></div>';
	        
	$('#write-modal-cont').children().append(voteData);
	$('#vote-modal').css('display','none');
	$('#dual-modal-bg').css('display','none');

	}else{

	    if(modalItemArr.length<=1){

	        $('#vote-modal-items-message').css('display','block');

	    }else{

	    alert("입력정보가 올바르지 않습니다. 다시 한번 확인해주세요.");

	}
	}
	})




$('.vote-modal-items').focusin(function(){

    $('#vote-modal-items-message').css('display','none');

})




})

