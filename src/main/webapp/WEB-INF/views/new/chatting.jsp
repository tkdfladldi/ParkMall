<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

  <title>CodePen - Fade and Blur on Hover Data Table</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
  
<style>
body {
	background: #fafafa url(https://jackrugile.com/images/misc/noise-diagonal.png);
	color: #444;
	font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
	text-shadow: 0 1px 0 #fff;
}

strong {
	font-weight: bold; 
}

em {
	font-style: italic; 
}

table {
	background: #f5f5f5;
	border-collapse: separate;
	box-shadow: inset 0 1px 0 #fff;
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
	width: 800px;
}	

th {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
	border-left: 1px solid #555;
	border-right: 1px solid #777;
	border-top: 1px solid #555;
	border-bottom: 1px solid #333;
	box-shadow: inset 0 1px 0 #999;
	color: #fff;
  font-weight: bold;
	padding: 10px 15px;
	position: relative;
	text-shadow: 0 1px 0 #000;	
}

th:after {
	background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
	content: '';
	display: block;
	height: 25%;
	left: 0;
	margin: 1px 0 0 0;
	position: absolute;
	top: 25%;
	width: 100%;
}

th:first-child {
	border-left: 1px solid #777;	
	box-shadow: inset 1px 1px 0 #999;
}

th:last-child {
	box-shadow: inset -1px 1px 0 #999;
}

td {
	border-right: 1px solid #fff;
	border-left: 1px solid #e8e8e8;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #e8e8e8;
	padding: 10px 15px;
	position: relative;
	transition: all 300ms;
}

td:first-child {
	box-shadow: inset 1px 0 0 #fff;
}	

td:last-child {
	border-right: 1px solid #e8e8e8;
	box-shadow: inset -1px 0 0 #fff;
}	

tr {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

tr:nth-child(odd) td {
	background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

tr:last-of-type td {
	box-shadow: inset 0 -1px 0 #fff; 
}

tr:last-of-type td:first-child {
	box-shadow: inset 1px -1px 0 #fff;
}	

tr:last-of-type td:last-child {
	box-shadow: inset -1px -1px 0 #fff;
}	

tbody:hover td {
	color: transparent;
	text-shadow: 0 0 3px #aaa;
}

tbody:hover tr:hover td {
	color: #444;
	text-shadow: 0 1px 0 #fff;
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

  
  


</head>
<body translate="no" >
 <div class="container-fluid">
 <div class="text-center">
                        <div style="font-size: 50px" class="error mx-auto" data-text="Chatting">Chatting</div>
                         <input type="text" id="message" class="form-control bg-light border-0 small" placeholder="채팅 입력"
                                aria-label="Search" aria-describedby="basic-addon2">
                                  <button class="btn btn-primary" id="sendBtn" type="button">메세지 전송 </button>
                        <p class="lead text-gray-800 mb-5"></p>
                        <p class="text-gray-500 mb-0" id="messageArea"></p>
                    </div>
                    </div>
  <table>
  <tbody>
    <tr>
      <td><strong>showSpeed</strong></td>
      <td>15</td>
      <td>The speed of the show/reveal</td>
    </tr>
    <tr>
      <td><strong>showEasing</strong></td>
      <td>'linear'</td>
      <td>The easing of the show/reveal</td>
    </tr>
    <tr>
      <td><strong>hideSpeed</strong></td>
      <td>50</td>
      <td>The speed of the hide/conceal</td>
    </tr>
    <tr>
      <td><strong>hideEasing</strong></td>
      <td>'linear'</td>
      <td>The easing of the hide/conceal</td>
    </tr>					
   
  </tbody>
</table>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script id="rendered-js" >
/* Hover over table rows to see fade/blur effect */
//# sourceURL=pen.js
    </script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
	$("#sendBtn").click(function() {
		if($("#message").val()==""){
			alert("내용을 입력해주세요");
			$("#message").focus();
			return false;
		}
		sendMessage();
		$('#message').val('')
	});
  
  let sock = new SockJS("/chatRoomHandler");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		if(data == "?type=exit&"){
			alert("이미 채팅방이 존재합니다.");
			onClose(data);
		}
		
		$("#messageArea").append(data + " <br/>");
		// 자동 스크롤 내려가게 하기 
		$("#messageArea").scrollTop($("#messageArea")[0].scrollHeight);
		/*  $("#messageArea").append(data + "<style>.name{color: blue; font-size: 20px;}a{text-decoration:none;}</style> <ui class=name><a href=#about>작성자 :${member.id}</a></ui> <br/>");*/
	}
	//서버와 연결 했을때
	function onOpen(evt){
		sock.send("?type=add&chatRoom_num=${roomNum}");
		sock.send("?type=firstMSG");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
	}
  
  
</script>
  

</body>

</html>
 
