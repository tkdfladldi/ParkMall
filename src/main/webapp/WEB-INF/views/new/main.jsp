<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


  
  
  
<style>
body{
  background: #303030;
}

#pricing-table {
	margin: 100px auto;
	text-align: center;
	width: 892px; /* total computed width = 222 x 3 + 226 */
}

#pricing-table .plan {
	font: 12px 'Lucida Sans', 'trebuchet MS', Arial, Helvetica;
	text-shadow: 0 1px rgba(255,255,255,.8);        
	background: #fff;      
	border: 1px solid #ddd;
	color: #333;
	padding: 20px;
	width: 180px; /* plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
	float: left;
	position: relative;
}

#pricing-table #most-popular {
	z-index: 2;
	top: -13px;
	border-width: 3px;
	padding: 30px 20px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	-moz-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
	-webkit-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
	box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);    
}

#pricing-table .plan:nth-child(1) {
	-moz-border-radius: 5px 0 0 5px;
	-webkit-border-radius: 5px 0 0 5px;
	border-radius: 5px 0 0 5px;        
}

#pricing-table .plan:nth-child(4) {
	-moz-border-radius: 0 5px 5px 0;
	-webkit-border-radius: 0 5px 5px 0;
	border-radius: 0 5px 5px 0;        
}

/* --------------- */	

#pricing-table h3 {
	font-size: 20px;
	font-weight: normal;
	padding: 20px;
	margin: -20px -20px 50px -20px;
	background-color: #eee;
	background-image: -moz-linear-gradient(#fff,#eee);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#eee));    
	background-image: -webkit-linear-gradient(#fff, #eee);
	background-image: -o-linear-gradient(#fff, #eee);
	background-image: -ms-linear-gradient(#fff, #eee);
	background-image: linear-gradient(#fff, #eee);
}

#pricing-table #most-popular h3 {
	background-color: #ddd;
	background-image: -moz-linear-gradient(#eee,#ddd);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#ddd));    
	background-image: -webkit-linear-gradient(#eee, #ddd);
	background-image: -o-linear-gradient(#eee, #ddd);
	background-image: -ms-linear-gradient(#eee, #ddd);
	background-image: linear-gradient(#eee, #ddd);
	margin-top: -30px;
	padding-top: 30px;
	-moz-border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0; 		
}

#pricing-table .plan:nth-child(1) h3 {
	-moz-border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	border-radius: 5px 0 0 0;       
}

#pricing-table .plan:nth-child(4) h3 {
	-moz-border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	border-radius: 0 5px 0 0;       
}	

#pricing-table h3 span {
	display: block;
	font: bold 25px/100px Georgia, Serif;
	color: #777;
	background: #fff;
	border: 5px solid #fff;
	height: 100px;
	width: 100px;
	margin: 10px auto -65px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	border-radius: 100px;
	-moz-box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
	-webkit-box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
	box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
}

/* --------------- */

#pricing-table ul {
	margin: 20px 0 0 0;
	padding: 0;
	list-style: none;
}

#pricing-table li {
	border-top: 1px solid #ddd;
	padding: 10px 0;
}

/* --------------- */
	
#pricing-table .signup {
	position: relative;
	padding: 8px 20px;
	margin: 20px 0 0 0;  
	color: #fff;
	font: bold 14px Arial, Helvetica;
	text-transform: uppercase;
	text-decoration: none;
	display: inline-block;       
	background-color: #72ce3f;
	background-image: -moz-linear-gradient(#72ce3f, #62bc30);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#72ce3f), to(#62bc30));    
	background-image: -webkit-linear-gradient(#72ce3f, #62bc30);
	background-image: -o-linear-gradient(#72ce3f, #62bc30);
	background-image: -ms-linear-gradient(#72ce3f, #62bc30);
	background-image: linear-gradient(#72ce3f, #62bc30);
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;     
	text-shadow: 0 1px 0 rgba(0,0,0,.3);        
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .5), 0 2px 0 rgba(0, 0, 0, .7);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .5), 0 2px 0 rgba(0, 0, 0, .7);
	box-shadow: 0 1px 0 rgba(255, 255, 255, .5), 0 2px 0 rgba(0, 0, 0, .7);
}

#pricing-table .signup:hover {
	background-color: #62bc30;
	background-image: -moz-linear-gradient(#62bc30, #72ce3f);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#62bc30), to(#72ce3f));      
	background-image: -webkit-linear-gradient(#62bc30, #72ce3f);
	background-image: -o-linear-gradient(#62bc30, #72ce3f);
	background-image: -ms-linear-gradient(#62bc30, #72ce3f);
	background-image: linear-gradient(#62bc30, #72ce3f); 
}

#pricing-table .signup:active, #pricing-table .signup:focus {
	background: #62bc30;       
	top: 2px;
	-moz-box-shadow: 0 0 3px rgba(0, 0, 0, .7) inset;
	-webkit-box-shadow: 0 0 3px rgba(0, 0, 0, .7) inset;
	box-shadow: 0 0 3px rgba(0, 0, 0, .7) inset; 
}

/* --------------- */

.clear:before, .clear:after {
  content:"";
  display:table
}

.clear:after {
  clear:both
}

.clear {
  zoom:1
}
</style>


 


</head>

<body translate="no" >

  <div id="pricing-table" class="clear">
     
  </div>

   <button class="btn btn-primary" style="height: 55px;" onclick="newChatRoom();">방만들기</button>

  

</body>

  <script>
  var fullRoom = '${fullRoom}';
	if(fullRoom === 'fullRoom'){
		alert('방 인원이 가득 찼습니다.');
	}
  function roomPassChk(chatPassWord ,chatRoom_num) {
	  
	if(chatPassWord != ""){
		var win = window.open("", "Win", "width=280px;,height=100px;");
		win.document.write("<head><link href=${pageContext.request.contextPath}/resources/admin_vendor/fontawesome-free/css/all.min.css rel=stylesheet type=text/css /></head>");
		win.document.write("<script src=https://code.jquery.com/jquery-3.4.1.js>");	
		win.document.write("<\/script>");
		win.document.write("<h2>비밀번호 입력</h2><input type=password  id=pass>"
		);
		win.document.write("<button onclick='roomPassChk2();' class=btn btn-primary btn-user btn-block type=button>확인</button>");
	
		win.document.write("<script type='text/javascript'> function roomPassChk2() {  ");
		win.document.write(" var passChk = $(\"#pass\").val(); ");
		win.document.write(" $.ajax({ ");
		win.document.write("  type : 'POST',   ");
		win.document.write("  url : '/roomPassChk',     ");
		win.document.write(" data : { chatPassWord : passChk , chatRoom_num : "+chatRoom_num+" },");
		win.document.write("  success : function(value) { if(value == 0){  alert(\"비밀번호 불일치\") }else{  self.location = '/chattingOpenClose?roomNum="+chatRoom_num+"';  } }})  ");
		
		win.document.write("   } <\/script>");
	}else{
		self.location = "/chatting?roomNum="+chatRoom_num;
	}
	
	
}
  
  $(document).ready(function() {
                	
                	   $.ajax({
                           type : "GET",            
                           url : "/chatRoomGet",      
                           success : function(mapList){ 
                        	   var html = "";
                               for(var i = 0; i<mapList.length; i++){
                            	   html += '<div class="plan" id="most-popular">';
                            	   html += ' <h3>'+mapList[i].chatRoom_Name+'<span>#'+mapList[i].category+'</span></h3>';
                            	   html += '<a class="signup '+i+'"  onclick="roomPassChk(\''+mapList[i].chatPassWord+'\', '+mapList[i].chatRoom_num+');">입장하기</a>';
                            	   html += '<ul>';
                            	   html += '<li><b>방장 : </b>'+mapList[i].hostName+'</li>';
                            	   html += '<li><b>인원 : '+mapList[i].realPeople+' / </b>'+mapList[i].people+'</li>';
                            	   if(mapList[i].chatPassWord != ""){
                            		   html += '<li><img src = "/resources2/assets/img/blook.PNG" height = "50px;"></li>';
                            	   }
                            	   html += '</ul>';
                            	   html += '</div>';
                            	   
                               }
                               $("#pricing-table").append(html);
                           },
                           error : function(XMLHttpRequest, textStatus, errorThrown){ 
                               alert("통신 실패.")
                           }
                       })
                	
				});
                
                function newChatRoom(){
                	window.open('/newChatRoom', "Win", "width=500,height=600");
                	win.document.write();

                }
 
  </script>

