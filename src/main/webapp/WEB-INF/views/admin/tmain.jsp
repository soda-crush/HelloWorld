<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<a href="${pageContext.request.contextPath }/admin/main">홈</a>
<a href="">모니터링</a>
<a href="">회원관리</a>
<a href="">대나무숲</a>
<a href="">코드지식인</a>
<a href="">업계현황</a>
<a href="">프로젝트 모집</a>
<a href="">일대일문의</a>
<a href="${pageContext.request.contextPath }/admin/modifyForm">정보변경</a>

</body>
</html>