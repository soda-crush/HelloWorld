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
<link rel="stylesheet" href="/css/projectBase.css" type="text/css" />
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css" />

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
.contentDivBot{
	text-align:left;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor style="text-align:left;">
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
				<div class="botD"><img src="/icon/Cicon.svg"> ${qResult.writer} ${qResult.formedDate} 조회수${qResult.viewCount}</div>
				<br>
				<!-- 아래 비로그인일때도 보이는지..? -->
				<c:choose>
					<c:when test="${qResult.id!=sessionScope.loginInfo.id}">
						<div style="text-align: right;" class="btnDIv">
<%-- 						<c:forEach items="${rResult}" var="r"> --%>
<%-- 							<c:set var="count" value="${qResult.replyCount==0}" /> --%>
<%-- 							<c:if test="${sessionScope.loginInfo == count  == ${qResult.seq}"> --%>
								<c:if test="${count==0}">
									<a class="btn btn-dark" href="/code/codeRWrite.do?seq=${qResult.seq}" role="button">답변</a>
								</c:if>
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
							<button class="btn btn-dark">공유</button>
							<button class="btn btn-dark" id="scrap">스크랩</button>
							<a class="btn btn-dark" href="/code/codeQList.do" role="button">목록</a>
							<button class="btn btn-danger" id="report">신고</button>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: right;">
							<button class="btn btn-dark" class="btnDIv2" id="modify">수정</button>
							<button class="btn btn-danger" class="btnDIv2" id="delete">삭제</button>
						</div>
					</c:otherwise>
				</c:choose>
<!-- 				<hr> -->
<!-- 				<hr> -->
			<!-- <div style="text-align: center; margin-right: 200px;">A2개</div> -->
	
			<!-- 답글 시작-->
		
				<div class="topQ">
					<c:forEach items="${rResult}" var="r">
					<hr>
					<hr>
<%-- 						<input type="hidden" id="seqSelect" data-repNum="${r.seq}">  --%>
<%-- 						<input type="hidden" class="parent${r.queSeq}" value="${r.queSeq}"> --%>
						<div style="font-size: 40px; font-weight: 100;">${r.writer}님의 답변입니다.</div>
						<br>
						<div id="content">${r.content}</div>									
						<br>
<%-- 							<c:if test="${cResult.size()>0 }"> --%>
<%-- 								<c:forEach items="${cResult }" var="c"> --%>
<%-- 									${c.content}<br> --%>
<%-- 								</c:forEach> --%>
<%-- 							</c:if> --%>
						<div>${r.formedDate}</div>
						<c:choose>
							<c:when test="${r.writer == sessionScope.loginInfo.nickName}">
								<div style="text-align:right;">
									<button class="btn btn-dark" id="modifyR" onclick="modifyRe(${r.seq},${r.queSeq})">수정</button>
									<button class="btn btn-danger" id="deleteR" onclick="deleteRe(${r.seq},${r.queSeq})">삭제</button>
								</div>
							</c:when>
							<c:otherwise>
								<div style="text-align:right;">
										<button class="btn btn-danger" id="reportR">신고</button>
								</div>
							</c:otherwise>
						</c:choose>	
						<br>
						<div style="text-align:right;"><button class="btn btn-dark" id="commentBtn">댓글</button></div>	
					</c:forEach>
				</div>
<!-- 댓글리스트 -->
<!-- 					<div id="commentList"></div> -->
<!-- 					<div class="contentDivBot"> -->
<%-- 						<c:forEach items="${cResult}" var="co"> --%>
<%-- 							<div class="row commentDiv${co.seq} commentBox"> --%>
<!-- 								<div class="col-12"> -->
<!-- 									<div class="row" style="font-size: 13px;"> -->
<!-- 										<div class="col-3">관리자</div> -->
<%-- 										<div class="col-3">${co.writeDate }</div> --%>
<!-- 										<div class="col-6" align="right"> -->
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${cResult.writer == sessionScope.loginInfo}"> --%>
<!-- 													<input type="button" value="수정" id="toCoModify" -->
<%-- 														onclick="modifyComment(${co.seq},'${co.content}')"> --%>
<!-- 													<input type="button" value="삭제" id="toCoDelete" -->
<%-- 														onclick="deleteComment(${readDTO.ask_seq},${co.co_seq})"> --%>
<%-- 												</c:when> --%>
<%-- 											</c:choose> --%>
<%-- 						            <c:if test="${co.writer == sessionScope.loginInfo}"> --%>
<%-- 													<a class="btn btn-primary" href="/code/codeDetail.do?seq=${co.seq }" role="button">수정하기</a> --%>
<!-- 														<a class="btn btn-primary" href="#" role="button">수정하기</a>  -->
<!-- 													<a class="btn btn-danger" href="#" role="button">삭제하기</a> -->
<%-- 									</c:if> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="row"> -->
<%-- 										<div class="col-12 commentView${co.co_seq}">${co.contents }</div> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 댓글 -->
					<div class="contentDivBot" style="display:none;">
						<div class="pPageComments">
							<c:if test="${cResult.size()>0 }">
								<c:forEach items="${cResult }" var="c">
									<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">
												<div class="col-8 pt-3">
													<div class="row commentInfo">
														<div class="col-12 commentWriter">${c.writer }</div>
														<div class="col-12 commentWriteDate">${c.formedDate }</div>
													</div>
												</div>				
												<div class="col-4 pt-2 text-right commentBtns">
<!-- 													<button type="button" class="btn btn-warning coReplyBtn">답글</button> -->
													<c:if test="${c.writer==sessionScope.loginInfo.nickName }">
														<a class="btn btn-info coModBtn" href="#" onclick="coModFunction(${c.seq},'${c.content}',${c.queSeq });return false;" role="button">수정</a>
														<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a>
													</c:if>
												</div>								
											</div>											
											<div class="row commentContent">
												<div class="col-12 pt-1 pl-4">${c.content }</div>
											</div>
										</div>
									</div>								
								</c:forEach>
							</c:if>
						</div>
							
							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoContents"></textarea></div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary" id="coWriteBtn">작성</button>
											<button type="button" class="btn btn-secondary" id="coCancel">취소</button>
<!-- 											style="margin-bottom:10px;"  -->
										</div>										
									</div>
									<div class="row">
										<div class="col-12">
											
										</div>										
									</div>								
		        				</div>
							</div>
					</div>



<!-- 							<div class="contentDivBot" style="display:none;"> -->
<!-- 								<input type="text" id="contentCo" placeholder="댓글을 입력해주세요"> -->
<!-- 								<input type="button" id="commentWrite" value="등록"> -->
<!-- 							</div>											 -->
										
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${sessionScope.loginInfo}"> --%>
<!-- 									<button class="btn btn-dark" class="btnDIv2" id="modifyR">수정</button> -->
<%-- 									<button class="btn btn-danger" class="btnDIv2" id="deleteR" onclick ="deleteR(${r.seq})">삭제</button> --%>
<%-- <%-- 									<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?seq=${Bresult.seq}'">삭제</button> --%> 
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
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
	
	<script>
	//스크랩하기
	
	$("#scrap").on("click",function(){
		var result = confirm("스크랩하시겠습니까?");
		if(result){
			//이미 했는지 검사
			$.ajax({
				url:"${pageContext.request.contextPath}/code/scrap",
				type:"post",
				data:{
					category : "code",
					categorySeq : ${qResult.seq}
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
	
		$("#modify").on("click",function(){
			location.href="${pageContext.request.contextPath}/code/modify.do?seq=${qResult.seq}";
		})
		$("#delete").on("click",function(){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/delete.do?seq=${qResult.seq}";
			}
		})
		
		flag = true;
		var b = $(".contentDivBot");
	
		$("#commentBtn").click(function(){
		        if(flag == false){
		            b.hide();
		            flag = true;
		        }
		        else{
		            b.show();﻿
		            flag = false;
		        };
		});
	
		function modifyRe(seq,queSeq){
				location.href="${pageContext.request.contextPath}/code/modifyR.do?seq="+seq+"&queSeq="+queSeq;
        }

		function deleteRe(seq,queSeq){
			var cf = confirm("삭제하시겠습니까?");
			if(cf){
				location.href="${pageContext.request.contextPath}/code/deleteR.do?seq="+seq+"&queSeq="+queSeq;
			}
        }
		
//     	$("#commentWrite").on("click",function(){
//     		$.ajax({
// 				url:"/code/codeCWriteProc.do",
// 				type:"post",
// 				data:{
// 					content : $("#contentCo").val(),
// 					repSeq: ${repSeq},
// 					writer: "${sessionScope.loginInfo}"
// 				},
// 				dataType:"json"
// 			}).done(function(data){
// 				$("#commentList").append("<div>" + data.writer + "</div><br>" + "<div>" + data.content + "</div><br>" + "<div>" + data.writeDate + "</div><br><a class=\"btn btn-primary\" href=/code/codeCDeleteProc.do?repSeq="+data.repSeq+"&seq="+data.seq+" role=\"button\">댓글 삭제</a>");
// 				$("#content").val("");
// 			});
//     	})


        $("#coWriteBtn").on("click",function(){
            $("#pCoContents").val($.trim($("#pCoContents").val()));
            if($("#pCoContents").val()==""){
               alert("댓글 내용을 입력해주세요.");
               return false;
            }
            
            $.ajax({
               url : "/code/codeCWriteProc.do",
               type : "post",
               dataType : "json",
               data :{
            	  queSeq : "${qResult.seq}", 
                  repSeq : "${repSeq}",
                  content : $("#pCoContents").val(),
                  writer: "${sessionScope.loginInfo.nickName}"
               }
            }).done(function(resp){
               $("#pCoContents").val("");
                $(".pPageComments").html("");
               console.log("asdfasdfasfadsf"+resp);
               commentRecall(resp);
               console.log("이건되냐");
            }).fail(function(resp){
               console.log("실패");
               console.log(resp);
            })
         });
                 
            function coModFunction(seq,contents,queSeq){     
               $(".commentBox"+seq).find(".commentBtns").css("display","none");
               $(".commentBox"+seq).find(".commentContent").css("display","none");
                    $(".commentBox"+seq).wrap('<form action="/code/codeCModifyProc.do" method="post" id="coModFrm"></form>');
               var html = [];
                html.push(
                      '<div class="col-12 coModBox mt-2"><div class="row">',
                      '<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+contents+'</textarea></div>',
                      '<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="queSeq" value="'+queSeq+'">',
                      '<div class="row">',
                      '<div class="col-12 text-center p-0">',
                      '<button type="button" class="btn btn-info" style="width:80%;" id="coMoBtn">수정</button>',
                      '</div></div>',
                      '<div class="row"><div class="col-12 text-center p-0">',
                      '<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
                      '</div></div></div></div></div>');
                	  $(".commentBox"+seq).append(html.join(""));             
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
                 
               $(document).on("click","#coMoBtn",function(){
               $("#pCoModContents").val($.trim($("#pCoModContents").val()));
               if($("#pCoModContents").val()==""){
                  alert("댓글 내용을 입력해주세요.");
                  return false;
               }
               console.log($("#coModFrm").serialize());
               $.ajax({
                  url : "/code/codeCModifyProc.do",
                  type : "post",
                  dataType : "json",
                  data : $("#coModFrm").serialize()
               }).done(function(resp){
                  console.log("성공");
                  console.log("000000000000000000000000000000000"+resp);
                  $(".pPageComments").html("");
                  commentRecall(resp);
               }).fail(function(resp){
                  console.log("실패");
                  console.log(resp);
               })
                 });
               
                 function coDelFunction(seq){
                    var check = confirm("정말 삭제하시겠습니까?");
                    if(check){
                       $.ajax({
                          url : "/code/codeCDeleteProc.do",
                          type : "post",
                          dataType : "json",
                          data :{
                        	  queSeq : "${qResult.seq}", 
                              seq : seq,
                              repSeq : "${repSeq}"
                          }
                       }).done(function(resp){
                      $(".pPageComments").html("");
                      commentRecall(resp);
                       }).fail(function(resp){
                      console.log("실패");
                      console.log(resp);
                       })
                    }
                 }
                 
               function commentRecall(resp){
               var loginInfo = "${sessionScope.loginInfo.nickName}";
               console.log("1111111111111111111111111111111111111111"+resp);
               console.log(resp.content);
               console.log(resp.writer);
               for(var i=0;i<resp.length;i++){
                  var html = [];
                  html.push(
                        '<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
//                         '<div class="col-1 profileBox pl-1 pt-2"></div>',
                        '<div class="col-7 pt-1"><div class="row commentInfo">',
                        '<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
                        '<div class="col-12 commentWriteDate">'+resp[i].writeDate+'</div></div></div>',
                        '<div class="col-4 pt-2 text-right commentBtns">'
//                         '<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
                        );
                  if(resp[i].writer==loginInfo){
                     
                     html.push(
                           '<a class="btn btn-info coModBtn" href="/code/codeCModifyProc.do?seq='+resp[i].seq+'&repSeq='+resp[i].repSeq+'" onclick="coModFunction('+resp[i].seq+',\''+resp[i].content+'\','+resp[i].queSeq+');return false;" role="button">수정</a>\n',
                           '<a class="btn btn-danger coDelBtn" href="/code/codeCDeleteProc.do?seq='+resp[i].seq+'&repSeq='+resp[i].repSeq+'" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
                           );
                  }
                  
                  html.push(
                        '</div></div>',
                        '<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].content+'</div></div></div></div>'
                        );
                  $(".pPageComments").append(html.join(""));   
                    }
            }
    	
	</script>
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
</html>