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
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.table{background-color:white;padding:0;text-align:center;}	
	.table tbody *{font-weight:normal;}
	.table tbody td:nth-child(2){font-weight:bold;}
	.table tbody td:nth-child(3){text-align:left;cursor:pointer;}
	.table tbody .N{color:limegreen;}
	.table tbody .Y{color:red;}
	.pComment{margin-left:3px;font-size:13px;color:orange;}
	a:hover{text-decoration:none;}
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
				<div id="pageTitle">
					<h1>프로젝트 모집</h1>
					<a class="btn btn-primary" href="/project/list" role="button">게시판</a>
					<a class="btn btn-secondary" href="/project/chart" role="button">그래픽</a>
					<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
				</div>				
				<table class="table table-hover">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">글번호</th>
				      <th scope="col">모집상태</th>
				      <th scope="col">제목</th>
				      <th scope="col">지역</th>
				      <th scope="col">인원</th>
				      <th scope="col">기간</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:choose>
				  		<c:when test="${projectList.size()==0 }">
				  		<tr><td colspan="9">작성된 글이 없습니다.</td></tr>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${projectList }" var="p">
				  				<tr>
				  					<th scope="row">${p.seq }</th>
				  					<td class="${p.state }">${p.stateInKor }</td>
				  					<td><a href="/project/detailView?seq=${p.seq }">${p.title } 
				  						<c:if test="${p.commentCount>0 }">
				  							<span class="pComment font-weight-bold">${p.commentCount }</span>
				  						</c:if>
				  						</a>
				  					</td>
				  					<td>${p.location1 }</td>
				  					<td>${p.capacity }명</td>
				  					<td>${p.formedAllDate }</td>
				  					<td>${p.writer }</td>
				  					<td>${p.formedWriteDate }</td>
				  					<td>${p.viewCount }</td>
				  				</tr>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				  </tbody>
				</table>
				<div class="text-right">
					<a class="btn btn-primary" href="/project/write" role="button">글쓰기</a>					
				</div>
				<nav aria-label="List navi" id="pPageNavi">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
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