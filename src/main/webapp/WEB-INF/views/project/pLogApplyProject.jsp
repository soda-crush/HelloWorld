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
<style>
body{background-color:#f2f2f2;}
#pageTitle{margin-bottom:20px;}
#pageTitle h4{font-weight:bold;}
</style>
</head>
<body>
			<div>
				<div id="pageTitle" class="row">
					<div class="col-12"><h4>내가 신청한 프로젝트</h4></div>					
				</div>
				<div class="tableDiv" style="width:100%;">
					<div class="row tableHead">		
						<div class="col-2">승인</div>				    					    
					    <div class="col-3">제목</div>
					    <div class="col-1">모집상태</div>
					    <div class="col-1">작성자</div>
					    <div class="col-1">지역</div>
					    <div class="col-3">기간</div>
					    <div class="col-1">인원</div>					    				    
					</div>
					
				  	<c:choose>
				  		<c:when test="${applyProjectList.size()==0 }">
				  		<div class="row text-center tableBodyNull"><div class="col-12">지원한 프로젝트가 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${applyProjectList }" var="a">
				  				<div class="row applyTableBody tableBody p-0">
				  					<div class="col-2 approve${a.approve }">${a.approveInKor }</div>									
										<div class="col-3 text-decoration-none" onclick="popUp('/project/apply/detailView?seq=${a.seq }')">${a.title } 
					  						<c:if test="${a.commentCount>0 }">
					  							<span class="pComment font-weight-bold">${a.commentCount }</span>
					  						</c:if>					  					
										</div>
									<div class="col-1 state${a.state }">${a.stateInKor }</div>										
									<div class="col-1">${a.writer }</div>
									<div class="col-1">${a.location1 }</div>
									<div class="col-3">${a.formedAllDate }</div>
									<div class="col-1">${a.capacity }명</div>									
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
				</div>
				<nav aria-label="List navi" id="pPageNavi">${applyPageNavi }</nav>
			</div>
		<script>
			function popUp(link){
				window.open(link,"_blank");
			}
        	$(".pNavi${applyCurrentPage}").addClass("active");
        </script>
</body>
</html>