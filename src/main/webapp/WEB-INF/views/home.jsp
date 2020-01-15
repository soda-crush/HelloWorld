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
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<style>
.boardCon{
padding-left: 3%;
padding-right: 3%;
}
.boardEle{
width: 100%;
background-color: white;
}
.boardEleTop{
padding-top: 5%;padding-bottom: 3%;color:white;padding-left: 2%;}
.bdt1{
background-color:#c25f55;}
.bdt2{
background-color:#53a998;}
.bdt3{
background-color:#5181a2;}
.boardEleCon{
padding-top: 9%;
padding-bottom:5%;
padding-left:3%;
padding-right:3%;
line-height: 150%;
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
height: 350px;
background-color: white;
border-radius: 2%;
}
#adverEle{
width:100%;
height: 200px;
background-color: lightgray;
text-align: center;
line-height: 200px;
}
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
			            			<c:forEach items="${bamList}" var="bam" varStatus="status">
			            			<div class="cursorPointer" onclick="location.href='/bamboo/bambooDetailView.do?seq=${bam.seq}'" style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${status.count}&emsp; ${bam.title}</div>
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
			            		<p class=fs1>주간 조회수 TOP5</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${codeList.size()!=0}">
			            			<c:forEach items="${codeList}" var="code" varStatus="status">
			            			<div class="cursorPointer" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${code.seq}'" style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${status.count}&emsp; ${code.title}</div>
			            			<br>
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
			            			<c:forEach items="${indusList}" var="indus" varStatus="status">
			            			<div class="cursorPointer" onclick="location.href='/industry/industryStatusDetailView.do?seq=${indus.seq}'"  style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${status.count}&emsp; ${indus.title}</div>
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
            	<c:choose>
            		<c:when test="${proList.size()!=0}">
            		<c:set var="cnt" value="1"/>
            			<c:forEach items="${proList}" var="pro">
            			<c:set var="sum" value="${sum+1}"/>
            				<div class="col-6 col-md-4 col-xl-3 projectCon">
		            			<div class="projectEle text-center cursorPointer" id="projectEle${sum}"  data-aos="fade-up">
		            			<br>
		            				<h4 style="word-break:break-all;word-break:break-word;">"${pro.languages}"</h4>
		            				<br>
		            				<div style="word-break:break-all;word-break:break-word;">${pro.title}</div>
		            				<br>모집인원 : ${pro.capacity}<br>
		            				지역 : ${pro.location1}&ensp;${pro.location2}<br>
		            				팀장 : ${pro.writer}<br>
		            				기간 : ${pro.formedAllDate }<br>
		            			</div>
            				</div>
            				<script>
            				$("#projectEle${sum}").hover(function(){
            					$("#projectEle${sum}").css("box-shadow","0px 0px 10px #a8a8a8");
            				},function(){
            					$("#projectEle${sum}").css("box-shadow","0px 0px 0px #000");
            				})
            				$("#projectEle${sum}").on("click",function(){
            					location.href="${pageContext.request.contextPath}/project/detailView?seq=${pro.seq}";
            				})
            				</script>
            			</c:forEach>
            		</c:when>
            	</c:choose>
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
       
       <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	   <script>
	     AOS.init();
	   </script>
</body>
</html>