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
<script>
	var result = ${result};
	if(result > 0){
		alert("문의글이 삭제되었습니다");
		location.href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}";
	}else{
		alert("문의글이 삭제되지 않았습니다. 같은 문제가 반복될 경우 관리자에게 문의해주세요");
		location.href="${pageContext.request.contextPath}/member1/detailViewInquiry?page=${page}&seq=${seq}";
	}
</script>
</body>
</html>