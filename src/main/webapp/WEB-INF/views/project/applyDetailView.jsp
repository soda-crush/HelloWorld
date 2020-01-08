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
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
<script src="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/examples/assets/app.css">
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/applyDetailView.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<style>
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
				<div id="pageTitle">
					<h1>프로젝트 신청 상세보기</h1>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${aPage.seq !=null }">
						<div id="pBody">
							<div><label class="ml-4">신청 프로젝트</label>
								<a href="/project/detailView?seq=${aPage.projectSeq }" class="text-decoration-none" id="openProject" target="_blank">${aPage.title } <i class="fa fa-external-link"></i></a>								
							</div>
							<div><label class="ml-4">신청자</label><span>${aPage.writer }</span></div>
							<div><label class="ml-4">사용 가능 언어</label><span>${aPage.languages }</span></div>
							<div><label class="ml-4">성별</label><span>${aPage.genderInKor }</span></div>
							<div><label class="ml-4">나이</label><span>${aPage.formedAge }</span></div>
							<div><label class="ml-4">재직여부</label><span>${aPage.workInInKor }</span></div>
							<div><label class="ml-4">포트폴리오 열람 공개여부</label><span>${aPage.portfolioInKor }</span>
								<c:if test="${aPage.portfolio=='Y' }">
									<a href="#" class="badge badge-info" id="openPortfolio">열람하기</a>
								</c:if>
							</div>
							<div><label class="ml-4">하고싶은 말</label></div>
							<div id="pPageContents">${aPage.etc }</div>
							<div class="text-center checkBtn mt-4">
								<button type="button" class="btn btn-success" id="approveBtn">승인</button>								
								<button type="button" class="btn btn-secondary" id="denialBtn">거절</button>								
							</div>
						</div>						
					</c:if>
				</div>
				
				<div id="pageFooter">
					<c:if test="${pPage.writer != sessionScope.loginInfo}">
						<span><a class="btn btn-danger" href="#" role="button">게시글 신고</a></span>
					</c:if>
					<span class="float-right">
						<a class="btn btn-secondary" href="/project/applyCheck?projectSeq=${aPage.projectSeq}" role="button">목록</a>
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
        
		<jsp:include page="/WEB-INF/views/project/jsp/approveModal.jsp"/>    
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script>
        	$("#approveBtn").on("click",function(){
        		var check = confirm("승인 하시겠습니까?");
        		if(check){
        			$.ajax({
        				type:"post",
        				url:"/project/apply/approveApply",
        				data:{seq:"${aPage.seq}"}
        			}).done(function(resp){
        				console.log("성공");
    					console.log(resp);
        				$("#pApproveModal").modal('show');
        			}).fail(function(resp){
        				console.log("실패");
    					console.log(resp);
    					alert("신청 실패!");
        			});
        		}        		
        	});
        	
        	$("#denialBtn").on("click",function(){
        		var check = confirm("승인 거절 하시겠습니까?");
        		if(check){
        			$.ajax({
        				type:"post",
        				url:"/project/apply/denyApply",
        				data:{seq:"${aPage.seq}"}
        			}).done(function(resp){
        				console.log("성공");
    					console.log(resp);
        				//$("#pApproveModal").modal('show');
        			}).fail(function(resp){
        				console.log("실패");
    					console.log(resp);
    					alert("신청 실패!");
        			});
        		}        		
        	});
        
        </script>
</body>
</html>