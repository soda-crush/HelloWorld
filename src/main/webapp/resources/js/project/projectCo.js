function commentRecall(resp){
	var loginInfo = "${sessionScope.loginInfo}";
for(var i=0;i<resp.length;i++){
	var html = [];
	html.push(
			'<div class="row commentDiv commentBox'+resp[i].seq+' p-0 pb-2 m-2"><div class="col-12"><div class="row">',
			'<div class="col-1 profileBox pl-1 pt-2"><img src="/img/profileSample.jpg" class="rounded mx-auto d-block" style="width:40px;height:40px;"></div>',
			'<div class="col-7 pt-1"><div class="row commentInfo">',
			'<div class="col-12 commentWriter">'+resp[i].writer+'</div>',
			'<div class="col-12 commentWriteDate">'+resp[i].formedWriteDate+'</div></div></div>',
			'<div class="col-4 pt-2 text-right commentBtns">',
			'<button type="button" class="btn btn-warning coReplyBtn">답글</button>\n'
			);
	if(resp[i].writer==loginInfo){
		html.push(
				'<button type="button" class="btn btn-info coModBtn">수정</button>\n',
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