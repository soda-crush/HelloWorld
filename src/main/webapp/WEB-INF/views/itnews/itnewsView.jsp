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
	#contentCon{
		min-height: 450px;
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


            <div class="container eleCon">
            	<div class=row>
            		<div class="col-12"><h3><br>${result.title}</h3></div>
            	</div>
            	<div class=row>
            		<div class="col-12"><hr>${result.writer}&emsp;${result.writeDate}&emsp;${result.viewCount}<hr></div>
            	</div>
            	<div class="row">
            		<div class="col-12" id=contentCon>${result.content}</div>
            	</div>
            	
            	<c:choose>
            	<c:when test="${loginInfo==result.writer}">
            	<div class="row">
            		<div class="col-12 text-center">
            			<button id=modify>수정</button><button id=remove>삭제</button>
            		</div>
            	</div>
            	</c:when>
            	</c:choose>
            	
            	<div class="row">
            		<div class="col-12" id=adver style="height:200px;background-color:green;color:white;">광고자리<br><br></div>
            	</div>
            	
            	<div class="row">
            		<div class="col-10">
            			<textarea style="width:100%;height:100%;" placeholder="댓글 입력" id="coContent"></textarea>
            		</div>
            		<div class="col-2">
            			<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-secondary" style="margin-bottom:10px;" id="coCancel">취소</button>
							</div>										
						</div>
						<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-primary" id="coWrite">작성</button>
							</div>										
						</div>					
            		</div>
            	</div>
            	
            	
            	<c:choose>
            		<c:when test="${list.size()==0}">
            			<div class="row">
            				<div class=col-12>
            					<h5>댓글이 없습니다.</h5>
            				</div>
            			</div>
            		</c:when>
            	</c:choose>
            	<c:otherwise>
            		<c:forEach items="${list}" var="dto">
            			<div class="row">
            				<div class=col-12>
            					${dto.content}
            				</div>
            			</div>
            		</c:forEach>
            	</c:otherwise>
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
        			//게시글
            		$("#remove").on("click",function(){
            			location.href="${pageContext.request.contextPath}/itnews/remove?seq=${result.seq}";
            		})
            		$("#modify").on("click",function(){
            			
            		})
            		
            		//댓글
            		$("#coCancel").on("click",function(){
            			$.ajax({
            				url:"${pageContext.request.contextPath}/itnews/coWrite",
            				data:{
            					content : $("#coContent").val(),
            					itSeq : ${result.seq}
            				},
            				dataType:"json",
            				type:"post"
            			}).done(function(){
            				console.log("성공");
            			});
            		})
        </script>
</body>
</html>
