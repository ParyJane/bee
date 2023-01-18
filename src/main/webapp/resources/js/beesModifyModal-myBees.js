$(function(){


$('.feed-modify').click(function () {

// 모달 크기 변경 //

$('#modify-modal').css('top', Math.max(0,(($(window).height()-$('#modify-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
$('#modify-modal').css('left', Math.max(0,(($(window).width()-$('#modify-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
$('#modify-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
$('#modify-modal-bg').css('display', 'block');
$('#modify-modal').css('display', 'block');
$('body').css('overflow','hidden');

})

$('#modify-modal-close').click(function () {

$('#modify-modal-bg').css('display', 'none');
$('#modify-modal').css('display', 'none');
$('#modify-modal-cont').children().html("");
$('#modify-modal-footer').children('input').val("");
$('body').css('overflow','auto');

})


$('.modify-function-icon').mouseover(function () {

$(this).prev().css('visibility', 'visible');

})

$('.modify-function-icon').mouseout(function () {

$(this).prev().css('visibility', 'hidden');
})


$('.modify-function-icon').click(function(){

    if($('.modify-modal-del-btn').length>1){


            $('#modify-modal-cont-div').children('div').find('*').remove();
            $('#modify-modal-cont-div').children('div').remove();
            

    }else{


    }

})



$('#modify-item-add-btn').click(function(){

$(this).before('<input>');
test = $(this).prev();
test.attr({
    type: "text",
    class: "modify-vote-modal-items",
    placeholder: "항목입력"
});
$(this).before('<input>');
btn = $(this).prev();
btn.attr({
    type: "button",
    class: "modify-hidden-item-del-btn",
    value: "x"
});


})

$('.modify-item-del-btn').click(function(){

console.log($('.modify-item-del-btn').val());
$(this).prev().remove();
$(this).remove();

});

$('#modify-vote-modal-cont').on('click','.modify-hidden-item-del-btn',function(){

$(this).prev().remove();
$(this).remove();
});


$('.modify-anonymous-btn').click(function(){

if($(this).attr('fill')=='lightgray'){

$(this).attr('fill','#F7D078');
$(this).prev().attr('checked','true');
$('.modify-item-select-btn').not($(this)).attr('fill','lightgray');

}else{

$(this).attr('fill','lightgray');
$(this).prev().removeAttr('checked');

}

})

$('#modify-vote-modal-btn').click(function () {
	
$('#modify-vote-modal').css('top', Math.max(0,(($(window).height()-$('#modify-vote-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
$('#modify-vote-modal').css('left', Math.max(0,(($(window).width()-$('#modify-vote-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
$('#dual-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
$('#dual-modal-bg').css('display','block');
$('#modify-vote-modal').css('display', 'block');

})

$('#modify-vote-modal-close').click(function () {

$('#modify-vote-modal').css('display', 'none');
$('#dual-modal-bg').css('display','none');
})




$('#modify-sche-modal-btn').click(function () {

$('#modify-sche-modal').css('top', Math.max(0,(($(window).height()-$('#modify-sche-modal').outerHeight())/2) + $(window).scrollTop())+'px'); 
$('#modify-sche-modal').css('left', Math.max(0,(($(window).width()-$('#modify-sche-modal').outerWidth())/2) + $(window).scrollLeft())+'px');
$('#dual-modal-bg').css('height', ($(window).height() + $(window).scrollTop())+'px'); 
$('#dual-modal-bg').css('display','block');
$('#modify-sche-modal').css('display', 'block');

})

$('#modify-sche-modal-close').click(function () {

$('#modify-sche-modal').css('display', 'none');
$('#dual-modal-bg').css('display','none');


})

$('#modify-input-image').on("change",handlerImgFileSelect);
$('#modify-input-file').on("change",handlerFileSelect);

function handlerFileSelect(e){
        
        var files = e.target.files;
        var fileArr = Array.prototype.slice.call(files);

        fileArr.forEach(function(f){

            var fileName = f.name;
            
            if(fileName.length>30){
                fileName = fileName.substring(0,27)+"...";
            }

            var file_html = '<div class="modify-modal-function-box" contentEditable="false"><button type="button" class="modify-modal-del-btn" >삭제</button><div class="file-icon-box">'+
                '<div class="file-icon"></div></div><div class="file-cont-box">'+
                '<p class="file-info">파일</p>'+'<p class="file-title">'+fileName+'</p></div></div>';
            $('#modify-modal-cont').children().append(file_html);


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

                var img_html = '<div style="height:100%" contentEditable="false"><button type="button" class="modify-modal-del-btn">삭제</button><img src="'+e.target.result+'"class="modify-modal-image-viewer" id="'+imgName+'"/></div>';
                $('#modify-modal-cont').children().append(img_html);

            }

            reader.readAsDataURL(f);


    })
}

    var scheData;

$('#modify-sche-modal-submit').click(function(){

if($('#modify-sche-modal-title').val()!='' && $('#modify-sche-modal-note').val()!='' && $('#modify-sche-start-date').val()!='' && $('#sche-end-date')!=''){
scheData = '<div class="modify-modal-function-box" contentEditable="false"><button type="button" class="modify-modal-del-btn" >삭제</button><div class="sche-icon-box"><div class="sche-icon"></div></div>'+
'<div class="modify-sche-cont-box"><p class="modify-sche-title">'+$('#modify-sche-modal-title').val()+'</p><p class="modify-sche-date">'+$('#modify-sche-start-date').val()+'~'+$('#modify-sche-end-date').val()+'</p></div>'
+'<input type="hidden" name="scheduleTitle" value="'+'"></div>';

$('#modify-modal-cont').children().append(scheData);
$('#modify-sche-modal').css('display','none');
$('#dual-modal-bg').css('display','none');

}else{

    alert("입력정보가 올바르지 않습니다. 다시 한번 확인해주세요.");

}

})


$('#modify-modal-cont').children().click(function(){

    // modal-function-box
    $('.modify-modal-function-box').on('click',function(){

    if($(this).children().css('visibility')=='hidden'){
        
        $(this).css('border','3px solid #f7d078');
        $(this).children('.modify-modal-del-btn').css('visibility','visible');

        $(this).children('button').on('click', function(){
        

        $('#modify-modal-cont-div').children('div').children('*').remove();
        $('#modify-modal-cont-div').children('div').remove();
        $('#modify-sche-modal').children('input').val("");
        $('#modify-vote-modal').children('input').val("");
        $('#modify-input-file').val("");

        })

    }else{
        $(this).css('border','lightgray');
        $(this).children('.modify-modal-del-btn').css('visibility','hidden');
    }

    })

    $('.modify-modal-image-viewer').on('click',function(){

        if($(this).prev().css('visibility')=='hidden'){
        
        $(this).css('border','3px solid #f7d078');
        var width = Number($(this).css('width').replace('px', ""))-60;
        $(this).prev().css('margin-left',width+"px");
        $(this).prev().css('visibility','visible');
        $('.modify-modal-image-viewer').not(this).css('border','1px solid lightgray');
        $('.modify-modal-image-viewer').not(this).prev().css('visibility','hidden');
        
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

$('#modify-vote-modal-submit').click(function(){

    var modalItemArr = new Array();

    $('.modify-vote-modal-items').each(function(){

        if($(this).val()!=''){
        modalItemArr.push($(this).val());
    }
    })

    console.log(modalItemArr.length)

if($('.modify-vote-modal-title').val()!='' && modalItemArr.length>1){
voteData = '<div class="modify-modal-function-box" contentEditable="false"><button type="button" class="modify-modal-del-btn" >삭제</button><div class="vote-icon-box"><div class="vote-icon"></div></div><div class="vote-info-box">'+
        '<p class="vote-state">투표 등록</p><p class="vote-title">'+$('.vote-modal-title').val()+'</p></div></div></div>';
        
$('#modify-modal-cont').children().append(voteData);
$('#modify-vote-modal').css('display','none');
$('#dual-modal-bg').css('display','none');

}else{

    if(modalItemArr.length<=1){

        $('#modify-vote-modal-items-message').css('display','block');

    }else{

    alert("입력정보가 올바르지 않습니다. 다시 한번 확인해주세요.");

}

}
})




$('.modify-vote-modal-items').focusin(function(){

    $('#modify-vote-modal-items-message').css('display','none');

})




})

