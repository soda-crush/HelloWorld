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
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>
	<style>
		.card{width:200px;height:300px;margin: auto;float :left;}
		.myprofile{margin-bottom:30px;float: left;width:200px;text-align:center;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		.scraptwrap{background-color:white;border: 1px solid rgba(0,0,0,.125);}
		.coltheme{margin:30px;font-weight:bold;}
		.navi{text-align: center;}
        a:hover{text-decoration:none;}
        .tableBody{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        #plogCohow{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
        #writer:hover{color:orange;}
        #writer2:hover{color:orange;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
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
		                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 85%;margin:7.5%;">
		                        <div class="card-body">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;font-weight:bold;margin-bottom:0px;">${ownerInfo.nickName} <span style="font-size:15px;">님</span></div>
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
	                <div class="col-12 col-md-8 col-lg-9 cohowwrap" style="min-height:700px;">
	                	<div class="tableDiv">
	                		<div class="coltheme"> 내 질문</div>
							<div class="row tableHead">
								<div class="col-2 col-lg-1">구분</div>
							    <div class="col-7 col-lg-5">제목</div>
							    <div class="col-3">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>	
							    <div class="col-1 d-none d-lg-block">조회수</div>					    
							</div>
							
						  	<c:choose>
						  		<c:when test="${qlist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">내가 질문한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${qlist }" var="dto">
						  				<div class="row tableBody p-0">
						  					<div class="col-2 col-lg-1" style="color:dodgerblue;">${dto.division}</div>
											<div class="col-7 col-lg-5 " >
							  					<div style="cursor:pointer;text-align:left;" class="line-over text-decoration-none pl-2" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">${dto.title} 
								  					<c:if test="${dto.replyCount>0 }">
								  						<span class="pComment font-weight-bold">${dto.replyCount}</span>
								  					</c:if>	
							  					</div>				  					
											</div>
											<div class="col-3" style="text-align:center;" id="writer">
												<div class="line-over">
													<span style="cursor:pointer" onclick="popUp('${dto.id}','${dto.writer}')">
														${dto.writer}
													</span>
												</div>
											</div>
											<div class="col-2 d-none d-lg-block">${dto.scrapDate}</div>
											<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>
										</div>	
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
						</div>
						<div style="float:left;width:100%;margin-top:15px;">
		                	<nav aria-label="List navi">
								<ul class="pagination justify-content-center">
									<c:forEach items="${qpageNavi}" var="navi">									
										<li id="page-navi" class="page-item qpageNavi">${navi}</li>
									</c:forEach>
								</ul>
							</nav>
		                </div>
	               		<div class="tableDiv">
	                		<div class="coltheme"> 내 답변</div>
							<div class="row tableHead">
								<div class="col-2 col-lg-1">구분</div>
							    <div class="col-7 col-lg-5">제목</div>
							    <div class="col-3">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>	
							    <div class="col-1 d-none d-lg-block">조회수</div>					    
							</div>
							
						  	<c:choose>
						  		<c:when test="${rlist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">내가 답변한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${rlist }" var="dto">
						  				<div class="row tableBody p-0">
						  					<div class="col-2 col-lg-1" style="color:dodgerblue;">${dto.division}</div>
											<div class="col-7 col-lg-5 " >
							  					<div style="cursor:pointer;text-align:left;" class="line-over text-decoration-none pl-2" onclick="location.href='${pageContext.request.contextPath}/code/codeDetail.do?seq=${dto.seq}'">${dto.title} 
								  					<c:if test="${dto.replyCount>0 }">
								  						<span class="pComment font-weight-bold">${dto.replyCount}</span>
								  					</c:if>	
							  					</div>				  					
											</div>
											<div class="col-3" style="text-align:center;" id="writer2">
												<div class="line-over">
													<span style="cursor:pointer" onclick="popUp('${dto.id}','${dto.writer}')">
														${dto.writer}
													</span>
												</div>
											</div>
											<div class="col-2 d-none d-lg-block">${dto.scrapDate}</div>
											<div class="col-1 d-none d-lg-block">${dto.viewCount}</div>
										</div>
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
						</div>
						<div style="float:left;width:100%;margin-top:15px;">
		                	<nav aria-label="List navi">
								<ul class="pagination justify-content-center">
									<c:forEach items="${rpageNavi}" var="navi">									
										<li id="page-navi" class="page-item rpageNavi">${navi}</li>
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
	    	$(function(){
	    		var element = $(".qpageNavi");
	    		var qcpage = "${qcpage}";
	    		if(element.length != 0){
	    			if(qcpage > 0 && qcpage <= 5){
		    			element[qcpage-1].classList.add('active');
		    		}else if(qcpage % 5 == 0){
		    			element[5].classList.add('active');
		    		}else{
		    			element[qcpage % 5].classList.add('active');
		    		}
	    		}
	    	});
	    	$(function(){
	    		var element = $(".rpageNavi");
	    		var rcpage = "${rcpage}";
	    		
	    		if(element.length != 0){
	    			if(rcpage > 0 && rcpage <= 5){
		    			element[rcpage-1].classList.add('active');
		    		}else if(rcpage % 5 == 0){
		    			element[5].classList.add('active');
		    		}else{
		    			element[rcpage % 5].classList.add('active');
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
        </script>
</body>
</html>
