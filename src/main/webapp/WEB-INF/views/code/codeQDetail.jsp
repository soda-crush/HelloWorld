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
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css"
	type="text/css" />
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
				<span>Q</span> <span class="badge badge-pill badge-danger">${dResult.point}</span>
				<span class="badge badge-pill badge-success"
					style="margin: 10; padding: 10; width: 40px;">${dResult.division}</span>
				<span>${dResult.title}</span>
			</div>
			<div>
				<div class="contentDiv">${dResult.content}</div>
				<div class="botD">${dResult.writer} ${dResult.writeDate} ${dResult.viewCount}</div>
				<div>　</div>
				<div style="text-align: right;" class="btnDIv">
					<a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
					<button class="btn btn-dark">공유하기</button>
					<button class="btn btn-dark">스크랩</button>
					<button class="btn btn-danger">신고하기</button>
				</div>
				<div>　</div>
				<c:choose>
					<c:when test="${sessionScope.loginInfo ==null}">
					</c:when>
					<c:otherwise>
						<div style="text-align: right;">
							<button class="btn btn-dark" class="btnDIv2" id="modify">수정하기</button>
							<button class="btn btn-danger" class="btnDIv2" id="delete">삭제하기</button>
						</div>
					</c:otherwise>
				</c:choose>
				<hr>
				<div style="text-align: center; margin-right: 200px;">A2개</div>
				<hr>
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
				location.href="${pageContext.request.contextPath}/code/delete.do?seq=${dResult.seq}";
			}
		})
	</script>
</html>