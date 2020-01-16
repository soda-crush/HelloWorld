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
<style>
#pw{
	height: 38px;
	border-radius: 6%;
	border:1px solid #a8a8a8;
	position:relative;
	top:2px;
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
						<h1>내 정보 수정</h1>
						<hr>
						<p>비밀번호를 입력해주세요.</p><br>
					</div>
					<div class="col-12 text-center">
					<h3><br></h3>
						<input type="text" id=pw name=pw placeholder="비밀번호">&ensp;<button type="button" class="btn btn-secondary" id="do" style="display:inline;">확인</button>
						<h3><br><br><br><br></h3>
					</div>
				</div>
				
            </div>
            
            <script>
            	$("#do").on("click",function(){
            		var pw = $("#pw").val();
            		if(pw!=null && pw!=""){
                			$.ajax({
                        		url : "${pageContext.request.contextPath}/member/modifyPwCheck",
    							type : "post",
    							data : {pw : $("#pw").val()}
                		}).done(function(data){
                			if (data == "true" || data ==true) {
                				location.href="${pageContext.request.contextPath}/member/modify";
                               }else{
                               	alert("비밀번호가 일치하지않습니다.");
                				}
                		});
            		}else{
            		 	alert("비밀번호를 입력해주세요");
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
