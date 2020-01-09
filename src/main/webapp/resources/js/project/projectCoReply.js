$(document).on("click","#coReplyBtn",function(){  
	var html = [];
	html.push(
//	'<i class="fa fa-mail-reply"></i>'
//			'<div class="row commentDiv commentBox${c.seq } coLevel${c.depth } p-0 pb-2">',
//			'<div class="col-12 commentInnerBox">',
//			'<div class="row commentContent">',
//			'<div class="col-12 pt-1 pl-4"><textarea></textarea></div>',
//			'</div></div></div>'
			'<div id="pCoReplyInput" class="row commentDiv commentBox p-0 pt-2 pb-2">',
			'<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="답글 내용을 입력해주세요" id="pCoReplyContents"></textarea></div>',
			'<div class="col-3 col-lg-2">',
			'<div class="row">',
			'<div class="col-12">',
			'<button type="button" class="btn btn-secondary" style="margin-bottom:10px;margin-top:10px;" id="coReplyCancel">취소</button>',
			'</div>',										
			'</div>',
			'<div class="row">',
			'<div class="col-12">',
			'<button type="button" class="btn btn-warning" id="coReplyWriteBtn">작성</button>',
			'</div>',										
			'</div>',								
		    '</div>',
			'</div>'
		);
	$(this).closest('.commentDiv').append(html.join(""));
});//답댓기능.