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
								<td colspan="3" style="font-size: 60px; font-weight: 100;">대나무숲</td>
								<td></td>
								<td style="font-size: 15px; color: gray;">     자유롭게 익명으로 글을 남기는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
				</div>
		<form action="bambooModifyProc.do" method="post" enctype="multipart/form-data" id=writeForm>
			<input type="hidden" name="writer" value="${bPage.writer}">
             <input type="hidden" name="seq" value="${bPage.seq}"> 
		제목<input type="text" id=title name=title value="${bPage.title}"><br> 
			<div id="summernote">${bPage.content}</div>
			<textarea style="display:none" name=content id=content></textarea>
			<button type="submit">작성하기</button> 
			<input type="button" id="return" value="돌아가기">
		</form>
		<script>
		$("#return").on('click',function() {
			location.href = "bambooDetailView.do?seq=${bPage.seq}";
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