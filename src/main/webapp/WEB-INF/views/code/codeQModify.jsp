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
<%-- 	<c:forEach items="${list}" var="dto"> --%>
<%-- 		<div>글번호 : ${dto.seq}</div> --%>
<%-- 		<div>구분 : ${dto.division}</div> --%>
<%-- 		<div>게시판제목 : ${dto.title}</div> --%>
<%-- 		<div>게시판내용 : ${dto.content}</div> --%>
<%-- 		<div>작성자 : ${dto.writer}</div> --%>
<%-- 		<div>포인트 : ${dto.point}</div> --%>
<%-- 		<div>조회수 : ${dto.viewCount}</div> --%>
<%-- 		<div>날짜 : ${dto.writeDate}</div> --%>
<%-- 	</c:forEach> --%>
	

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