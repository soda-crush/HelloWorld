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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script>
	$(function() {
		$('#writeForm').on('submit', function() {
			$('#content').val($('.note-editable').html());
		})
	})
</script>
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
				
				<form action="industryStatusWriteProc.do" method="post" enctype="multipart/form-data" id=writeForm>
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
				제목<input type="text" name=title><br> 
				<div id="summernote"></div>
				<textarea style="display:none" name=content id=content></textarea>
				<button type="submit">작성하기</button> 
				<input type="button" id="return" value="돌아가기">
				</form>
			<script>
			$("#return").on('click',function() {
			location.href = "bambooList.do";
							})
		 	$('#summernote').summernote({
     						});
			</script>
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
</html>