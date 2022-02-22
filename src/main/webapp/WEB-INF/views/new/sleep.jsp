<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <style type="text/css">
			    #cmdMessage {
			        height: 100vh;
			        background-image: url('/resources2/assets/img/comhi.jfif');
			        background-repeat : no-repeat;
			        background-size : cover;
			      }
			      p{
			      color: red;
			      font-size: 17px;
			      }
			      .w-btn {
				    position: relative;
				    border: none;
				    display: inline-block;
				    padding: 15px 30px;
				    border-radius: 15px;
				    font-family: "paybooc-Light", sans-serif;
				    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
				    text-decoration: none;
				    font-weight: 600;
				    transition: 0.25s;
				}
				.w-btn-green {
				    background-color: #77af9c;
				    color: #d7fff1;
				}
				.w-btn-gra1 {
				    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
				    color: white;
				}
				
				
    </style>
				<main>
                  		
                  						
                  		<div class="container-fluid">
					   
                    <!-- 404 Error Text -->
                    <div class="text-center" id="cmdMessage">
                    			<br>
                  				<button class="btn btn-primary" onclick="ipChk();">ip 확인</button>
                  				<button class="btn btn-primary" onclick="sleepChk();">컴퓨터 자동종료 설정</button>
                  				<br>
                  				<br>
                  				
                  					
                  		<div class="container" style=" Display:none ">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">자동종료</h3></div>
                                    <div class="card-body">
                                            <div class="form-floating mb-3" id="exitTime">
                                            	
                                            		<select id="hour" class="w-btn w-btn-green" >
					                  					<option>== 시간  ==</option>
					                  					<c:forEach begin="1" end="24" var="i">
						                                        <option value="${i}">${i} 시간</option>
						                                    </c:forEach>
					                  					
													</select>
													<select id="minute" class="w-btn w-btn-green" >
					                  					<option>== 분 ==</option>
					                  					  <c:forEach begin="1" end="60" var="i">
						                                        <option value="${i}">${i} 분</option>
						                                    </c:forEach>
													</select> 
													<p>후에 종료</p>
                                            </div>
                                            <button class="w-btn w-btn-gra1" id="gra" style="Display:none" type="button">
										        
										    </button>
                                            <div>
                                                <a class="w-btn w-btn-green" id="subMit" onclick="sleepSubmit();">확인</a>
                                           		 <a class="w-btn w-btn-green" onclick="Cancel();">예약 취소</a>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <select onchange="selectSleep();" id="selectSleep" class="btn btn-primary" style="width:500px; height:35px; Display:none ">
								    <option value="time">시간 설정</option>
								    <option value="day">날짜 설정</option>
								</select>
                    </div>
                            
                        <p class="lead text-gray-800 mb-5"></p>
                        <p class="text-gray-500 mb-0" id="message"></p>
                    	<div id="demo" style="font-size : 50px; color: red;"></div>
                    </div>
					
                </div>
                </main>
                
             <script type="text/javascript">
            var time = 0; //기준시간 작성
             
            if(time > 0){
         	var min = ""; //분
         	var sec = ""; //초

         	//setInterval(함수, 시간) : 주기적인 실행
         	var x = setInterval(function() {
         		//parseInt() : 정수를 반환
         		min = parseInt(time/60); //몫을 계산
         		sec = time%60; //나머지를 계산

         		document.getElementById("demo").innerHTML = min + "분" + sec + "초";
         		time--;

         		//타임아웃 시
         		if (time < 0) {
         			clearInterval(x); //setInterval() 실행을 끝냄
         			document.getElementById("demo").innerHTML = "종료";
         		}
         	}, 1000);
            	
            } 
            
         	
             function sleepSubmit() {
            	 var hour = $("#hour").val();
            	 var minute = $("#minute").val();
            	 
            	 if(hour == "== 시간 =="){
            		 hour = 0;
            	 }
            	 if(minute == "== 분 =="){
            		 minute = 0;
            	 }
            	 
            	 
            	 $.ajax({
      				type: "post",
      				url : "/newhome/sleepPost",
      				data : {"hour" : hour, "minute" : minute},
      				error : function(error) {
     					alert("알 수 없는 오류가 발생 했습니다.");
     				},
      				success : function(n) {
      					if(n > 1){
      						$("#exitTime").css('display', 'none');
      						$("#subMit").css('display', 'none');
      						$("#gra").show();	
      						var result = format(n);
      						$("#gra").append(result);
      						alert("예약 성공"); 
      					}
      					else if(n == 1){    
      					$("#exitTime").css('display', 'none');
  						$("#subMit").css('display', 'none');
  						var result = format(n);
  						$("#gra").append(result);
  						alert("예약 성공"); 
      					}
      					else{
      						alert("알 수 없는 오류");
      					}
      		         } 
      			})
 				}
				
             
             
             function selectSleep() {
            	 
            	 var selChk = $("#selectSleep").val();
				if(selChk == "time"){
					$(".container").show();	
				}else{
					$(".container").css('display', 'none');
				}
			}
             function format(n) {
            	var str = (n).toString();

				var substr1 = str.substring(0, 4) + "년";
				var substr2 = str.substring(4, 6)+ "월";
				var substr3 = str.substring(6, 8)+ "일";
				var substr4 = str.substring(8, 10)+ "시";
				var substr5 = str.substring(10, 12)+ "분";
				var substr6 = str.substring(12, 14)+ "초";
				str = substr1+substr2+substr3+substr4+substr5+substr6;
				return str;
				
			}
             
             function sleepChk() {
            	 $("#gra").empty();	
            	 $(".container").show();	
            	 $("#selectSleep").show();	
            	 $("#message").empty();	
            	 
            	 $.ajax({
	      				type: "post",
	      				url : "/newhome/sleepChk",
	      				error : function(error) {
	     					alert("알 수 없는 오류가 발생 했습니다.");
	     				},
	      				success : function(n) {
	      					if(n > 0){
	      						$("#exitTime").css('display', 'none');
	      						$("#subMit").css('display', 'none');
	      						$("#gra").show();	
	      						var result = format(n);
	      						$("#gra").append(result);
	      					}else if(n == 0){
	      						$("#exitTime").show();
	      						$("#subMit").show();
	      					}
	      		         } 
	      			})
		     }
             
             	function ipChk() {
             		$(".container").css('display', 'none');
             		$("#selectSleep").css('display', 'none');
             		$("#message").empty();	
           		 $.ajax({
     				type: "post",
     				url : "/newhome/ipChk",
     				error : function(error) {
    					alert("알 수 없는 오류가 발생 했습니다.");
    				},
     				success : function(n) {
     					$("#message").append(n);
     		         } 
     			})
				}
             	function Cancel() {
             		 $("#gra").empty();	
             		$.ajax({
         				type: "post",
         				url : "/newhome/Cancel",
         				error : function(error) {
        					alert("알 수 없는 오류가 발생 했습니다.");
        				},
         				success : function(n) {
         					if(n > 0){
	      						$("#gra").css('display', 'none');
	      						$("#exitTime").show();
	      						$("#subMit").show();
         						alert("예약 취소");
         					}else{
         						alert("알 수 없는 오류가 발생 했습니다.");
         					}
         					
         		         } 
         			})
				}
             	
             	
             
             </script>