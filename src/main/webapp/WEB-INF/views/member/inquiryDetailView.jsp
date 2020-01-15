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
<link rel="stylesheet" href="/css/project/detailView.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>

#pPageContents img{max-width:100%;}
	#titleLink:hover{
		cursor:pointer;
		color:gray;
	}
	#titleLink strong{
		font-size:25px;
	}
	.wordWrap{
		word-break:break-all;
		word-break:break-word;		
	}
	.titleWrap{
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
				<div class="border border-secondary rounded" id="pageBody">
						<div id="pHeader" class="pl-2 pr-2">
							<div class="ml-4 titleWrap wordWrap" style="font-weight:bold;">${dto.title}</div>
							<label class="ml-4">작성일 : ${dto.formedDate}</label>
						</div>
						<hr>
						<div id="pBody">
						
							<div id="pPageContents" class="wordWrap">${dto.content}</div>
							
							<div class="pPageComments">
							<c:if test="${list.size()>0 }">
								<c:forEach items="${list}" var="list">
									<div class="row commentDiv commentBox${list.seq} p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">								
												<div class="col-7 pt-1">
													<div class="row commentInfo">
														<div class="col-12 commentWriter">관리자</div>
														<div class="col-12 commentWriteDate">${list.formedDate}</div>
													</div>
												</div>											
											</div>											
											<div class="row commentContent">
												<div class="col-12 pt-1 pl-4">${list.reply}</div>
											</div>
										</div>
									</div>								
								</c:forEach>
							</c:if>
							</div>
						</div>
				</div>
				
				<div id="pageFooter">
					<span class="float-right">
						<c:if test="${list.size() == 0}">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-outline-primary" id="modify">수정</button>
                                    <button type="button" class="btn btn-outline-primary" id="delete">삭제</button>
                                </div>
						</c:if>
						<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/member1/myInquiry?page=${page}" role="button">목록</a>
					</span>
				</div>          
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
        	$("#modify").on("click", function(){
        		location.href="${pageContext.request.contextPath}/member1/modifyForm?page=${page}&seq=${dto.seq}";
        	})
        	$("#delete").on("click", function(){
        		var result = confirm("이 문의글을 삭제하시겠습니까?")
        		if(result){
        			location.href="${pageContext.request.contextPath}/member1/deleteInquiry?page${page}&seq=${dto.seq}";
        		}
        	})
        </script>
</body>
</html>
