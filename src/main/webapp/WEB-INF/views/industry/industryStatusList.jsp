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
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.table{background-color:white;padding:0;text-align:center;}	
	.table tbody *{font-weight:normal;}
	.table tbody td:nth-child(2){font-weight:bold;}
	.table tbody td:nth-child(3){text-align:center;cursor:pointer;}
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
            <div class=container id="projectPage" style="background-color:white">
				<div id="pageTitle">
					<h1>업계현황</h1>
				</div>				
				<table class="table table-hover">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">글번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성날짜</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:choose>
				  		<c:when test="${industryStatusList.size()==0 }">
				  		<tr><td colspan="8">작성된 글이 없습니다.</td></tr>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${industryStatusList }" var="i">
				  				<tr>
				  					<th scope="row">${i.seq }</th>
				  					<td><a href="/industry/industryStatusDetailView.do?seq=${i.seq }">${i.title } 
				  						<c:if test="${i.commentCount>0 }">
				  							<span class="pComment font-weight-bold">${i.commentCount }</span>
				  						</c:if>
				  						</a>
				  					</td>
				  					<td>익명</td>
				  					<td>${i.formedWriteDate }</td>
				  					<td>${i.viewCount }</td>
				  				</tr>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				  </tbody>
				</table>
				<div class="text-right">
					<a class="btn btn-primary" href="/industry/industryStatusWrite.do" role="button">글쓰기</a>					
				</div>
				<nav aria-label="List navi">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				     <c:forEach items="${pageNavi}" var="navi">									
						${navi}
					</c:forEach>
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