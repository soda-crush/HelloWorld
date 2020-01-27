<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/industry/industryBase.css" type="text/css"/>
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
		var oriCon = $("#content").val();
		var nonTagCon = oriCon.replace(/(<([^>]+)>)/ig,"");
		$("#nonTagContents").val(nonTagCon);
	})
})
</script>
<script>
   $(function(){
      $("#bambooNavi").attr('class','nav-item nav-link active');
      var modTitle = $("#modTitle").val().replace(/modF'Fdom/gi,'"');
      $("#title").val(modTitle);
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
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>      
            <!--      몸통 시작!!!   -->
            <div class=container id="projectPage">
            <div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom"><h1 class="titleClick cursorPointer">대나무숲</h1></td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     자유롭게 익명으로 글을 남기는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;"><h1 class="titleClick cursorPointer">대나무숲</h1></div>
					<div style="font-size: 15px; color: gray;">자유롭게 익명으로 글을 남기는 게시판입니다.</div>
				</div>
			</div>
		<form action="bambooModifyProc.do" method="post" enctype="multipart/form-data" id=writeForm>
			<div class=row>
				
				<input type="hidden" name="writer" value="${bPage.writer}">
             <input type="hidden" name="seq" value="${bPage.seq}"> 
				<div class="col-12 title" >
					<input type="text" id=title name=title style="width: 100%" value="${bPage.title}" maxlength="100" placeholder="제목을 입력해주세요.">
					<input type="hidden" value="${bPage.modTitle }" id="modTitle">
				</div>
			</div>
			<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
			<div class=row>
					<div class="col-12 content">
			
			<textarea style="display: none" name=content id=content class="summernote">${bPage.content}</textarea>
			<input type="hidden" id="nonTagContents" name="nonTagContents">
					</div>
				</div> 
			<div class=row>
				<div class="col-12 btn" style="text-align: right;">
					<button class="btn btn-primary" type="button" id="write">수정</button>
					<button class="btn btn-secondary" type="button" id="return">취소</button>
				</div>
			</div>
		</form>
		</div>
		<script>
		$("#return").on('click',function() {
			location.href = "bambooDetailView.do?seq=${bPage.seq}";
						})
		$('.summernote').summernote({
			lang: 'ko-KR',
			 height : 500,
			 codeviewFilter: true,
			 toolbar: [
		            ['style', ['style']],
		            ['font', ['bold', 'underline', 'clear']],
		            ['fontname', ['fontname']],
		            ['fontsize', ['fontsize']],
		            ['color', ['color']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['height', ['height']],
		            ['table', ['table']],
		            ['insert', ['link', 'picture', 'hr']],
		            ['view', ['fullscreen']],
		            ['help', ['help']]
		      ]
     	});
		$("#write").on("click", function() {
			regex = /^[(<p><br></p>)(<p>(&nbsp; )+</p>)]{0,}$/g;
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
		$(".titleClick").on("click",function(){
			location.href="/bamboo/bambooList.do";
		})
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