<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/applyList.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
body{background-color:#e9ecef;}
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
            <div class="container" id="projectApplyPage">
            	<div id="pageTitle" class="row">
					<div class="col-12"><h1>프로젝트 신청 내역</h1></div>					
				</div>	           
           
           		<div class="tableDiv">
					<div class="row tableHead">					    
					    <div class="col-1">번호</div>
					    <div class="col-2">신청자</div>
					    <div class="col-5">사용가능언어</div>
					    <div class="col-2">재직여부</div>
					    <div class="col-1">포트폴리오</div>
					    <div class="col-1">승인상태</div>
					</div>
					
				  	<c:choose>
				  		<c:when test="${applyList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">신청 내역이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${applyList }" var="a">				  			
				  				<div class="row tableBody p-0 text-decoration-none applyRow${a.approve }" onclick="openApplyPage(${a.seq },'${a.approve}')">
									<div class="col-1">${a.seq }</div>
									<div class="col-2">${a.writer }</div>
									<div class="col-5">${a.languages }</div>
									<div class="col-2">${a.workInInKor }</div>									
									<div class="col-1">${a.portfolioInKor }</div>
									<div class="col-1 approve${a.approve }">${a.approveInKor }</div>									
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
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
        
<%--         <jsp:include page="/WEB-INF/views/standard/footer.jsp"/> --%>
        
        <script>
        	function openApplyPage(seq,approve){
        		if(approve=='X'){
        			return false;
        		}
        		location.href='/project/apply/detailView?seq='+seq;
        	}
        </script>
</body>
</html>