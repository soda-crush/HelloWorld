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
	.btnM{
		width:120px;
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

            <div class="container">
				<div class="row">
					<div class="col-12">
						<h1>마이페이지</h1>
					</div>
				</div>
            <div class="row">
            	<div class="col-12 text-center">
            	<hr>
            	<h3><br></h3>
	            	<button type="button" class="btn btn-light btnM" id=modify>내 정보 수정</button><br><br>
	            	<button type="button" class="btn btn-light btnM" id=personalQ>1:1 문의</button><br><br>
	            	<button type="button" class="btn btn-light btnM" id=withdrawal>회원탈퇴</button>
            	</div>
            </div>
            
             </div>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        <script>
        	$("#modify").on("click",function(){
        		location.href = "${pageContext.request.contextPath}/member/modifyCheck";
        	})
        	$("#personalQ").on("click",function(){
        		location.href = "${pageContext.request.contextPath}/member1/myInquiry";
        	})
        	$("#withdrawal").on("click",function(){
        		location.href = "${pageContext.request.contextPath}/member/withdrawal";
        	})
        	
        </script>
</body>
</html>
