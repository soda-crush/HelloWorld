<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<style>
div{
border : 0.5px solid green;
}
.boardCon{
padding-left: 3%;
padding-right: 3%;
}
.boardEle{
width: 100%;
background-color: white;
}
.boardEleTop{
padding-top: 5%;padding-bottom: 0%;color:white;padding-left: 2%;}
.bdt1{
background-color:#c25f55;}
.bdt2{
background-color:#53a998;}
.bdt3{
background-color:#5181a2;}
.boardEleCon{
padding-top: 9%;
padding-bottom:9%;
padding-left:3%;
padding-right:3%;
line-height: 260%;
}
.boardEleCon a{
color:black;
font-size: 11px;
}
.projectCon{
padding-top: 3%;
padding-bottom: 3%;
padding-left: 1%;
padding-right: 1%;
}
.projectEle{
width: 100%;
height: 300px;
background-color: white;
}
#adverEle{
width:100%;
height: 200px;
background-color: lightgray;
text-align: center;
line-height: 200px;
padding: 0px;
}
.adverCon{
padding: 0px;}
.fs1{
font-size: 11px;}
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
            		<div class="co1-12 col-lg-4 boardCon">
	            		<div class="boardEle">
		            		<div class="boardEleTop bdt1">
		            			<p class=mainTitle>대나무 숲</p>
		            			<p class=fs1>주간 조회수 TOP5</p>
		            		</div>
		            		<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${bamList.size()!=0}">
			            		<c:set var="cnt" value="1"/>
			            			<c:forEach items="${bamList}" var="bam">
			            			<c:set var="sum" value="${sum+1}"/>
			            			${sum}&emsp;
			            			<a href="/bamboo/bambooDetailView.do?seq=${bam.seq}"> ${bam.title}</a>
			            			<br>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
		            		</div>
	            		</div>
            		</div>
            		<div class="co1-12 col-lg-4 boardCon">
	            		<div class="boardEle">
			            	<div class="boardEleTop bdt2">
			            		<p class=mainTitle>Code-How</p>
			            		<p class=fs1>주간 스크랩수 TOP5</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${codeList.size()!=0}">
			            		<c:set var="cnt" value="1"/>
			            			<c:forEach items="${codeList}" var="code">
			            			<c:set var="sum" value="${sum+1}"/>
			            			${sum}&emsp; ${code.title}<br>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
			            	</div>
		            	</div>
            		</div>
            		<div class="co1-12 col-lg-4 boardCon">
	            		<div class="boardEle">
			            	<div class="boardEleTop bdt3">
			            		<p class=mainTitle>업계현황</p>
		            			<p class=fs1>주간 조회수 TOP5</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${indusList.size()!=0}">
			            		<c:set var="cnt" value="1"/>
			            			<c:forEach items="${indusList}" var="indus">
			            			<c:set var="sum" value="${sum+1}"/>
			            			${sum-5}&emsp;
			            			<a href="/industry/industryStatusDetailView.do?seq=${indus.seq}"> ${indus.title}</a>
			            			<br>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
			            	</div>
		            	</div>
            		</div>
            	</div>
            	
            	<div class= row>
            		<div class="col-12 adverCon text-center">
            		<br><br>
            			<div id=adverEle>
            				광고 자리
            			</div>
            		<br><br>
            		<h3>진행중인 프로젝트</h3>
            		<hr>
            		</div>
            	</div>
            	
            	<div class="row">
            		<div class="col-3 projectCon">
            			<div class="projectEle">
            				프로젝트 테스트<br>
            				테스트
            			</div>
            		</div>
            		<div class="col-3 projectCon">
            			<div class="projectEle">
            				프로젝트 테스트<br>
            				테스트
            			</div>
            		</div>
            		<div class="col-3 projectCon">
            			<div class="projectEle">
            				프로젝트 테스트<br>
            				테스트
            			</div>
            		</div>
            		<div class="col-3 projectCon">
            			<div class="projectEle">
            				프로젝트 테스트<br>
            				테스트
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
</body>
</html>