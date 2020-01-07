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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
    
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	
    .dash{
    
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
							<a class="btn btn-primary" href="/project/chart" role="button">그래픽</a>
							<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
						</div>
					</div>				
					
					
					
					<div class="dash">
					    <div class="man_info">
					        <div class="info_top cf">
					            <div class="profile" style="background-image:url(/resources/images/new/no-pic.png)">
					                프로필사진
					            </div>
					            <div class="pro_con">
					                <h3 class="project_name cf">
					                    최수인
					                </h3>
									<ul class="name1 cf">
					                    <li class="old">32세</li>
					                    <li class="local ellipsis">서울 종로구</li>
					                </ul>
									<div class="cf"></div>
									<ul class="name cf mt-10">
					                	<li class="career">총 0년</li>
									</ul>
					                <ul class="name cf mt-5">
					                    <li class="tech">
											JSP, Jquery, JavaScript, Oracle
					                    </li>
					                </ul>
					            </div>
					        </div>
					    </div>
					    <div class="man_sche">
					        <div class="she12_gray">
					            <ul class="cf">
					                <li><p>07월</p></li>
					                <li><p>08월</p></li>
					                <li><p>09월</p></li>
					                <li><p>10월</p></li>
					                <li><p>11월</p></li>
					                <li><p>12월</p></li>
					                <li><p>01월</p></li>
					                <li><p>02월</p></li>
					                <li><p>03월</p></li>
					                <li><p>04월</p></li>
					                <li><p>05월</p></li>
					                <li><p>06월</p></li>
					            </ul>
					        </div>
					        <!-- 프로젝트 바 -->
					        <div class="project4" style="left:0%;width:99%;">
					            <a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="moveLink" title="비공개 프로젝트 진행중<br></a>2021.03.01부터 투입가능">
					            <h4 class="ellipsis">비공개 프로젝트 진행중</h4>
					            <p class="ellipsis">2021.03.01부터 투입가능</p>
					            <div class="day_end"></div>
					            </a>
					        </div>
					
					
					        <!-- 오늘 -->
					        <div class="line_able" style="left:52%;">
					            <div class="day_able">01/05</div>
					        </div>
					    </div>
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
     
</script>
</body>
</html>
