<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.table{background-color:white;padding:0;text-align:center;}	
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
		<div class=container id="projectPage" style="background-color:white">
		<div id="pageTitle">
			<table>
				<tr>
					<td colspan="3" style="font-size: 60px; font-weight: 100;">대나무숲</td>
					<td></td>
					<td style="font-size: 15px; color: gray;">자유롭게 익명으로 글을 남기는
						게시판입니다.</td>
					<td></td>
				</tr>
			</table>
		</div>
		
		<form action="bambooWriteProc.do" method="post"
			enctype="multipart/form-data" id=writeForm>
			<div class=row>
				<div class="col-2 title">
					<h4>제목</h4>
				</div>
				<div class="col-10 title" >
					<input type="text" name=title style="width: 100%">
				</div>
			</div>
				<div class=row>
					<div class="col-12 content">
			<div id="summernote"></div>
			<textarea style="display: none" name=content id=content></textarea>
					</div>
				</div>
			<div class=row>
				<div class="col-12 btn" style="text-align: right;">
					<button class="btn btn-primary" type="button" id="write">작성하기</button>
					<button class="btn btn-primary" type="button" id="return">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
		<script>
		$("#return").on('click',function() {
			location.href = "bambooList.do";
						})
		 $('#summernote').summernote({
			 height : 500
   		  });
		
		$("#write").on("click", function() {
			$("#title").val($.trim($("#title").val())); 						
			if (($("#title").val()=="" || $(".note-editable").text()== "")) {
				alert("작성 하지 않는 문항이 있습니다. 다시 한번 확인해주세요.");
				return false;
			} else {
				var result = confirm("이대로 작성 하시겠습니까?");
				if (result) {
					$("#writeForm").submit();
				}
			}
		})
	</script>
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