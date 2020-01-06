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
<link rel="stylesheet" href="/css/mainBase.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            	 <c:if  test="${bPage.seq !=null }">
		
            	<form action="bambooModifyProc.do" method="post">
            	<input type="hidden" name="writer" value="${bPage.writer}">
            	<input type="hidden" name="seq" value="${bPage.seq}">
            	제목<input type="text" id=title name=title value=${bPage.title}><br>
            	내용<input type="textarea" id="content" name=content value=${bPage.content}><br>
            	<input type="button" id="return" value="돌아가기">
            	<input type="button" id="write" value="작성">
            	</form>
          	  </c:if>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
</body>

	<script>
        	$("#return").on("click",function(){
        		location.href="bambooDetailView.do?seq=${bPage.seq}";
        	})
        	$("#write").on("click",function(){
        		$("form").submit();
        	})
        </script>
</html>