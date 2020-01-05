<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
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
            <div class=container id="industryPage">
				<div id="pageTitle">
					<h1>업계현황</h1>
				</div>
				
            <c:if  test="${iPage.seq !=null }">
				  				<div>${iPage.seq}</div>
				  				<h3>${iPage.title}</h3>
				  				<div>익명</div>
				  				<div>${iPage.writeDate}</div>
				  				<div>${iPage.viewCount}</div>
				  				<div>${iPage.content}</div>
			</c:if>
				 <a class="btn btn-primary" href="/industry/industryStatusList.do" role="button">돌아가기</a>
				 <a class="btn btn-primary" href="#" role="button">공유하기</a>
				 <a class="btn btn-primary" href="#" role="button">스크랩</a>
				 <a class="btn btn-primary" href="#" role="button">신고하기</a>
            <div id="commentList">
            <c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									<div>익명</div><br>
									<div>${c.content }</div><br>
									<div>${c.writeDate }</div>
									<a class="btn btn-primary" href="/industry/comment/deleteProc.do?seq=${c.seq }&indSeq=${c.indSeq}" role="button">댓글 삭제</a>
								</c:forEach>
			</c:if>
           	</div>		
            <c:if test="${iPage.writer == sessionScope.loginInfo}">
							<a class="btn btn-primary" href="/industry/industryStatusDetailView.do?seq=${iPage.seq }" role="button">수정하기</a>
							<a class="btn btn-primary" href="#" role="button">삭제하기</a>
						</c:if>
						<br>
						
						<input type="text" id="content" placeholder="댓글을 입력해주세요">
						<input type="button" id="commentWrite" value="등록">
						
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
        	$("#commentWrite").on("click",function(){
        		$.ajax({
					url:"/industry/comment/writeProc.do",
					type:"post",
					data:{
						content : $("#content").val(),
						indSeq: ${iPage.seq},
						writer: "${sessionScope.loginInfo}"
					},
					dataType:"json"
				}).done(function(data){
					console.log(data);
					$("#commentList").append("<div>" + data.writer + "</div><br>" + "<div>" + data.content + "</div><br>" + "<div>" + data.writeDate + "</div><br><a class=\"btn btn-primary\" href=/industry/comment/deleteProc.do?indSeq="+data.indSeq+"&seq="+data.seq+" role=\"button\">댓글 삭제</a>");
					$("#content").val("");
				});
        	})
        </script>
</body>
</html>