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
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
<script src="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/examples/assets/app.css">
<link rel="stylesheet" href="/css/project/applyDetailView.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
</head>
<body>
	
 		<div id=baseBackgroundColor>
            <div class=container style="height:20px;">
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <div class="container" id="projectPage">
				<div id="pageTitle">
					<h2>프로젝트 신청 상세</h2>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${aPage.seq !=null }">
						<div id="pBody">
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">신청 프로젝트</div>
								<div class="col-md-8 col-lg-9" onclick="popUp('/project/detailView?seq=${aPage.projectSeq }')" id="openProject" style="height:22px;">
									<span style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;" class="ml-0">${aPage.title } </span>
									<i class="fa fa-external-link"></i></div>																
								</div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">신청자</div>
								<div class="col-md-8 col-lg-9">${aPage.writer }</div>
							</div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3  dLabel">사용 가능 언어</div>
								<div class="col-md-8 col-lg-9" style="word-break:break-all;word-break:break-word;">${aPage.languages }</div></div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">성별</div>
								<div class="col-md-8 col-lg-9">${aPage.genderInKor }</div>
							</div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">나이</div>
								<div class="col-md-8 col-lg-9">${aPage.formedAge }</div>
							</div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">재직여부</div>
								<div class="col-md-8 col-lg-9">${aPage.workInInKor }</div>
							</div>
							<div class="row pl-3 mb-3">
								<div class="col-md-4 col-lg-3 dLabel">포트폴리오 공개여부</div>
								<div class="col-md-8 col-lg-9">${aPage.portfolioInKor }								
								<c:if test="${aPage.portfolio=='Y' }">
									<span onclick="pLogPopUp('/Portfolio/toPlog.do?owner=${aPage.id}&other=Y')" class="badge badge-info" id="openPortfolio" style="cursor:pointer;">열람하기</span>
								</c:if>
								</div>
							</div>							
							<div class="row pl-3 mb-2">
								<div class="col-12 dLabel">하고싶은 말</div>
							</div>
							<div class="row pl-3 pr-3">
								<div id="pPageContents" class="col-11 rounded ml-3" style="word-break:break-all;word-break:break-word;">${aPage.etc }</div>
							</div>	
							
							
							
							<div class="text-center checkBtn mt-4">
							
								<c:choose>
									<c:when test="${aPage.approve == 'O' }">
										<span style="font-weight:bold;">신청 <span style="color:limegreen;font-weight:bold;">승인</span>되었습니다.</span>
									</c:when>
									<c:when test="${aPage.approve == 'X' }">
										<span style="font-weight:bold;">신청 <span style="color:red;font-weight:bold;">거절</span>되었습니다.</span>
									</c:when>
									<c:when test="${aPage.approve == 'W' }">
										<c:choose>
											<c:when test="${aPage.leaderId == sessionScope.loginInfo.id }">										
												<div id="approveProcBtns">
													<button type="button" class="btn btn-success" id="approveBtn">승인</button>								
													<button type="button" class="btn btn-secondary" id="denialBtn">거절</button>
												</div>											
											</c:when>
											<c:when test="${aPage.id == sessionScope.loginInfo.id }">												
												<p style="font-weight:bold;">신청 후 <span style="color:orange;font-weight:bold;">승인 대기중</span>입니다.</p>
												<button type="button" class="btn btn-warning" id="applyCancelBtn">신청취소</button>
											</c:when>
										</c:choose>
									</c:when>															
								</c:choose>
													
							</div>
						</div>	
						<input type=hidden id="applySeq" value="${aPage.seq}">					
					</c:if>
				</div>
				
				<div id="pageFooter">
					<span class="float-right">
						<c:if test="${aPage.leaderId == sessionScope.loginInfo.id }">
							<a class="btn btn-secondary" href="/project/apply/list?projectSeq=${aPage.projectSeq}" role="button">목록</a>
						</c:if>
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
		<jsp:include page="/WEB-INF/views/project/jsp/denialModal.jsp"/>
        <script src="/js/project/applyDetail.js"></script>
        <script>
// 			function popUp(link){
// 				window.open(link, "applyPopUp", "width=1000,height=750");
// 			}
// 			function pLogPopUp(link){
// 				window.open(link, "pLogPopUp", "width=800,height=600");
// 			}			
// 	        $("#applyCancelBtn").on("click",function(){
// 	        	var check = confirm("신청을 취소하시겠습니까?");
// 	        	if(check){
// 	        		$.ajax({
// 	        			type:"post",
// 	        			url:"/project/apply/deleteProc",
// 	        			data:{seq:"${aPage.seq}"}
// 	        		}).done(function(resp){
// 	        			alert("신청이 취소되었습니다.");
// 						window.opener.document.location.href = window.opener.document.URL;  
// 						window.close();
// 	        		}).fail(function(resp){
	        			
// 	        		});
// 	        	}
// 	        });
	        
//         	$("#approveBtn").on("click",function(){
//         		var check = confirm("승인 하시겠습니까?");
//         		if(check){
//         			$.ajax({
//         				type:"post",
//         				url:"/project/apply/approveApply",
//         				data:{seq:"${aPage.seq}"}
//         			}).done(function(resp){
//         				$("#pApproveModal").modal('show');
//         				$("#approveProcBtns").remove();
//         				$(".checkBtn").append('<span style="font-weight:bold;">신청 <span style="color:limegreen;font-weight:bold;">승인</span>되었습니다.</span>');
//         				window.opener.document.location.href = window.opener.document.URL;
//         			}).fail(function(resp){
//     					alert("신청 실패!");
//         			});
//         		}        		
//         	});
        	
//         	$("#denialBtn").on("click",function(){
//         		var check = confirm("승인 거절 하시겠습니까?");
//         		if(check){
//         			$.ajax({
//         				type:"post",
//         				url:"/project/apply/denyApply",
//         				data:{seq:"${aPage.seq}"}
//         			}).done(function(resp){
//         				$("#pDenialModal").modal('show');
//     					$("#approveProcBtns").remove();
//         				$(".checkBtn").append('<span style="font-weight:bold;">신청 <span style="color:red;font-weight:bold;">거절</span>되었습니다.</span>');
//         				window.opener.document.location.href = window.opener.document.URL;
//         			}).fail(function(resp){
//     					alert("신청 실패!");
//         			});
//         		}        		
//         	});
        
        </script>
</body>
</html>