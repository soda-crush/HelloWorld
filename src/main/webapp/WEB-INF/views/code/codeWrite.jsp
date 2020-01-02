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
select{
	z-index:2;
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
		<div class=container>
			<div class=row>
				<div class="col-3 division">
					<h4>Language</h4>
				</div>
				<div class="col-3 division">
					<select name="langauge">
						<option value="">언어 선택</option>
						<option value="JAVA">JAVA</option>
						<option value="PHP">PHP</option>
						<option value="C">C</option>
					</select>
				</div>
				<div class="col-3 division">
					<h4>Get Point</h4>
				</div>
				<div class="col-3 division">
					<select name="point">
						<option value="">point</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
					</select>
				</div>
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
</body>
</html>