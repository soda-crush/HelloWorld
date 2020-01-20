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
<style>
input{
	height: 38px;
	border-radius: 5px;
	border:1px solid #a8a8a8;
	}
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

            
            <div class="container eleCon">

			<div class=row>
				<div class=col-12>
					<br>
					<h1>아이디 찾기</h1>
					<hr>
					<p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p><br>
				</div>
				<div class="col-12 text-center">
					<input type = text id = name name=name placeholder="이름" style="position:relative;bottom:2px;"><br>
					&emsp;<input type = text id = email name=email placeholder="이메일 주소" style="position:relative;left:55px;">
					<button type="button" class="btn btn-secondary" id=send style="position:relative;left:55px;">인증번호 받기 </button><br>
					<input type=text id=codeInput name = codeInput placeholder="인증코드 입력"><br>
					<button type="button" class="btn btn-success" id=findBtn style="position:relative;top:10px;">다음</button>
					<br><br>
				</div>
			</div>

            </div>
            <script>
            	$("#send").on("click",function(){
            		var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/gm;
                     var data = $("#email").val();
                     var result = regex.exec(data);
            		
                     if(result == null){
                    	 alert("이메일 형식이 아닙니다.");
                     }else{
                    	 $.ajax({
                 			url : "${pageContext.request.contextPath}/member/idFindmailSending",
                 			data : {
                 				name : $("#name").val(),
                 				email : $("#email").val()
                 			},
                 			type:"post"
                 		}).done(function(resp){
                 			alert("인증번호를 발송했습니다.\n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.");
                 		});
                     }
            	})
            	
            	$("#findBtn").on("click",function(){
            		$.ajax({
            			url : "${pageContext.request.contextPath}/member/ctfCodeProc",
            			data : {
            				email : $("#email").val(),
            				code : $("#codeInput").val()
            			},
            			type:"post"
            		}).done(function(resp){
            			if(resp == "true"){
            				location.href="${pageContext.request.contextPath}/member/showId?email="+$("#email").val();
            			}else{
            				alert("코드가 일치하지 않습니다. ");
            			}
            		});
            	})
            	
            </script>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
</body>
</html>
