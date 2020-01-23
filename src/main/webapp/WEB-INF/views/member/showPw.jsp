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

            <form action="${pageContext.request.contextPath}/member/showPwMdf" method="post" id=frm>
	            <div class="container eleCon">
	            	<div class=row>
	            		<div class=col-12>
	            			<br>
	            			<h1>비밀번호 찾기</h1>
	            			<hr>
	            			<p class="text-center">${id}님 비밀번호를 변경해주세요. </p>
	            			<input type=text name=id style="display:none;" value="${id}">
	            			<div class="text-center">
	            			<input type="password" name=pw id=pw placeholder="비밀번호 입력" style="position:relative;bottom:2px;"><br>
	            			<input type="password" name=pwRe id=pwRe placeholder="비밀번호 재입력" >
	            			<div id=pwMsg style="color:red;font-size:13px;"></div>
	            			<button type="button" class="btn btn-secondary" id=btn style="position:relative;top:2px;">변경</button>
	            			</div>
	            			<br>
	            		</div>
	            	</div>
	            </div>
            </form>
            
            <script>
            var pwTest = 0;
            $("#pw").on("focusout",function(){
            	var regex = /[0-8a-zA-Z]{4,12}/;
            	var data = $("#pw").val();
            	var result = regex.exec(data);
            	
            	if(result == null){
            		 $("#pwMsg").html("&emsp;4~12자의 영문 대/소문자, 숫자만 사용 가능");
            		 pwTest = 0;
            	}else{
            		$("#pwMsg").html("");
            		pwTest = 1;
            	}
            
            })
            
            
            	$("#btn").on("click",function(){
            		if(pwTest == 0){
            			alert("비밀번호가 조건에 만족하지 않습니다. 조건을 확인해 주세요.");
            			return false;
            		}
            		  var pw =$("#pw").val();
                      var pwRe =$("#pwRe").val();

                      if((pw == "")||(pwRe == "")){
                    	  alert("모두 입력해주세요.");
                      }else{
                    	  if(pw == pwRe){
      						  //디비에서 비번 변경
      						$("#frm").submit();
      					  }else{
      						  alert("비밀번호가 일치하지않습니다.");
      					  }
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
