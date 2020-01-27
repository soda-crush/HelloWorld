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
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
</head>

<body>
			<div style="width:96%;">
				<div id="pageTitle" class="row">
					<div class="col-12" onclick="location.href='/project/pLog/makeProjectList'" style="cursor:pointer"><h4>내가 <span style="color:#1D1294;">모집</span>한 프로젝트</h4></div>					
				</div>
				<div class="tableDiv">
					<div class="row tableHead">					    
					    <div class="d-none col-md-2 d-md-block col-lg-1">상태</div>
					    <div class="col-4 col-md-1">신청내역</div>
					    <div class="d-none col-md-1 d-md-block col-lg-1">총신청</div>
						<div class="col-2 col-md-1">승인</div>
					    <div class="d-none col-md-3 d-md-block col-lg-2">프로젝트 기간</div>
					    <div class="col-6 col-md-4 col-lg-4">제목</div>					    
					    <div class="d-none d-lg-block col-lg-1">작성일</div>	
					    <div class="d-none d-lg-block col-lg-1">조회</div>				    					    
					</div>
					
				  	<c:choose>
						<c:when test="${not empty searchChoice && makeProjectList.size()==0}">
							<div class="row text-center tableBodyNull"><div class="col-12">검색 결과가 없습니다.</div></div>
						</c:when>
				  		<c:when test="${empty searchChoice && makeProjectList.size()==0 }">
				  			<div class="row text-center tableBodyNull"><div class="col-12">모집한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${makeProjectList }" var="m">
				  				<div class="row makeTableBody tableBody p-0">
									<div class="d-none col-md-2 d-md-block col-lg-1 state${m.state }">${m.stateInKor }</div>
									<div class="col-4 col-md-1"><button type="button" class="btn btn-outline-warning btn-sm mb-1" style="width:72px;font-size:13px;" onclick="popUp('frmPopup${m.seq }',${m.seq })">신청목록</button></div>
									<div class="d-none col-md-1 d-md-block col-lg-1">${m.totalApply } <small class="text-secondary">명</small></div>									
									<div class="col-2 col-md-1"><strong class="capaCheck achieve<fmt:parseNumber integerOnly= "true" value= "${m.totalApprove/m.capacity }" />">${m.totalApprove }/${m.capacity }</strong> <small class="text-secondary">명</small></div>
									<div class="d-none col-md-3 d-md-block col-lg-2"><small>${m.formedAllDate }</small></div>
									<div class="col-6 col-md-4 col-lg-4 text-decoration-none" onclick="detailPopUp('/project/detailView?seq=${m.seq }')">
										<div class="row">
											<div style="max-width:75%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">${m.title }</div> 
											<c:if test="${m.imageCount>0 }">
												<i class="fa fa-photo ml-1 mr-1" style="font-size:13px;margin-top:20px;color:#757575;"></i>
											</c:if> 											
											<c:if test="${m.commentCount>0 }">
												<div class="pComment font-weight-bold ml-1" style="display:inline-block;">${m.commentCount }</div>
											</c:if>
										</div>
									</div>
									<div class="d-none d-lg-block col-lg-1">${m.formedDate }</div>
									<div class="d-none d-lg-block col-lg-1">${m.viewCount }</div>
								</div>	
								<form id="frmPopup${m.seq }" method="post"><input type="hidden" name="projectSeq" value="${m.seq }"></form>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				</div>
				<div class="row pageListFooter">
					<div class="col-12 order-2 order-lg-1 col-lg-10">
						  <form class="form-inline" action="/project/pLog/makeProjectList" method="post" id="searchFrm">
							<select class="form-control searchSelect" name="searchOption" id="searchOption" style="margin-right:5px;">
								<option value="all" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="nonTagContents">내용</option>
							    <option value="location">지역</option>
							    <option value="capacity">인원</option>						
							    <option value="languages">사용언어</option>		    
							</select>
						    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요(20자 이내)" aria-label="Search" name="keyword" id="keyword" style="margin-right:5px;min-width:285px;" maxlength="20">
						    <button class="btn btn-dark my-2 my-sm-0" type="submit" id="searchBtn">검색</button>
						  </form>
					</div>								
					<div class="col-12 order-1 order-lg-2 col-lg-2 text-right">
						<button class="btn btn-success mb-2" type="button" onclick="popUp('/project/write')">글쓰기</button>			
					</div>
				</div>
				<nav aria-label="List navi" id="mPageNavi">${makePageNavi }</nav>
			</div>
		<script>
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");	  
	        		return false;
	        	}
	        });
	        $("#searchOption option").filter(function(){
	        	return this.value == "${searchChoice}";
	        }).attr('selected',true);
	        $("#keyword").val("${keywordChoice}");
	        function detailPopUp(link){
	        	window.open(link, "detailViewPopUp", "width=1000,height=840");	
	        }
			function popUp(popUpName,seq){
				var target = 'makeListPopUp';
				window.open('', target, "width=1000,height=750");
				var frmPopup = document.getElementById(popUpName);
				frmPopup.action = '/project/apply/list';
				frmPopup.target = target;			
				frmPopup.submit();
			}
        	$(".pNavi${makeCurrentPage}").addClass("active");
        </script>
</body>
</html>