<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css"
	type="text/css" />
<script>
   $(function(){
      $("#itNavi").attr('class','nav-item nav-link active');
   });
</script>
</head>
<body>
	<div id="pCoInput" class="row">
		<div class="col-10">
			<textarea style="width: 100%; height: 100%;" placeholder="사유 입력"
				id="reason" name="reason"></textarea>
		</div>
		<div class="col-2">
			<div class="row">
				<div class="col-12">
					<button type="button" class="btn btn-secondary"
						style="margin-bottom: 10px;" id="cancel">취소</button>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<button type="button" class="btn btn-primary" id="writeBtn">작성</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>