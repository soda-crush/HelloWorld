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
			if($("#pCoModContents").length>0){
   				alert("현재 열려있는 댓글 수정창이 있습니다.");
   				$("#pCoModContents").focus();
   				return false;
   			}
			var html = [];
			html.push(
					'<div id="pCoReplyInput" class="row commentDiv commentBox p-0 pb-2">',
					'<div class="col-1 text-right pl-0 pt-1"><strong>┗</strong></div>',
					'<div class="col-11 commentInnerBox pb-0">',
					'<div class="row mt-2">',
					'<div class="col-9 col-md-10"><textarea class="form-control ml-0" placeholder="답글 내용을 입력해주세요" id="pCoReplyContents" name="contents" maxlength="1300"></textarea></div>',
					'<div class="col-3 col-md-2 p-0">',
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
				if($('.commentBox'+seq).next('.coLevel1').length>0){
					$('.commentBox'+seq).nextAll('.coLevel1:last').after(html.join(""));
				}else{
					$('.commentBox'+seq).after(html.join(""));	
				}				
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
			var check = $("#checkApplyCount").val();
			var check2 = $("#pageState").val();
			if(check>0){
				alert("신청 대기중 또는 신청 승인된 회원이 있는 모집글은\n수정이 불가합니다");
				return false;
			}else if(check2=='Y'){
				alert("모집마감된 모집글은 수정이 불가합니다");
				return false;
			}else {
				location.href="/project/modify?seq="+$("#pageSeq").val();
			}
		});
       	$("#pDelBtn").on("click",function(){
       		var check = $("#checkApplyCount").val();
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
			if($("#pCoReplyInput").length>0){
				alert("현재 열려있는 답글 입력창이 있습니다.");
				$("#pCoReplyInput textarea").focus();
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
					
//		var data = JSON.stringify(result);
		var data = $("#tagData").val();
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
			$("input[name='projectSeq']").val($("#pageSeq").val());
			$("input[name='leaderId']").val($("#writerId").val());
			$.ajax({
				type:"post",
				url:"/project/apply/writeProc",
				data:$("#applyFrm").serialize()
			}).done(function(resp){
				$('#pApplyConfirmModal').modal('show');				
				$('#pApplyModal').modal('hide');
			}).fail(function(resp){
				console.log(resp);
				alert("신청 실패!");
			});
			return false;				
		});
		$('#pApplyModal').on('hidden.bs.modal', function (e) {
			$(this).find('form').trigger('reset');	
			$('.bootstrap-tagsinput .tag [data-role="remove"]').click();			
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
						'<div class="col-1 text-right pl-0 pt-1"><strong>┗</strong></div>'		
					);
				}
				if(resp[i].id==loginInfo){
					html.push(
							'<div class="col-'+(12-resp[i].depth)+' commentInnerBox pb-0" style="background-color:#e8f1ff;">'					
					);						
				}else{
					html.push(
							'<div class="col-'+(12-resp[i].depth)+' commentInnerBox pb-0">'					
					);							
				}
				if(resp[i].contents!=null){
					html.push(
							'<div class="row commentHeader">',
							'<div class="col-md-1 d-none d-md-block profileBox pl-1 pt-2 pr-0"><img src="'+resp[i].profileImg+'" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
							'<div class="col-12 col-md-11 pt-1">',
							'<div class="row commentInfo1 pl-2" style="height:22px;">',
							'<div class="col-6 commentWriter p-0">',
							'<span style="font-weight:bold;cursor:pointer;" onclick="popUp(\'/Portfolio/toPlog.do?owner='+resp[i].id+'&other=Y\')">'+resp[i].writer+'</span></div>',
							'<div class="col-6 text-right commentBtns pl-0">'
					);
					if(resp[i].depth==0){
						html.push(
							'<a style="height:90%;width:40px;font-size:14px;" class="btn btn-warning coReplyBtn align-middle" href="#" onclick="coReplyFunction('+resp[i].seq+');return false;" role="button">답글</a>\n'		
						);
					}
					if(resp[i].id==loginInfo){
						html.push(
							'<a style="height:90%;width:40px;font-size:14px;" class="btn btn-info coModBtn" href="#" onclick="coModFunction('+resp[i].seq+');return false;" role="button">수정</a>\n',
							'<a style="height:90%;width:40px;font-size:14px;" class="btn btn-danger coDelBtn" href="#" onclick="coDelFunction('+resp[i].seq+');return false;" role="button">삭제</a>'
						);
					}
					html.push(
						'</div></div>',
						'<div class="row commentInfo2 pl-2 mt-0"><div class="col-12 p-0"><span class="commentWriteDate pr-2" style="font-size:13px;">'+resp[i].formedWriteDate+'</span>\n'
					);
					if(resp[i].changeDate!=null){
						html.push(
								'<span class="commentChangeDate" style="font-size:13px;">(수정일 : '+resp[i].formedChangeDate+')</span>'
						);
					}
					html.push(
							'</div></div></div></div>',
							'<div class="row commentContent">',
							'<div class="col-12 pt-1 pl-4" style="word-break:break-all;word-break:break-word;">'+resp[i].contents+'</div>',
							'<input type="hidden" value="'+resp[i].modComment+'" id="hiddenModCo'+resp[i].seq+'"></div>'
					);
				}else {
					html.push(
							'<div class="row mt-2 mb-2"><div class="col-12">',
							'<span class="commentDelMessage pr-2" style="font-size:13px;">삭제된 댓글입니다.</span>\n',
							'<span class="commentDelDate" style="font-size:13px;">(삭제일 : '+resp[i].formedChangeDate+')</span>',
							'</div></div>'
					);
				}
				html.push(
						'</div></div>'		
				);
				$(".pPageComments").append(html.join(""));	
			}
		}