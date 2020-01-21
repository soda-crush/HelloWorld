<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/applyList.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
body{background-color:#e9ecef;}
#aPageNavi{margin-top:20px;}
</style>
</head>
<body>
<%-- 	<jsp:include page="/WEB-INF/views/standard/header.jsp"/> --%>
	
 		<div id=baseBackgroundColor>
            <div class=container style="height:20px;">
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <div class="container d-none d-md-block" id="projectApplyPage">
            	<div id="pageTitle" class="row">
					<div class="col-12"><h1>프로젝트 신청 내역</h1></div>					
				</div>	           
           
           		<div class="tableDiv d-none d-md-block">
					<div class="row tableHead">					    
					    <div class="d-none d-lg-block col-lg-1">번호</div>
					    <div class="d-none d-lg-block col-lg-2">신청자</div>
					    <div class="d-none d-md-block col-md-3 col-lg-4">사용가능언어</div>
					    <div class="d-none d-md-block col-md-3 col-lg-2">재직여부</div>
					    <div class="d-none d-md-block col-md-3 col-lg-2">포트폴리오</div>
					    <div class="d-none d-md-block col-md-3 col-lg-1">승인상태</div>
					</div>
					
				  	<c:choose>
				  		<c:when test="${projectApplyList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">신청 내역이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>				  			
				  			<c:forEach items="${projectApplyList }" var="a" varStatus="status">					  							  			
				  				<div class="row tableBody p-0 text-decoration-none applyRow${a.approve }" onclick="openApplyPage(${a.seq },'${a.approve}')">
									<div class="d-none d-lg-block col-lg-1">${projectApplyList.size() - status.index}</div>
									<div class="d-none d-lg-block col-lg-2"><small>${a.writer }</small></div>
									<div class="d-none d-md-block col-md-3 col-lg-4">${a.languages }</div>
									<div class="d-none d-md-block col-md-3 col-lg-2">${a.workInInKor }</div>									
									<div class="d-none d-md-block col-md-3 col-lg-2">${a.portfolioInKor }</div>
									<div class="d-none d-md-block col-md-3 col-lg-1 approve${a.approve }">${a.approveInKor }</div>									
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>				
			</div>
			<nav aria-label="List navi" id="aPageNavi" class="d-none d-md-block">${pageNavi }</nav>
			<div class="d-md-none text-center">해당 해상도에서는 지원하지 않습니다</div>
            <!--       몸통 끝!!!   -->
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
<%--         <jsp:include page="/WEB-INF/views/standard/footer.jsp"/> --%>
        
        <script>
        	$(".pNavi${currentPage}").addClass("active");	
        	function openApplyPage(seq,approve){
        		if(approve=='X'){
        			return false;
        		}
        		location.href='/project/apply/detailView?seq='+seq;
        	}
        </script>
</body>
</html>