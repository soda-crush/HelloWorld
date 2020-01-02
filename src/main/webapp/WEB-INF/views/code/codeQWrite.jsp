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
<link rel="stylesheet" href="/css/mainBase.css">
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
		<form action="codeQWriteProc.do" method="post">
			<div class=container>
				<div class=row>
					<div class="col-3 division">
						<h4>Language</h4>
					</div>
					<div class="col-3 division">
						<select name="division" class="sele">
							<option value="">언어 선택</option>
							<option value="java">java</option>
							<option value="php">php</option>
							<option value="c">c/c++/c#</option>
							<option value="android">android</option>
							<option value="ios">ios</option>
							<option value="db">db(oracle/mysql/mssql)</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="col-3 division">
						<h4>Get Point</h4>
					</div>
					<div class="col-3 division">
						<select name="point" class="sele">
							<option value="">point</option>
							<option value="10">10</option>
							<option value="30">30</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
					</div>
				</div>

				<div class=row>
					<div class="col-2 title">
						<h4>Q    질문</h4>
					</div>
					<div class="col-10 title">
						<input type="text" name="title" style="width:100%">
					</div>
				</div>

				<div class=row>
					<div class="col-12 content">
						<textarea name="content" style="width:100%; height:500px; resize:none;"></textarea>
					</div>
				</div>
				
				<div class=row>
					<div class="col-12 btn" style="text-align:right;">
						<button class="btn btn-primary" type="submit">작성완료</button>
						<button class="btn btn-primary" type="button">작성취소</button>
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
</body>
</html>