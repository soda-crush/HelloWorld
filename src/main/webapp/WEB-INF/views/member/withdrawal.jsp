<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
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
					<h1>회원탈퇴</h1>
					<hr>
					<p>회원탈퇴 진행시 탈퇴한 아이디로는 재가입이 불가능합니다. 비밀번호를 입력해 주세요.</p><br>
				</div>
				<div class="col-12 text-center">
					<h1><br></h1>
					<input type = "password" id = pw name=pw placeholder="비밀번호 입력" class=inputStyle1>
					<button type="button" class="btn btn-dark" id=do>탈퇴</button>
					<h1><br><br><br></h1>
				</div>
			</div>

            </div>
            <script>
            	$("#do").on("click",function(){
            		
            		var pw = $("#pw").val();
            		if(pw == "" || pw == null){
            			alert("비밀번호를 입력해주세요.");
            			return false;
            		}
            		
            		var result = confirm("정말 탈퇴하시겠습니까?");
            		if(result){
            			$.ajax({
                 			url : "${pageContext.request.contextPath}/member/withdrawalCheck",
                 			data : {
                 				pw : $("#pw").val()
                 			},
                 			type:"post"
                 		}).done(function(resp){
                 			if(resp == "notEquals"){
                 				alert("비밀번호가 일치하지 않습니다.");
                 			}else if(resp == "success"){
                 				alert("탈퇴되었습니다.");
                 				location.href="${pageContext.request.contextPath}/member/logout";
                 			}else{
                 				alert("탈퇴중 오류. 일대일 문의를 통해 문의해주세요.");
                 			}
                 		});
            		}
            		
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
