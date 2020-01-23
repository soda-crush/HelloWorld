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
<style>
#pInfo > div:nth-child(4) > div.col-md-7 > div > span > input.tt-input{max-width:620px;}
#applyFrm > div.modal-body > div:nth-child(1) > div.col-7.pApplyInput > div > span > input.tt-input{max-width:250px;}
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
					<h1>프로젝트 모집</h1>
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
						
							<div class="text-center checkBtn">
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
											<div class="col-1 text-right pt-1"><span>┗</span></div>
										</c:if>
										<div class="col-${12-c.depth } commentInnerBox pb-0">
										<c:if test="${c.id==sessionScope.loginInfo.id }">
											<input type="hidden" class="myCommentBox">
										</c:if>
											<c:choose>
												<c:when test="${c.contents!=null }">
													<div class="row commentHeader">
														<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="${c.profileImg }" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
														<div class="col-7 col-lg-6 pt-1">
															<div class="row commentInfo pl-2">
																<div class="col-12 commentWriter"><span style="font-weight:bold;cursor:pointer;" onclick="popUp('/Portfolio/toPlog.do?owner=${c.id}&other=Y')">${c.writer }</span></div>
																<div class="col-12 commentWriteDate">
																	<span>${c.formedWriteDate }</span>
																	<c:if test="${c.changeDate!=null }">
																		<span style="margin-left: 10px;">(수정일 : ${c.formedChangeDate })</span>
																	</c:if>
																</div>
															</div>
														</div>				
														<div class="col-5 pt-2 text-right commentBtns">
															<c:if test="${c.depth==0 }">
																<a class="btn btn-warning coReplyBtn" href="#" onclick="coReplyFunction(${c.seq});return false;" role="button">답글</a>
															</c:if>													
															<c:if test="${c.id==sessionScope.loginInfo.id }">
																<a class="btn btn-info coModBtn" href="#" onclick="coModFunction(${c.seq});return false;" role="button">수정</a>
																<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a>
															</c:if>
														</div>								
													</div>
													<div class="row commentContent">
														<div class="col-12 pt-1 pl-4" style="word-break:break-all;word-break:break-word;">${c.contents }</div>
														<input type="hidden" value="${c.modComment }" id="hiddenModCo${c.seq }">														
													</div>
												</c:when>
												<c:otherwise>
													<span class="row align-middle m-2 mt-2">삭제된 댓글입니다.<span class="delCoDate" style="margin-left: 10px;color:darkgray;">(삭제일 : ${c.formedChangeDate })</span></span>
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
		
		<script>
		$(".myCommentBox").closest(".commentInnerBox").css("background-color","#e8f1ff");
		function popUp(link){
			window.open(link, "pLogPopUp", "width=800,height=600");
		}
		$("#pReportBtn").on("click",function(){
			var check = "해당 게시물을 신고하시겠습니까?";
			if(check){
				$.ajax({
					url:"/project/reportDuplCheck",
					type:"post",
					data:{seq : $("#pageSeq").val()}
				}).done(function(resp){
					if(resp == 'dupl'){
						alert("해당 게시물을 이미 신고하셨습니다.");
					}else if(resp == 'possible'){
						$('#reportModal').modal('show');						
					}
				}).fail(function(resp){
				});
				return false;
			}
		});

		$("#reportFrm").on("submit",function(){
			$("#reportReasonInput").val($.trim($("#reportReasonInput").val()));
			if($("#reportReasonInput").val()==""){
				alert("신고사유를 작성해주세요.");
				return false;
			}
			$.ajax({
				url:"/project/report",
				type:"post",				
				data:$("#reportFrm").serialize()
			}).done(function(resp){
				$("#reportReasonInput").val("");
				$('#reportModal').modal('hide');
				$("#rSuccessModal").modal('show');				
			}).fail(function(resp){
			});
			return false;
		});
		
		$("#reportCancelBtn").on("click",function(){
			$("#reportReasonInput").val("");
		});
		function coReplyFunction(seq){
			if($("#pCoReplyInput").length>0){
				alert("현재 열려있는 답글 입력창이 있습니다.");
				$("#pCoReplyInput textarea").focus();
				return false;
			}
			var html = [];
			html.push(
					'<div id="pCoReplyInput" class="row commentDiv commentBox p-0 pb-2">',
					'<div class="col-1 text-right pt-1"><span>┗</span></div>',
					'<div class="col-11 commentInnerBox pb-0">',
					'<div class="row mt-2">',
					'<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="답글 내용을 입력해주세요" id="pCoReplyContents" name="contents" maxlength="1300"></textarea></div>',
					'<div class="col-3 col-lg-2">',
					'<div class="row">',
					'<div class="col-12">',
					'<button type="button" class="btn btn-secondary" style="margin-bottom:10px;margin-top:10px;" id="coReplyCancel">취소</button>',
					'</div>',										
					'</div>',
					'<div class="row">',
					'<div class="col-12"><input type="hidden" name="projectSeq" value="'+$("#pageSeq").val()+'"><input type="hidden" name="parentSeq" value='+seq+'>',
					'<button type="button" class="btn btn-warning" id="coReplyWriteBtn">작성</button>',
					'</div>',										
					'</div>',								
				    '</div>',
				    '</div>',
				    '</div>',
					'</div>'
			);
			if($('.commentBox'+seq).nextAll('.coLevel0:first').length==0){
				$('.commentBox'+seq).after(html.join(""));
			}else{
				$('.commentBox'+seq).nextAll('.coLevel0:first').before(html.join(""));	
			}
			$("#pCoReplyInput").wrap('<form method="post" id="coReplyWriteFrm"></form>');
			$("#pCoReplyContents").focus();
		}//답댓기능.
		$(document).on("click","#coReplyCancel",function(){
			var check = confirm("답글 작성을 취소하시겠습니까?");
			if(check){
				$("#pCoReplyInput").unwrap();
				$("#pCoReplyInput").remove();	
			}
		});
		$(document).on("click","#coReplyWriteBtn",function(){
			$("#pCoReplyContents").val($.trim($("#pCoReplyContents").val()));
			if($("#pCoReplyContents").val()==""){
				alert("답글 내용을 입력해주세요.");
				return false;
			}
			$.ajax({
				url: "/project/comment/replyWriteProc",
				type: "post",
				data: $("#coReplyWriteFrm").serialize(),
				dataType: "json"
			}).done(function(resp){
				$(".pPageComments").html("");
				commentRecall(resp);
			}).fail(function(resp){
			});
		});
		$(document).on("click","#scrapNull",function(){
			$.ajax({
				url : "/project/scrap",
				type : "post",
				data : {
					categorySeq : $("#pageSeq").val()
				}
			}).done(function(resp){
				alert("스크랩되었습니다.");
				$("#scrapNull").replaceWith('<i class="fa fa-bookmark" id="scrapDone" data-toggle="tooltip" title="스크랩"></i>');
			}).fail(function(resp){
			});
		});
		$(document).on("click","#scrapDone",function(){
			$.ajax({
				url : "/project/unScrap",
				type : "post",
				data : {
					categorySeq : $("#pageSeq").val()
				}
			}).done(function(resp){
				alert("스크랩이 취소되었습니다.");
				$("#scrapDone").replaceWith('<i class="fa fa-bookmark-o" id="scrapNull" data-toggle="tooltip" title="스크랩"></i>');
			}).fail(function(resp){
			});
		});
		$("#applyCheckBtn").on("click",function(){
			window.open("/project/apply/list?projectSeq="+$("#pageSeq").val(), "applyListPopUp", "width=1000,height=750,scrollbars=no, resizable=no, toolbars=no, menubar=no");
		});
		
		$("#pCloseBtn").on("click",function(){
			var check = confirm("프로젝트 모집을 마감하시겠습니까?\n마감된 모집글은 상태를 변경할 수 없습니다.");
			if(check){
				location.href="/project/closeProject?seq="+$("#pageSeq").val();
			}
		});
		var applyCount = $("#applyCount").val();
		$("#pModBtn").on("click",function(){
			var check = ${checkApplyCount};
			if(check>0){
				alert("신청 대기중 또는 신청 승인된 회원이 있는 모집글은\n수정이 불가합니다");
				return false;
			}else{
				location.href="/project/modify?seq="+$("#pageSeq").val();
			}
		});
       	$("#pDelBtn").on("click",function(){
       		var check = ${checkApplyCount};
       		if(check>0){
       			var check = confirm("신청 대기중 또는 신청 승인된 회원이 있습니다\n정말 삭제하시겠습니까?");
       			if(check){
       				location.href="/project/deleteProc?seq="+$("#pageSeq").val();
       			}
       		}else{
       			var check = confirm("정말 삭제하시겠습니까?");
           		if(check){           			
           			location.href="/project/deleteProc?seq="+$("#pageSeq").val();
           		}	
       		}           		
       	});
           	
		function coModFunction(seq){  
			if($("#pCoModContents").length>0){
   				alert("현재 열려있는 댓글 수정창이 있습니다.");
   				$("#pCoModContents").focus();
   				return false;
   			}
			var checkContents = $("#hiddenModCo"+seq).val().replace(/modF'Fdom/gi,'"');
			$(".commentBox"+seq).find(".commentBtns").css("display","none");
			$(".commentBox"+seq).find(".commentContent").css("display","none");
          		$(".commentBox"+seq).wrap('<form action="/project/comment/modifyProc" method="post" id="coModFrm"></form>');
			var html = [];	
   			html.push(
   					'<div class="row coModBox mt-2 mb-2"><div class="col-12"><div class="row">',
   					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="contents" maxlength="1300">'+checkContents+'</textarea></div>',
   					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="projectSeq" value="'+$("#pageSeq").val()+'">',
   					'<div class="row">',
   					'<div class="col-12 text-center p-0">',
   					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
   					'</div></div>',
   					'<div class="row"><div class="col-12 text-center p-0">',
   					'<button type="button" class="btn btn-warning" style="width:80%;" id="coMoConfirmBtn">수정</button>',
   					'</div></div></div></div></div></div>'
   			);
   			$(".commentBox"+seq).find(".commentHeader").after(html.join(""));  
		}
           	
       	$(document).on("click","#coMoCancel",function(){
       		var check = confirm("수정을 취소하시겠습니까?");
       		if(check){
       			$(this).closest(".commentDiv").unwrap();
       			$(this).closest(".commentDiv").find(".commentInnerBox").find(".commentHeader").find(".commentBtns").show();
       			$(this).closest(".commentDiv").find(".commentInnerBox").find(".commentContent").show();           			
       			$(this).closest(".coModBox").remove();           			
       		}
       	});
           	
        $(document).on("click","#coMoConfirmBtn",function(){
			$("#pCoModContents").val($.trim($("#pCoModContents").val()));
			if($("#pCoModContents").val()==""){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
				
			$.ajax({
				url : "/project/comment/modifyProc",
				type : "post",
				dataType : "json",
				data : $("#coModFrm").serialize()
			}).done(function(resp){
				$(".pPageComments").html("");
				commentRecall(resp);
			}).fail(function(resp){
			});
		});
           	
           	
		function coDelFunction(seq){
			var check = confirm("정말 삭제하시겠습니까?");
           	if(check){
           		$.ajax({
           			url : "/project/comment/deleteProc",
           			type : "post",
           			dataType : "json",
           			data :{
           				seq:seq,
           				projectSeq : $("#pageSeq").val()
       				}
           		}).done(function(resp){
    				$(".pPageComments").html("");
    				commentRecall(resp);
        		}).fail(function(resp){
       			});
           	}
		}
		$("#coCancel").on("click",function(){
			var check = confirm("정말 취소하시겠습니까?");
			if(check){
				$("#pCoContents").val("");
			}
		});
		$("#coWriteBtn").on("click",function(){
			$("#pCoContents").val($.trim($("#pCoContents").val()));
			if($("#pCoContents").val()==""){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}				
			$.ajax({
				url : "/project/comment/writeProc",
				type : "post",
				dataType : "json",
				data :{
					projectSeq : $("#pageSeq").val(),
					contents : $("#pCoContents").val(),						
				}
			}).done(function(resp){
				$("#pCoContents").val("");
				$(".pPageComments").html("");					
				commentRecall(resp);
			}).fail(function(resp){
			});
		});
			
		var result = ${data};
		var data = JSON.stringify(result);			
		var task = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace("text"),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
			local: jQuery.parseJSON(data) //your can use json type
		});		
		task.initialize();		
		var elt = $("#languages");
		elt.tagsinput({
			itemValue: "value",
			itemText: "text",
			typeaheadjs: {
			  name: "task",
			  displayKey: "text",
			  source: task.ttAdapter()
			}
		});
			
		$("#applyProjectSeq").val($("#pageSeq").val());
		$("#leaderId").val($("#writerId").val());
		$("#applyFrm").on("keypress", function(e) {
	        if(e.keyCode == 13) {
	        	e.preventDefault();
	        }
	    });
		$("#applyFrm").on("submit",function(){
			var genderCheck = $("input:radio[name='gender']").is(":checked");
			var workInCheck = $("input:radio[name='workIn']").is(":checked");
			if($("#languages").val()==""|$("#age")==null|!genderCheck|!workInCheck){
				alert("필수 입력 항목을 확인해주세요");
				return false;
			}	
			if($("#email").val()!=""){
				var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/gm;
	            var data = $("#email").val();
	            var result = regex.exec(data);
	            if(result == null){			
					alert("올바른 이메일 형식이 아닙니다");				
					$("#email").focus();
					return false;
	            }					
			}
			$.ajax({
				type:"post",
				url:"/project/apply/writeProc",
				data:$("#applyFrm").serialize()
			}).done(function(resp){
				$('#pApplyConfirmModal').modal('show');
				$(".pApplyInput").children('input').val("");
				$(".pApplyInput").children('select').val("");
				$("#etc").val("");
				$(".bootstrap-tagsinput").children('.label-info').remove();					
				$('#pApplyModal').modal('hide');
			}).fail(function(resp){
				alert("신청 실패!");
			});
			return false;				
		});
		$("#applyCancelBtn").on("click",function(){
			$(".pApplyInput").children('input').val("");
			$(".pApplyInput").children('select').val("");
			$("#etc").val("");
			$("input.tt-input").val("");
			$(".bootstrap-tagsinput").children('.label-info').remove();				
		});
		
		$("#applyConfirmCheckBtn").on("click",function(){			
			$("#getApplyBtn").remove();
			$(".checkBtn").append('<p style="font-weight:bold;">신청 후 <span style="color:orange;font-weight:bold;">승인 대기중</span>입니다.</p>');
		});

		function commentRecall(resp){
			var loginInfo = $("#sessionId").val();
			for(var i=0;i<resp.length;i++){
				var html = [];
				html.push(							
						'<div class="row commentDiv commentBox'+resp[i].seq+' coLevel'+resp[i].depth+' p-0 pb-1">'
				);
				if(resp[i].depth==1){
					html.push(
						'<div class="col-1 text-right pt-1"><span>┗</span></div>'		
					);
				}
				if(resp[i].id==loginInfo){
					html.push(
							'<div class="col-'+(12-resp[i].depth)+' commentInnerBox pb-0" style="background-color:#f0f6ff;">'					
					);						
				}else{
					html.push(
							'<div class="col-'+(12-resp[i].depth)+' commentInnerBox pb-0">'					
					);							
				}
				if(resp[i].id==loginInfo){
					html.push(
						'<input type="hidden" class="myCommentBox">'		
					);					
				}
				if(resp[i].contents!=null){
					html.push(
							'<div class="row commentHeader">',
							'<div class="col-lg-1 d-none d-lg-block profileBox pl-1 pt-2 pr-0"><img src="'+resp[i].profileImg+'" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
							'<div class="col-7 col-lg-6 pt-1">',
							'<div class="row commentInfo pl-2">',
							'<div class="col-12 commentWriter"><span style="font-weight:bold;cursor:pointer;" onclick="popUp(\'/Portfolio/toPlog.do?owner='+resp[i].id+'&other=Y\')">'+resp[i].writer+'</span></div>',
							'<div class="col-12 commentWriteDate">',
							'<span>'+resp[i].formedWriteDate+'</span>'
					);
					if(resp[i].changeDate!=null){
						html.push(
								'<span style="margin-left: 10px;">(수정일 : '+resp[i].formedChangeDate+')</span>'
						);
					}
					html.push(
							'</div></div></div>',
							'<div class="col-5 pt-2 text-right commentBtns">'
					);
					if(resp[i].depth==0){
						html.push(
								'<a class="btn btn-warning coReplyBtn" href="#" onclick="coReplyFunction('+resp[i].seq+');return false;" role="button">답글</a>\n'
						);
					}
					if(resp[i].id==loginInfo){
						html.push(									
								'<a class="btn btn-info coModBtn" href="#" onclick="coModFunction('+resp[i].seq+');return false;" role="button">수정</a>\n',									
								'<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'									
						);
					}
					html.push(							
						'</div></div>',
						'<div class="row commentContent">',
						'<div class="col-12 pt-1 pl-4" style="word-break:break-all;word-break:break-word;">'+resp[i].contents+'</div>',
						'<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'"></div>'
					);
				}else{
					html.push(								
							'<span class="row align-middle m-2 mt-2">삭제된 댓글입니다.<span class="delCoDate" style="margin-left: 10px;color:darkgray;">(삭제일 : '+resp[i].formedChangeDate+')</span></span>'
					);
				}
				html.push(
						'</div></div>'		
				);
				$(".pPageComments").append(html.join(""));	
			}
		}
		  
	</script>
</body>
</html>