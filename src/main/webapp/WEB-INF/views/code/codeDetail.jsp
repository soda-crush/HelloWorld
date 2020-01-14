<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/adRsc/css/themify-icons.css">
	
<script>
   $(function(){
      $("#codeNavi").attr('class','nav-item nav-link active');
   });
</script>

<!-- 카톡공유 -->
<script type="text/JavaScript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function shareKakaotalk() {
		Kakao.init("7fce3c86f0e6aeeac11028850040589c"); // 사용할 앱의 JavaScript 키를 설정
		Kakao.Link.sendDefault({
			objectType : "feed",
			content : {
				title : "${qResult.title}", // 콘텐츠의 타이틀
				description : "${qResult.content}", // 콘텐츠 상세설명
				imageUrl : "/img/kakao.png", // 썸네일 이미지 			
				link : {
					mobileWebUrl : "http://www.naver.com/", // 모바일 카카오톡에서 사용하는 웹 링크 URL				
					webUrl : "http://www.naver.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
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
					mobileWebUrl : "http://www.naver.com/" // 모바일 카카오톡에서 사용하는 웹 링크 URL
					,
					webUrl : "http://www.naver.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
				}
			} ]
		});
	}
	
</script>
<!-- . -->

<style>
.contentDiv {
	/* 한 줄 자르기 */
	display: block;
	text-align: left;
	width: 800px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* 여러 줄 자르기 추가 스타일 */
	white-space: normal;
}

.topQ {
	display: block;
	text-align: left;
}

.botD {
	/* 	margin-right: 550px; */
	display: block;
	text-align: left;
}

.btnDIv2 {
	margin: 20px;
	padding: 20px;
}

#pageTitle {
	margin-bottom: 20px;
}

#pageTitle h1 {
	display: inline;
	margin-right: 10px;
	font-weight: bold;
}

#pageBody {
	background-color: white;
}

#pHeader, #pageFooter {
	padding-top: 10px;
}

#pHeader #stateLabel {
	color: white;
}

#pHeader label.N {
	background-color: limegreen;
}

#pHeader label.Y {
	background-color: red;
}

#pHeader span:first-of-type {
	font-size: 20px;
}

#pHeader label:nth-of-type(2) {
	width: 200px;
}

#pInfo *, #pBody * {
	font-size: 15px;
}

#pInfo label, #pBody label {
	width: 100px;
	color: darkgray;
}

#baseBackgroundColor {
	margin: auto;
	text-align: center;
}

#btnDIv {
	margin: 20px;
}

span:nth-child(1) {
	font-size: 60px;
	font-weight: 100;
}

span:nth-child(4) {
	font-size: 50px;
	font-weight: 100;
}

.contentDivBot {
	text-align: left;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor style="text-align: left;">
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class=container id="projectPage" style="background-color: white;">
			<!-- 			<div id="pageTitle"> -->
			<div class="topQ">
				<span>Q</span> <span class="badge badge-pill badge-danger">${qResult.point}</span>
				<span class="badge badge-pill badge-success"
					style="margin: 10; padding: 10; width: 60px;">${qResult.division}</span>
				<span>${qResult.title}</span>
			</div>
			<br>
			<div>
				<div class="contentDiv">${qResult.content}</div>
				<br>
				<div class="botD">
					<img src="/icon/Cicon.svg"> 
					<span style="cursor:pointer" onclick="popUp('${qResult.id}','${qResult.writer}')">${qResult.writer}</span>				
					${qResult.formedDate} 조회수${qResult.viewCount}
				</div>
				<br>

				<c:choose>
					<c:when test="${sessionScope.loginInfo.id==null }">
						<div style="text-align: right;" class="btnDIv">
							<a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
						</div>
					</c:when>
					<c:when test="${qResult.id!=sessionScope.loginInfo.id}">
						<div style="text-align: right;" class="btnDIv">
							<c:if test="${count==0 && adoptCount==0}">
								<a class="btn btn-dark"
									href="/code/codeRWrite.do?seq=${qResult.seq}" role="button">답변</a>
							</c:if>
							<a id="kakao-link-btn" href="javascript:;"
								onClick="shareKakaotalk();"> <img src="/icon/kakaoTalk.png"
								height=40>
							</a>
							<!-- 							<button class="btn btn-warning" id="sharing">공유</button> -->
							<!-- 							<button type="button" class="btn btn-outline-warning" id="sharing"><a id="kakao-link-btn" href="javascript:;" onClick="shareKakaotalk();"> -->
							<!-- 								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" height=20/> -->
							<!-- 							</a>공유</button> -->
							<!-- 						<i class="fa fa-bookmark" id="scrapDone" data-toggle="tooltip" title="스크랩"></i> -->
							<button class="btn btn-dark" id="scrap">스크랩</button>
							<a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
							<button class="btn btn-danger" id="report">신고</button>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: right;">
							<!-- 답변이 있으면 삭제,수정이 안됨. -->
							<c:if test="${repCount==0}">
								<button class="btn btn-dark" class="btnDIv2" id="modify">수정</button>
								<button class="btn btn-danger" class="btnDIv2" id="delete">삭제</button>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>

				<!-- 답글 시작-->
				<c:forEach items="${rResult}" var="r">
					<div class="topQ">
						<hr>
						<hr>

						<c:if test="${r.adopt=='Y'}">
							<div>
								<span class="ti-crown text-warning"></span>
								<p5>질문자 채택</p5>
							</div>
						</c:if>

						<div class="row">
							<div class="col-10">
								<div style="font-size: 40px; font-weight: 100;">
									<span style="cursor:pointer" onclick="popUp('${r.id}','${r.writer}')">${r.writer}</span>
									<span style="font-size: 20px; font-weight: 50; color: gray;">님의 답변입니다.</span>
									<c:choose>
										<c:when test="${r.memLevel == 2}">
											<!-- 							<span class="badge badge-pill badge-info" style="margin: 10; width: 80px; height:30px;">비실무자</span>						 -->
											<span class="badge badge-pill badge-info">비실무자</span>
										</c:when>
										<c:when test="${r.memLevel == 3}">
											<span class="badge badge-pill badge-primary">실무자</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-pill badge-danger">강등자</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="col-2">
								<%-- 						<c:if test="${r.adopt=='Y'}"> --%>
								<!-- 							<i data-brackets-id="1484" class="fa fa-check-circle-o"  style="font-size:100px;"><h3 style="color:red;">질문자채택</h3></i> -->
								<!-- 							<i data-brackets-id="803" class="fa fa-check" style="font-size:100px;"><h3 style="color:red;">질문자채택</h3></i> -->
								<!-- 							<img src="/icon/check.svg" width=150 height=70><h3 style="color:red;">질문자채택</h3> -->
								<%-- 						</c:if> --%>
							</div>
						</div>
						<br>
						<div id="content">${r.content}</div>
						<br>
						<div>${r.formedDate}</div>

						<!-- 채택 -->
						<c:if
							test="${repCount >0 && qResult.id == sessionScope.loginInfo.id}">
							<div style="text-align: right;">
								<c:if test="${r.adopt=='N' && adoptCount == 0}">
									<button type="button" class="btn btn-primary" id="adopt"
										onclick="adopt('${r.id}')">채택하기</button>
								</c:if>
							</div>
						</c:if>
						<br>
						<c:choose>
							<c:when test="${sessionScope.loginInfo.id==null }">

							</c:when>
							<c:when test="${r.id == sessionScope.loginInfo.id}">
								<div style="text-align: right;">
									<button class="btn btn-dark" id="modifyR"
										onclick="modifyRe(${r.seq},${r.queSeq})">수정</button>
									<button class="btn btn-danger" id="deleteR"
										onclick="deleteRe(${r.seq},${r.queSeq})">삭제</button>
								</div>
							</c:when>
							<c:otherwise>
								<div style="text-align: right;">
									<button class="btn btn-danger" id="reportR">신고</button>
								</div>
							</c:otherwise>
						</c:choose>
						<br>
						<%-- 					<c:if test="${sessionScope.loginInfo.id!=null }">	 --%>
						<div style="text-align: right;">
							<button class="btn btn-dark" id="commentBtn"
								onclick="hideCo(${r.seq})">댓글</button>
						</div>
						<%-- 					</c:if>	 --%>
						<br>
						<div class="contentDivBot dSeq${r.seq}" style="display: none;">
							<div class="pPageComments${r.seq}">
								<c:if test="${cResult.size()>0 }">
									<c:forEach items="${cResult }" var="c">
										<!-- 										댓글seq = 답글seq 같은것만 보여지게 -->
										<c:choose>
											<c:when test="${c.repSeq == r.seq}">
												<div
													class="row commentDiv commentBox${r.seq}${c.seq} p-0 pb-2 m-2" style="border:1px solid red; border-top:none; border-left: none; border-right: none;">													
													<div class="col-12 commentInnerBox">
														<div class="row commentHeader">
															<div class="col-8 pt-3">
																<div class="row commentInfo">
																	<div class="col-12 commentWriter">${c.writer }</div>
																	<div class="col-12 commentWriteDate">${c.formedDate}</div>
																</div>
															</div>
															<div class="col-4 pt-2 text-right commentBtns">
																<!-- 													<button type="button" class="btn btn-warning coReplyBtn">답글</button> -->
																<c:if test="${c.id==sessionScope.loginInfo.id }">
																	<a class="btn btn-info coModifyBtn"
																		onclick="coModFunction(${c.queSeq}, ${c.repSeq}, ${c.seq}, '${c.content}');return false;"
																		role="button">수정</a>
																	<a class="btn btn-danger coDeleteBtn"
																		onclick="coDelFunction(${c.queSeq}, ${c.repSeq}, ${c.seq});return false;"
																		role="button">삭제</a>
																</c:if>
															</div>
														</div>
														<div class="row commentContent">
															<div class="col-12 pt-1 pl-4">${c.content }</div>
														</div>
													</div>
												</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>
							</div>

							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10">
									<textarea class="form-control pCoContents${r.seq}"
										placeholder="댓글 내용을 입력해주세요" id="pCoContents${r.seq}"></textarea>
								</div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary"
												id="coWriteBtn${r.seq}">작성</button>
											<button type="button" class="btn btn-secondary" id="coCancel">취소</button>
											<!-- 											style="margin-bottom:10px;"  -->
										</div>
									</div>
									<div class="row">
										<div class="col-12"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<script>
				$("#pCoContents${r.seq}").focus(function(){
					if("${sessionScope.loginInfo.id}" == ""){
		    			alert("로그인 후 이용가능합니다.")
		    			$("#pCoContents${r.seq}").blur();
		    		}
		       	})
		       	
		       		$("#coWriteBtn${r.seq}").on("click",function(){		       			
		       				if($("#pCoContents${r.seq}").val()==""){
						           alert("댓글 내용을 입력해주세요.");
						           return false;
						    }
						
							$.ajax({
						           url : "/code/codeCWriteProc.do",
						           type : "post",
						           dataType : "json",
						           data :{
						        	  queSeq : "${qResult.seq}", 
						              repSeq : "${r.seq}",
						              content : $("#pCoContents${r.seq}").val(),
						              writer: "${sessionScope.loginInfo.nickName}"
						           }
						        }).done(function(resp){
						            $("#pCoContents${r.seq}").val("");
						            $(".pPageComments${r.seq}").html("");
						           
						           //call list
					               var loginInfo = "${sessionScope.loginInfo.id}";
					               for(var i=0;i<resp.length;i++){
					                  var html = [];
					                  html.push(
					                        '<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid red; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
//					                         '<div class="col-1 profileBox pl-1 pt-2"></div>',
					                        '<div class="col-8 pt-3"><div class="row commentInfo">',
					                        '<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
					                        '<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
					                        '<div class="col-4 pt-2 text-right commentBtns">'
					                        );
					                  if(resp[i].id==loginInfo){
					                     
					                     html.push(
					                           '<a class="btn btn-info coModifyBtn" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+',\''+resp[i].content+'\');return false;" role="button">수정</a>\n',
					                           '<a class="btn btn-danger coDeleteBtn" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
					                           );
					                  }
					                  
					                  html.push(
					                        '</div></div>',
					                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div>'
					                        );
					                  $(".pPageComments${r.seq}").append(html.join(""));	 			                     
						           
						        }
						        }).fail(function(resp){
						        	
						        })      			
				})			
	       				       		
				</script>
				
				</c:forEach>
				<!-- 	답글끝 -->

				<br>
				<hr>

			</div>
		</div>
		<!--       몸통 끝!!!   -->

		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
	<script>
	
	// 카톡 공유하기
	$("#sharing").on("click",function(){
		location.href="${pageContext.request.contextPath}/code/sharing.do";
	})
	
	//스크랩
	$("#scrap").on("click",function(){
		var result = confirm("스크랩하시겠습니까?");
		if(result){
			//이미 했는지 검사
			$.ajax({
				url:"${pageContext.request.contextPath}/code/scrap.do",
				type:"post",
				data:{
					category : "codeQuestion",
					categorySeq : "${qResult.seq}"
				}
			}).done(function(resp){
				if(resp == "success"){//스크랩 성공
					alert("스크랩에 성공하셨습니다. P-log의 마이스크랩에서 확인해주세요.");
				}else if(resp == "already"){//이미스크랩
					alert("이미 스크랩된 글입니다. P-log의 마이스크랩에서 확인해주세요.");
				}else{//실패
					alert("오류발생. 일대일문의에 문의해주세요.");
				}
			});
		}
	})
	
		// 채택
		function adopt(replyId){
		var cf = confirm("채택하시겠습니까?");
			if(cf){		
				location.href="${pageContext.request.contextPath}/code/adopt.do?adoptPoint="+${qResult.point}+"&queSeq="+${qResult.seq}+"&writerId="+'${qResult.id}'+"&replyId="+replyId;
			}	
		}	
	
		$("#modify").on("click",function(){
			location.href="${pageContext.request.contextPath}/code/modify.do?seq=${qResult.seq}";
		})
		$("#delete").on("click",function(){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/delete.do?seq=${qResult.seq}&point=${qResult.point}";
			}
		})

		flag = true;
		function hideCo(seq){
			var b = $(".dSeq"+seq);
			if(flag == true){
				b.show();﻿
	            flag = false;
	        }else{
	        	b.hide();
	            flag = true;
	        };
    	}
		
		
		function modifyRe(seq,queSeq){
				location.href="${pageContext.request.contextPath}/code/modifyR.do?seq="+seq+"&queSeq="+queSeq;
        }

		function deleteRe(seq,queSeq){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/deleteR.do?seq="+seq+"&queSeq="+queSeq;
			}
        }
		
		//닉네임 눌렀을때 새창 띄우기
		function popUp(id,writer){
			if(writer == null){
				alert("탈퇴한 회원입니다.");
				return false;
			}
			else{
				window.open("/Portfolio/toPlog.do?owner="+id, "pLogPopUp", "width=600,height=600");
			}
	      
	     }
    	
		function coDelFunction(queSeq, repSeq, seq){
			 var check = confirm("정말 삭제하시겠습니까?");
             if(check){
                $.ajax({
                   url : "/code/codeCDeleteProc.do",
                   type : "post",
                   dataType : "json",
                   data :{
                 	  queSeq : queSeq,
                      repSeq : repSeq,
                      seq:seq
                   }
                }).done(function(resp){
               $(".pPageComments"+repSeq).html("");               
             //call list
	               var loginInfo = "${sessionScope.loginInfo.id}";
	               for(var i=0;i<resp.length;i++){
	                  var html = [];
	                  html.push(
	                        '<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid red; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
//			                         '<div class="col-1 profileBox pl-1 pt-2"></div>',
	                        '<div class="col-8 pt-3"><div class="row commentInfo">',
	                        '<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
	                        '<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
	                        '<div class="col-4 pt-2 text-right commentBtns">'
//			                         '<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
	                        );
	                  if(resp[i].id==loginInfo){
	                     
	                     html.push(
	                           '<a class="btn btn-info coModifyBtn" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+',\''+resp[i].content+'\');return false;" role="button">수정</a>\n',
	                           '<a class="btn btn-danger coDeleteBtn" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
	                           );
	                  }
	                  
	                  html.push(
	                        '</div></div>',
	                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div>'
	                        );
	                  $(".pPageComments"+repSeq).append(html.join(""));   
		        }
		        }).fail(function(resp){

		        })
            }
		}
		
		function coModFunction(queSeq,repSeq,seq,content){	
			if($("#pCoModContents").length>0){
				alert("현재 열려있는 댓글 수정창이 있습니다.");
				return false;
			}
			$(".commentBox"+repSeq+seq).find(".commentBtns").css("display","none");
			$(".commentBox"+repSeq+seq).find(".commentContent").css("display","none");
       		$(".commentBox"+repSeq+seq).wrap('<form action="/code/codeCModifyProc.do" method="post" id="coModFrm"></form>');
			var html = [];
			html.push(
					'<div class="col-12 coModBox mt-2 mb-2"><div class="row">',
					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+content+'</textarea></div>',
					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="repSeq" value="'+repSeq+'"><input type="hidden" name="queSeq" value="'+queSeq+'">',
					'<div class="row">',
					'<div class="col-12 text-center p-0">',
					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
					'</div></div>',
					'<div class="row"><div class="col-12 text-center p-0">',
					'<button type="button" class="btn btn-warning" style="width:80%;" id="coMoConfirmBtn">수정</button>',
					'</div></div></div></div></div>'
			);
			$(".commentBox"+repSeq+seq).append(html.join(""));  			
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
					url : "/code/codeCModifyProc.do",
					type : "post",
					dataType : "json",
					data : $("#coModFrm").serialize()
				}).done(function(resp){
		               $(".pPageComments"+resp[0].repSeq).html("");               
		               //call list
		  	               var loginInfo = "${sessionScope.loginInfo.id}";
		  	               for(var i=0;i<resp.length;i++){
		  	                  var html = [];
		  	                  html.push(
		  	                        '<div class="row commentDiv commentBox'+resp[i].repSeq+resp[i].seq+' p-0 pb-2 m-2" style="border:1px solid red; border-top:none; border-left: none; border-right: none;"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
//		  			                         '<div class="col-1 profileBox pl-1 pt-2"></div>',
		  	                        '<div class="col-8 pt-3"><div class="row commentInfo">',
		  	                        '<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
		  	                        '<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
		  	                        '<div class="col-4 pt-2 text-right commentBtns">'
//		  			                         '<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
		  	                        );
		  	                  if(resp[i].id==loginInfo){
		  	                     
		  	                     html.push(
		  	                           '<a class="btn btn-info coModifyBtn" onclick="coModFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+',\''+resp[i].content+'\');return false;" role="button">수정</a>\n',
		  	                           '<a class="btn btn-danger coDeleteBtn" onclick="coDelFunction('+resp[i].queSeq+','+resp[i].repSeq+','+resp[i].seq+');return false;" role="button">삭제</a>'
		  	                           );
		  	                  }
		  	                  
		  	                  html.push(
		  	                        '</div></div>',
		  	                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div>'
		  	                        );
		  	                  $(".pPageComments"+resp[0].repSeq).append(html.join(""));   
		  		        }
				}).fail(function(resp){
					
				})
	      });       	
		
	</script>
</body>
</html>