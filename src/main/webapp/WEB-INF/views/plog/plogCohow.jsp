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
		.card{width:200px;height:300px;margin: auto;float :left;}
		.myprofile{float: left;height: 350px;margin-top: 20px;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
		.coltheme{margin:30px;}
		.navi{text-align: center;}
		.nvlink1{height:45px;line-height:45px;font-size:14px;}
		.nvlink2{height:45px;line-height:45px;font-size:10px;}
        a:hover{text-decoration:none;}
        .tableBody{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	</style>
	<script>
	$(function(){
		$("#plogNavi").attr('class','nav-item nav-link active');
	});
	</script>
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
            <div class="container">
				<h1 class="d-none d-sm-block"> Programming-Log</h1>
				<h3 class="d-sm-none"> Programming-Log</h3>
	           	<div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
				<div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
	                            <p class="card-text" style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 scraptwrap">
	                	<div class="tableDiv">
	                		<div class="coltheme"> 내 질문</div>
							<div class="row tableHead">
								<div class="col-2 col-lg-1">구분</div>
							    <div class="col-7 col-lg-5">제목</div>
							    <div class="col-3">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>	
							    <div class="col-1 d-none d-lg-block">조회수</div>					    
							</div>
							
						  	<c:choose>
						  		<c:when test="${qlist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">내가 질문한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${qlist }" var="dto">
						  				<div class="row tableBody p-0">
						  					<div class="col-2 col-lg-1" style="color:dodgerblue;">${dto.division}</div>
											<div class="col-7 col-lg-5 " >
							  					<div class="line-over text-decoration-none" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">${dto.title} 
								  					<c:if test="${dto.replyCount>0 }">
								  						<span class="pComment font-weight-bold">${dto.replyCount}</span>
								  					</c:if>	
							  					</div>				  					
											</div>
											<div class="col-3" style="text-align:center;"><div class="line-over">${dto.writer}</div></div>
											<div class="col-2 d-none d-lg-block">${dto.scrapDate}</div>
											<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>
										</div>	
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
						</div>
						<div class="naviwrap"style="width:100%;text-align:center;margin-top:20px;">
		                    <c:forEach items="${qpageNavi}" var="navi">									
								${navi}
							</c:forEach>
	               		</div>
	               		<div class="tableDiv">
	                		<div class="coltheme"> 내 답변</div>
							<div class="row tableHead">
								<div class="col-2 col-lg-1">구분</div>
							    <div class="col-7 col-lg-5">제목</div>
							    <div class="col-3">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>	
							    <div class="col-1 d-none d-lg-block">조회수</div>					    
							</div>
							
						  	<c:choose>
						  		<c:when test="${rlist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">내가 답변한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${rlist }" var="dto">
						  				<div class="row tableBody p-0">
						  					<div class="col-2 col-lg-1" style="color:dodgerblue;">${dto.division}</div>
											<div class="col-7 col-lg-5 " >
							  					<div class="line-over text-decoration-none" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">${dto.title} 
								  					<c:if test="${dto.replyCount>0 }">
								  						<span class="pComment font-weight-bold">${dto.replyCount}</span>
								  					</c:if>	
							  					</div>				  					
											</div>
											<div class="col-3" style="text-align:center;">${dto.writer}</div>
											<div class="col-2 d-none d-lg-block">${dto.scrapDate}</div>
											<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>
										</div>
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
						</div>
						<div class="naviwrap"style="width:100%;text-align:center;margin-top:20px;">
		                    <c:forEach items="${rpageNavi}" var="navi">									
								${navi}
							</c:forEach>
	               		</div>
	                </div>
	          	</div>
            </div>
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
