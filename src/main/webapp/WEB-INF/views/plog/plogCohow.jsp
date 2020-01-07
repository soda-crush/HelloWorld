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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
	<style>
		h1{text-align: center;padding-top: 50px;padding-bottom: 50px;}
		ul{background-color: lightgray;font-size: 13px;}
		.card{width:200px;height:300px;margin: auto;margin-top:10px;float :left;}
		.myprofile{float: left;height: 350px;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
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
            <div class="container">
				<h1> Programming-Log</h1>
	            <nav class="navbar navbar-expand-md navbar-light" style="background-color: #008EDC;">
		         	<a class="navbar-brand" href="#"></a>
		  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		   				 <span class="navbar-toggler-icon"></span>
		  			</button>
		            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		
		                <div class="navbar-nav box text-center plogNavi" id="naviCon">
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do">내 스크랩</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a>
		                </div>
		            </div>
		        </nav>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/img/profileSample.jpg" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3>
	                            <p class="card-text" style="text-align: center;">point : 12,345</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-sm-6 col-md-8 col-lg-9 cohowwrap">
	                </div>
	          	</div>
            </div>
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
