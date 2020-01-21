<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
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
					<div class="col-12 col-lg-5"><h1>프로젝트 모집</h1></div>
					<div class="col-12 col-lg-7 pt-2">
						<a class="btn btn-danger" href="/project/list" role="button">게시판</a>
						<a class="btn btn-secondary" href="/project/chart" role="button">일정</a>
					</div>
				</div>
				<div class="tableDiv">
					<div class="row mb-3">
						<div class="col-12">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-outline-warning btn-sm active" id="latestOrder">최신순</button>
								<button type="button" class="btn btn-outline-warning btn-sm" id="deadlineOrder" data-toggle="tooltip" title="모집마감된 글은 제외됩니다">마감임박순</button>
							</div>
						</div>
					</div>
					<div class="row tableHead">					    
					    <div class="col-xl-1 d-none d-xl-block">번호</div>
					    <div class="col-xl-1 col-3 col-md-2 col-lg-1">상태</div>
					    <div class="col-xl-3 col-7 col-md-5">제목</div>
					    <div class="col-xl-1 col-2 col-md-1">지역</div>
					    <div class="col-xl-1 col-lg-1 d-none d-lg-block">인원</div>
					    <div class="col-xl-2 col-md-4 d-none d-md-block">프로젝트 기간</div>
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
									<div class="col-xl-1 col-3 col-md-2 col-lg-1 ${p.state }">${p.stateInKor }</div>
				  					<div class="col-xl-3 col-7 col-md-5 text-decoration-none" onclick="location.href='/project/detailView?page=${currentPage}&seq=${p.seq }'">
											<div class="row">
											<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;font-weight:bold;">${p.title }</div> 
					  						<c:if test="${p.commentCount>0 }">
					  							<div class="pComment font-weight-bold ml-1" style="display:inline-block;margin-top:1px;">${p.commentCount }</div>
					  						</c:if>
					  						</div>					  					
									</div>
									<div class="col-xl-1 col-2 col-md-1">${p.location1 }</div>
									<div class="col-xl-1 col-lg-1 d-none d-lg-block">${p.capacity }명</div>
									<div class="col-xl-2 col-md-4 d-none d-md-block"><small>${p.formedAllDate }</small></div>
									<div class="col-xl-1 d-none d-xl-block text-decoration-none" onclick="popUp('/Portfolio/toPlog.do?owner=${p.id}')"><small>${p.writer }</small></div>
									<div class="col-xl-1 d-none d-xl-block">${p.formedDate }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-12 order-2 order-lg-1 col-lg-10">
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
							<input type="hidden" name="pageOrder" id="pageOrder">
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="keyword" id="keyword" style="margin-right:5px;">
						    <button class="btn btn-dark my-2 my-sm-0 ml-1" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>								
					<div class="col-12 order-1 order-lg-2 col-lg-2 text-right">
						<a class="btn btn-success mb-2" href="/project/write" role="button">글쓰기</a>					
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
        	var pageOrder = "${pageOrder}";
			if(pageOrder=='seq'){
				$("#latestOrder").addClass("active");
				$("#deadlineOrder").removeClass("active");
				$("#pageOrder").val("seq");
			}else if(pageOrder=='startDate'){
				$("#deadlineOrder").addClass("active");
				$("#latestOrder").removeClass("active");
				$("#pageOrder").val("startDate");
			}
        	$("#deadlineOrder").on("click",function(){
        		$("#pageOrder").val("startDate");
        		location.href="/project/list?pageOrder="+$("#pageOrder").val();
        	});
        	$("#latestOrder").on("click",function(){
        		$("#pageOrder").val("seq");
        		location.href="/project/list?pageOrder="+$("#pageOrder").val();
        	});
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");
	        	}
	        });
        	$(".pNavi${currentPage}").addClass("active");
			function popUp(link){
				window.open(link, "pLogPopUp", "width=800,height=600");
			}
        </script>
</body>
</html>