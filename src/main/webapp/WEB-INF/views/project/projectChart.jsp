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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/chart.css" type="text/css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
<style>
	#pageTitle{margin-bottom:40px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.projectList{margin-bottom:10px;}	
	.pTextInfo label.N{background-color:limegreen;}
	.pTextInfo label.Y{background-color:red;}
	.pTextInfo label{color:white;}
	.pTextInfo{padding:15px;background-color:#ffffff;border-radius:10px 0px 0px 10px;}
	.graphNaviItem:last-of-type{border-radius:0px 10px 10px 0px;}
	.graphNaviItem{background-color:#e0e0e0;color:#ffe88790;width:52px;margin-left:2px;line-height:120px;}
	.pGraphBar{position:relative;}
	.progressBar{
		height:50px;
		width:100px;
		background-color:orange;
		position:absolute;
		z-index:1;
		top:50%; left:50%;
    	transform: translate(-50%, -50%);
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
            <section class="projectContainer" style="min-height: 100px;">        
               
	            <div class=container id="projectPage">
					<div id="pageTitle" class="row">
						<div class="col-12 col-lg-4"><h1>프로젝트 모집</h1></div>
						<div class="col-12 col-lg-8 pt-2">
							<a class="btn btn-secondary" href="/project/list" role="button">게시판</a>
							<a class="btn btn-danger" href="/project/chart" role="button">그래픽</a>
							<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
						</div>
					</div>	
					
								
					<div class="choice">
<!-- 					정렬선택 -->
					</div>
					<div class="projectContainer">
						<c:choose>
							<c:when test="${projectList.size()==0 }">
					  			<div class="row"><div class="col-12">모집중인 프로젝트가 없습니다.</div></div>
					  		</c:when>
					  		<c:otherwise>
					  			<c:forEach items="${projectList }" var="p">
									<div class="row projectList">
										<div class="col-5 pTextInfo">
											<label class="${p.state } badge badge-pill ml-0" id="stateLabel">${p.stateInKor }</label>
											<div>${p.title }</div>
											<div>${p.location1 } ${p.location2 }</div>
										</div>
										
										<div class="col-7 pGraphBar p-0">
											<ul class="nav graphNavi">
											  <li class="nav-item graphNaviItem">.</li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>
											  <li class="nav-item graphNaviItem"> </li>											  											  
											</ul>
											<div class="progressBar"></div>
										</div>
										
										
									</div>					
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
	            </div>
            
            </section>           
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
		$("")
	
	</script>
	
</body>
</html>
