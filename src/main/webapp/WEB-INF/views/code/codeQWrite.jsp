<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/code/codeBase.css" type="text/css"/>

<style>
.division {
	padding: 0px;
	margin: 0px;
}

.sele {
	width: 200px;
}
.btn{
	margin:5px;
}
</style>
<script>
	$(function(){
	    $("#codeNavi").attr('class','nav-item nav-link active');
	 });
	
	$(function() {
		$("#writeForm").on("submit", function() {
			$("#content").val($(".note-editable").html());
		})
	})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent1></div>
			</div>
		</div>
		
		<!--      몸통 시작!!!   -->
		<form action="codeQWriteProc.do" method="post" id="writeForm">
			<div class=container>
				<div class=row>
					<div class="col-xl-1 col-3 title">
						언어
					</div>
					<div class="col-xl-11 col-9 title" >
						<select name="division" class="sele" id="division">
							<option value="">언어 선택</option>
							<option value="java">java</option>
							<option value="php">php</option>
							<option value="c/c++/c#">c/c++/c#</option>
							<option value="android">android</option>
							<option value="ios">ios</option>
							<option value="database">db(oracle/mysql/mssql)</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				
				<br>
				
				<div class=row>
					<div class="col-xl-1 col-3 title">
						포인트
					</div>
					<div class="col-xl-11 col-9 title">
						<select name="point" class="sele" id="point">
							<option value="0">포인트X</option>
							<option value="10">10</option>
							<option value="30">30</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
					</div>
				</div>
				
				<br>
				
				<div class=row>
					<div class="col-xl-1 col-3 title">
						질 문
					</div>
					<div class="col-xl-11 col-9 title">
						<input type="text" name="title" style="width: 100%" id="title" maxlength="100">
					</div>
				</div>
				
				<br>
				
				<div class=row>
					<div class="col-12 content">
						<textarea name="content" id="content" style="display: none" class="summernote"></textarea>
<!-- 						<div id="summernote"></div> -->
					</div>
				</div>
				
			<br>
			
				<div class=row>
					<div class="col-12 btn" style="text-align: right;">
						<button class="btn btn-primary cursorPointer" type="button" id="write">작성완료</button>
						<button class="btn btn-danger cursorPointer" type="button" id="cancle">작성취소</button>
					</div>
				</div>
			</div>
		</form>
		
		<div class=row>
			<div class="col-12" id=aroundContent></div>
		</div>
	</div>
	<!--       몸통 끝!!!   -->

<!-- 	<div class=container> -->
<!-- 		<div class=row> -->
<!-- 			<div class="col-12" id=aroundContent></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />

	<script>
// 		var divisionTest = $("#division").val();
// 		var pointTest = $("#point").val();
// 		var titleTest = $("#title").val();
// 		var contentTest = $(".note-editable").text();
		
		$('.summernote').summernote({
			placeholder : '내용을 입력해주세요',
			height : 500,
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
		})
		
		$("#cancle").on("click",function() {
			location.href = "${pageContext.request.contextPath}/code/codeQList.do";
		})
		
		$("#write").on("click", function(){
// 		   regex = /^[(<p><br></p>)(<p>(&nbsp; ){1,}</p>)]{0,}$/g;
		   var regex = /^[(<p><br></p>)(<p>(&nbsp; )+</p>)]{0,}$/g;
		   
//		   var content = $(".note-editable").text();
 		   var content = $(".summernote").val();
		   var result = regex.exec(content);

		   $("#title").val($.trim($("#title").val())); 
		   if(($("#division").val()== "" || $("#point").val()== "" || $("#title").val()=="" || (result!=null))){
		      alert("작성 하지 않는 문항이 있습니다. 다시 한번 확인해주세요.");
		      return false;
		   }
		   else{
			   var result = confirm("이대로 작성 하시겠습니까?");
				if (result) {
					$("#writeForm").submit();
				}
		   }
		})
		
		$("#point").on("change",function(){
			$.ajax({
		        url : "/code/pointCheck.do",
		        type : "post",
		        dataType : "json",
		        data : {
		           id : "${sessionScope.loginInfo.id}"	           
		        }
		     }).done(function(resp){
		    	 var adoptPoint = $("#point option:selected").val();
		        if(resp >= adoptPoint){ 
		        	
		        }
		        else{
		           alert("포인트가 부족합니다 다시 확인해주세요.");
		        }    
		     }).fail(function(resp){
		        console.log("실패");
		     })
		})
		
	</script>
</body>
</html>