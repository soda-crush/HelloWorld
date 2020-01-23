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
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
	#titleLink:hover{
		cursor:pointer;
		color:gray;
	}
	#titleLink strong{
		font-size:25px;
	}
	.tableBody div:nth-child(3){
		cursor:default;
	}
	.tableBody div:nth-child(2){
		cursor:pointer;
	}	
	#baseBackgroundColor{
		min-height:680px;
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

            
  				<div class=container id="projectPage">
  				<div class=row>
					<div class="col-12">
						<h1><br></h1>
					</div>
				</div>
  				
				<div id="pageTitle" class="row ml-1 mb-4">
					<div class="col-12" id="titleLink">
						<div class="col-auto vertical-align:text-top p-0"><h1>공지사항</h1></div>
					</div>
					<script>
						$("#titleLink").on("click", function(){
							location.href="${pageContext.request.contextPath}/notice/noticeList?page=${page}";
						})
					</script>
				</div>	
				<div class="searchDiv">
					<form action="${pageContext.request.contextPath}/notice/noticeList" method="post">
					  <div class="form-group row">
					  	<div class="col-6 d-none d-md-block"></div>
					    <div class="col-4 col-md-2 pr-0 pl-0">
					      <label class="sr-only" for="inlineFormCustomSelect">Preference</label>
					      <select class="custom-select" name="searchOption" id="inlineFormCustomSelect">
					        <option selected value="all">제목+내용</option>
					        <option value="title">제목</option>
					        <option value="content">내용</option>
					      </select>
					    </div>
					    <div class="col-6 col-md-3 pr-0 pl-0">
					      <div class="custom-control custom-checkbox pl-0">
					        <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요(20자 이내)" maxlength="20">
					      </div>
					    </div>
					    <div class="col-2 col-md-1 pr-0 pl-0">
					      <button type="submit" class="btn btn-primary">검색</button>
					    </div>
					  </div>
					</form>
				</div>			
				<div class="tableDiv">
					<div class="row tableHead">					    
				    	<div class="col-2">번호</div>
				    	<div class="col-6">제목</div>
				    	<div class="col-2">작성일</div>
				    	<div class="col-2">조회수</div>
					</div>
					
				  	<c:choose>
				  		<c:when test="${list.size()==0}">
				  		<div class="row"><div class="col-12 text-center" style="min-height:200px; line-height:200px;background-color:#ffffff90;">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${list}" var="dto">
				  				<div class="row tableBody p-0">			  					
									<div class="col-2">${dto.seq}</div>
									<div class="col-6 text-left" id="toDetail${dto.seq}" style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">
									${dto.title}</div>
									<div class="col-2 text-center">${dto.formedDate}</div>
									<div class="col-2">${dto.viewCount}</div>
								</div>
								<script>
									$("#toDetail${dto.seq}").on("click", function(){
										location.href = "${pageContext.request.contextPath}/notice/detailViewNotice?page=${page}&seq=${dto.seq}";
									})
								</script>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>								
				<nav aria-label="Page navigation example" class="mt-4">
				  <ul class="pagination justify-content-center">
				  <c:forEach items="${pageNavi}" var="page">
				  	<li class="page-item pageNavi">${page}</li>
				  </c:forEach>   
				  </ul>
				</nav>
				
				<div class=row>
					<div class="col-12">
						<h1><br></h1>
					</div>
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
        <c:if test="${list.size() != 0}">
        <script>
		var element = $(".pageNavi");
		var page = "${page}";
		if(page > 0 && page <= 5){
			element[page-1].classList.add('active');
		}else if(page % 5 == 0){
			element[5].classList.add('active');
		}else{
			element[page % 5].classList.add('active');
		}	
        </script>
        </c:if>
</body>
</html>
