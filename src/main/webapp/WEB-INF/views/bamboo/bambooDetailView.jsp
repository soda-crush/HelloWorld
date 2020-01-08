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
            <div class=container id="bambooPage" class=eleCon>
				<div id="pageTitle">
					<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100;">대나무숲</td>
								<td></td>
								<td style="font-size: 15px; color: gray;">     자유롭게 익명으로 글을 남기는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
				</div>
				
            <c:if  test="${bPage.seq !=null }">
				  				<div>${bPage.seq}</div>
				  				<h3>${bPage.title}</h3>
				  				<input type="hidden" name="writer" value="${bPage.writer}">
				  				<div>익명</div>
				  				<div>${bPage.writeDate}</div>
				  				<div>${bPage.viewCount}</div>
				  				<div>${bPage.content}</div>
			</c:if>
				 <a class="btn btn-primary" href="/bamboo/bambooList.do" role="button">돌아가기</a>
				 <a class="btn btn-primary" href="#" role="button">공유하기</a>
				 <a class="btn btn-primary" href="#" role="button">스크랩</a>
				 <a class="btn btn-primary" href="#" role="button">신고하기</a>
          
          
          
          
<!--             <div id="commentList"> -->
<%--             <c:if test="${comments.size()>0 }"> --%>
<%-- 								<c:forEach items="${comments }" var="c"> --%>
<%-- 									<input type="hidden" name="seq" id="commentSeq" value="${c.seq}"> --%>
<%-- 									<input type="hidden" name="writer" value="${c.writer}"> --%>
<!-- 									작성자<br><div>익명</div><br> -->
									
<%-- 									댓글<br><div>${c.content }</div><br> --%>
									
<%-- 									작성날짜<br><div>${c.writeDate }</div> --%>
									
<%-- 									<c:if test="${c.writer==sessionScope.loginInfo }"> --%>
<%-- 									<a class="btn btn-primary" href="href=/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" role="button">댓글 수정</a> --%>
<%-- 									<a class="btn btn-primary" href="/bamboo/comment/deleteProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" role="button">댓글 삭제</a><br> --%>
<%-- 									</c:if> --%>
									
<%-- 								</c:forEach> --%>
<%-- 			</c:if> --%>
<!--            	</div> -->
           	<div class="pPageComments">
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">
												
												<div class="col-7 pt-1">
													<div class="row commentInfo">
														<div class="col-12 commentWriter">${c.writer }</div>
														<div class="col-12 commentWriteDate">${c.writeDate }</div>
													</div>
												</div>				
												<div class="col-4 pt-2 text-right commentBtns">
<!-- 													<button type="button" class="btn btn-warning coReplyBtn">답글</button> -->
													<c:if test="${c.writer==sessionScope.loginInfo }">
														<a class="btn btn-info coModBtn" href="/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" onclick="coModFunction(${c.seq},'${c.content }');return false;" role="button">수정</a>
														<a class="btn btn-danger coDelBtn" href="/bamboo/comment/deleteProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a>
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
<!-- 							<div class="ajaxComments"></div> -->
							</div>
							
							
							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoContents"></textarea></div>
								<div class="col-3 col-lg-2">
<!-- 									<div class="row"> -->
<!-- 										<div class="col-12"> -->
<!-- 											<button type="button" class="btn btn-secondary" style="margin-bottom:10px;" id="coCancel">취소</button> -->
<!-- 										</div>										 -->
<!-- 									</div> -->
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary" id="coWriteBtn">작성</button>
										</div>										
									</div>								
		        				</div>
							</div>
           	
           	
           	
           	
           	
           	
<!--            	<div id="commentList"> -->
<!--            	<div class="pPageComments"> -->
<%-- 							<c:if test="${comments.size()>0 }"> --%>
<%-- 								<c:forEach items="${comments }" var="c"> --%>
<%-- 									<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2"> --%>
<!-- 										<div class="col-12 commentInnerBox"> -->
<!-- 											<div class="row commentHeader"> -->
												
<!-- 												<div class="col-7 pt-1"> -->
<!-- 													<div class="row commentInfo"> -->
<%-- 														<div class="col-12 commentWriter">${c.writer }</div> --%>
<%-- 														<div class="col-12 commentWriteDate">${c.writeDate }</div> --%>
<!-- 													</div> -->
<!-- 												</div>				 -->
<!-- 												<div class="col-4 pt-2 text-right commentBtns"> -->
<!-- 													<button type="button" class="btn btn-warning coReplyBtn">답글</button> -->
<%-- 													<c:if test="${c.writer==sessionScope.loginInfo }"> --%>
<%-- 														<a class="btn btn-info coModBtn" href="href=/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" onclick="coModFunction(${c.seq},'${c.content }');return false;" role="button">수정</a> --%>
<%-- 														<a class="btn btn-danger coDelBtn" href="/bamboo/comment/deleteProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a> --%>
<%-- 													</c:if> --%>
<!-- 												</div>								 -->
<!-- 											</div>											 -->
<!-- 											<div class="row commentContent"> -->
<%-- 												<div class="col-12 pt-1 pl-4">${c.content }</div> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div>								 -->
<%-- 								</c:forEach> --%>
<%-- 							</c:if> --%>
<!-- 							</div> -->
           	
<!--            		</div> -->
           	
           	
           	
           	
           	
           	
           			
            <c:if test="${bPage.writer == sessionScope.loginInfo}">
							<a class="btn btn-primary" href="/bamboo/bambooModify.do?seq=${bPage.seq }" role="button">수정하기</a>
							<a class="btn btn-primary" href="/bamboo/bambooDeleteProc.do?seq=${bPage.seq }" role="button">삭제하기</a>
						</c:if>
<!-- 						<br> -->
						
<!-- 						<input type="text" id="content" placeholder="댓글을 입력해주세요"> -->
<!-- 						<input type="button" id="commentWrite" value="등록"> -->
						
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
        $("#coWriteBtn").on("click",function(){
			$("#pCoContents").val($.trim($("#pCoContents").val()));
			if($("#pCoContents").val()==""){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "/bamboo/comment/writeProc.do",
				type : "post",
				dataType : "json",
				data :{
					bamSeq : "${bPage.seq}",
					content : $("#pCoContents").val(),
					writer: "${sessionScope.loginInfo}"
				}
			}).done(function(resp){
				$("#pCoContents").val("");
// 				$(".pPageComments").html("");
				console.log("asdfasdfasfadsf"+resp);
				commentRecall(resp);
				console.log("이건되냐");
			}).fail(function(resp){
				console.log("실패");
				console.log(resp);
			})
		});
        
        
//         	$("#commentWrite").on("click",function(){
//         		$.ajax({
// 					url:"/bamboo/comment/writeProc.do",
// 					type:"post",
// 					data:{
// 						content : $("#content").val(),
// 						bamSeq: ${bPage.seq},
// 						writer: "${sessionScope.loginInfo}"
// 					},
// 					dataType:"json"
// 				}).done(function(data){
// 					$("#commentList").append("<input type=\"hidden\" value="+data.writer+">작성자<br><div>익명</div><br>댓글<br><div>" + data.content + "</div><br>" + 
// 					"작성날짜<br><div>" + data.writeDate + "</div><br><a class=\"btn btn-primary\" href=/bamboo/comment/modifyProc.do?bamSeq="+data.bamSeq+"&seq="+data.seq+" role=\"button\">댓글 수정</a><a class=\"btn btn-primary\" href=/bamboo/comment/deleteProc.do?bamSeq="+data.bamSeq+"&seq="+data.seq+" role=\"button\">댓글 삭제</a><br>");
					
// 					$("#content").val("");
// 				});
//         	})
        	
			function coModFunction(seq,contents){     
				$(".commentBox"+seq).find(".commentBtns").css("display","none");
				$(".commentBox"+seq).find(".commentContent").css("display","none");
           		$(".commentBox"+seq).wrap('<form action="/bamboo/comment/modifyProc.do" method="post" id="coModFrm"></form>');
				var html = [];
    			html.push(
    					'<div class="col-12 coModBox mt-2"><div class="row">',
    					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+contents+'</textarea></div>',
    					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="bambooSeq" value="${bPage.seq }">',
    					'<div class="row">',
    					'<div class="col-12 text-center p-0">',
//     					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
    					'</div></div>',
    					'<div class="row"><div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-warning" style="width:80%;" id="coMoBtn">수정</button>',
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
					url : "/bamboo/comment/modifyProc.do",
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
           	function commentRecall(resp){
				var loginInfo = "${sessionScope.loginInfo}";
				console.log("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
				console.log("1111111111111111111111111111111111111111"+resp);
				console.log(resp.content);
				
				
					var html = [];
					html.push(
							'<div class="row commentDiv commentBox'+resp.seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
// 							'<div class="col-1 profileBox pl-1 pt-2"></div>',
							'<div class="col-7 pt-1"><div class="row commentInfo">',
							'<div class="col-12 commentWriter">'+resp.writer+'</div>',
							'<div class="col-12 commentWriteDate">'+resp.writeDate+'</div></div></div>',
							'<div class="col-4 pt-2 text-right commentBtns">'
// 							'<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
							);
					if(resp.writer==loginInfo){
						console.log("fffffffffffffffffffffffffffff");
						html.push(
								'<a class="btn btn-info coModBtn" href="/bamboo/comment/modifyProc.do?seq='+resp.seq+'&bamSeq='+resp.bamSeq+'" onclick="coModFunction('+resp.seq+',\''+resp.content+'\');return false;" role="button">수정</a>\n',
								'<a class="btn btn-danger coDelBtn" href="/bamboo/comment/deleteProc.do?seq='+resp.seq+'&bamSeq='+resp.bamSeq+'" onclick="coDelFunction('+resp.seq+');return false;" role="button">삭제</a>'
								);
					}
					
					html.push(
							'</div></div>',
							'<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp.content+'</div></div></div></div>'
							);
					$(".pPageComments").append(html.join(""));	
					
			}
        </script>
</body>
</html>