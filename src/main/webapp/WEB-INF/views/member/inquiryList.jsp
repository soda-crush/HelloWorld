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
<link rel="stylesheet" href="/css/inquiry/inquiryBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/inquiry/inquiryList.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
	#titleLink:hover{
		cursor:pointer;
		color:gray;
	}
	#titleLink strong{
		font-size:25px;
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
				<div id="pageTitle" class="row ml-1 mb-4">
					<div class="col-12" id="titleLink">
							<div class="row">
							<div class="col-auto vertical-align:text-top p-0"><i class="fa fa-quote-left"></i></div>
							<div class="col-auto vertical-align:text-top p-0"><strong>일대일문의</strong></div>
							<div class="col-auto vertical-align:text-top p-0"><i class="fa fa-quote-right"></i></div>
							</div>
					</div>
					<script>
						$("#titleLink").on("click", function(){
							location.href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}";
						})
					</script>
				</div>				
				<div class="tableDiv">
					<div class="row tableHead">					    
				    	<div class="col-4 col-md-3">답변상태</div>
				    	<div class="col-1 d-none d-md-block">번호</div>
				    	<div class="col-8 col-md-6">제목</div>
				    	<div class="col-2 d-none d-md-block">작성일</div>
					</div>
					
				  	<c:choose>
				  		<c:when test="${list.size()==0}">
				  		<div class="row"><div class="col-12">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${list}" var="dto">
				  				<div class="row tableBody p-0">
				  					<div class="col-4 col-md-3">
				  					<c:choose>
				  						<c:when test="${dto.count > 0}">
				  							<p class="text-success m-0"><strong>답변완료</strong></p>
				  						</c:when>
				  						<c:otherwise>
				  							<p class="text-danger m-0"><strong>답변대기중</strong></p>
				  						</c:otherwise>
				  					</c:choose>	
				  					</div>			  					
									<div class="col-1 d-none d-md-block">${dto.seq}</div>
									<div class="col-8 col-md-6 pl-2" id="toDetail${dto.seq}">${dto.title}</div>
									<div class="col-2 d-none d-md-block">${dto.formedDate}</div>
								</div>
								<script>
									$("#toDetail${dto.seq}").on("click", function(){
										location.href = "${pageContext.request.contextPath}/member1/detailViewInquiry?page=${page}&seq=${dto.seq}";
									})
								</script>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>								
				<div class="pageListFooter text-right">
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/member1/toInquiryForm?page=${page}" role="button">글쓰기</a>					
				</div>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  <c:forEach items="${pageNavi}" var="page">
				  	<li class="page-item pageNavi">${page}</li>
				  </c:forEach>   
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
        
        <script>
		$(function(){
			var element = $(".pageNavi");
			var page = "${page}";
			if(page > 0 && page <= 10){
				element[page-1].classList.add('active');
			}else if(page % 10 == 0){
				element[10].classList.add('active');
			}else{
				element[page % 10].classList.add('active');
			}	
		});
		
        </script>
</body>
</html>
