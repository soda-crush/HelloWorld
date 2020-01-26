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
					<div class="col-12 col-md-6 col-lg-5 m-0 p-0"><h1 onclick="location.href='/project/list'" style="cursor:pointer">프로젝트 모집</h1><span class="badge badge-pill ml-2" id="stateCountLabel">${stateCount }</span></div>
					<div class="col-12 col-md-6 col-lg-7 m-0 p-0 pt-2 pb-1 text-right">
						<div style="width:180px; height:35px;display:inline-block;border-bottom:2px solid crimson;cursor:pointer" class="text-center pt-1" onclick="location.href='/project/list'"><span style="color:black;font-weight:bold;font-size:18px;">게시판</span></div>
						<div style="margin-left:-5px;width:180px; height:35px;display:inline-block;border-bottom:2px solid #99000030;cursor:pointer" class="text-center pt-1" onclick="location.href='/project/chart'"><span style="color:black;font-weight:bold;font-size:18px;opacity:30%;">일정</span></div>
					</div>
				</div>
				<div class="tableDiv">
					<div class="row mb-3">
						<div class="col-5 col-md-3 col-lg-2 p-0">
							<div class="btn-group btn-group-sm" role="group" aria-label="projectOrderBtns">
								<button type="button" class="btn btn-outline-warning btn-sm active" id="latestOrder" style="font-size:14px;">최신순</button>
								<button type="button" class="btn btn-outline-warning btn-sm" id="deadlineOrder" data-toggle="tooltip" title="모집마감된 글은 제외됩니다" style="font-size:14px;">마감임박순</button>								
							</div>							
						</div>
						<div class="col-7 p-0">
							<div class="pt-1" style="color:#8a8a8a;" id="deadlineComment"><small>모집중인 프로젝트만 표시됩니다</small></div>
						</div>						
					</div>
					<div class="row tableHead">					    
					    <div class="col-xl-1 d-none d-xl-block">번호</div>
					    <div class="col-xl-1 col-3 col-md-2 col-lg-1">상태</div>
					    <div class="col-xl-3 col-6 col-md-5">제목</div>
					    <div class="col-xl-1 col-3 col-md-2">지역</div>
					    <div class="col-xl-1 col-lg-1 d-none d-lg-block">인원</div>
					    <div class="col-xl-2 col-md-3 d-none d-md-block col-lg-2">프로젝트 기간</div>
					    <div class="col-xl-1 d-none d-xl-block">작성자</div>
					    <div class="col-lg-1 d-none d-lg-block">작성일</div>
					    <div class="col-lg-1 d-none d-lg-block">조회</div>					    
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
				  					<div class="col-xl-3 col-6 col-md-5 text-decoration-none" onclick="location.href='/project/detailView?page=${currentPage}&seq=${p.seq }'">
											<div class="row">
											<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;font-weight:bold;">${p.title }</div> 
					  						<c:if test="${p.commentCount>0 }">
					  							<div class="pComment font-weight-bold ml-1" style="display:inline-block;margin-top:1px;">${p.commentCount }</div>
					  						</c:if>
					  						</div>					  					
									</div>
									<div class="col-xl-1 col-3 col-md-2">${p.location1 }</div>
									<div class="col-xl-1 col-lg-1 d-none d-lg-block">${p.capacity }명</div>
									<div class="col-xl-2 col-md-3 d-none d-md-block col-lg-2"><small>${p.formedAllDate }</small></div>
									<div class="col-xl-1 d-none d-xl-block text-decoration-none" onclick="popUp('/Portfolio/toPlog.do?owner=${p.id}&other=Y')"><small>${p.writer }</small></div>
									<div class="col-lg-1 d-none d-lg-block">${p.formedDate }</div>
									<div class="col-lg-1 d-none d-lg-block">${p.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-12 order-2 order-lg-1 col-lg-10">
						  <form class="form-inline" action="/project/list" method="post" id="searchFrm">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
								<option value="all" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="nonTagContents">내용</option>
							    <option value="location">지역</option>
							    <option value="capacity">인원</option>
							    <option value="languages">사용언어</option>
							    <option value="writer">작성자</option>									    
							</select>
							<input type="hidden" name="pageOrder" id="pageOrder">
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요(20자 이내)" aria-label="Search" name="keyword" id="keyword" style="margin-right:5px;min-width:285px;" maxlength="20">
						    <button class="btn btn-dark my-2 my-sm-0 ml-1" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>								
					<div class="col-12 order-1 order-lg-2 col-lg-2 text-right">
						<a class="btn btn-success mb-2" href="/project/write" role="button">글쓰기</a>					
					</div>
				</div>
				<nav aria-label="List navi" id="pPageNavi">${pageNavi }</nav>
				
				<input type=hidden id="pageCheckOrder" value="${pageOrder}">
				<input type=hidden id="currentCheckpage" value="${currentPage}">				
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
        <script src="/js/project/list.js"></script>
</body>
</html>