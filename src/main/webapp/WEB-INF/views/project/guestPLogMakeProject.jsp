<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/css/project/pLogList.css" type="text/css"/>
</head>

<body>
			<div style="width:96%;">
				<div id="pageTitle" class="row">
					<div class="col-12"><h4>${otherInfo.nickName}님이 <span style="color:#1D1294;">모집</span>한 프로젝트</h4></div>					
				</div>
				<div class="tableDiv">
					<div class="row tableHead">					    
					    <div class="col-3 col-sm-2 col-lg-1">상태</div>
					    <div class="col-2 col-sm-1">인원</div>
					    <div class="d-none col-sm-3 d-sm-block col-lg-3">프로젝트 기간</div>
					    <div class="col-7 col-sm-6 col-md-3 col-lg-4 pl-2">제목</div>					    
					    <div class="d-none col-md-2 d-md-block">작성일</div>	
					    <div class="d-none col-md-1 d-md-block col-lg-1">조회</div>				    					    
					</div>
					
				  	<c:choose>
				  		<c:when test="${makeProjectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">모집한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${makeProjectList }" var="m">
				  				<div class="row makeTableBody tableBody p-0">
									<div class="col-3 col-sm-2 col-lg-1 state${m.state }">${m.stateInKor }</div>
									<div class="col-2 col-sm-1"><strong>${m.capacity }</strong> <small class="text-secondary">명</small></div>
									<div class="d-none col-sm-3 d-sm-block col-lg-3"><small>${m.formedAllDate }</small></div>
									<div class="col-7 col-sm-6 col-md-3 col-lg-4 pl-2 text-decoration-none" onclick="popUp('/project/detailView?seq=${m.seq }')">
										<div class="row">
											<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">${m.title }</div> 
											<c:if test="${m.commentCount>0 }">
												<div class="pComment font-weight-bold ml-1" style="display:inline-block;">${m.commentCount }</div>
											</c:if>
										</div>
									</div>
									<div class="d-none col-md-2 d-md-block">${m.formedDate }</div>
									<div class="d-none col-md-1 d-md-block text-center">${m.viewCount }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<nav aria-label="List navi" id="mPageNavi">${makePageNavi }</nav>
			</div>
		<script>
			function popUp(link){
				window.open(link, "makeListPopUp", "width=1000,height=840");
			}
        	$(".pNavi${makeCurrentPage}").addClass("active");
        </script>
</body>
</html>