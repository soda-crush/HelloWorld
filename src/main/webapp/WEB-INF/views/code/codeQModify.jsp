<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<style>
.division {
	padding: 0px;
	margin: 0px;
}

.sele{
	width:200px;
}
.btn{
	margin:20px;
}
.btn-primary{
	width:110px;
	height:30px;
}
</style>
<script>
$(function(){
	$("#writeForm").on("submit",function(){
		$("#content").val($(".note-editable").html());
	})
})
</script>
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
		<form action="modifyProc.do" method="post" id="writeForm">
		<input type="hidden" name="writer" value="${result.writer}">
			<div class=container>
				<div class=row>
					<div class="col-3 division">
						<h4>Language</h4>
					</div>
					<div class="col-3 division">
						<select name="division" class="sele">
							<option value="">언어 선택</option>
							<option value="java" <c:if test="${result.division eq 'java'}">selected</c:if>>java</option>
							<option value="php" <c:if test="${result.division eq 'php'}">selected</c:if>>php</option>
							<option value="c" <c:if test="${result.division eq 'c'}">selected</c:if>>c/c++/c#</option>
							<option value="android" <c:if test="${result.division eq 'android'}">selected</c:if>>android</option>
							<option value="ios" <c:if test="${result.division eq 'ios'}">selected</c:if>>ios</option>
							<option value="db" <c:if test="${result.division eq 'db'}">selected</c:if>>db(oracle/mysql/mssql)</option>
							<option value="etc" <c:if test="${result.division eq 'etc'}">selected</c:if>>기타</option>
						</select>
					</div>
					<div class="col-3 division">
						<h4>Get Point</h4>
					</div>
					<div class="col-3 division">
						<select name="point" class="sele">
							<option value="">point</option>
							<option value="10" <c:if test="${result.point == 10}">selected</c:if>>10</option>
							<option value="30" <c:if test="${result.point == 30}">selected</c:if>>30</option>
							<option value="50" <c:if test="${result.point == 50}">selected</c:if>>50</option>
							<option value="100" <c:if test="${result.point == 100}">selected</c:if>>100</option>
						</select>
					</div>
				</div>
				
				<div class=row>
					<div class="col-2 title">
						<h4>Q    질문${result.division}</h4>
					</div>
					<div class="col-10 title">
						<input type="text" name="title" style="width:100%" value="${result.title}">
					</div>
				</div>

				<div class=row>
					<div class="col-12 content">
						<textarea name="content" id="content" style="display:none"></textarea>
						<div id="summernote">${result.content}</div>
					</div>
				</div>
				
				<div class=row>
					<div class="col-12 btn" style="text-align:right;">
						<button class="btn btn-primary" type="submit">작성완료</button>
						<button class="btn btn-primary" type="button" id="cancle">작성취소</button>
					</div>
				</div>
			</div>
		</form>
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
		$('#summernote').summernote({
			height: 500
		})
		$("#cancle").on("click",function(){
			location.href="${pageContext.request.contextPath}/code/codeDetail.do?seq=${parent_seq}";
		})
	</script>
</body>
</html>