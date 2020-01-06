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
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
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
				<div id="pageTitle" class="mb-4">
					<h1>일대일 문의쓰기</h1>
				</div>
				
				<form action="${pageContext.request.contextPath}/member1/writeInquiry" method="post" id="writeFrm" enctype="multipart/form-data">
					<div id="pageBody">					
						<div id="pBody">
							<div id="pTitleInput" class="mb-3"><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title"></div>
							<div id="pContentsInput"><textarea class="form-control summernote" name="content" id="content"></textarea></div>											
						</div>					
					</div>
					<div id="pageFooter" class="mt-3">
						<span><button class="btn btn-secondary back" type="button">목록</button></span>
						<span class="float-right">			
							<input class="btn btn-primary" type="submit" value="글쓰기" id="writeBtn">			
							<button class="btn btn-secondary back" type="button">취소</button>					
						</span>
					</div>
				</form>          
            </div>
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
<script>
$('.summernote').summernote({
    placeholder: '내용을 입력해주세요',	        
    minHeight: 300,
    maxHeight: 300,   
});     

$("#writeBtn").on("click", function(){
	$("#title").val($.trim($("#title").val())); 
	if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return false;
	}
})

$(".back").on("click", function(){
	var result = confirm("모든 입력 내용이 사라집니다. 글쓰기를 취소할까요?");
	if(result){
		location.href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}";
	}
})
</script>
</body>
</html>
