<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.fourmeeting.bee.image.model.vo.AttachFileDTO" %>
    <%@page import="com.fourmeeting.bee.member.model.vo.Member" %>
      <%@ include file="/include/headerBee.jsp"  %>

<%@page import="com.fourmeeting.bee.notice.model.vo.Notice"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<%@page import="com.fourmeeting.bee.beesuser.model.vo.BeesUser"%>
<%@page import="com.fourmeeting.bee.admin.model.vo.Search" %>

<%@page import="com.fourmeeting.bee.bees.model.vo.Setting"%>
<%@page import="com.fourmeeting.bee.schedule.model.vo.Schedule"%>
<%@page import="com.fourmeeting.bee.image.model.vo.Image"%>
<%@page import="com.fourmeeting.bee.file.model.vo.BeesFile"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.FeedVote"%>
<%@page import="com.fourmeeting.bee.comment.model.vo.FeedComment"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fourmeeting.bee.vote.model.vo.Vote"%>
<%@page import="com.fourmeeting.bee.board.model.vo.Feed"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
width: 100%;
margin-top:40px;

height:80%;
overflow:scroll;
}

.uploadResult ul {
display: flex;
flex-flow: row;
justify-content: center;
align-items: center;
padding:0;
width:100px;
height:100px;
}
.uploadResult a{
width:300px;
height:300px;

}



.uploadResult img {
width: 80%;
white-space:pre;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:5%;
  bottom:5%;
  width:100%;
  height:100%;
  min-height:500px;
  background-color: white; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.uploadResult div{
 display:flex;
 width:400px;
 height:300px;
width:33%;
min-width:300px;
 white-space:pre;
 display:block;
}
.modal-content{
height:500px;
}
#uploadBtn{
float:right;
background-image:url('/resources/image/header/plus.png'); 
background-repeat: no-repeat;
        border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
        margin-right:20px;
}
.img_body{
height:1200px;

}
.view{
margin-left:80px;
float:left;
padding:20px;
margin-top:15px;
}
.view img{
width:100%;
height:100%;
}

</style>
</head>
<body>


<!--?????? ?????? ?????? -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!--?????? ?????????-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>

<!--???????????? CDN-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


<%@ include file="/common/cdnLib.jsp"%>
	<!--?????? ??????????????? + ????????? ????????? + ?????? ????????? ??????-->
	<link rel="stylesheet" type="text/css" href="/resources/css/beesForm.css">
	<script type="text/javascript" src="/resources/js/beesForm.js"></script>
   <link rel="stylesheet" type="text/css" href="/resources/css/beesUploadImage.css">


 <script>

$(function(){

//???????????? ???????????? X
$('input').attr('autocomplete','off');

$('.chat-open-btn').click(function(){    
window.open("chatting-page.html", '?????? ??????', 'width=400px, height=600px, resizable=no');
return false;

});

});

</script>

<%

//?????? ?????? ?????? (????????? ????????????)
Member member = (Member)session.getAttribute("member");
Bees bees = (Bees)request.getAttribute("bees");

session.setAttribute("beesNo",bees.getBeesNo());//?????? ???????????? ?????????????????? ??????

Setting setting = (Setting)request.getAttribute("setting");
int userCount = (int)request.getAttribute("userCount");
String beesName = bees.getBeesName();
if(bees.getBeesName().length()>=5){
beesName = bees.getBeesName().substring(0,5)+"..";
}
BeesUser user = (BeesUser)request.getAttribute("user");
String userAuth = null;
if(user!=null){
	if(user.getUserAuthYN()=='W'){
		user = null;
		userAuth = "W";
	}
}

%>
<div class="container pt-3" id="all">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3 p-0">
				
					<!-- ?????? ????????? ?????? -->
				<div id="bees-side" class="container m-0 p-2">
					<div id="bees-side-profile">
					<% 
   				 String coverPath = bees.getBeesCover();	
					String beesCover = null;
    			if(coverPath.endsWith("_bee")){
    			beesCover = "/resources/image/beeCreateProfile/"+coverPath;
    			}else{
    				beesCover = coverPath;
    				}
					 %>  
						<table>
							<tr>
							
								<td id="bees-cover" colspan="2" style="background-image:url('<%=beesCover %>')"></td>
							</tr>
							<tr>
								<td id="bees-name" colspan="2"><%=bees.getBeesName() %></td>
							</tr>
							<tr>
								<td id="bees-member-count">
									??????<b> <%=userCount %> </b>
								</td>
								<td id="bees-invite"><!-- ????????? ?????? -->
								<%if(user!=null){%>
								<%if((setting.getSetUserInvite()).equals("user")){%>
									<a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>??????</a>
              <%}else if(((setting.getSetUserInvite()).equals("manager"))){
              	if(!(user.getUserClass().equals("user"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>??????</a>
              <%}//if
              }//elseif
              else if(((setting.getSetUserInvite()).equals("host"))){
              if((user.getUserClass().equals("host"))){%>
              <a href="/inviteMember.do"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 19">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
              </svg>??????</a>
              <%}
              }
								}//userIf%>
								</td>
							</tr>
							<tr>
								<td id="bees-note" colspan="2">
								<% 
								if(user!=null){
								if(!(user.getUserClass()).equals("user")){ %>
									<a href="/beeSettingSubIntro.do?beesNo=<%=bees.getBeesNo()%>">?????? ?????? ?????? </a>
								<%} 
								}%>
								</td>
							</tr>
							<%if(bees.getBeesPublicYN() == 'N' && user==null ){%>
							<tr>
								<td id="bees-public" colspan="2">
								????????? ???????????? ???????????? ????????????. ????????? ???????????? ????????? ??? ????????????.
								</td>
							</tr>
							<%}else{%>
							<tr>
								<td id="bees-cont" colspan="2">
								<%if(bees.getBeesCont()==null){%>
								<%}else{ %>
								<%=bees.getBeesCont() %>
								<%} %>
								</td>
							</tr>
							<%}
							if(user!=null){%>
							<%if(!(user.getUserClass()).equals("user")){ %>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td id="bees-setting" colspan="2">
								<form id="beeSettingMove" action="/beeSettingMain.do" method="post">
                        <input type="hidden" id="beesNo" name="beesNo" value="<%=bees.getBeesNo()%>"/>                     
		                <a href="#" onclick="document.getElementById('beeSettingMove').submit();"> <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
		                <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
		                <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
		             	</svg>&nbsp;????????????
                           </a>
                            </form>
								</td>
							</tr>
							
							<%} 
							}
							%>
						
						
						
						
						</table>
					</div>
					<%
					if(user!=null){ %>
					<div id="bees-side-chatting">
						<table>
							<tr>
								<td id="chatting-header">??????</td>
								<td id="new-chat">
									
								<%if((setting.getSetUserInvite()).equals("user")){%>
								<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">??? ??????</a>	
              					<%}else if(((setting.getSetUserInvite()).equals("manager"))){
              					if(!(user.getUserClass().equals("user"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">??? ??????</a>
             				<%}//if
              				}//elseif
              				else if(((setting.getSetUserInvite()).equals("host"))){
              				if((user.getUserClass().equals("host"))){%>
							<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()">??? ??????</a>
             				 <%}
             				 }%>
							</td>	
							</tr>
							<tr>
								<td class="innerline" colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding: 10px 5px 0 5px; line-height: 10px;">
									<div class="chat-profile" style="background-image:url('<%=beesCover %>')"></div>
									<a class="chat-open-btn" href="#none" target="_blank" onclick="openPopup()" style="color: dimgray">
									'<%=beesName %>' ?????? ??????
									</a>
								</td>
								<script>
								$('.chat-open-btn').click(
										function() {
											window.open("/chat.do?beesNo=${requestScope.bees.beesNo }&userName=${requestScope.user.userName }", '?????? ??????',
													'width=400px, height=600px, resizable=no');
											return false;});
								</script>
							</tr>
						</table>
					</div>
					<%}else{ 
					}%>
				</div>
				<!-- ???????????? ?????? ???????????? -->
				
				
				
				
				
			</div>
			
			
			
			
			
			
			
			
			<div class="col-7 p-0">
				<div id="bees-contents" class="container m-0 p-2">
			
				<div id="main_content" style="background-color: white; width:100%; min-height:600px;">
            <div class="img_content" style="min-height:600px;">
               <div class="img_head">
                  <H3>?????????</H3>
   <%
	ArrayList<AttachFileDTO> list=(ArrayList<AttachFileDTO>)request.getAttribute("list");
                Member m4 = (Member)session.getAttribute("member");
             	System.out.println(member.getMemberNo());	
              	
%>
	

<%
		
		if ( m4 != null) {
	%>

                           
                  
               </div>
            <!--      <input type="file" id="upImgFiles" onChange="uploadImgs();" name='uploadFile' accept="image/*" multiple >  <!-- name="subImg" -->
               <div class="img_body">
                  <span>????????????</span> 
                   <form action="" method="post" enctype="multipart/form-data">
                       <div class='uploadDiv'>    
                         <input type='file' name='uploadFile' multiple id="btn-upload" style="border:none;margin-right:200px; width:85px;">
                         <input type="hidden" name='beesNo' value=''${param.beesNo} >
						</div>
                  
		  <div class='uploadBtn'>
				 <button type="submit" id='uploadBtn' class="btn btn-modifys" style="width:80px; background-color:#FFF3D8;color:#50401B;border:none;">?????????</button>
			</div>
                    </form>                                                                   
              
               <div class='bigPictureWrapper'>
				  <div class='bigPicture'>
				  </div>
			</div> 
              
                         
              			 
                     
                     <div class='uploadResult'>  <!--  ????????? ??? ?????? ???????????? ????????????-->
				
					
			<%for(AttachFileDTO a : list){ %>
			<%System.out.println(a.getChangeFileName()); %>
			
			<div class="view"><span><small><%=a.getFileName() %></small></span><br><img src="/resources/file/<%=a.getChangeFileName() %>" style="border-radius:30px;">
			
			
			
			
			
			
			
			</div>
			<% 	}%>
				
				
			
                     
           
                      
            
               </div> <!-- img_body -->
            <!-- ???????????? ?????? -->
            
           
            
          
           


<a href="/image.do" style="color:black">uploadForm</a>
   
            
            <!-- ???????????? ?????? -->
            </div> <!-- img_content -->
            </div> <!-- main_content -->

   </div>   <!-- bees-contents -->
				
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	

	
	
	<%} %>		  
	
     
      
      
       
     
	
	
	
	
	<script>

	function showImage(fileCallPath){
	  
	  //alert(fileCallPath);
	
	  $(".bigPictureWrapper").css("display","flex").show();
	  
	  $(".bigPicture")
	  .html("<img src='/display.do?fileName="+fileCallPath+"'>")
	  .animate({width:'100%', height: '100%'}, 1000);

	}
	
	$(".bigPictureWrapper").on("click", function(e){
	  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	  setTimeout(() => {
		    $(this).remove();
		  }, 1000);
	});
	


	
	$(".uploadResult img").on("click", function(e){
		 $(this).parent().hide();
		 $(this).prev().hide();
	  var targetFile = $(this).data("file");
	  var type = $(this).data("type");
 	  var name = $(this).data("name");	
	  var targetLi = $(this).closest("div");
	  
	  $.ajax({
	    url: '/deleteFile.do',
	    data: {filePath: targetFile, type:type, name:name},
	    dataType:'text',
	    type: 'POST',
	      success: function(result){
	         alert(result);
	         targetLi.remove();
	       }
	  }); //$.ajax
	  
	});

            
  </script>          
            
 <script>

 $(document).ready(function(){
	
      
	 $('#uploadBtn').click(function(e){
		 e.preventDefault();
	 $.ajax({
		 url: '/selectAllImage.do',
		 processData: false,
		 contentType: false,
		 type: 'POST',
		 dataType:'json',
		 success: function(result){
			 console.log("re"+result);
			 alert("??????");
			 var str="";
			 $(result).each(function(i, attachFileDTO){
			 var fileCallPath = encodeURIComponent( attachFileDTO.uploadPath);
				
			 
			
		
		
		 });   //$.ajax
		 }
	 }); 
	/*?????????*/	
	 
	 var cloneObj = $(".uploadDiv").clone();
	 $('#uploadBtn').on("click", function(e){
		 $('.view').empty();
		 var regex = new RegExp("(.*?)\.(jpe?g|png|gif)$");
			var maxSize = 5242880; //5MB

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("?????? ????????? ??????(????????? ?????? 5MB????????? ???????????????.)");
					return false;
				}

				if (!regex.test(fileName)) {
					alert("????????? ????????? ????????? ???????????????.(????????? ????????????:jpeg/jpg/png/gif)");
					return false;
				}
				return true;
			}
		 var formData = new FormData();
		var beesNo = ${param.beesNo};
		 formData.append('beesNo',beesNo);
		 var inputFile = $("input[name='uploadFile']");
		
		 var files = inputFile[0].files;
 		
 		console.log(files);
 		
 		for(var i = 0; i < files.length; i++){
 			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

 			 formData.append("uploadFile", files[i]);
 			
 		}
			
 		
 		 $.ajax({
 			 url: '/uploadAjaxAction.do',
 			 processData: false,
 			 contentType: false,
 			 data: formData,
 			 type: 'POST',
 			 dataType:'json',
 			 success: function(result){
 			 
 				 $('uploadResult').val().remove();
 				 alert("???????????? ??????!");
 			 console.log(result);
 			 showUploadedFile(result);
 			$(".uploadDiv").html(cloneObj.html());
 			 }
 			 }); //$.ajax
 			
 			 
	 });
	 var uploadResult = $(".uploadResult div");
	 
	 function showUploadedFile(uploadResultArr){
		    
		    var str = "";
		    
		    $(uploadResultArr).each(function(i, obj){
		      
		      if(true){
		    	  
		    	str += "<li>" + obj.fileName + "</li>"
		      }
		    	var fileName = obj.uuid +"_"+obj.fileName;
		        var fileCallPath =  encodeURIComponent( fileName);
		        var originPath = obj.uploadPath;
		        
		        
		        originPath = originPath.replace(new RegExp(/\\/g),"/");
		        str += "<div><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
		        "<img src='/display.do?fileName="+fileCallPath+"'></a>"+
		        "<span data-file=\'"+fileCallPath+"\' data-type='image' data-name=\'"+fileName+"\'><img src='/resources/image/admin/error.png' style='width:20px; height:20px;'></span></div>";
		        
		        
		      
		    });
		    
		    uploadResult.append(str);
		  }
 });
 </script>
<!--    $(document).ready(function(){
                                 $('#uploadBtn').click(function(e){
                                    e.preventDefault();
                                    $('#btn-upload').click();
                                 });
                               
                                 
                              });
                              
                            function uploadImgs() {
                                  // @breif ????????? ?????? ??????
                                  var fileList = document.getElementById( "upImgFiles" ).files;
                                       
                                 // @breif ????????? ?????? ??????
                                 function readAndPreview( fileList ) {
                                    // @breif ????????? ????????? ??????
                                    if ( /\.(jpe?g|png|gif)$/i.test( fileList.name ) ) {
                                       var reader = new FileReader();
                                       reader.addEventListener( "load", function() {
                                          var image = new Image();
                                          image.width = "170";
                                          image.height = "170";
                                          image.title = fileList.name;
                                          image.src = this.result;

                                          // @details ????????? ????????? ??????
                                          document.getElementById( "imageviews" ).appendChild( image );
                                       }, false );

                                       // @details readAsDataURL( )??? ?????? ????????? URL??? ????????????.

                                       if( fileList ) {
                                          reader.readAsDataURL( fileList );
                                       }
                                    }
                                 }

                               if( fileList ) {
                            // @details readAndPreview() ????????? forEach???????????? ?????? ??????
                                   [].forEach.call( fileList, readAndPreview );
                                }
                               }  
                        -->
                             
         <jsp:include page="/common/footer.jsp" flush="true"/>                   
</body>
</html>
