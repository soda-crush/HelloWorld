<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<style>
div{
/* border:0.5px solid green; */

}
.fontThin{
	font-family: "Nanumgothic";
	font-size:13.7px;
}
.mpExpla{
line-height: 60%;
}
.boardCon{
padding-left: 0.4%;
padding-right: 0.4%;
}
.boardEle{
width: 100%;
border-radius: 3px;
}
.boardEleTop{
padding-top: 5%;padding-bottom: 3%;color:white;padding-left: 2%;
border-top-left-radius: 3px;
border-top-right-radius: 3px;
border-top: 1px solid boardEleTop;
border-left: 1px solid boardEleTop;
border-right: 1px solid boardEleTop;
}
.bdt1{
background-color:#c25f55;}
.bdt2{
background-color:#53a998;}
.bdt3{
background-color:#5181a2;}
.bdt4{
background-color:#d1a93b;}
.boardEleCon{
padding-top: 6%;
padding-bottom:5%;
padding-left:10%;
padding-right:10%;
line-height:128%;
background-color: #f0f0f0; 
border:1px solid #cfcfcf;
border-bottom-left-radius: 3px;
border-bottom-right-radius: 3px;
}
.boardEleCon a{
color:black;
font-size: 11px;
}
.boardEleCon p{
font-size:12.5px;
position:relative;
bottom : 1px;
}
.boardEleCon .fontThin:hover{
text-decoration: underline;
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
background-color: #2f2f2f;
color:white;
text-align: center;
line-height: 200px;
}
.fs1{
font-size: 11px;}

<!-- -->
.langTag{
	border:1px solid orange;
	background-color:orange;
	border-radius:5px;
	padding: 3px;
	margin-bottom : 2px;
	display:inline-block;
}

	.info{
		position:relative;
		left:50%;
		transform:translateX(-50%);
	}
	.infoBoxTop{
		border-top: 1px solid #f5f5f2;
	}
	.infoBox{
		border-bottom : 1px solid #f5f5f2;	
	}
	
	.infoBox>div:first-child{
		background-color : #F3F8FB;
		text-align: center;
	}
	.infoBoxBottom>div:nth-child(2){
		max-height:120px;
		overflow:auto;
	}
	.orangeFt{
		font-size: 12.5px;
		color:#f09800;
	}
</style>

<script>
$('.nav.navbar-nav a').hover(
        function () {
        	console.log("hover");
            $('#plogLogo').css({"opacity": 100});
        }
);
</script>
</head>
<body>
		<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent1 style="height:23px;">  
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            
            <div class="container">
            
            	<div class="row">
            		<div class="co1-12 col-md-6 col-lg-3 boardCon pl-4 pr-4 pl-md-1 pr-md-1">
	            		<div class="boardEle">
		            		<div class="boardEleTop bdt1 cursorPointer" onclick="location.href='/bamboo/bambooList.do'">
		            			<p class="fs1 pl-3 pt-3" style="line-height:35%;">주간 조회수 TOP10</p>
		            			<p class="mainTitle pl-3 pb-2" style="line-height:35%;">대나무 숲</p>
		            		</div>
		            		<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${bamList.size()!=0}">
			            			<c:forEach items="${bamList}" var="bam" varStatus="status">
			            			<div class="row pb-1">
			            			<div class="col-1 orangeFt font-weight-bolder p-0 text-center">${status.count}</div><div class="col-11 fontThin cursorPointer" style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" onclick="location.href='/bamboo/bambooDetailView.do?seq=${bam.seq}'">${bam.title}</div>
			            			</div>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
		            		</div>
	            		</div>
            		</div>
            		
            		<div class="col-12 d-md-none"><div style="height:8px;"></div></div>
            		<div class="co1-12 col-md-6 col-lg-3 boardCon pl-4 pr-4 pl-md-1 pr-md-1">
	            		<div class="boardEle">
			            	<div class="boardEleTop bdt2 cursorPointer" onclick="location.href='/code/codeQList.do'">
			            		<p class="fs1 pl-3 pt-3" style="line-height:35%;">주간 조회수 TOP10</p>
		            			<p class="mainTitle pl-3 pb-2" style="line-height:35%;">Code-How</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${codeList.size()!=0}">
			            			<c:forEach items="${codeList}" var="code" varStatus="status">
			            			<div class="row pb-1">
			            			<div class="orangeFt font-weight-bolder col-1 p-0 text-center">${status.count}</div><div class="fontThin col-11 cursorPointer" style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${code.seq}'">${code.title}</div>
			            			</div>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
			            	</div>
		            	</div>
            		</div>
            		
            		<div class="col-12 d-lg-none"><div style="height:8px;"></div></div>
            		<div class="co1-12 col-md-6 col-lg-3 boardCon pl-4 pr-4 pl-md-1 pr-md-1">
	            		<div class="boardEle">
			            	<div class="boardEleTop bdt3 cursorPointer" onclick="location.href='/industry/industryStatusList.do'">
			            		<p class="fs1 pl-3 pt-3" style="line-height:35%;">주간 조회수 TOP10</p>
		            			<p class="mainTitle pl-3 pb-2" style="line-height:35%;">업계현황</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${indusList.size()!=0}">
			            			<c:forEach items="${indusList}" var="indus" varStatus="status">
			            			<div class="row pb-1">
			            			<div class="orangeFt font-weight-bolder col-1 p-0 text-center">${status.count}</div><div class="fontThin col-11 cursorPointer" style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" onclick="location.href='/industry/industryStatusDetailView.do?seq=${indus.seq}'">${indus.title}</div>
			            			</div>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
			            	</div>
		            	</div>
            		</div>
            	
					<div class="col-12 d-md-none"><div style="height:8px;"></div></div>
            		<div class="co1-12 col-md-6 col-lg-3 boardCon pl-4 pr-4 pl-md-1 pr-md-1">
	            		<div class="boardEle">
			            	<div class="boardEleTop bdt4 cursorPointer" onclick="location.href='/itnews/itnewsList'">
			            		<p class="fs1 pl-3 pt-3" style="line-height:35%;">주간 조회수 TOP10</p>
		            			<p class="mainTitle pl-3 pb-2" style="line-height:35%;">IT News</p>
			            	</div>
			            	<div class="boardEleCon">
			            		<c:choose>
			            		<c:when test="${itList.size()!=0}">
			            			<c:forEach items="${itList}" var="it" varStatus="status">
			            			<div class="row pb-1">
			            			<div class="orangeFt font-weight-bolder col-1 p-0 text-center">${status.count}</div><div class="fontThin col-11 cursorPointer" style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" onclick="location.href='/itnews/detail?seq=${it.seq}'">${it.title}</div>
			            			</div>
			            			</c:forEach>
			            		</c:when>
			            		</c:choose>
			            	</div>
		            	</div>
            		</div>
            	
            	</div>
            	
            	
            	<div class= row>
            		<div class="col-12 pt-4 pb-5 pl-0 pr-0">
            			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						  </ol>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="/img/crc1.jpg" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/img/crc2.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/img/crc3.jpg" class="d-block w-100" alt="...">
						    </div>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
            		</div>
            	</div>
            	
            	<div class=row>
            		<div class=col-12>
            			<h3 style="color:#ededed;" class="text-left cursorPointer" onclick="location.href='/project/list'">모집중인 프로젝트 》</h3>
            		<hr>
            		</div>
            	</div>
            	
            	<div class="row">
            	<c:choose>
            		<c:when test="${proList.size()!=0}">
            		<c:set var="cnt" value="1"/>
            			<c:forEach items="${proList}" var="pro" varStatus="status">
            			<c:set var="sum" value="${sum+1}"/>
            				<div class="col-12 col-md-4 col-xl-3 projectCon ">
		            			<div class="projectEle text-center cursorPointer" id="projectEle${sum}"  data-aos="fade-up">
		            				<p class="text-secondary text-left pl-3 pt-2">#${status.count}</p>
		            				<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">		            				
		            				<strong>&nbsp;${pro.title}</strong>
		            				</div>
		            				
		            				<div class="info m-auto">
			            				<div class="row infoBox infoBoxTop ml-1 mr-1">
			            					<div class="col-4"><small>모집인원</small></div>
			            					<div class="col-8 p-0">${pro.capacity}명</div>
			            				</div>
			            				<div class="row infoBox ml-1 mr-1">
			            					<div class="col-4"><small>지역</small></div>
			            					<div class="col-8 p-0">${pro.location1}&ensp;${pro.location2}</div>
			            				</div>
			            				<div class="row infoBox ml-1 mr-1">
			            					<div class="col-4"><small>팀장</small></div>
			            					<div class="col-8 p-0">${pro.writer}</div>
			            				</div>
			            				<div class="row infoBox infoBox ml-1 mr-1">
			            					<div class="col-12"><small>기간</small></div>
			            					<div class="col-12 p-0">${pro.formedAllDate }</div>
			            				</div>
			            				<div class="row infoBox infoBox infoBoxBottom ml-1 mr-1">
			            					<div class="col-12"><small>사용언어</small></div>
			            					<div class="col-12 p-2">
					            				<c:choose>
					            					<c:when test="${pro.splitLanguage.size() > 0 }">
					            						<c:forEach items="${pro.splitLanguage}" var="lang">
					            							<div class="col-auto ml-1 mr-1 langTag">${lang}</div>
					            						</c:forEach>
					            					</c:when>
					            				</c:choose>			            					
			            					</div>
			            				</div>			            				
		            				</div>		            				            				
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