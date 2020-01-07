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
            h1{text-align: center;padding-top: 50px; padding-bottom: 50px;}
            ul{background-color: lightgray;font-size: 13px;}
            .container{margin:auto; background-color: #efefef;}
            .card{ width:200px;height:300px;margin: auto;margin-top:10px; float :left;}
            .myprofile{float: left;height: 350px;}
            #mycard{float:none;display:flex;align-items:center;}
            .commentwrite{width:100%; height:100px;padding: 0px;margin-top: 10px;float: left;}
            .commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
            .col{margin: 0px; padding: 0px;}
            .content{height:90%;float: left;resize: none;}
            .sendbt{height:90%;float: left;}
            #writer{text-underline-position: auto;margin-right: 30px;}
            .commentlist>div>div{margin-right: 5px;}
            #commentForm{height:100%;}
            textarea{resize:none;}
            .page-item{padding:0px;height:10px;width:10px;}
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
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="${pageContext.request.contextPath}/GuestBook/selectList.do	">방명록</a>
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
	                    <a class="nav-link" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do" style="padding:7px;">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link"href="${pageContext.request.contextPath}/Plog/toPlogProject.do" style="padding:7px;">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="${pageContext.request.contextPath}/GuestBook/selectList.do" style="padding:7px;">방명록</a>
	                </li>
	            </ul>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/files/1578295891418_lion.png" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;"><!-- 아이디에대한 이미지값 -->
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3><!--  세션값 -->
	                            <p class="card-text" style="text-align: center;">point : 12,345</p><!--  세션에 대한 포인트값 -->
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-sm-6 col-md-8 col-lg-9 commentwrap">
	
	
	                    <div class="commentwrite">
	                    	<form action="${pageContext.request.contextPath}/GuestBook/insert.do" method="post" id="commentForm">
		                        <div class="row"></div>
<!-- 		                        <input type="hidden" name="owner" value="test"> 여기다 세션값 받아서 저장할것. -->
		                        <textarea class="col-10 content" placeholder="내용을 입력해주세요" name="content"></textarea>
		                        <button class="col-2 sendbt">작성</button>
	                    	</form>	
	                    </div>
	                    <div class="commentlist" style="float: left">
	                    
	                    	<c:forEach items="${list}"  var="dto">
		                		<div class="row" style="margin:5px;">
		                            <div>작성자 : </div>
		                            <div class="writer${dto.seq}"> ${dto.writer }</div>
		                            <div>작성일 :</div>
		                            <div id="writeDate"> ${dto.writeDate}</div>
		                        </div>
		                        <div class="row">
		                            <textarea class="message" style="margin:10px;width:100%;height:100%"  onkeydown="resize(this)" onkeyup="resize(this)" readonly>${dto.content }</textarea>
		                        </div>
		                        <div style="text-align:right"><button id="delete" onclick="location.href='${pageContext.request.contextPath}/GuestBook/delete.do?seq=${dto.seq}'">삭제하기</button></div>
							</c:forEach>
	                    </div>
	                    <div style="width:100%;float:left;">
		                    <c:forEach items="${pageNavi}" var="navi">									
								${navi}
							</c:forEach>
	               		</div>
	                   
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
       		function resize(obj) {
        	  obj.style.height = "1px";
        	  obj.style.height = (12+obj.scrollHeight)+"px";
        	}
        </script>
</body>
</html>
