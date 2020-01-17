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
<link rel="stylesheet" href="/css/project/pLogList.css" type="text/css"/>
</head>

<body>
			<div>
				<div id="pageTitle" class="row">
					<div class="col-12"><h4>내가 <span style="color:crimson;">신청</span>한 프로젝트</h4></div>					
				</div>
				<div class="tableDiv" style="width:100%;">
					<div class="row tableHead">		
						<div class="col-1">승인</div>
						<div class="col-1">신청내역</div>
						<div class="col-1">신청일</div>		
					    <div class="col-1">상태</div>								    					    
					    <div class="col-1">인원</div>						    
					  	<div class="col-1">지역</div>
					    <div class="col-2">프로젝트 기간</div>
					    <div class="col-3">제목</div>
					    <div class="col-1">작성자</div>

				    				    
					</div>
					
				  	<c:choose>
				  		<c:when test="${applyProjectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">지원한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${applyProjectList }" var="a">
				  				<div class="row applyTableBody tableBody p-0">
				  					<div class="col-1 approve${a.approve }">${a.approveInKor }</div>
				  					<div class="col-1"><button type="button" class="btn btn-outline-danger btn-sm mb-1" onclick="popUp('/project/apply/detailView?seq=${a.seq }')">신청글</button></div>									
									<div class="col-1">${a.formedWriteDate }</div>	
									<div class="col-1 state${a.state }"><strong>${a.stateInKor }</strong></div>										
									<div class="col-1">${a.capacity }명</div>
									<div class="col-1">${a.location1 } ${a.location2 }</div>
									<div class="col-2">${a.formedDate }</div>																											
									<div class="col-3 text-decoration-none" onclick="popUp('/project/detailView?seq=${a.projectSeq}')">
										<div class="row">
											<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">${a.title }</div> 
											<c:if test="${a.commentCount>0 }">
												<div class="pComment font-weight-bold ml-1" style="display:inline-block;">${a.commentCount }</div>
											</c:if>
										</div>
									</div>
									<div class="col-1 text-decoration-none" style="cursor:pointer;" onclick="popUp('/Portfolio/toPlog.do?owner=${a.leaderId}')">${a.writer }</div>
								</div>	
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-6">
						  <form class="form-inline" action="/project/pLog/applyProjectList" method="post" id="searchFrm">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
								<option selected disabled>선택</option>
								<option value="all">제목+내용</option>
							    <option value="title">제목</option>
							    <option value="contents">내용</option>
							    <option value="location">지역</option>
							    <option value="capacity">인원</option>
							    <option value="writer">작성자</option>								    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="keyword" id="keyword">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>													
				</div>
				<nav aria-label="List navi" id="aPageNavi">${applyPageNavi }</nav>
			</div>
		<script>
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");	        		
	        	}
	        });		
			function popUp(link){
				var applyWindow = window.open(link, "applyPopUp", "width=1000,height=750");
			}
        	$(".pNavi${applyCurrentPage}").addClass("active");        	
        </script>
</body>
</html>