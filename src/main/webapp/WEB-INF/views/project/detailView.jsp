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
<link rel="stylesheet" href="/css/project/detailView.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<script src="/js/project/projectCo.js"></script>
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
					<h1>프로젝트 모집</h1>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${pPage.seq !=null }">
						<div id="pHeader">
							<label class="${pPage.state } badge badge-pill ml-4" id="stateLabel">${pPage.stateInKor }</label>
							<i class="fa fa-share-alt"></i><i class="fa fa-bookmark"></i><br>
							<span class="ml-4" style="font-weight:bold;">${pPage.title}</span><br>
							<label class="ml-4">작성자 : ${pPage.writer }</label>
							<label class="ml-4">작성일 : ${pPage.formedWriteDate }</label>
							<label class="ml-4">조회 : ${pPage.viewCount }</label>
						</div>
						<hr>
						<div id="pInfo">
							<div><label class="ml-4">지역</label><span>${pPage.location1 } ${pPage.location2 }</span></div>
							<div><label class="ml-4">모집인원</label><span>${pPage.capacity }명</span></div>
							<div><label class="ml-4">기간</label><span>${pPage.formedAllDate }</span></div>
							<div><label class="ml-4">사용언어</label><span>${pPage.languages }</span></div>
						</div>
						<hr>
						<div id="pBody">
						
							<div id="pPageContents">${pPage.contents }</div>
							
							<div><label class="ml-4">연락처</label><span>${pPage.phone }</span></div>
							<div><label class="ml-4">메일주소</label><span>${pPage.email }</span></div>
							
							<c:if test="${pPage.writer == sessionScope.loginInfo}">
								<div class="text-center checkBtn">
									<button type="button" class="btn btn-warning" id="applyCheckBtn">신청내역
										<c:if test="${pPage.applyCount>0 }">
					  						<span class="pApply font-weight-bold">${pPage.applyCount }</span>
					  					</c:if>
									</button>
									<c:if test="${pPage.state=='N' }">
									<button type="button" class="btn btn-success" id="pCloseBtn">모집완료처리</button>
									</c:if>
								</div>
							</c:if>
							
							
							
							<c:if test="${pPage.writer != sessionScope.loginInfo && pPage.state=='N' }">
								<div class="text-center applyBtn">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pApplyModal">신청하기</button>
								</div>
							</c:if>
							
							
							 <div class="row align-items-center adBoxDiv">
							    <div class="col-12">광고자리</div>
							 </div>
							
							<div class="pPageComments">
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									<div class="row commentDiv commentBox${c.seq } p-0 pb-2 m-2">
										<div class="col-12 commentInnerBox">
											<div class="row commentHeader">
												<div class="col-1 profileBox pl-1 pt-2"><img src="/img/profileSample.jpg" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>
												<div class="col-7 pt-1">
													<div class="row commentInfo">
														<div class="col-12 commentWriter">${c.writer }</div>
														<div class="col-12 commentWriteDate">${c.formedWriteDate }</div>
													</div>
												</div>				
												<div class="col-4 pt-2 text-right commentBtns">
													<button type="button" class="btn btn-warning coReplyBtn">답글</button>
													<c:if test="${c.writer==sessionScope.loginInfo }">
														<a class="btn btn-info coModBtn" href="#" onclick="coModFunction(${c.seq},'${c.contents }');return false;" role="button">수정</a>
														<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction(${c.seq});return false;" role="button">삭제</a>
													</c:if>
												</div>								
											</div>											
											<div class="row commentContent">
												<div class="col-12 pt-1 pl-4">${c.contents }</div>
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
						</div>
					</c:if>
				</div>
				
				<div id="pageFooter">
					<c:if test="${pPage.writer != sessionScope.loginInfo}">
						<span><a class="btn btn-danger" href="#" role="button">게시글 신고</a></span>
					</c:if>
					<span class="float-right">
						<c:if test="${pPage.writer == sessionScope.loginInfo}">
							<a class="btn btn-info" href="/project/modify?seq=${pPage.seq }" role="button">수정</a>
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
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
		<script>
		$("#applyCheckBtn").on("click",function(){
			location.href="/project/applyCheck?projectSeq=${pPage.seq}";	
		});
		
		var loginInfo = "${sessionScope.loginInfo}";
			$("#pCloseBtn").on("click",function(){
				var check = confirm("프로젝트 모집을 마감하시겠습니까?\n마감된 모집글은 상태를 변경할 수 없습니다.");
				if(check){
					location.href="/project/closeProject?seq=${pPage.seq}";
				}
			});
			var applyCount = ${pPage.applyCount};
           	$("#pDelBtn").on("click",function(){
           		var check = confirm("정말 삭제하시겠습니까?");
           		if(check){
           			location.href="/project/deleteProc?seq=${pPage.seq}";
           		}
           	});
           	
           	$("#coReplyBtn").on("click",function(){           		
           	});//답댓기능.
           	
           	
           	function coModFunction(seq,contents){     
				$(".commentBox"+seq).find(".commentBtns").css("display","none");
				$(".commentBox"+seq).find(".commentContent").css("display","none");
           		$(".commentBox"+seq).wrap('<form action="/project/comment/modifyProc" method="post" id="coModFrm"></form>');
				var html = [];
    			html.push(
    					'<div class="col-12 coModBox mt-2"><div class="row">',
    					'<div class="col-9 col-md-10 col-xl-11 pr-0"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요" id="pCoModContents" style="height:80px;" name="contents">'+contents+'</textarea></div>',
    					'<div class="col-3 col-md-2 col-xl-1"><input type="hidden" name="seq" value="'+seq+'"><input type="hidden" name="projectSeq" value="${pPage.seq }">',
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
				
				$.ajax({
					url : "/project/comment/modifyProc",
					type : "post",
					dataType : "json",
					data : $("#coModFrm").serialize()
				}).done(function(resp){
					console.log("성공");
					console.log(resp);
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
           				url : "/project/comment/deleteProc",
           				type : "post",
           				dataType : "json",
           				data :{
           					seq:seq,
           					projectSeq : "${pPage.seq}"
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
						projectSeq : "${pPage.seq}",
						contents : $("#pCoContents").val(),						
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
				$.ajax({
					type:"post",
					url:"/project/apply/writeProc",
					data:$("#applyFrm").serialize()
				}).done(function(resp){
					console.log("성공");
					console.log(resp);
					$(".pApplyInput").children('input').val("");
					$(".bootstrap-tagsinput").children('.label-info').remove();
					$(".pApplyInput").children('select').val("");
					$('#pApplyModal').modal('hide');
					$('#pApplyConfirmModal').modal('show');
				}).fail(function(resp){
					console.log("실패");
					console.log(resp);
					alert("신청 실패!");
				});
				return false;				
			});
			

			function commentRecall(resp){
				var loginInfo = "${sessionScope.loginInfo}";
				for(var i=0;i<resp.length;i++){
					var html = [];
					html.push(
							'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12 commentInnerBox"><div class="row commentHeader">',
							'<div class="col-1 profileBox pl-1 pt-2"><img src="/img/profileSample.jpg" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
							'<div class="col-7 pt-1"><div class="row commentInfo">',
							'<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
							'<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
							'<div class="col-4 pt-2 text-right commentBtns">',
							'<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
							);
					if(resp[i].writer==loginInfo){
						html.push(
								'<a class="btn btn-info coModBtn" href="#" onclick="coModFunction('+resp[i].seq+',\''+resp[i].contents+'\');return false;" role="button">수정</a>\n',
								'<a class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
								);
					}
					html.push(
							'</div></div>',
							'<div class="row commentContent"><div class="col-12 pt-1 pl-4">'+resp[i].contents+'</div></div></div></div>'
							);
					$(".pPageComments").append(html.join(""));	
					}
			}	
         </script>            
            
</body>
</html>