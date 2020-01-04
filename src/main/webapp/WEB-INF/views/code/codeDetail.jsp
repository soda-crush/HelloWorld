<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/projectBase.css" type="text/css" />
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css" />

<style>
.contentDiv {
	/* 한 줄 자르기 */
	display: block;
	text-align: left;
	width: 800px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* 여러 줄 자르기 추가 스타일 */
	white-space: normal;
}

.topQ {
	display: block;
	text-align: left;
}

.botD {
	/* 	margin-right: 550px; */
	display: block;
	text-align: left;
}

.btnDIv2 {
	margin: 20px;
	padding: 20px;
}

#pageTitle {
	margin-bottom: 20px;
}

#pageTitle h1 {
	display: inline;
	margin-right: 10px;
	font-weight: bold;
}

#pageBody {
	background-color: white;
}

#pHeader, #pageFooter {
	padding-top: 10px;
}

#pHeader #stateLabel {
	color: white;
}

#pHeader label.N {
	background-color: limegreen;
}

#pHeader label.Y {
	background-color: red;
}

#pHeader span:first-of-type {
	font-size: 20px;
}

#pHeader label:nth-of-type(2) {
	width: 200px;
}

#pInfo *, #pBody * {
	font-size: 15px;
}

#pInfo label, #pBody label {
	width: 100px;
	color: darkgray;
}

#baseBackgroundColor {
	margin: auto;
	text-align: center;
}

#btnDIv {
	margin: 20px;
}

span:nth-child(1) {
	font-size: 60px;
	font-weight: 100;
}

span:nth-child(4) {
	font-size: 50px;
	font-weight: 100;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class=container id="projectPage" style="background-color: white;">
			<!-- 			<div id="pageTitle"> -->
			<div class="topQ">
				<span>Q</span> <span class="badge badge-pill badge-danger">${qResult.point}</span>
				<span class="badge badge-pill badge-success"
					style="margin: 10; padding: 10; width: 40px;">${qResult.division}</span>
				<span>${qResult.title}</span>
			</div>
			<br>
			<div>
				<div class="contentDiv">${qResult.content}</div>
				<br>
				<div class="botD"><img src="/icon/Cicon.svg">${qResult.writer} ${qResult.writeDate} 조회수${qResult.viewCount}</div>
				<br>
				<!-- 아래 비로그인일때도 보이는지..? -->
				<c:choose>
					<c:when test="${qResult.writer!=sessionScope.loginInfo}">
						<div style="text-align: right;" class="btnDIv">
							<a class="btn btn-dark" href="/code/codeRWrite.do?seq=${qResult.seq}" role="button">답변</a>
							<button class="btn btn-dark">공유</button>
							<button class="btn btn-dark">스크랩</button>
							<a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
							<button class="btn btn-danger">신고</button>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: right;">
							<button class="btn btn-dark" class="btnDIv2" id="modify">수정</button>
							<button class="btn btn-danger" class="btnDIv2" id="delete">삭제</button>
						</div>
					</c:otherwise>
				</c:choose>
				<hr>
				<div style="text-align: center; margin-right: 200px;">A2개</div>
				<hr>
				
			<!-- 답글 시작-->
		
				<div class="topQ">
					<c:forEach items="${rResult}" var="r">
						<div style="font-size: 40px; font-weight: 100;">${r.writer}님의 답변입니다.</div>
						<br>
						<div id="content">${r.content}</div>
						<br>
							<c:if test="${cResult.size()>0 }">
								<c:forEach items="${cResult }" var="c">
									${c.content}<br>
								</c:forEach>
							</c:if>
						<div>${r.writeDate}
							<button class="btn btn-dark" id="comments">댓글</button>
						</div>
						<c:choose>
							<c:when test="${qResult.writer==sessionScope.loginInfo}">
									<button class="btn btn-dark" class="btnDIv2" id="modifyR">수정</button>
									<button class="btn btn-danger" class="btnDIv2" id="deleteR" onclick ="deleteR(${r.seq})">삭제</button>
<%-- 									<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?seq=${Bresult.seq}'">삭제</button> --%>
							</c:when>
						</c:choose>
						<br>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--       몸통 끝!!!   -->

		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
	
	<script>
		$("#modify").on("click",function(){
			
		})
		$("#delete").on("click",function(){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/delete.do?seq=${qResult.seq}";
			}
		})
		$("#modifyR").on("click",function(){
			
		})
		
		$("#comments").on("click",function(){
			$("#content").append("<input type='text'><button>전송</button>");
		})
		
		function deleteR(seq){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/deleteR.do?seq="+seq;
			}
        }
	</script>
</html>