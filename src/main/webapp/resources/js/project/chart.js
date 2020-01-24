var pageOrder = $("#pageCheckOrder").val();
if(pageOrder=='seq'){
	$("#latestOrder").addClass("active");
	$("#deadlineOrder").removeClass("active");
	$("#pageOrder").val("seq");
}else if(pageOrder=='startDate'){
	$("#deadlineOrder").addClass("active");
	$("#latestOrder").removeClass("active");
	$("#pageOrder").val("startDate");
}
$("#deadlineOrder").on("click",function(){
	$("#pageOrder").val("startDate");
	location.href="/project/chart?pageOrder="+$("#pageOrder").val();
});
$("#latestOrder").on("click",function(){
	$("#pageOrder").val("seq");
	location.href="/project/chart?pageOrder="+$("#pageOrder").val();
});
function popUp(link){
	window.open(link, "pLogPopUp", "width=1000,height=750");
}
function scrapFunc(seq){
	$.ajax({
		url : "/project/scrap",
		type : "post",
		data : {
			categorySeq : seq
		}
	}).done(function(resp){
		alert("스크랩되었습니다.");
		$("#scrap"+seq).replaceWith('<i class="fa fa-bookmark scrapDone" id="scrap'+seq+'" data-toggle="tooltip" title="스크랩" onclick="unScrapFunc('+seq+')"></i>');
	}).fail(function(resp){
	});
}

function unScrapFunc(seq){
	$.ajax({
		url : "/project/unScrap",
		type : "post",
		data : {
			categorySeq : seq
		}
	}).done(function(resp){
		alert("스크랩이 취소되었습니다.");
		$("#scrap"+seq).replaceWith('<i class="fa fa-bookmark-o scrapNull" id="scrap'+seq+'" data-toggle="tooltip" title="스크랩" onclick="scrapFunc('+seq+')"></i>');
	}).fail(function(resp){
	});
}