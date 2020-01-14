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
	<style>
   		*{spellcheck="false"}
        h1,h3{text-align: center;padding-top: 50px; padding-bottom: 50px;}
        ul{background-color: lightgray;font-size: 13px;}
        .card{ width:200px;height:300px;margin: auto; float :left;}
        .myprofile{float: left;height: 350px;margin-top: 20px;}
        #mycard{float:none;display:flex;align-items:center;}
        .commentwrite{width:100%; height:100px;padding: 0px;margin-top: 10px;float: left;}
        .commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
        .col{margin: 0px; padding: 0px;}
        .content{height:90%;float: left;resize: none;}
        .sendbt{height:90%;float: left;}
        #writer{text-underline-position: auto;margin-right: 30px;}
        .commentlist>div>div{margin-right: 5px;}
        #commentForm{height:100%;}
        textarea{resize:none;}
        .page-item{padding:0px;height:10px;width:10px;}
		.navi{text-align: center;}
		.nvlink1{height:45px;line-height:45px;font-size:14px;}
		.nvlink2{height:45px;line-height:45px;font-size:10px;}
    	a:hover{text-decoration:none;}
        .message{background-color:#efefef;margin:10px;width:100%;height:100%;border:0px;}
        .listwrap{border:1px solid gray;margin: 10px; padding:5px;}
    	.line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
    </style>
	<script>
	$(function(){
		$("#plogNavi").attr('class','nav-item nav-link active');
	});
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
            <div class="container">
				<h1 class="d-none d-sm-block"> Programming-Log</h1>
				<h3 class="d-sm-none"> Programming-Log</h3>
	            <div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
							<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink1 d-none d-sm-block"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
				<div class="row navi" style="background-color: #008EDC;">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a></div>
					<c:choose>
						<c:when test="${loginInfo.id ==ownerInfo.id }">
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a></div>
						</c:when>
					</c:choose>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a></div>
					<div class="col nvlink2 d-sm-none"><a class="text-light" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a></div>
				</div>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/img/profileSample.jpg" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;"><!-- 아이디에대한 이미지값 -->
	                        <div class="card-body">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
	                            <p class="card-text" style="text-align: center;font-size:15px;">point : ${ownerInfo.point }</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 commentwrap">
	
	
	                    <div class="commentwrite">
	                    	<form action="${pageContext.request.contextPath}/GuestBook/insert.do" method="post" id="commentForm">
		                        <div class="row"></div>
<%-- 		                        <input type="hidden" name="owner" value="${sessionScope.loginInfo}">  --%>
		                        <textarea class="col-10 content" placeholder="내용을 입력해주세요" name="content"></textarea>
		                        <button class="col-2 sendbt">작성</button>
	                    	</form>	
	                    </div>
	                    <div class="commentlist row" style="float: left">
	                    
	                    	<c:forEach items="${list}"  var="dto">
	                    		<div class="listwrap col-12">
			                		<div class="row" style="margin:5px;">
			                            <div>작성자 : </div>
			                            <div class="writer${dto.seq}" style="margin-right:30px;"> ${dto.writer }</div>
			                            <div>작성일 :</div>
			                            <div id="writeDate"> ${dto.getDate()}</div>
			                        </div>
			                        <div class="row">
			                            <textarea id="list${dto.seq }" class="message" onkeydown="resize(this)" onkeyup="resize(this)" readonly>${dto.content }</textarea>
			                        </div>
			                        <c:choose>
										<c:when test="${dto.writer == loginInfo.nickName}">
											<div style="text-align:right">
												<c:choose>
													<c:when test = "${dto.writerID == loginInfo.id || dto.ownerID == loginInfo.id }">
							                        	<button id="update${dto.seq}" onclick="update(${dto.seq})" style="visibility:hidden;">수정완료</button>
							                        	<button id="toModify${dto.seq }" onclick="modify(${dto.seq})">수정하기</button>
													</c:when>
												</c:choose>
					                        	<button id="delete" onclick="location.href='${pageContext.request.contextPath}/GuestBook/delete.do?seq=${dto.seq}&cpage=${cpage}'">삭제하기</button>
					                        </div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
							 <div class="naviwrap col-12"style="width:100%;text-align:center;">
			                    <c:forEach items="${pageNavi}" var="navi">									
									${navi}
								</c:forEach>
	               			</div>
	                    </div>
	                   
	                </div>
	            </div>
            </div>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script>
        	function update(seq){
        		var content = $('#list'+seq).val();
        		$.ajax({
        			url: "${pageContext.request.contextPath}/GuestBook/update.do",
	  				type: "POST",
	  				data: {
	  					content : content,
	  					seq : seq
	  				},
        		}).done(function(){
            		$('#list'+seq).prop('readonly', true);
            		$('#list'+seq).attr('style','background-color:#efefef');
            		$('#update'+seq).attr('style','visibility:hidden');
            		$('#toModify'+seq).attr('style','visibility:visible');
            		var resizeList = document.getElementsByClassName("message");
            		for(var i=0 ; i<resizeList.length;i++){
            			resize(resizeList[i]);
            		}
        		}).fail(function(){
        			alert("실패하였습니다.");
        		})
        		
        	}
        
        	function modify(seq){
        		$('#list'+seq).prop('readonly', false);
        		$('#list'+seq).attr('style','background-color:white');
        		$('#update'+seq).attr('style','visibility:visible');
        		$('#toModify'+seq).attr('style','visibility:hidden');
        		var resizeList = document.getElementsByClassName("message");
        		for(var i=0 ; i<resizeList.length;i++){
        			resize(resizeList[i]);
        		}
        		var focustext = document.getElementById('list'+seq);
        		focustext.focus();
        		focustext.setSelectionRange(focustext.value.length,focustext.value.length);
        	}
        	$(function(){
        		var resizeList = document.getElementsByClassName("message");
        		for(var i=0 ; i<resizeList.length;i++){
        			resize(resizeList[i]);
        		}
        	})
       		function resize(obj) {
        	  obj.style.height = "1px";
        	  obj.style.height = (12+obj.scrollHeight)+"px";
        	}
        </script>
</body>
</html>
