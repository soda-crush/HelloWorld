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
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');
   });
</script>
<style>
	
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
            <div class=container id="projectPage">
				<div id="pageTitle" class="row">
					<div class="col-12 col-lg-4"><h1>프로젝트 모집</h1></div>
					<div class="col-12 col-lg-8 pt-2">
						<a class="btn btn-danger" href="/project/list" role="button">게시판</a>
						<a class="btn btn-secondary" href="/project/chart" role="button">그래픽</a>
						<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
						<a class="btn btn-warning" href="/project/pLog/pLogProjectList" role="button">임시</a>
					</div>
				</div>				
				<div class="tableDiv">
					<div class="row tableHead">					    
					    <div class="col-xl-1 d-none d-xl-block">번호</div>
					    <div class="col-xl-1 col-2 col-md-2 col-lg-1">모집상태</div>
					    <div class="col-xl-3 col-8 col-md-5">제목</div>
					    <div class="col-xl-1 col-2 col-md-1">지역</div>
					    <div class="col-xl-1 col-lg-1 d-none d-lg-block">인원</div>
					    <div class="col-xl-2 col-md-4 d-none d-md-block">기간</div>
					    <div class="col-xl-1 d-none d-xl-block">작성자</div>
					    <div class="col-xl-1 d-none d-xl-block">작성일</div>
					    <div class="col-xl-1 d-none d-xl-block">조회</div>					    
					</div>
					
				  	<c:choose>
				  		<c:when test="${projectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${projectList }" var="p">
				  				<div class="row tableBody p-0">
									<div class="col-xl-1 d-none d-xl-block">${p.seq }</div>
									<div class="col-xl-1 col-2 col-md-2 col-lg-1 ${p.state }">${p.stateInKor }</div>
									<div class="col-xl-3 col-8 col-md-5 text-decoration-none" onclick="location.href='/project/detailView?seq=${p.seq }'">										
										<div class="ml-1" style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;font-weight:bold;">${p.title } 
				  						<c:if test="${p.commentCount>0 }">
				  							<div class="pComment font-weight-bold ml-1" style="display:inline-block;">${p.commentCount }</div>
				  						</c:if>
				  						</div>					  					
									</div>
									<div class="col-xl-1 col-2 col-md-1">${p.location1 }</div>
									<div class="col-xl-1 col-lg-1 d-none d-lg-block">${p.capacity }명</div>
									<div class="col-xl-2 col-md-4 d-none d-md-block">${p.formedAllDate }</div>
									<div class="col-xl-1 d-none d-xl-block text-decoration-none" onclick="popUp('/Portfolio/toPlog.do?owner=${p.id}')">${p.writer }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.formedDate }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-6">
						  <form class="form-inline" action="/project/list" method="post" id="searchFrm">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
								<option selected disabled>선택</option>
								<option value="all">제목+내용</option>
							    <option value="title">제목</option>
							    <option value="contents">내용</option>
							    <option value="location">지역</option>
							    <option value="capacity">인원</option>
							    <option value="writer">작성자</option>									    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="keyword" id="keyword">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>								
					<div class="col-6 text-right">
						<a class="btn btn-success" href="/project/write" role="button">글쓰기</a>					
					</div>
				</div>
				<nav aria-label="List navi" id="pPageNavi">${pageNavi }</nav>
				
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
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");
	        		return false;
	        	}
	        });
        	$(".pNavi${currentPage}").addClass("active");
			function popUp(link){
				window.open(link, "pLogPopUp", "width=600,height=600");
			}
        </script>
</body>
</html>