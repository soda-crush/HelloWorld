<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<style>
div{
	border: 1px solid green;
}
.input1{
	width:100%;
}
.btnEle{
	width:100%;
	height: 100%;
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
            
            <div class=container>
            	<div class="row">
            	<div class="col-1"></div>
            		<div class="col-5">
            		<h4>로그인</h4>
            		<div class="row">
            			<div class="col-8">
            				<input type="text" name="id" id="id" class="input1" placeholder="아이디 입력"><br>
            				<input type="text" name="pw" id="pw" class="input1" placeholder="비밀번호 입력">
            			</div>
            			<div class="col-2">
            			<button>로그인</button>
            			</div>
            			<div class="col-2">
            			<button>
            			ㄹ
            			</button>
            			</div>
            		</div>
            		</div>
            		<div class="col-5">
            		
            		</div>
            	<div class="col-1"></div>
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
</body>
</html>