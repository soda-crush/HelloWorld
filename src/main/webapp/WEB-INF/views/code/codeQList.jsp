<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/themify-icons.css">
<link rel="stylesheet" href="/css/code/codeBase.css" type="text/css"/>

<script>
   $(function(){
      $("#codeNavi").attr('class','nav-item nav-link active');
   });
</script>

<style>
#pageTitle {
	margin-bottom: 20px;
}
a:hover {
	text-decoration: none;
}
#pageTitle h1 {
	display: inline;
	margin-right: 10px;
	font-weight: bold;
}
#pageTitle .btn{margin-left:5px;}
.tableDiv{border-radius:5px;}
.tableHead{
    font-size: 1rem;
    font-weight: bold;
    border-top: 1px solid #dee2e6;
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
    color: #495057;
    background-color: #e9ecef;
    border-color: #dee2e6;
}
.tableHead,.tableBody,.tableBodyNull{text-align:center;height: 50px;line-height: 50px;}
.tableBody div:nth-child(2){font-weight:bold;}
.tableBody div:nth-child(3){text-align:left;cursor:pointer;}   
.tableBody .N{color:limegreen;}
.tableBody .Y{color:red;}
.pComment{margin-left:3px;font-size:13px;color:orange;}    
.tableBody,.tableBodyNull div{
    font-size: 0.9rem;
    color: #212529;
    text-align: center;
    box-sizing: border-box;
    vertical-align: top;
    border-bottom: 1px solid #dee2e6;
    font-weight: normal;   
    background-color:white;    
}    
.tableHead div,.tableBody div{padding: 0;margin: 0;}
.tableBody:hover{background-color: #bfac8e30}
/* .pageListFooter{margin-top:20px;} */
.searchOption{margin-right:5px;}
#pPageNavi{margin-top:30px;}
.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link{
   color: white;
   font-size: 15px !important;
   line-height: 28px;
   border-bottom: 4px solid white;
}
 #baseBackgroundColor{
 background-color: #e8e8e890;
 }
 h5{
 	height:12px;
 }
 #footerSpace{
 	height:10px;
 }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor >
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent1></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class=container id="projectPage">
			<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom"><h1>Code-How</h1></td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">코드 관련해서 질문하고 답변하는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div id="pageTitle" class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;"><h1>Code-How</h1></div>
					<div style="font-size: 15px; color: gray;">코드 관련해서 질문하고 답변하는 게시판입니다.</div>
				</div>
			</div>
			
			<div class="tableDiv" style="min-height:250px;">
					<div class="row tableHead">					    
					    <div class="col-xl-1 d-none d-xl-block">글번호</div>
					    <div class="col-xl-1 col-3 col-md-2">구분</div>
					    <div class="col-xl-5 col-7 col-md-7" style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">제목</div>				    				    
					    <div class="col-xl-1 d-none d-xl-block">작성자</div>
					    <div class="col-xl-1 col-md-2 d-none d-md-block">포인트</div>	
					    <div class="col-xl-1 col-2 col-md-1">답변수</div>
					    <div class="col-xl-1 d-none d-xl-block">날짜</div>
					    <div class="col-xl-1 d-none d-xl-block">조회수</div>					    
					</div>
						<c:choose>
							<c:when test="${list.size()==0 }">
								<div class="row text-center tableBodyNull" style="height:220px;">
									<div class="col-12" style="line-height:220px;">
									작성된 글이 없습니다.
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="dto">
									<div class="row tableBody p-0">
										<div class="col-xl-1 d-none d-xl-block">${dto.seq}</div>
										<div class="col-xl-1 col-3 col-md-2" style="color:dodgerblue;">
<%-- 											<span class="badge badge-pill badge-success" style="margin: 10; width: 60px;">${dto.division}</span> --%>
											${dto.division}
										</div>
										<div class="col-xl-5 col-7 col-md-7" onClick="detailView(${dto.seq})">
											<div class="row">
											<div style="max-width:85%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">${dto.title}</div>												
											<%-- <span class="badge badge-pill badge-danger ml-1" style="height:20px; margin-top:15px;">${dto.newWriteDate}</span> --%>
											</div>
										</div>										
<!-- 										 <span class="badge badge-pill badge-info">실무자</span></td> -->		
										<div class="col-xl-1 d-none d-xl-block">									
											<span style="cursor:pointer" onclick="popUp('${dto.id}','${dto.writer}')">
												${dto.writer}
											</span>
							  			</div>
							  			<div class="col-xl-1 col-md-2 d-none d-md-block">
											${dto.point}
										</div> 								
										<div class="col-xl-1 col-2 col-md-1">
											<c:choose>
												<c:when test="${dto.replyCount==0 }">
													0
												</c:when>
												<c:otherwise>
													${dto.replyCount}
												</c:otherwise>
											</c:choose>
										</div>										
										<div class="col-xl-1 d-none d-xl-block">${dto.formedDate}</div>
										<div class="col-xl-1 d-none d-xl-block">${dto.viewCount}</div>
									</div>
									
								</c:forEach>
							</c:otherwise>
						</c:choose>
		</div>
		<br>
		<div>
				<c:if test="${sessionScope.loginInfo.id!=null }">	
					<div class="text-right">
						<a class="btn btn-primary" role="button" id="write" style="color:white;">글쓰기</a>
					</div>
				</c:if>
		
				<nav aria-label="List navi">
					<ul class="pagination justify-content-center">
						<c:forEach items="${pageNavi}" var="navi">									
							<li id="page-navi" class="page-item pageNavi">${navi}</li>
						</c:forEach>
					</ul>
				</nav>
<!-- 검색 -->
							<form action="${pageContext.request.contextPath}/code/codeSearch.do" method="get" id="frm">
							<div class="form-group row mt-1 mb-1 justify-content-center">
									<div class="col-sm-2 my-1 p-0 pl-1 pr-1">
	                                <select class="form-control form-control-sm" name="value">
	                                	<option value="all">전체</option>
	                                	<option value="division">구분</option>
	                                    <option value="title">제목</option>
	                                    <option value="writer">작성자</option>
	                                </select>
	                                </div>
	                                <div class="col-sm-8 my-1 pl-1 pr-1">
									<input type="text" class="form-control form-control-sm" name="search" maxlength=100 placeholder="검색어를 입력하세요(100자이내)">
									</div>
									<div class="col-sm-2 my-1 p-0 pl-1 pr-1 text-center">
										<button class="btn btn-primary btn-xs btn-block" id="search" style="height:30px; text-align:center; line-height:0px;">검색</button>
									</div>
							</div>
							</form>
			</div>
		</div>
			<div class=container>
				<div class=row>
					<div class="col-12" id=aroundContent></div>
				</div>
			</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
			<!--       몸통 끝!!!   -->

<!-- 			<div class=container> -->
<!-- 				<div class=row> -->
<!-- 					<div class="col-12" id=aroundContent></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<c:if test="${list.size()!=0 }">	
	<script>
		$(function(){
			var element = $(".pageNavi");
			var page = "${page}";
			if(page > 0 && page <= 10){
				element[page-1].classList.add('active');
			}else if(page % 10 == 0){
				element[10].classList.add('active');
			}else{
				element[page % 10].classList.add('active');
			}	
		});
	</script>
</c:if>
	
<script>
	
// 		$.ajax({
// 	        url : "/code/memLevel.do",
// 	        type : "post",
// 	        dataType : "json",
// 	        data : {
// 	           id : "${sessionScope.loginInfo.id}"	           
// 	        }
// 	     }).done(function(resp){
// 	        if(resp > 1){
// 	           location.href="/code/codeQWrite.do";   
// 	        }else{
// 	           alert("권한이 없습니다. 관리자에게 문의하세요.")
// 	           return false;
// 	        }    
// 	     }).fail(function(resp){
// 	        console.log("실패");
// 	     })

		
	$("#write").on("click",function(){
		if("${sessionScope.loginInfo.memLevel}" == 1){
			alert("권한이 없습니다. 관리자에게 문의하세요.");
			return false;
		}
		else{
			 location.href="/code/codeQWrite.do";
		}
	})
	
	$("#search").on("click",function(){
		$("frm").submit();
	})
	
	function detailView(seq){
		location.href="${pageContext.request.contextPath}/code/codeDetail.do?seq="+seq;
	}
	
	//닉네임 눌렀을때 새창 띄우기
	function popUp(id,writer){
		if(writer == null){
			alert("탈퇴한 회원입니다.");
			return false;
		}
		else{
			window.open("/Portfolio/toPlog.do?owner="+id, "pLogPopUp", "width=800,height=800");
		}
      
     }
</script>
</body>
</html>	