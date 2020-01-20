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
<script src="/js/summernote-ko-KR.js"></script>
<script>
$(function() {
	$('#writeForm').on('submit', function() {
		$('#content').val($('.note-editable').html());
	})
})
</script>
<script>
   $(function(){
      $("#indusNavi").attr('class','nav-item nav-link active');
   });
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
		<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom">업계현황</td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     업계현황에 대한 정보를 나누는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;">업계현황</div>
					<div style="font-size: 15px; color: gray;">업계현황에 대한 정보를 나누는 게시판입니다.</div>
				</div>
			</div>
		<c:if test="${iPage.seq !=null }">
			<form action="industryStatusModifyProc.do" method="post" enctype="multipart/form-data" id=writeForm>
				<input type="hidden" name="writer" value="${iPage.writer}">
				<input type="hidden" name="seq" value="${iPage.seq}"> 
				
				<div class=row>
				<div class="col-1 title">
					<h4>분야</h4>
				</div>
				<div class="col-11 title" >
					<select name="field" id="field">
						<option value="SM">SM</option>
						<option value="SI">SI</option>
						<option value="Solution">Solution</option>
					</select>
				</div>
			</div>	
			<div class=row>
				<div class="col-1 title">
					<h4>직무</h4>
				</div>
				<div class="col-11 title" >
					<select name="duty" id="duty">
						<option value="웹">웹</option>
						<option value="어플리케이션">어플리케이션</option>
						<option value="시스템소프트웨어">시스템소프트웨어</option>
						<option value="응용소프트웨어">응용소프트웨어</option>
						<option value="빅데이터">빅데이터</option>
						<option value="정보보호">정보보호</option>
						<option value="데이터베이스">데이터베이스</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
				<div class=row>
				<div class="col-1 title">
					<h4>제목</h4>
				</div>
					<input type="hidden" name="writer" value="${iPage.writer}">
				<div class="col-11 title" >
					<input type="text" id=title name=title style="width: 100%" value="${iPage.title}" maxlength="100">
				</div>
			</div>
			<div class=row>
					<div class="col-12 content">
			
			<textarea style="display: none" name=content id=content class="summernote">${iPage.content}</textarea>
					</div>
				</div> 
			<div class=row>
				<div class="col-12 btn" style="text-align: right;">
					<button class="btn btn-primary" type="button" id="write">작성하기</button>
					<button class="btn btn-primary" type="button" id="return">돌아가기</button>
				</div>
			</div>
			</form>
		</c:if>
		<script>
		$("#return").on('click',function() {
			location.href = "industryStatusDetailView.do?seq=${iPage.seq}";
						})
		 $('.summernote').summernote({
			 lang: 'ko-KR',
			 height : 500
     	});
		$("#write").on("click", function() {
			regex = /^[(<p><br></p>)(<p>(&nbsp; ){1,}</p>)]{0,}$/g;
			   var content = $(".summernote").val();
			   var result = regex.exec(content);
			   $("#title").val($.trim($("#title").val())); 
			   if(($("#title").val()=="")&&(result!=null)){
			      alert("제목과 내용을 입력해주세요.");
			      return false;
			   }else if(result!=null){
			      alert("내용을 입력해 주세요.");
			      return false;
			   }else if($("#title").val()==""){
			      alert("제목을 입력해 주세요.");
			      return false;
			   }else {
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
	</div>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
</body>


</html>