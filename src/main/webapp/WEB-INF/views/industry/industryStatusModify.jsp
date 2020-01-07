<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
            <div id="pageTitle">
					<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100;">업계현황</td>
								<td></td>
								<td style="font-size: 15px; color: gray;">     업계현황에 대한 정보를 나누는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
				</div>
            	 <c:if  test="${iPage.seq !=null }">
		
            	<form action="industryStatusModifyProc.do" method="post">
            	<input type="hidden" name="writer" value="${iPage.writer}">
            	<input type="hidden" name="seq" value="${iPage.seq}">
            	<select name="field" id="field">
            		<option value="분야1">분야1</option>
            		<option value="분야2">분야2</option>
            		<option value="분야3">분야3</option>
            	</select>
            	<select name="duty" id="duty">
            		<option value="직무1">직무1</option>
            		<option value="직무2">직무2</option>
            		<option value="직무3">직무3</option>
            	</select>
            	제목<input type="text" id=title name=title value="${iPage.title}"><br>
            	내용<textarea id="content" name=content>${iPage.content}</textarea><br>
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
        		location.href="industryStatusDetailView.do?seq=${iPage.seq}";
        	})
        	$("#write").on("click",function(){
        		$("form").submit();
        	})
        </script>
</html>