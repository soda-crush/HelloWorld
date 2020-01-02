<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<style>
.menu {
	height: 30px;
	width: 100%;
	font-family: 'Alata', sans-serif;
	border: 1px solid black;
	border-radius: 3px;
}

.Wrap {
	height: 800px;
	width: 200px;
	margin: 0px;
	float: left;
}

h4 {
	margin: 0px;
	padding: 20px 20px;
	text-align: right;
	font-size: 20px;
	font-family: 'Alata', sans-serif;
}

.menu>a {
	text-decoration: none;
	color: white;
}

#wrapper {
	width: 1500px;
	bolder: 1px solid black;
	overflow: hidden;
	margin: auto;
}

#container {
	height: 800px;
	width: 1300px;
	float: left;
	padding: 20px;
	overflow-x: scroll;
	border: 1px solid black;
}

#headDiv {
	padding: 0px;
	margin: 0px;
	padding-top: 20px;
	padding-bottom: 20px;
}

#headDiv>div {
	padding: 0px;
	margin: 0px;
	font-weight: bold;
	font-size: 20px;
	line-height: 30px;
}

.article {
	padding-bottom: 10px;
}

.article:hover {
	background-color: #cbe7ff90;
}

a:hover {
	text-decoration: none;
}

.naviBar {
	font-size: 20px;
	word-spacing: 5px;
	font-weight: bold;
}

.naviPage:visited {
	color: black;
}

input[type="button"] {
	width: 100px;
	height: 30px;
	border: 0px;
	background-color: lightgray;
	font-size: 13px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>

	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
	<c:forEach items="${list}" var="dto">
		<div>글번호 : ${dto.seq}</div>
		<div>구분 : ${dto.division}</div>
		<div>게시판제목 : ${dto.title}</div>
		<div>게시판내용 : ${dto.content}</div>
		<div>작성자 : ${dto.writer}</div>
		<div>포인트 : ${dto.point}</div>
		<div>조회수 : ${dto.viewCount}</div>
		<div>날짜 : ${dto.writeDate}</div>
	</c:forEach>
	

		<!--
<button type="button" class="btn btn-primary">채택</button>
<span class="badge badge-pill badge-success">JAVA</span>
<button type="button" class="btn btn-danger">레벨7</button>
<span class="badge badge-pill badge-info">실무자</span>
<span class="badge badge-pill badge-warning">80</span>
<button type="button" class="btn btn-dark">댓글</button>
-->


		<!--       몸통 끝!!!   -->

		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/standard/footer.jsp"/>

</body>
</html>