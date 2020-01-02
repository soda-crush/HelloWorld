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
	<script>
		var result = ${result};
		if(result){
			alert("정보 변경이 완료되었습니다");
		}else{
			alert("정보 변경에 실패했습니다. 다시 시도해 주세요");
		}		
		location.href = "${pageContext.request.contextPath }/admin/modifyForm";
	</script>
</body>
</html>