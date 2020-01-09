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
<style>
	.table{background-color:white;padding:0;text-align:center;}
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
            <div class=container id="projectPage" style="background-color:white">
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
				  				<div>${bPage.formedWriteDate}</div>
				  				<div>${bPage.viewCount}</div>
				  				<div class="contentDiv">${bPage.content}</div>
			</c:if>
				 <a class="btn btn-primary" href="/bamboo/bambooList.do" role="button">돌아가기</a>
				 <c:if test="${bPage.writer == sessionScope.loginInfo.id}">
				 <a class="btn btn-primary" href="/bamboo/bambooModify.do?seq=${bPage.seq }" role="button">수정하기</a>
				 <a class="btn btn-primary" href="/bamboo/bambooDeleteProc.do?seq=${bPage.seq }" role="button">삭제하기</a>
				 </c:if>
				 <a class="btn btn-primary" href="#" role="button">공유하기</a>
<!-- 		     <a class="sbtn btn-primary" href="#" role="button">스크랩</a> -->
				 <a class="btn btn-primary" href="#" role="button">신고하기</a>

           	<div class="pPageComments">
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">
												
												<div class="col-7 pt-1">
													<div class="row commentInfo">
													<input type="hidden" name="writer" value="${c.writer}">
														<div class="col-12 commentWriter">익명</div>
														<div class="col-12 commentWriteDate">${c.formedWriteDate  }</div>
													</div>
												</div>				
												<div class="col-4 pt-2 text-right commentBtns">
													<c:if test="${c.writer==sessionScope.loginInfo.id }">
														<a class="btn btn-info coModBtn" href="/bamboo/comment/modifyProc.do?seq=${c.seq }&bamSeq=${c.bamSeq}" onclick="coModFunction(${c.seq},'${c.content}',${c.bamSeq });return false;" role="button">수정</a>
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
							</div>
							
			<c:if test="${bPage.writer == sessionScope.loginInfo.id}">				
							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoContents"></textarea></div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary" id="coWriteBtn">작성</button>
										</div>										
									</div>								
		        				</div>
							</div>    	
						</c:if>		
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
					writer: "${sessionScope.loginInfo.id}"
				}
			}).done(function(resp){
				$("#pCoContents").val("");
 				$(".pPageComments").html("");
				commentRecall(resp);

			}).fail(function(resp){
				console.log("실패");
				console.log(resp);
			})
		});
         	
			function coModFunction(seq,contents,bamSeq){     
				$(".commentBox"+seq).find(".commentBtns").css("display","none");
				$(".commentBox"+seq).find(".commentContent").css("display","none");
           		$(".commentBox"+seq).wrap('<form action="/bamboo/comment/modifyProc.do" method="post" id="coModFrm"></form>');
				var html = [];
    			html.push(
    					'<div class="col-12 coModBox mt-2"><div class="row">',
    					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="content">'+contents+'</textarea></div>',
    					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="bamSeq" value="'+bamSeq+'">',
    					'<div class="row">',
    					'<div class="col-12 text-center p-0">',
    					'<button type="button" class="btn btn-secondary" style="margin-bottom:5px;width:80%;" id="coMoCancel">취소</button>',
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
           				url : "/bamboo/comment/deleteProc.do",
           				type : "post",
           				dataType : "json",
           				data :{
           					seq : seq,
           					bamSeq : "${bPage.seq}"
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
				var loginInfo = "${sessionScope.loginInfo.id}";
				for(var i=0;i<resp.length;i++){
					var html = [];
					html.push(
							'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
							'<div class="col-7 pt-1"><div class="row commentInfo">',
							'<input type="hidden" name="writer" value='+resp[i].writer+'>',
							'<div class="col-12 commentWriter">익명</div>',
							'<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
							'<div class="col-4 pt-2 text-right commentBtns">'
							);
					if(resp[i].writer==loginInfo){
					html.push(
								'<a class="btn btn-info coModBtn" href="/bamboo/comment/modifyProc.do?seq='+resp[i].seq+'&bamSeq='+resp[i].bamSeq+'" onclick="coModFunction('+resp[i].seq+',\''+resp[i].content+'\','+resp[i].bamSeq+');return false;" role="button">수정</a>\n',
								'<a class="btn btn-danger coDelBtn" href="/bamboo/comment/deleteProc.do?seq='+resp[i].seq+'&bamSeq='+resp[i].bamSeq+'" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
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
</body>
</html>