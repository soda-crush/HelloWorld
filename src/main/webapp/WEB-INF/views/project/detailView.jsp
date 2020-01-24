<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/detailView.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');
      
		//카카오톡
	  function shareKakaotalk() {
	      Kakao.init("17c512cbe4e17a204cce3c9b7d64d274"); // 사용할 앱의 JavaScript 키를 설정		  
	      Kakao.Link.sendDefault({
	         objectType : "feed",
	         content : {
	            title : "${pPage.kakaoTitle}", // 콘텐츠의 타이틀 
	            description : "프로젝트 모집", // 콘텐츠 상세설명
	            imageUrl : "https://miro.medium.com/max/3840/1*U-R58ahr5dtAvtSLGK2wXg.png", // 썸네일 이미지          
	            link : {
	               mobileWebUrl : "http://${ip}/project/detailView?page=${page}&seq=${pPage.seq }", // 모바일 카카오톡에서 사용하는 웹 링크 URL		            		   
	               webUrl : "http://${ip}/project/detailView?page=${page}&seq=${pPage.seq }" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	            }
	         },
	         social : {
	            likeCount : 0 // LIKE 개수
	            ,
	            commentCount : 0 // 댓글 개수
	            ,
	            sharedCount : 0
	         // 공유 회수
	         },
	         buttons : [ {
	            title : "링크 이동하기" // 버튼 제목
	            ,
	            link : {
	               mobileWebUrl : "http://${ip}/project/detailView?page=${page}&seq=${pPage.seq }",  // 모바일 카카오톡에서 사용하는 웹 링크 URL
	               webUrl : "http://${ip}/project/detailView?page=${page}&seq=${pPage.seq }" // PC버전 카카오톡에서 사용하는 웹 링크 URL
	            }
	         } ]
	      });
	   }
		
	  $("#kakaoSharing").on("click",shareKakaotalk);
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
            
            <!--      몸통 시작!!!   -->
            <div class=container id="projectPage">
				<div id="pageTitle">
					<h1>프로젝트 모집글 상세보기</h1>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${pPage==null }">
						<script>
							alert("삭제되었거나 존재하지 않는 글입니다");
							location.href="/project/list?page=${page}";
						</script>
					</c:if>
					<c:if test="${pPage.seq !=null }">
						<div id="pHeader">
							<label class="${pPage.state } badge badge-pill ml-4" id="stateLabel">${pPage.stateInKor }</label>
							<label class="mb-0">
							<i class="fa fa-share-alt" id="kakaoSharing" data-toggle="tooltip" title="카카오톡 공유하기"></i>
							<c:choose>
								<c:when test="${scrap=='impossible' }">
									<i class="fa fa-bookmark" id="scrapDone" data-toggle="tooltip" title="스크랩"></i>									
								</c:when>
								<c:otherwise>
									<i class="fa fa-bookmark-o" id="scrapNull" data-toggle="tooltip" title="스크랩"></i>									
								</c:otherwise>
							</c:choose>
							</label>
							<br>
							<div class="ml-4 mr-3 mb-3 mt-2" style="font-weight:bold;font-size:20px;display:inline-block;word-break:break-all;word-break:break-word;">${pPage.title}</div><br>
							<label class="ml-4 mb-0" onclick="popUp('/Portfolio/toPlog.do?owner=${pPage.id}&other=Y')" style="cursor:pointer;">
							<img src="${pPage.profileImg }" style="width:30px;height:30px;margin-right:7px;margin-bottom:5px;"><strong style="font-size:15px;">${pPage.writer }</strong></label>
							<label class="ml-4 mb-0">작성일 : ${pPage.formedWriteDate }</label>
							<label class="ml-4 mb-0">조회 : ${pPage.viewCount }</label>
						</div>
						<hr>
						<div id="pInfo">
							<div class="row"><div class="ml-4 col-4 col-md-3 col-lg-2 dLabel">지역</div><div class="col-7 col-xl-9">${pPage.location1 } ${pPage.location2 }</div></div>
							<div class="row"><div class="ml-4 col-4 col-md-3 col-lg-2 dLabel">모집인원</div><div class="col-7">${pPage.capacity }명</div></div>
							<div class="row"><div class="ml-4 col-4 col-md-3 col-lg-2 dLabel">프로젝트 기간</div><div class="col-7">${pPage.formedAllDate }</div></div>
							<div class="row"><div class="ml-4 col-4 col-md-3 col-lg-2 dLabel">사용언어</div><div class="col-7 col-xl-9" style="word-break:break-all;word-break:break-word;">${pPage.languages }</div></div>
						</div>
						<hr>
						<div id="pBody">						
							<div id="pPageContents" style="max-width:100%;word-break:break-all;word-break:break-word;">${pPage.contents }</div>							
							<div class="row"><div class="ml-4 col-3 col-md-2 col-xl-1 dLabel">연락처</div><div class="col-7">${pPage.phone }</div></div>
							<div class="row"><div class="ml-4 col-3 col-md-2 col-xl-1 dLabel">메일주소</div><div class="col-7">${pPage.email }</div></div>
						
							<div class="text-center checkBtn mt-3">
								<c:choose>
									<c:when test="${pPage.id == sessionScope.loginInfo.id}">										
											<c:choose>
												<c:when test="${pPage.state=='N' }">
													<button type="button" class="btn btn-warning" id="applyCheckBtn">신청현황
														<c:if test="${pPage.applyCount>0 }">
									  						<span class="pApply font-weight-bold">${pPage.applyCount }</span>
									  					</c:if>
													</button>										
													<button type="button" class="btn btn-success" id="pCloseBtn">모집마감처리</button>
												</c:when>
												<c:otherwise>
													<p style="font-weight:bold;"><span style="color:red;font-weight:bold;">모집마감</span>되었습니다.</p>
													<button type="button" class="btn btn-warning" id="applyCheckBtn">전체신청내역</button>
												</c:otherwise>
											</c:choose>										
									</c:when>
									<c:when test="${myApply==null }">
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pApplyModal" id="getApplyBtn">신청하기</button>
									</c:when>
									<c:when test="${myApply.id == sessionScope.loginInfo.id }">
										<c:choose>
											<c:when test="${myApply.approve eq 'W' }">
												<p style="font-weight:bold;">신청 후 <span style="color:orange;font-weight:bold;">승인 대기중</span>입니다.</p>
											</c:when>
											<c:when test="${myApply.approve eq 'O' }">
												<p style="font-weight:bold;">신청 <span style="color:limegreen;font-weight:bold;">승인</span>된 프로젝트입니다.</p>
											</c:when>
											<c:when test="${myApply.approve eq 'X' }">
												<p style="font-weight:bold;">신청 <span style="color:red;font-weight:bold;">거절</span>된 프로젝트입니다.</p>
											</c:when>
										</c:choose>
									</c:when>
								</c:choose>
							</div>
							
							 <div class="row align-items-center adBoxDiv">
							    <div class="col-12"><img src="/img/${adImg }"></div>
							 </div>
							
							<div class="pPageComments">
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									<div class="row commentDiv commentBox${c.seq } coLevel${c.depth } p-0 pb-1">
										<c:if test="${c.depth==1 }">
											<div class="col-1 text-right pt-1"><strong>┗</strong></div>
										</c:if>
										<div class="col-${12-c.depth } commentInnerBox pb-0">
										<c:if test="${c.id==sessionScope.loginInfo.id }">
											<input type="hidden" class="myCommentBox">
										</c:if>
											<c:choose>
												<c:when test="${c.contents!=null }">
													<div class="row commentHeader">
														<div class="col-md-1 d-none d-md-block profileBox pl-1 pt-2 pr-0"><img src="${c.profileImg }" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
														<div class="col-12 col-md-11 pt-1">
															<div class="row commentInfo1 pl-2" style="height:22px;">
																<div class="col-6 commentWriter p-0">
																	<span style="font-weight:bold;cursor:pointer;" onclick="popUp('/Portfolio/toPlog.do?owner=${c.id}&other=Y')">${c.writer }</span>
																</div>
																<div class="col-6 text-right commentBtns">
																	<c:if test="${c.depth==0 }">
																		<a style="height:90%;width:40px;font-size:14px;" class="btn btn-warning coReplyBtn align-middle" href="#" onclick="coReplyFunction(${c.seq});return false;" role="button">답글</a>
																	</c:if>													
																	<c:if test="${c.id==sessionScope.loginInfo.id }">
																		<a style="height:90%;width:40px;font-size:14px;" class="btn btn-info coModBtn" href="#" onclick="coModFunction(${c.seq});return false;" role="button">수정</a>
																		<a style="height:90%;width:40px;font-size:14px;" class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a>
																	</c:if>
																</div>				
															</div>
															<div class="row commentInfo2 pl-2 mt-0">
																<div class="col-12 p-0">
																	<span class="commentWriteDate pr-2" style="font-size:13px;">${c.formedWriteDate }</span>
																	<c:if test="${c.changeDate!=null }">																			
																		<span class="commentChangeDate" style="font-size:13px;">(수정일 : ${c.formedChangeDate })</span>
																	</c:if>
																</div>
															</div>
														</div>								
													</div>
													<div class="row commentContent">
														<div class="col-12 pt-1 pl-4" style="word-break:break-all;word-break:break-word;">${c.contents }</div>
														<input type="hidden" value="${c.modComment }" id="hiddenModCo${c.seq }">														
													</div>
												</c:when>
												<c:otherwise>
													<div class="row mt-2 mb-2">
														<div class="col-12">
															<span class="commentDelMessage pr-2" style="font-size:13px;">삭제된 댓글입니다.</span>
															<span class="commentDelDate" style="font-size:13px;">(삭제일 : ${c.formedChangeDate })</span>
														</div>
													</div>
												</c:otherwise>											
											</c:choose>
										</div>
									</div>								
								</c:forEach>
							</c:if>
							</div>
							
							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoContents" maxlength="1300"></textarea></div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-secondary" style="margin-bottom:10px;" id="coCancel">취소</button>
										</div>										
									</div>
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary" id="coWriteBtn">작성</button>
										</div>										
									</div>								
		        				</div>
							</div>
							<div>
								<input type="hidden" id="pageSeq" value="${pPage.seq }">
								<input type="hidden" id="sessionId" value="${sessionScope.loginInfo.id }">
								<input type="hidden" id="applyCount" value="${pPage.applyCount}">								
								<input type="hidden" id="writerId" value="${pPage.id }">
								<input type="hidden" id="checkApplyCount" value="${checkApplyCount}">
								<input type="hidden" id="tagData" value='${data}'>
								<input type="hidden" id="pageState" value="${pPage.state }">																
							</div>
						</div>
					</c:if>
				</div>
				
				<div id="pageFooter">
					<c:if test="${pPage.id != sessionScope.loginInfo.id}">
						<span><button type="button" class="btn btn-danger" id="pReportBtn">게시글 신고</button></span>
					</c:if>
					<span class="float-right">
						<c:if test="${pPage.id == sessionScope.loginInfo.id}">
							<button type="button" class="btn btn-info" id="pModBtn">수정</button>
							<button type="button" class="btn btn-danger" id="pDelBtn">삭제</button>
						</c:if>
						<a class="btn btn-secondary" href="/project/list" role="button">목록</a>
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
		              
        <jsp:include page="/WEB-INF/views/project/jsp/applyModal.jsp"/>        
		<jsp:include page="/WEB-INF/views/project/jsp/applyConfirmModal.jsp"/>
		<jsp:include page="/WEB-INF/views/project/jsp/reportModal.jsp"/>
		<jsp:include page="/WEB-INF/views/project/jsp/reportSuccessModal.jsp"/>
		<jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
		<script src="/js/project/detailView.js"></script>
</body>
</html>