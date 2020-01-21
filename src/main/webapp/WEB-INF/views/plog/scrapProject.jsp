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
		.card{width:200px;height:300px;margin: auto;;float :left;}
		.myprofile{float: left;width:200px;text-align:center;}
		#mycard{ float:none;display:flex;align-items:center;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
		.scraptwrap{background-color:white;border:1px solid #BDBDBD;}
		#page${page}{color:blue;}
		.coltheme{margin:30px;}
		.navi{text-align: center;}
        a:hover{text-decoration:none;}	
        .scrapnavi>div{height:50px;line-height:50px;}
        .scrapnavi>div>a{color:black;}
        .scrapnavi>div>a:hover{font-weight:bold;color:gray;}
        .scrapnavi{background-color: lightgray;border-radius:5px;margin-top:30px;width:200px;display:inline-block;border-right:1px solid gray;}	
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        #plogScrap{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:12px;}
        .btn-group>button{font-size:15px;}
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
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div>
	                    	<div class="card d-none d-md-block" id="mycard">
		                        <img src="${ownerInfo.profileImg }" class="card-img-top" alt="..." style="width: 85%;margin:7.5%;">
		                        <div class="card-body">
		                            <div class="card-title line-over" style="text-align: center;font-size:20px;margin-bottom:0px;">${ownerInfo.nickName} 님</div>
		                            <p class="card-text" style="text-align: center;font-size:18px;">POINT : <span style="font-size:15px;font-weight:bold;">${ownerInfo.point }</span></p>
		                        </div>
	                    	</div>
	                    	<div class="d-md-none" style="background-color:white;border-radius:5px;height:200px;border: 1px solid rgba(0,0,0,.125); padding:15px;margin-right:10px;">
	                    		<div style="float:left">
		                        	<img src="${ownerInfo.profileImg }" style="width:150px;margin:10px;">
	                    		</div>
		                        <div style="float:left;margin-top:100px;margin-left:20px;">
		                            <div class="line-over" style="text-align: center;font-size:20px;">${ownerInfo.nickName} 님</div>
		                            <p class="card-text" style="text-align: center;font-size:18px;">POINT : <span style="font-size:15px;font-weight:bold;">${ownerInfo.point }</span></p>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-8 col-lg-9 scraptwrap" style="min-height:600px;">
	    	 				<div class="btn-group" role="group" aria-label="Basic example" style="margin-top:20px;margin-bottom:20px;">
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/itNews.do'">IT 뉴스</button>
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/cohow.do'">코드 지식인</button>
								<button type="button" class="btn btn-flat btn-xs btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/industryStatus.do'">업계 현황</button>
								<button type="button" class="btn btn-flat btn-xs btn-secondary" onclick="location.href='${pageContext.request.contextPath}/Scrap/project.do'">프로젝트</button>
			           		</div>
			         	<div class="tableDiv">
							<div class="row tableHead">
							    <div class="col-2">모집상태</div>
							    <div class="col-7 col-lg-4">제목</div>
							    <div class="col-1" style="text-align:center;">지역</div>
							    <div class="col-lg-1 d-none d-lg-block">인원</div>
							    <div class="col-2">작성자</div>
							    <div class="col-2 d-none d-lg-block">작성일</div>					    
							</div>
						  	<c:choose>
						  		<c:when test="${plist.size()==0 }">
						  		<div class="row text-center tableBodyNull"><div class="col-12">스크랩한 글이 없습니다.</div></div>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${plist }" var="p">
						  				<div class="row tableBody p-0">
											<div class="col-2 ${p.state }" style="text-align:center;">${p.stateInKor }</div>
												<div  style="cursor:pointer;" class="col-7 col-lg-4 line-over text-decoration-none" onclick="location.href='${pageContext.request.contextPath}/project/detailView?seq=${p.seq }'">${p.title } 
							  						<c:if test="${p.commentCount>0 }">
							  							<span class="pComment font-weight-bold">${p.commentCount }</span>
							  						</c:if>					  					
												</div>
											<div class="col-1" style="text-align:center">${p.location1 }</div>
											<div class="col-lg-1 d-none d-lg-block">${p.capacity }명</div>
											<div class="col-2 line-over">
												<span style="cursor:pointer" onclick="popUp('${p.id}','${p.writer}')">
													${p.writer}
												</span>
											</div>
											<div class="col-2 d-none d-lg-block">${p.formedWriteDate }</div>
										</div>	
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>				    
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
        $(function(){
    		var element = $(".pageNavi");
    		var cpage = "${cpage}";
    		if(element.length != 0){
	    		if(cpage > 0 && cpage <= 10){
	    			element[cpage-1].classList.add('active');
	    		}else if(page % 10 == 0){
	    			element[10].classList.add('active');
	    		}else{
	    			element[cpage % 10].classList.add('active');
	    		}
    		}
    	});
        function popUp(id,writer){
    		if(writer == null){
    			alert("탈퇴한 회원입니다.");
    			return false;
    		}
    		else{
    			window.open("/Portfolio/toPlog.do?owner="+id, "pLogPopUp", "width=600,height=600");
    		}
          
         }
        </script>
</body>
</html>
