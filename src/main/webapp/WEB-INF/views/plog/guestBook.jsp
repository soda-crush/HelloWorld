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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
       <style>
            h1{text-align: center;padding-top: 50px; padding-bottom: 50px;}
            ul{background-color: lightgray;font-size: 13px;}
            .card{ width:200px;height:300px;margin: auto;margin-top:10px; float :left;}
            .myprofile{float: left;height: 350px;}
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
            .naviwrap>div{width:25px;display:inline-block;text-align:center;}
            
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
            
            <div class="container">
				<h1> Programming-Log</h1>
	            <nav class="navbar navbar-expand-md navbar-light" style="background-color: #008EDC;">
		         	<a class="navbar-brand" href="#"></a>
		  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		   				 <span class="navbar-toggler-icon"></span>
		  			</button>
		            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		
		                <div class="navbar-nav box text-center plogNavi" id="naviCon">
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">내 포트폴리오</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">내 지식인</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogScrap.do">내 스크랩</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a>
		                    <a class="nav-item nav-link active text-light text-primary" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a>
		                </div>
		            </div>
		        </nav>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="/img/profileSample.jpg" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;"><!-- 아이디에대한 이미지값 -->
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3><!--  세션값 -->
	                            <p class="card-text" style="text-align: center;">point : 12,345</p><!--  세션에 대한 포인트값 -->
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 commentwrap">
	
	
	                    <div class="commentwrite">
	                    	<form action="${pageContext.request.contextPath}/GuestBook/insert.do" method="post" id="commentForm">
		                        <div class="row"></div>
		                        <input type="hidden" name="owner" value="${sessionScope.loginInfo}"> 
		                        <textarea class="col-10 content" placeholder="내용을 입력해주세요" name="content"></textarea>
		                        <button class="col-2 sendbt">작성</button>
	                    	</form>	
	                    </div>
	                    <div class="commentlist" style="float: left">
	                    
	                    	<c:forEach items="${list}"  var="dto">
		                		<div class="row" style="margin:5px;">
		                            <div>작성자 : </div>
		                            <div class="writer${dto.seq}"> ${dto.writer }</div>
		                            <div>작성일 :</div>
		                            <div id="writeDate"> ${dto.writeDate}</div>
		                        </div>
		                        <div class="row">
		                            <textarea id="list${dto.seq }" class="message" style="margin:10px;width:100%;height:100%" onkeydown="resize(this)" onkeyup="resize(this)" readonly>${dto.content }</textarea>
		                        </div>
		                        <div style="text-align:right">
		                        	<button id="update${dto.seq }" onclick="update(${dto.seq})" style="visibility:hidden;">수정완료</button>
		                        	<button id="toModify${dto.seq }" onclick="modify(${dto.seq})">수정하기</button>
		                        	<button id="delete" onclick="location.href='${pageContext.request.contextPath}/GuestBook/delete.do?seq=${dto.seq}'">삭제하기</button>
		                        </div>
							</c:forEach>
	                    </div>
	                    <div class="naviwrap"style="width:100%;float:left;text-align:center;">
		                    <c:forEach items="${pageNavi}" var="navi">									
								${navi}
							</c:forEach>
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
            		$('#update'+seq).attr('style','visibility:hidden');
            		$('#toModify'+seq).attr('style','visibility:visible');
        		}).fail(function(){
        			alert("실패하였습니다.");
        		})
        		
        	}
        
        	function modify(seq){
        		$('#list'+seq).prop('readonly', false);
        		$('#update'+seq).attr('style','visibility:visible');
        		$('#toModify'+seq).attr('style','visibility:hidden');
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
