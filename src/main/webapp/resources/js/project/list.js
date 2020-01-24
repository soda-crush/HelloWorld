        	var pageOrder = $("#pageCheckOrder").val();
			if(pageOrder=='seq'){
				$("#latestOrder").addClass("active");
				$("#deadlineOrder").removeClass("active");
				$("#pageOrder").val("seq");
			}else if(pageOrder=='startDate'){
				$("#deadlineOrder").addClass("active");
				$("#latestOrder").removeClass("active");
				$("#deadlineComment").css("display","block");
				$("#pageOrder").val("startDate");
			}
        	$("#deadlineOrder").on("click",function(){
        		$("#pageOrder").val("startDate");
        		location.href="/project/list?pageOrder="+$("#pageOrder").val();
        	});
        	$("#latestOrder").on("click",function(){
        		$("#pageOrder").val("seq");
        		location.href="/project/list?pageOrder="+$("#pageOrder").val();
        	});
	        $("#searchFrm").on("submit",function(){
	        	$("#keyword").val($.trim($("#keyword").val()));
	        	if($("#keyword").val()==""){
	        		alert("검색어를 입력해주세요");
	        	}
	        });
        	$(".pNavi"+$("#currentCheckpage").val()).addClass("active");
			function popUp(link){
				window.open(link, "pLogPopUp", "width=800,height=600");
			}