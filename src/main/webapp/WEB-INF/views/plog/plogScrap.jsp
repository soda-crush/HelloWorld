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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
				<h1> Programming-Log</h1>
	            <ul class="nav nav-tabs d-none d-sm-block">
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a>
	                </li>
	            </ul>
	            <ul class="nav nav-tabs d-sm-none">
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do" style="padding:7px;">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do" style="padding:7px;">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do" style="padding:7px;">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link"href="${pageContext.request.contextPath}/Plog/toPlogProject.do" style="padding:7px;">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/GuestBook/selectList.do" style="padding:7px;">방명록</a>
	                </li>
	            </ul>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="lion.png" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3>
	                            <p class="card-text" style="text-align: center;">point : 12,345</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-sm-6 col-md-8 col-lg-9 scraptwrap">
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
</body>
</html>
