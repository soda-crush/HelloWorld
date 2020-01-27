<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
	<style>
   		*{spellcheck="false"}
        .card{width:200px;height:300px;margin:auto;float:left;}
        .myprofile{margin-bottom:30px;float: left;padding-right:0px;}
        #mycard{float:none;display:flex;align-items:center;}
        .commentwrite{width:100%; height:100px;padding: 0px;margin-top: 10px;float: left;}
        .commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
        .col{margin: 0px; padding: 0px;}
        .content{height:90%;float: left;resize: none;}
        .sendbt{height:90%;float: left;}
        .commentlist>div>div{margin-right: 5px;}
        #commentForm{height:100%;}
        .commentwrap{border-radius:5px;padding: 15px;background-color:white;border: 1px solid rgba(0,0,0,.125);}
        textarea{resize:none;}
    	a:hover{text-decoration:none;}
        .message{background-color:white;margin:10px;width:100%;height:100%;border:0px;}
        .listwrap{margin: 10px; padding:5px;}
    	.line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
    	.interval{width:100%;background-color:lightgray;border-radius: 8px;height:1px;margin-left:15px;}
        #plogGuestBook{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
        #writer:hover{color:orange;}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogGuestHeader.jsp"/>
 		<div id="plogBaseBackgroundColor">
            <div class=container>
                <div class=row>
                    <div class="col-12" id=plogAroundContent>
                    </div>
                </div>
            </div>         
            <div class="container">
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div>
	                    	<div class="card d-none d-md-block" id="mycard">
		                        <img src="${otherInfo.profileImg }" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
		                        <div class="card-body">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;font-weight:bold;margin-bottom:0px;">${otherInfo.nickName} <span style="font-size:15px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:12px;">POINT <span style="font-size:15px;font-weight:bold;">${point }</span></p>
		                        </div>
	                    	</div>
	                    	<div class="d-md-none" style="background-color:white;border-radius:5px;height:200px;border: 1px solid rgba(0,0,0,.125); padding:5px;margin-right:10px;">
	                    		<div style="float:left">
		                        	<img src="${ownerInfo.profileImg }" style="width:150px;margin:10px;">
	                    		</div>
		                        <div style="float:left;margin-top:100px;margin-left:20px;">
	                            <div class="card-title line-over" style="text-align: center;font-size:17px;font-weight:bold;margin-bottom:0px;">${ownerInfo.nickName} <span style="font-size:12px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:10px;">POINT <span style="font-size:13px;font-weight:bold;">${point }</span></p>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 commentwrap" style="min-height:500px;">
	
	
	                    <div class="commentwrite">
	                    	<form action="${pageContext.request.contextPath}/GuestBook/insert.do" method="post" id="commentForm">
	                    		<input type="hidden" name="other" value="Y">
		                        <div class="row"></div>
		                        <textarea maxlength="1300" class="col-10 content" placeholder="내용을 입력해주세요" name="content" id="content"></textarea>
		                        <button class="col-2 btn btn-outline-dark sendbt" id="sendbt" type="button" >작성</button>
	                    	</form>	
	                    </div>
	                    <div class="commentlist row">
	                    	<c:forEach items="${list}"  var="dto">
	                    		<div class="interval"> </div>
	                    		<div class="listwrap col-12">
			                		<div>
			                			<div style="float:left;">
			                				<img src="${dto.writerImg }" style="width:50px;">
			                			</div>
			                			<div style="float:left;margin-left:10px;">
				                            <div id="writer">
				                            	<span style="cursor:pointer;font-size:20px;font-weight:bold;" onclick="popUp('${dto.writerID}','${dto.writer}')">
													${dto.writer}
												</span>
												<span style="color:gray;font-size:12px;">${dto.getDate()}</span>
											</div>
			                			</div>
			                            <textarea id="list${dto.seq }" class="message" onkeydown="resize(this)" onkeyup="resize(this)" maxlength="1300" readonly >${dto.content }</textarea>
			                  		</div>
			                        <c:choose>
										<c:when test="${dto.writer == loginInfo.nickName}">
											<div style="text-align:right">
												<c:choose>
													<c:when test = "${dto.writerID == loginInfo.id || dto.ownerID == loginInfo.id }">
														<button id="update${dto.seq}" class="btn btn-outline-dark" onclick="update(${dto.seq})" style="visibility:hidden;">수정완료</button>
														<button id="toModify${dto.seq }" class="btn btn-outline-dark" onclick="modify(${dto.seq})">수정</button>
													</c:when>
												</c:choose>
												<button class="btn btn-outline-danger" id="delete" onclick="del(${dto.seq},${cpage})">삭제</button>
					                        </div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
	                    </div>
	                <div style="float:left;width:100%;margin-top:15px;">
	                	<nav aria-label="List navi">
							<ul class="pagination justify-content-center">
								<c:forEach items="${pageNavi}" var="navi">									
									<li id="page-navi" class="page-item pageNavi">${navi}</li>
								</c:forEach>
							</ul>
						</nav>
	                </div>
					
	                </div>

	            </div>
            </div>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script>
        	
        
        	function update(seq){
        		var content = $('#list'+seq).val();
        		$.ajax({
        			url: "${pageContext.request.contextPath}/GuestBook/update.do",
	  				type: "POST",
	  				data: {
	  					content : content,
	  					seq : seq
	  				},
        		}).done(function(){
            		$('#list'+seq).prop('readonly', true);
            		$('#update'+seq).attr('style','visibility:hidden');
            		$('#toModify'+seq).attr('style','visibility:visible');
            		var resizeList = document.getElementsByClassName("message");
            		for(var i=0 ; i<resizeList.length;i++){
            			resize(resizeList[i]);
            		}
        		}).fail(function(){
        			alert("실패하였습니다.");
        		})
        		
        	}
        
        	function modify(seq){
        		$('#list'+seq).prop('readonly', false);
        		$('#update'+seq).attr('style','visibility:visible');
        		$('#toModify'+seq).attr('style','visibility:hidden');
        		var resizeList = document.getElementsByClassName("message");
        		for(var i=0 ; i<resizeList.length;i++){
        			resize(resizeList[i]);
        		}
        		var focustext = document.getElementById('list'+seq);
        		focustext.focus();
        		focustext.setSelectionRange(focustext.value.length,focustext.value.length);
        	}
        	
        	function del(seq,cpage){
        		if(confirm("정말 삭제하시겠습니까?")){
        			location.href='${pageContext.request.contextPath}/GuestBook/delete.do?seq='+seq+'&cpage='+cpage;
        		}
        	}
        	
        	$(function(){
        		var resizeList = document.getElementsByClassName("message");
        		for(var i=0 ; i<resizeList.length;i++){
        			resize(resizeList[i]);
        		}
        	})
       		function resize(obj) {
        	  obj.style.height = "1px";
        	  obj.style.height = (12+obj.scrollHeight)+"px";
        	}
	    	$(function(){
	    		var element = $(".pageNavi");
	    		var cpage = "${cpage}";
	    		if(element.length != 0){
	    			if(cpage > 0 && cpage <= 5){
		    			element[cpage-1].classList.add('active');
		    		}else if(cpage % 5 == 0){
		    			element[5].classList.add('active');
		    		}else{
		    			element[cpage % 5].classList.add('active');
		    		}	
	    		}
	    	});
	    	function popUp(id,writer){
	    		if(writer == null){
	    			alert("탈퇴한 회원입니다.");
	    			return false;
	    		}
	    		else{
	    			window.open("/Portfolio/toPlog.do?owner="+id+"&other=Y", "pLogPopUp", "width=600,height=600");
	    		}
	          
	         }
	    	$("#sendbt").on("click",function(){
	    		if($("#content").val()==""){
	    			alert("내용을 작성해주세요");
	    		}else{
		    		$("#commentForm").submit();
	    		}
	    	})
        </script>
</body>
</html>
