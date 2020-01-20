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
						<div class="col-auto vertical-align:text-top p-0"><strong>공지사항</strong></div>
					</div>
					<script>
						$("#titleLink").on("click", function(){
							location.href="${pageContext.request.contextPath}/notice/noticeList";
						})
					</script>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
						<div id="pHeader" class="pl-2 pr-2">
							<div class="ml-4 titleWrap wordWrap" style="font-weight:bold;">${dto.title}</div>
							<label class="ml-4">${dto.formedDate}</label>
						</div>
						<hr>
						<div id="pBody">						
							<div id="pPageContents" class="wordWrap">${dto.content}</div>
						</div>
				</div>
				
				<div id="pageFooter">						
					<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/notice/noticeList" role="button">목록</a>
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
</body>
</html>
