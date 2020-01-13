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
										<div class="col-xl-3 col-8 col-md-5 text-decoration-none" onclick="location.href='/project/detailView?seq=${p.seq }'">${p.title } 
					  						<c:if test="${p.commentCount>0 }">
					  							<span class="pComment font-weight-bold">${p.commentCount }</span>
					  						</c:if>					  					
										</div>
									<div class="col-xl-1 col-2 col-md-1">${p.location1 }</div>
									<div class="col-xl-1 col-lg-1 d-none d-lg-block">${p.capacity }명</div>
									<div class="col-xl-2 col-md-4 d-none d-md-block">${p.formedAllDate }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.writer }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.formedWriteDate }</div>
									<div class="col-xl-1 d-none d-xl-block">${p.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-6">
						  <form class="form-inline">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" name="searchOption" style="margin-right:5px;">
								<option selected disabled>선택</option>
							    <option value="제목">제목</option>
							    <option value="내용">내용</option>
							    <option value="지역">지역</option>								    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit">검색</button>
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
        	$(".pNavi${currentPage}").addClass("active");
        </script>
</body>
</html>