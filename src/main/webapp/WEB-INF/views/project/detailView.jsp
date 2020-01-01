<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageBody{background-color:white;}	
	#pHeader,#pageFooter{padding-top:10px;}
	#pHeader #stateLabel{color:white;}
	#pHeader label.N{background-color:limegreen;}
	#pHeader label.Y{background-color:red;}
	#pHeader label:not(#stateLabel){font-size:15px;}
	#pHeader span:first-of-type{font-size:20px;}
	#pHeader label:nth-of-type(2){width:200px;}
	#pInfo *,#pBody *{font-size:15px;}
	#pInfo label,#pBody label{width:100px;color:darkgray;}
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
				<div id="pageTitle">
					<h1>프로젝트 모집</h1>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${pPage.seq !=null }">
						<div id="pHeader">
							<label class="${pPage.state } badge badge-pill ml-4" id="stateLabel">${pPage.stateInKor }</label><br>
							<span class="ml-4">${pPage.title}</span><br>
							<label class="ml-4">작성자 : ${pPage.writer }</label><label>작성일 : ${pPage.formedWriteDate }</label>
						</div>
						<hr>
						<div id="pInfo">
							<div><label class="ml-4">지역</label><span>${pPage.location1 } ${pPage.location2 }</span></div>
							<div><label class="ml-4">모집인원</label><span>${pPage.capacity }명</span></div>
							<div><label class="ml-4">기간</label><span>${pPage.formedAllDate }</span></div>
							<div><label class="ml-4">사용언어</label><span>${pPage.languages }</span></div>
						</div>
						<hr>
						<div id="pBody">
							<div><p>${pPage.contents }</p></div>
							
							<div><label class="ml-4">연락처</label><span>${pPage.phone }</span></div>
							<div><label class="ml-4">메일주소</label><span>${pPage.email }</span></div>
							
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									${c.contents }<br>
								</c:forEach>
							</c:if>
						</div>
					</c:if>
				</div>
				<div id="pageFooter">
					<span><a class="btn btn-danger" href="#" role="button">게시글 신고</a></span>
					<span class="float-right">
						<c:if test="${pPage.writer == sessionScope.loginInfo}">
							<a class="btn btn-info" href="#" role="button">수정</a>
							<a class="btn btn-info" href="#" role="button">삭제</a>
						</c:if>
						<a class="btn btn-secondary" href="/project/list" role="button">목록</a>
					</span>
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