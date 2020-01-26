<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

<!-- 데이트피커 -->
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<style>
	.arrow{
		width:12px;
	}
/* 	#imgCon{ */
/* 		width:100px; */
/* 		height: 100px; */
/*  		display: none;  */
/* 	} */
	.redP{
		font-size: 11px;
		color:red;
	}
	#startInputDate{
	width:130px;
	}
	.eleCon {
	background-color:#f7f7f7;
	}
	* {font-family: "NanumgothicBold";}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <form action="${pageContext.request.contextPath}/member/modifyProc" method="post" id=frm>
            <div class="container eleCon">
            
            <div class="row">
            	<div class="col-12">
            		<h4><br></h4>
            		<h3><img src="/icon/whiteArrow.svg" style="position:relative;bottom:3px;right:4px;">내 정보 수정</h3>
            		<p class=redP>&emsp;&emsp;* 은 필수표기정보입니다.</p> 
           		</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">아이디</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<h3>"${dto.id}"</h3>
            		<img id=idCheck style="display:none;">
            		<div id=idMsg></div>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">이름</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=text name=name id=name value="${dto.name}">
            		<img id=nameCheck style="display:none;">
            		<div id=nameMsg></div>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class="col-12 col-sm-6">
            	<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">비밀번호</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=password name=pw id=pw placeholder="비밀번호 입력">
            	</div>
            	<div class="col-12 col-sm-6">
            	<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">비밀번호 확인</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=password name=pwRe id=pwRe placeholder="비밀번호 재입력">
            		<img id=pwCheck style="display:none;">
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row id=empContainer>
            	<div class=col-12>
            		<input type=radio name=empCheck value=unemployee class=emp><h5 style="display:inline">일반</h5>
            	</div>
            	<div class=col-12>
            		<br>
            		<input type=radio name=empCheck value=employee class=emp><h5 style="display:inline">재직자</h5>
            		<input type=radio name=empCheck value=demotion class=emp style="display:none">
            		<input type=text name=demotionMail id=demotionMail  style="display:none">
            		<hr>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div id=empEle style="display:none;">
            	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">회사 메일</h5><div class="d-sm-none"></div><p class=redP style="display:inline">* 메일을 전송하는데 다소 시간이 걸립니다. 메일 전송 알림창이 뜰 때 까지 기다려 주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=empEmail id=empEmail placeholder="메일 주소 입력">
		            		<button type=button id=sendMail1>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">인증 코드</h5><p class=redP style="display:inline">*</p>
		            	<div class="d-sm-none"></div><p style="display:inline;" class="pl-2 pl-sm-0">-메일로 전송된 코드를 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=empCode id=empCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification1">인증</button>
		            		<img id=empEmailCheck style="display:none;">
	            	</div>
           		 </div>
            </div>
            <div id=unempEle style="display:none">
             	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">개인 메일</h5><div class="d-sm-none"></div><p class=redP style="display:inline">* 메일을 전송하는데 다소 시간이 걸립니다. 메일 전송 알림창이 뜰 때 까지 기다려 주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=unempEmail id=unempEmail placeholder="메일 주소 입력">
		            		<button type=button id=sendMail2>인증 메일 발송</button>
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">인증 코드</h5><p class=redP style="display:inline">*</p>
		            	<div class="d-sm-none"></div><p style="display:inline;" class="pl-2 pl-sm-0">-메일로 전송된 코드를 입력해주세요.</p>
		            		&emsp;<br>&emsp;<input type=text name=unempCode id=unempCode placeholder="인증 코드 입력">
		            		<button type=button id = "certification2">인증</button>
		            		<img id=unempEmailCheck style="display:none;">
	            	</div>
           		 </div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/doubleArrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">개인정보 공개여부</h5>
            		&emsp;Programming Log(포트폴리오, Ko-How, 프로젝트 참여현황)를 타인이 열람하는 것에 동의합니다.<br>
            		&emsp;비동의 하실경우 Programmming Log에서 프로필 정보만 공개됩니다.<br>
            		&emsp;동의합니다.<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheck" value="Y">
            		<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheckNone" value="N" style="display:none">
            	</div>
            </div> 
            
<!--             <div class=row> -->
<!--             	<div class=col-12> -->
<!--             		<br> -->
<!--             	</div> -->
<!--             </div> -->
<!--             <div class=row> -->
<!--             	<div class=col-12> -->
<!--             		<h5><img src="/icon/arrow.svg" class=arrow>프로필 사진</h5> -->
<!--             		<div id=imgCon></div> -->
<!--             		<input type=file id=img> -->
<!--             	</div> -->
<!--             </div> -->

              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">닉네임</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=text name=nickName id=nickName  value="${dto.nickName}">
            		<img id=nickCheck style="display:none;">
            		<div id=nickMsg></div>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">생년월일</h5><p class=redP style="display:inline">*</p><br>
						&emsp;<select id="birthdayYear" name=birthdayYear></select>
						<select id="birthdayMonth" name=birthdayMonth></select>
						<select id="birthdayDay" name=birthdayDay></select>
						<input name="birthday" id="birthday" style="display:none"> 
            		</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">주소</h5>
            		&emsp;<input type="text" id="postcode" name="postcode" value="${dto.postcode}" onclick="sample4_execDaumPostcode()" readonly>
            		<input type="button" onclick="sample4_execDaumPostcode()" value="찾기"><br>
            		&emsp;<input type="text" id="addr1" name=addr1  value="${dto.addr1}" onclick="sample4_execDaumPostcode()" readonly>
            		<input type=text name=addr2 id=addr2  value="${dto.addr2}">
            	</div>
            </div>  <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">휴대전화</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=text name=phone id=phone  value="${dto.phone}">
            		<img id=phoneCheck style="display:none;">
            		<div id=phoneMsg></div>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row style="display:none;">
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">가입 경로</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=radio name=joinPath value="jp1">지인 추천<br>
            		&emsp;<input type=radio name=joinPath value="jp2">'Hello World!' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp3">'프로젝트 모집' 검색<br>
            		&emsp;<input type=radio name=joinPath value="jp4">
            		<input type="text" placeholder="15자 이내의 사유를 입력해주세요" id=otherJoinPath name=otherJoinPath maxlength="15" readonly>
            		<p class=redP style="display:none" id=jp4Reason>* 기타가입사유를 꼭 입력해주세요.</p>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5 style="display:inline"><img src="/icon/arrow.svg" class=arrow style="position:relative;bottom:3px;right:3px;">성별</h5><p class=redP style="display:inline">*</p><br>
            		&emsp;<input type=radio name="gender" value="W">여성<br>
            		&emsp;<input type=radio name="gender" value="M">남성
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
            </div>
            <div class=row>
            	<div class="col-12 text-center">
            		<button type = button id=send>수정완료</button>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
            </div>
            
            </div>
            </form>
            <!--       몸통 끝!!!   -->
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
        var idTest = 0;
        var nameTest = 0;
        var pwTest = 0;
        var emailTest = 0;
        var nickTest = 0;
        var birthYearTest = 0;
        var birthMonthTest = 0;
        var birthDayTest = 0;
        var phoneTest = 0;
        var jpTest = 0;
        var genderTest = 0;
        var emailTest2 = 0;
        var emailTestEmp = 0;
        var emailTestUnemp = 0;
        
        //프로필 이미지 등록
        
        //인증버튼 클릭전 메일보냈는지 확인
        $("#empEmail").on("focusout",function(){
        	emailTest2 = 0;
        })
         $("#unempEmail").on("focusout",function(){
        	emailTest2 = 0;
        })
        
        //실무자 비실무자 체크
	        $("input:radio[name=empCheck]").click(function(){
	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
	            	emailTestEmp = 0;
	            	emailTestUnemp = 0;
	                $("#empEle").css("display","block");
	                $("#unempEle").css("display","none");
	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
	            	emailTestEmp = 0;
	            	emailTestUnemp = 0;
	            	$("#unempEle").css("display","block");
		            $("#empEle").css("display","none");
	            }
	        });
        
        //우편번호 api
         function sample4_execDaumPostcode() {
        		new daum.Postcode({
            		oncomplete: function(data) {
                		var roadAddr = data.roadAddress;
                		document.getElementById('postcode').value = data.zonecode;
                		document.getElementById("addr1").value = roadAddr;
            		}
        		}).open();
    		}
        
        //유효성 검사
        	//아이디
        	 //1. ID는 영어소문자,숫자만 가능해야함(4~12자리,소문자로 시작해야함)
                $("#id").on("focusout",function(){
                    var regex = /^[a-z][a-z0-9]{6,11}$/g;
                    var data =$("#id").val();
                    var result = regex.exec(data);

                    if(result == null){
                        $("#idMsg").html("&emsp;아이디는 소문자로 시작해야하며 숫자,소문자를 이용해  7-14자로 입력하십시오.");
                    }else{
                    	 $("#idMsg").html("");
                    	$.ajax({
                    		url : "${pageContext.request.contextPath}/member/duplCheck",
							type : "post",
							data : {id : $("#id").val()},
							dataType : "json"
								}).done(function(data){
									if (data.result == "true") {
										$("#idCheck").css("display","inline");
										$("#idCheck").attr("src","/icon/x.svg");
									}else{
										$("#idCheck").css("display","inline");
										$("#idCheck").attr("src","/icon/check.svg");
										idTest = 1;
									}
								})
                    }
                })
                $("#id").on("input",function(){
                	$("#idCheck").css("display","none");
                })
        
               //비밀번호 
                $("#pw").on("focusout",function(){
                	var regex = /^[0-8a-zA-Z]{4,12}$/;
                	var data = $("#pw").val();
                	var result = regex.exec(data);
                	
                	if(result == null){
                		 $("#pwMsg").html("&emsp;4~12자의 영문 대/소문자, 숫자만 사용 가능");
                		 $("#pwCheck").css("display","inline");
   						 $("#pwCheck").attr("src","/icon/x.svg");
                         pwTest = 0;
                	}else{
                		$("#pwMsg").html("");
                		var pw =$("#pw").val();
                        var pwRe =$("#pwRe").val();

                        if((pw != "")||(pwRe != "")){
                        	 if(pw == pwRe){
                             	$("#pwCheck").css("display","inline");
         						$("#pwCheck").attr("src","/icon/check.svg");
         						pwTest = 1;
                             }else{
                             	$("#pwCheck").css("display","inline");
         						$("#pwCheck").attr("src","/icon/x.svg");
         						pwTest = 0;
                             }
                    	}
                	}
                }) 

				 $("#pwRe").on("focusout",function(){
                	var regex = /^[0-8a-zA-Z]{4,12}$/;
                    var data = $("#pwRe").val();
                    var result = regex.exec(data);
                    
                    if(result == null){
               		 $("#pwMsg").html("&emsp;4~12자의 영문 대/소문자, 숫자만 사용 가능");
               		 $("#pwCheck").css("display","inline");
					 $("#pwCheck").attr("src","/icon/x.svg");
                     pwTest = 0;
               		}else{
               		 $("#pwMsg").html("");
               		 var pw =$("#pw").val();
                     var pwRe =$("#pwRe").val();

 					if((pw != "")||(pwRe != "")){
 						 if(pw == pwRe){
 		                    	$("#pwCheck").css("display","inline");
 								$("#pwCheck").attr("src","/icon/check.svg");
 								pwTest = 1;
 		                    }else{
 		                    	$("#pwCheck").css("display","inline");
 								$("#pwCheck").attr("src","/icon/x.svg");
 		                    }
                 	}
               		}
                }) 
        	
        
            
                
            
                
            
                
            //가입경로 체크
           	  $("input:radio[name=joinPath]").click(function(){
	            if($("input:radio[name=joinPath]:checked").val()=='jp4'){
	            	$("#jp4Reason").css("display","inline");
	            	jpTest = 0;
	            	var Ele1 = document.getElementById('otherJoinPath') ;
	            	Ele1.readOnly = false;
	            }else{
	            	var Ele1 = document.getElementById('otherJoinPath') ;
	            	Ele1.readOnly = true;
	            	$("#otherJoinPath").val("");
	            	jpTest = 1;
	            }
	        });
            
            $("#otherJoinPath").on("focusout",function(){
            	 if($("#otherJoinPath").val() != ""){
            		 jpTest = 1;
            	 }else{
            		 jpTest = 0;
            	 }
            });
            
            
            
            //성별체크
              $("input:radio[name=gender]").click(function(){
	           genderTest = 1;
	        	});
            
            //이메일 유효성 검사
            emailTest = 1;
 	               //실무자 체크했을때
 	            	 $("#sendMail1").on("click",function(){
 	            		 if(emailTestEmp == 2){
 	            			 alert("이미 메일을 전송하였습니다. 메일 재전송을 원하시면 회원가입 절차를 다시 진행해주십시오.");
 	            			 return false;
 	            		 }else if(emailTestEmp == 1){
 	            			alert("메일 전송 절차가 진행중입니다. 알림창이 뜰때까지 기다려 주십시오.");
 	            			 return false;
 	            		 }
 	            		 
 	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/g;
 	                     var data = $("#empEmail").val();
 	                     var result = regex.exec(data);
 	                     var oriMail = '${dto.email}'; 

 	                    if(data == oriMail){
	                    	 alert("동일한 이메일은 재인증을 안하셔도 괜찮습니다.");
	                    	 emailTest = 1;
	                     }else{
	                    	 if(result == null){
	 							//이메일 형식 아닌경우
	 							alert("올바른 이메일 형식이 아닙니다. 확인부탁드립니다.");
								return false;
	  	                     }else{
	  	                    	//이메일 형식 맞는 경우
	  	                    	
	  	                    	//디비에 있는지 먼저 확인
	  	                    	$.ajax({
	  	 	 	              			url:"${pageContext.request.contextPath}/member/isEmailALready",
	  	 	 	              			type:"post",
	  	 	 	              			data:{
	  	 	 	              				email : $("#empEmail").val()
	  	 	 	              			}
	  	 	 	              		}).done(function(resp){
	  	 	 	              			if(resp == "true"){
	  	 	 	              				alert("이미 등록된 이메일입니다.");
	  	 	 	              			}else{
	 	 	 	 	              			var regex = /^\w+@\w+.co.kr$/g;
	 	 	 	 	                    	var data = $("#empEmail").val();
	 	 	 	 	 	                    var result = regex.exec(data);
	 	 	 	 	 	                    
	 	 	 	 	 	             		//실무자 : 네이버만 임시로 풀기
	 	 	 	              				var regexNaver = /^\w+@naver.com$/g;
	 	 	 	              				var resultNaver = regexNaver.exec(data);
		 	 	 	 	                    if(resultNaver != null){
		 	 	 	 	                    	emailTestEmp = 1;
			 	 	 	 	                    emailTest2 = 1;
		 	 	 	 	                    	$.ajax({
		 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
		 	 	 	 	              			type:"post",
		 	 	 	 	              			data:{
		 	 	 	 	              				email : $("#empEmail").val()
		 	 	 	 	              			}
		 	 	 	 	              			}).done(function(data){
		 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
		 	 	 	 	              			emailTestEmp = 2;
	 	 	 	 	              			});
		 	 	 	 	                    	return false;
		 	 	 	 	                    }
		 	 	 	 	                    //----------
	 	 	 	 	 	                    
	 	 	 	 	 	                    var regex2 = /^\w+@\w+.pe.kr$/g;
	 	 	 		 	                    var result2 = regex2.exec(data);
	 	 	 		 	                    
	 	 	 		 	                    if(result2 != null){
	 	 	 		 	                    	alert("개인 도메인(예. pe.kr)을 상업적 목적으로 이용하실 경우 일반회원으로 가입후 일대일문의를 통해 재직자 인증부탁드립니다.");
	 	 	 		 	                    	return;
	 	 	 		 	                    }
	 	 	 		 	                    
	 	 	 	 	 	                    if(result == null){
	 	 	 	 	 	                    	alert("영리 단체 도메인(co.kr)이 아닙니다. 일반회원 선택후 진행해주세요.");
	 	 	 	 	 	                    }else{
	 	 	 	 	 	                   		emailTestEmp = 1;
	 	 	 	 	 	                    	emailTest2 = 1;
	 	 	 	 	 	                    	$.ajax({
	 	 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
	 	 	 	 	 	              			type:"post",
	 	 	 	 	 	              			data:{
	 	 	 	 	 	              				email : $("#empEmail").val()
	 	 	 	 	 	              			}
	 	 	 	 	 	              		}).done(function(data){
	 	 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.");
	 	 	 	 	 	              			emailTestEmp = 2;
	 	 	 	 	 	              		});
	 	 	 	 	 	                    }
	  	 	 	              			}
	  	 	 	              		});
	                     }
 	                     
 	                     }
 	                 })

 	           
 	            	//비실무자 체크했을때
 	            	  $("#sendMail2").on("click",function(){
 	                     var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/g;
 	                     var data = $("#unempEmail").val();
 	                     var result = regex.exec(data);
						 var oriMail = '${dto.email}'; 
						 
 	                     if(data == oriMail){
 	                    	 alert("동일한 이메일은 재인증을 안하셔도 괜찮습니다.");
 	                    	 emailTest = 1;
 	                     }else{
 	                    	 if(emailTestUnemp == 2){
 	 	            			 alert("이미 메일을 전송하였습니다. 메일 재전송을 원하시면 회원가입 절차를 다시 진행해주십시오.");
 	 	            			 return false;
 	 	            		 }else if(emailTestUnemp == 1){
 	 	            			alert("메일 전송 절차가 진행중입니다. 알림창이 뜰때까지 기다려 주십시오.");
 	 	            			 return false;
 	 	            		 } 
 	                    	 
 	                    	if(result == null){
 								//이메일 형식 아닌경우
 								alert("올바른 이메일 형식이 아닙니다. 확인부탁드립니다.");
 								return false;
 	 	                     }else{
 	 	                    	//이메일 형식 맞는 경우
 	 	                    	
 	 	                    	//디비에 있는지 먼저 확인
 	 	                    	$.ajax({
 	 	 	 	              			url:"${pageContext.request.contextPath}/member/isEmailALready",
 	 	 	 	              			type:"post",
 	 	 	 	              			data:{
 	 	 	 	              				email : $("#unempEmail").val()
 	 	 	 	              			}
 	 	 	 	              		}).done(function(data){
 	 	 	 	              			if(data == "true"){
 	 	 	 	              				alert("이미 등록된 이메일입니다.");
 	 	 	 	              			}else{
 	 	 	 	              			var regex = /^\w+@\w+.co.kr$/g;
 	 	 	 	                    	var data = $("#unempEmail").val();
 	 	 	 	 	                    var result = regex.exec(data);
 	 	 	 	 	                    if(result == null){
 	 	 	 	 	                   		emailTestUnemp = 1;
 	 	 	 	 	                    	emailTest2 = 1;
 	 	 	 	 	                    	$.ajax({
 	 	 	 	 	 	              			url:"${pageContext.request.contextPath}/member/mailSending",
 	 	 	 	 	 	              			type:"post",
 	 	 	 	 	 	              			data:{
 	 	 	 	 	 	              				email : $("#unempEmail").val()
 	 	 	 	 	 	              			}
 	 	 	 	 	 	              		}).done(function(data){
 	 	 	 	 	 	              			alert("인증 메일이 전송되었습니다. 메일을 확인해주세요.\n개인 도메인(예시. pe.kr)을 상업적 목적으로 이용하실 경우 일반회원으로 가입후 일대일문의를 통해 재직자 인증부탁드립니다.");
 	 	 	 	 	 	              			emailTestUnemp = 2;
 	 	 	 	 	 	              		});
 	 	 	 	 	                    }else{
 	 	 	 	 	                    	alert("영리단체 도메인(co.kr)은 재직자로 가입부탁드립니다.");
 	 	 	 	 	                    }
 	 	 	 	              			}
 	 	 	 	              		});	
 	 	                    	
 	                     }
 	                    	
 	                     }
 	                 })
 	                 
 	                 //메일 내용 변경시 검사 0
 	                  $("#empEmail").on("input",function(){
 	                	  emailTest = 0;
 	                  })
 	                   $("#unempEmail").on("input",function(){
 	                	  emailTest = 0;
 	                  })
            
            //이메일 인증코드 확인 - 실무자
            $("#certification1").on("click",function(){
            	if(emailTest2 == 0){
            		alert("인증 메일 발송부터 진행하여 주십시오.");
            	}else{
            		$.ajax({
            			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
            			type:"post",
            			data:{
            				email : $("#empEmail").val(),
            				code : $("#empCode").val()
            			}
            		}).done(function(data){
            			if(data == "true"){
            				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
            				$("#empEmailCheck").css("display","inline");
							$("#empEmailCheck").attr("src","/icon/check.svg");
                			emailTest = 1;
            			}else{
            				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
            				$("#empEmailCheck").css("display","inline");
							$("#empEmailCheck").attr("src","/icon/x.svg");
            				emailTest = 0;
            			}
            		});
            	}
            	})
            	
            //이메일 인증코드 확인 - 비실무자
            	$("#certification2").on("click",function(){ㄴ
            		if(emailTest2 == 0){
                		alert("인증 메일 발송부터 진행하여 주십시오.");
                	}else{
                		$.ajax({
                			url:"${pageContext.request.contextPath}/member/ctfCodeProc",
                			type:"post",
                			data:{
                				email : $("#unempEmail").val(),
                				code : $("#unempCode").val()
                			}
                		}).done(function(data){
                			if(data == "true"){
                				alert("인증에 성공하셨습니다. 계속 진행하여 주십시오.");
                				$("#unempEmailCheck").css("display","inline");
    							$("#unempEmailCheck").attr("src","/icon/check.svg");
                    			emailTest = 1;
                			}else{
                				alert("인증에 실패하였습니다. 코드를 다시 확인해주시기 바랍니다.");
                				$("#unempEmailCheck").css("display","inline");
    							$("#unempEmailCheck").attr("src","/icon/x.svg");
                				emailTest = 0;
                			}
                		});
                	}
            	})
            	
            //생년월일 2
            //생년월일 select
			window.onload = function(){

				var toDay = new Date();
				var year  = toDay.getFullYear();
				var month = (toDay.getMonth()+1);
				var day   = toDay.getDate();

				var str = "";
				// 년도 설정
				for (var i=year-1; i>=1900; i--) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>년</option>";	
				$("#birthdayYear").html(str);
				
				
				// 월, 일 설정
				str = "";
				for (var i=12; i > 9; i--) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				for (var i=9; i > 0; i--) {
					str += "<option value='0" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>월</option>";	
				$("#birthdayMonth").html(str);
				
				str = "";
				for (var i=31; i > 9; i--) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				}
				for (var i=9; i > 0; i--) {
					str += "<option value='0" + i + "' selected='selected'>" + i + "</option>";
				}
				str += "<option value='N' selected='selected'>일</option>";	
				$("#birthdayDay").html(str);
				
				
				//다시 뿌려주는 정보
				 //실무자 비실무자 체크
				 if(${dto.memLevel==2}){//비실무자
					 	$('input:radio[name=empCheck]:input[value=unemployee]').attr("checked", true);
		            	$("#unempEle").css("display","block");
			            $("#empEle").css("display","none");
			            $("#unempEmail").val("${dto.email}");
		            }else if(${dto.memLevel==3}){//실무자
		            	$('input:radio[name=empCheck]:input[value=employee]').attr("checked", true);
		            	$("#empEle").css("display","block");
			            $("#unempEle").css("display","none");
			            $("#empEmail").val("${dto.email}");
		            }else{//강등
		            	$('input:radio[name=empCheck]:input[value=demotion]').attr("checked", true);
		            	$("#empContainer").css("display","none");
		            }

					//개인정보
					if(${dto.ifmOpenCheck=='Y'}){
						$("#ifmOpenCheck").attr("checked", true);
					}
					
					//년도
					var string = '${dto.birth}';
					var date =string.split(' ')[0];
					var eleDate = date.split('-');
					$("#birthdayYear").val(eleDate[0]).prop("selected", true);
					$("#birthdayMonth").val(eleDate[1]).prop("selected", true);
					$("#birthdayDay").val(eleDate[2]).prop("selected", true);
					
					
				//회원가입 유효성 검사
				nameTest = 1;
				//이름
	             $("#name").on("focusout",function(){
	                   var regex = /^[ㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/g;
	                   var data =$("#name").val();
	                   var result = regex.exec(data);

	                    if(result == null){
	                    	$("#nameCheck").css("display","inline");
							$("#nameCheck").attr("src","/icon/x.svg");
							nameTest = 0;
	                    }else{
							$("#nameCheck").css("display","inline");
							$("#nameCheck").attr("src","/icon/check.svg");
							nameTest = 1;
	                    }
	                })
	                $("#nameName").on("input",function(){
	                	nameTest = 0;
	                	$("#nameCheck").css("display","none");
	                	nameTest = 0;
	                })
				
	                //닉네임
	                nickTest=1;
	                //닉네임 중복검사
	           		  $("#nickName").on("focusout",function(){
	                   var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,7}$/g;
	                   var data =$("#nickName").val();
	                   var result = regex.exec(data);
	                   var oriNick = '${dto.nickName}';
	                   
	                   if(oriNick == data){
	                	   $("#nickCheck").css("display","inline");
						   $("#nickCheck").attr("src","/icon/check.svg");
						   nickTest = 1;
	                   }else{
	                	   if(result == null){
		                        $("#nickMsg").html("&emsp;닉네임은 한글,영문자,숫자를 조합하여 2-10자로 입력해 주세요.");
		                        nickTest = 0;
		                    }else{
		                    	$("#nickMsg").html("");
		                    	$.ajax({
		                    		url : "${pageContext.request.contextPath}/member/nickDuplCheck",
									type : "post",
									data : {nickName : $("#nickName").val()},
									dataType : "json"
										}).done(function(data){
											if (data.result == "true") {
												$("#nickCheck").css("display","inline");
												$("#nickCheck").attr("src","/icon/x.svg");
												nickTest = 0;
											}else{
												$("#nickCheck").css("display","inline");
												$("#nickCheck").attr("src","/icon/check.svg");
												nickTest = 1;
											}
										})
		                    }
	                   }
	
	                    
	                })
	                $("#nickName").on("input",function(){
	                	nickTest=0;
	                	$("#nickCheck").css("display","none");
	                })
	                
	                //연락처
	                phoneTest = 1;
	           		//휴대폰 번호 중복,유효성 검사
	              	$("#phone").on("focusout",function(){
	                     var regex = /^\d{10,11}$/g;
	                     var data =$("#phone").val();
	                     var result = regex.exec(data);
	                     var oriPhone = '${dto.phone}';
	                     
	                     if(oriPhone == data){
	                    	 $("#phoneCheck").css("display","inline");
								$("#phoneCheck").attr("src","/icon/check.svg");
								phoneTest = 1;
	                     }else{
	                    	 if(result == null){
		                          $("#phoneMsg").html("&emsp;올바른 휴대폰번호 형식이 아닙니다.");
									phoneTest = 0;
		                      }else{
		                      	$("#phoneMsg").html("");
		                      	$.ajax({
		                      		url : "${pageContext.request.contextPath}/member/phoneDuplCheck",
		  							type : "post",
		  							data : {phone : $("#phone").val()},
		  							dataType : "json"
		  								}).done(function(data){
		  									if (data.result == "true") {
		  										$("#phoneCheck").css("display","inline");
		  										$("#phoneCheck").attr("src","/icon/x.svg");
		  										phoneTest = 0;
		  									}else{
		  										$("#phoneCheck").css("display","inline");
		  										$("#phoneCheck").attr("src","/icon/check.svg");
		  										phoneTest = 1;
		  									}
		  								})
		                      }
	                     }
	                  })
	                  $("#phone").on("input",function(){
	                	  phoneTest = 0;
	                  	$("#phoneCheck").css("display","none");
	                  })
					
					//생년 월일
					birthYearTest = 1;
	              	birthMonthTest = 1;
	              	birthDayTest = 1;
	              //생년월일 유효성 검사
	    			$("#birthdayYear").on("change",function(){
	    				if($("#birthdayYear").val() != "N"){
	    					birthYearTest = 1;
	    				}else{
	    					birthYearTest = 0;
	    				}
	    			})
	    			$("#birthdayMonth").on("change",function(){
	    				if($("#birthdayMonth").val() != "N"){
	    					birthMonthTest = 1;
	    				}else{
	    					birthMonthTest = 0;
	    				}
	    			})
	    			$("#birthdayDay").on("change",function(){
	    				if($("#birthdayDay").val() != "N"){
	    					birthDayTest = 1;
	    				}else{
	    					birthDayTest = 0;
	    				}
	    			})
	              	
	                  //가입경로 뿌리기
	                  var joinPath = "${dto.joinPath}";
	                  if(joinPath == "지인 추천"){
	                	  $('input:radio[name=joinPath]:input[value=jp1]').attr("checked", true);
	                	  jpTest = 1;
	                  }else if(joinPath == "'Hello World!' 검색"){
	                	  $('input:radio[name=joinPath]:input[value=jp2]').attr("checked", true);
	                	  jpTest = 1;
	                  }else if(joinPath == "'프로젝트 모집' 검색"){
	                	  $('input:radio[name=joinPath]:input[value=jp3]').attr("checked", true);
	                	  jpTest = 1;
	                  }else{
	                	  $('input:radio[name=joinPath]:input[value=jp4]').attr("checked", true);
	                	  $("#otherJoinPath").val(joinPath);
	                	  jpTest = 1;
	                  }
	    			
	                  //성별 뿌리기
	                  var gender = "${dto.gender}";
	                  if(gender=='W'){
	                	  $('input:radio[name=gender]:input[value=W]').attr("checked", true);
	                	  genderTest = 1;
	                  }else{
	                	  $('input:radio[name=gender]:input[value=M]').attr("checked", true);
	                	  genderTest = 1;
	                  }
	                  
			}
            
          
            

			
			
            	
            //가입버튼 누르기전 마지막 체크
            	$("#send").on("click",function(){
            		if(${dto.memLevel!=1}){
            			if((pwTest*birthYearTest*birthMonthTest*birthDayTest*nickTest*phoneTest*jpTest*genderTest*nameTest*emailTest) != 1){
            				//console.log("pwTest*birthYearTest*birthMonthTest*birthDayTest*nickTest*phoneTest*jpTest*genderTest*nameTest");
                			//console.log(pwTest + " : " + birthYearTest + " : " + birthMonthTest + " : " + birthDayTest + " : " + nickTest + " : " + phoneTest + " : " + jpTest + " : " + genderTest + " : " + nameTest);
            				alert("조건에 만족하지 않는 문항이 있습니다. 확인부탁드립니다.")
                         }else{
                        	var result = confirm("이대로 수정하시겠습니까?");
                        	if(result){
                        		//날짜 다시 2009-03-20 10:20:30.0
                        		var date = $("#birthdayYear").val()+"-"+ $("#birthdayMonth").val()+"-"+ $("#birthdayDay").val()+" 00:00:00.0";
                        		$("#birthday").val(date);
                        		if($("#postcode").val()==""||$("#postcode").val()==null){
                        			$("#postcode").val("");
                        		}
    							//체크 안돼있으면 ifmOpenCheckNone으로 바꾸기
    							var ifmChk = $("#ifmOpenCheck").prop("checked");
    							if(ifmChk == false){
    								$("#ifmOpenCheckNone").prop("checked", true);
    							}
                        		$("#frm").submit();
                        	}
                        }
            		}else{
            			//console.log("pwTest*birthYearTest*birthMonthTest*birthDayTest*nickTest*phoneTest*jpTest*genderTest*nameTest");
            			//console.log(pwTest + " : " + birthYearTest + " : " + birthMonthTest + " : " + birthDayTest + " : " + nickTest + " : " + phoneTest + " : " + jpTest + " : " + genderTest + " : " + nameTest);
            			if((pwTest*birthYearTest*birthMonthTest*birthDayTest*nickTest*phoneTest*jpTest*genderTest*nameTest) != 1){
                         	alert("조건에 만족하지 않는 문항이 있습니다. 확인부탁드립니다.")
                         }else{
                        	var result = confirm("이대로수정하시겠습니까?");
                        	if(result){
                        		//날짜 다시 2009-03-20 10:20:30.0
                        		var date = $("#birthdayYear").val()+"-"+ $("#birthdayMonth").val()+"-"+ $("#birthdayDay").val()+" 00:00:00.0";
                        		$("#birthday").val(date);
                        		if($("#postcode").val()==""||$("#postcode").val()==null){
                        			$("#postcode").val("");
                        		}
        		            	$("#demotionMail").val('${dto.email}');
    							//체크 안돼있으면 ifmOpenCheckNone으로 바꾸기
    							var ifmChk = $("#ifmOpenCheck").prop("checked");
    							if(ifmChk == false){
    								$("#ifmOpenCheckNone").prop("checked", true);
    							}
                        		$("#frm").submit();
                        	}
                        }
            		}
             		
            	})
            	
        </script>
</body>
</html>
