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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/writeBase.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<style>
	#titleLink:hover{
		cursor:pointer;
		color:gray;
	}
	#titleLink strong{
		font-size:25px;
	}
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
				<div id="pageTitle" class="row ml-1 mb-4">
					<div class="col-12" id="titleLink">
							<div class="row">
							<div class="col-auto vertical-align:text-top p-0"><i class="fa fa-quote-left"></i></div>
							<div class="col-auto vertical-align:text-top p-0"><strong>일대일문의</strong></div>
							<div class="col-auto vertical-align:text-top p-0"><i class="fa fa-quote-right"></i></div>
							</div>
					</div>
					<script>
						$("#titleLink").on("click", function(){
							location.href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}";
						})
					</script>
				</div>
				
				<form action="${pageContext.request.contextPath}/member1/modifyInquiry?page=${page}" method="post" id="writeFrm" enctype="multipart/form-data">
					<div id="pageBody">					
						<div id="pBody">
							<div id="pTitleInput" class="mb-3"><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title" value="${dto.title}" maxlength="100"></div>
							<div id="pContentsInput"><textarea class="form-control summernote" name="content" id="content">${dto.content}</textarea></div>											
						</div>					
					</div>
					<input type="hidden" value="${dto.seq}" name="seq">
					<div id="pageFooter" class="mt-3">
						<span><button class="btn btn-secondary back" type="button">목록</button></span>
						<span class="float-right">			
							<input class="btn btn-primary" type="submit" value="수정하기" id="writeBtn">			
							<button class="btn btn-secondary back" type="button">취소</button>					
						</span>
					</div>
				</form>          
            </div>
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id="aroundContent">
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
    lang: 'ko-KR',
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

$("#writeBtn").on("click", function(){
	var regex = /^[(<p><br></p>)(<p>(&nbsp; ){1,}</p>)]{0,}$/g;
	var content = $(".summernote").val();
	var result = regex.exec(content);
	   
	$("#title").val($.trim($("#title").val())); 
	
	if(($("#title").val() == "")&&(result != null)){
		alert("제목과 내용을 입력해주세요.");
	    return false;
	}else if(result != null){
	    alert("내용을 입력해 주세요.");
	    return false;
	}else if($("#title").val()==""){
	    alert("제목을 입력해 주세요.");
	    return false;
	}	
})

$(".back").on("click", function(){
	var result = confirm("모든 입력 내용이 사라집니다. 수정을 취소할까요?");
	if(result){
		location.href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}";
	}
})
</script>
</body>
</html>
