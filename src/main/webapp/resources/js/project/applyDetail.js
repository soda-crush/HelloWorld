        	function openApplyList(){
        		var frmPage = document.getElementById("pageChange");
        		frmPage.action = '/project/apply/list';
        		frmPage.submit();
        	}
			function popUp(link){
				window.open(link, "applyPopUp", "width=1000,height=750");
			}
			function pLogPopUp(link){
				window.open(link, "pLogPopUp", "width=800,height=600");
			}			
	        $("#applyCancelBtn").on("click",function(){
	        	var check = confirm("신청을 취소하시겠습니까?");
	        	if(check){
	        		$.ajax({
	        			type:"post",
	        			url:"/project/apply/deleteProc",
	        			data:{seq:$("#applySeq").val()}
	        		}).done(function(resp){
	        			alert("신청이 취소되었습니다.");
						window.opener.document.location.href = window.opener.document.URL;  
						window.close();
	        		}).fail(function(resp){
	        			
	        		});
	        	}
	        });
	        
        	$("#approveBtn").on("click",function(){
        		var check = confirm("승인 하시겠습니까?");
        		if(check){
        			$.ajax({
        				type:"post",
        				url:"/project/apply/approveApply",
        				data:{seq:$("#applySeq").val()}
        			}).done(function(resp){
        				$("#pApproveModal").modal('show');
        				$("#approveProcBtns").remove();
        				$(".checkBtn").append('<span style="font-weight:bold;">신청 <span style="color:limegreen;font-weight:bold;">승인</span>되었습니다.</span>');
        				window.opener.document.location.href = window.opener.document.URL;
        			}).fail(function(resp){
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
        				data:{seq:$("#applySeq").val()}
        			}).done(function(resp){
        				$("#pDenialModal").modal('show');
    					$("#approveProcBtns").remove();
        				$(".checkBtn").append('<span style="font-weight:bold;">신청 <span style="color:red;font-weight:bold;">거절</span>되었습니다.</span>');
        				window.opener.document.location.href = window.opener.document.URL;
        			}).fail(function(resp){
    					alert("신청 실패!");
        			});
        		}        		
        	});