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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>
	<style>
		h1{text-align: center;padding-top: 50px;padding-bottom: 50px;}
		ul{background-color: lightgray;font-size: 13px;}
		.card{width:200px;height:300px;margin: auto;;float :left;}
		.myprofile{float: left;margin-top: 20px;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
		#page${page}{color:blue;}
		.coltheme{margin:30px;}
		.navi{text-align: center;}
		.nvlink{height:45px;line-height:45px;}
        a:hover{text-decoration:none;}	
        .scrapnavi>div{margin:10px;height:30px;}
        .scrapnavi>div>a{color:black;}
        .scrapnavi{background-color: lightgray;border-radius:5px;margin-top:30px;}
		
.table {
	background-color: white;
	padding: 0;
	text-align: center;
}

.table tbody * {
	font-weight: normal;
}

.table tbody td:nth-child(2) {
	font-weight: bold;
}

.table tbody td:nth-child(3) {
	text-align: left;
	cursor: pointer;
}

.table tbody .N {
	color: limegreen;
}

.table tbody .Y {
	color: red;
}

.pComment {
	margin-left: 3px;
	font-size: 13px;
	color: orange;
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

            
            <div class="container">
				<h1> Programming-Log</h1>
	            <div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/toScrap.do">내 스크랩</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/img/profileSample.jpg" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">${ownerInfo.nickName} 님</h3>
	                            <p class="card-text" style="text-align: center;">point : ${ownerInfo.point }</p>
	                        </div>
	                    </div>
	                    <div class="scrapnavi" >
	                		<div><a href="${pageContext.request.contextPath}/Scrap/itNews.do"> IT 뉴스</a> </div>
	                		<div><a href="${pageContext.request.contextPath}/Scrap/cohow.do"> 코드 지식인</a></div>
	                		<div><a href="${pageContext.request.contextPath}/Scrap/industryStatus.do"> 업계현황</a></div>
	                		<div><a href="${pageContext.request.contextPath}/Scrap/project.do"> 프로젝트</a> </div>
	                	</div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 scraptwrap">
	                	<div class="coltheme"> it 뉴스 </div>
			         	<div class="tableDiv" >
							<div class="row tableHead">
							    <div class="col-7 col-lg-5">제목</div>
							    <div class="col-2">작성자</div>
							    <div class="col-3">작성일</div>
							    <div class="col-2 d-none d-lg-block">조회수</div>				    
							</div>
							
						  	<c:choose>
						  		<c:when test="${nlist.size()==0 }">
						  		<div class="row"><div class="col-12">스크랩한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${nlist}" var="dto">
						  				<div class="row tableBody p-0">
							    			<div class="col-7 col-lg-5 "><a href="${pageContext.request.contextPath}/itnews/detail?seq=${dto.seq}&page=${page}">${dto.title}</a></div>
							    			<div class="col-2">${dto.writer}</div>
							    			<div class="col-3">${dto.getDate()}</div>
							    			<div class="col-2 d-none d-lg-block">${dto.viewCount}</div>	
										</div>
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose> 
						</div>
			                	
			            <div class="coltheme"> 업계현황</div>
			            	<div class="tableDiv">
								<div class="row tableHead">
								    <div class="col-2 d-none d-md-block">분야/직무</div>
								    <div class="col-7 col-md-5">제목</div>
								    <div class="col-2">작성자</div>
								    <div class="col-3 col-lg-2">작성일</div>
								    <div class="col-1 d-none d-lg-block">조회수</div>				    
								</div>
								
							  	<c:choose>
							  		<c:when test="${ilist.size()==0 }">
							  		<div class="row"><div class="col-12">스크랩한 글이 없습니다.</div></div>
							  		</c:when>
							  		<c:otherwise>
							  			<c:forEach items="${nlist}" var="dto">
							  				<div class="row tableBody p-0">
								   				<div class="col-2 d-none d-md-block">${i.field }/${i.duty }</div>
								    			<div class="col-7 col-lg-5"><a href="${pageContext.request.contextPath}/itnews/detail?seq=${dto.seq}&page=${page}">${dto.title}</a></div>
								    			<div class="col-2">${dto.writer}</div>
								    			<div class="col-3 col-lg-2">${dto.getDate()}</div>
								    			<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>	
											</div>
							  			</c:forEach>
							  		</c:otherwise>
							  	</c:choose> 
							</div>  	
			         		<table class="table table-hover">
							  <tbody>
							  	<c:choose>
							  		<c:when test="${ilist.size()==0 }">
							  		<tr><td colspan="8">스크랩한 글이 없습니다.</td></tr>
							  		</c:when>
							  		<c:otherwise>
							  			<c:forEach items="${ilist }" var="i">
							  				<tr>
							  					<td>${i.field }/${i.duty }</td>
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
	                		<div class="coltheme"> 코드 지식인</div>
					        	<table class="table table-hover">
									<thead class="thead-light">
										<tr>
											<th scope="col">구분</th>
											<th scope="col">게시판제목</th>
											<th scope="col">작성자</th>
											<th scope="col">날짜</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${clist.size()==0 }">
												<tr>
													<td colspan="8">스크랩한 글이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${clist}" var="dto">
													<tr>
														<td><span class="badge badge-pill badge-success"
															style="margin: 10; width: 60px;">${dto.division}</span></td>
														<td style="cursor:hand" onClick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">
															${dto.title}
															<c:if test="${dto.replyCount>0 }">
									  							<span class="pComment font-weight-bold">${dto.replyCount}</span>
									  						</c:if>	
															<span class="badge badge-pill badge-danger">N</span></td>
														<td>${dto.writer}  
														 <span class="badge badge-pill badge-info">실무자</span></td>
														</td>
														<td>${dto.formedDate}</td>
														<td>${dto.viewCount}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
	                		
	                		<div class="coltheme"> 프로젝트</div>
	                	
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
</body>
</html>
