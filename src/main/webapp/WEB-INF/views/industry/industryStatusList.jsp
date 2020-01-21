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
<link rel="stylesheet" href="/css/industry/industryBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/industry/list.css" type="text/css"/>
<style>
 #baseBackgroundColor{
 min-height:680px;
 }
</style>
<script>
   $(function(){
      $("#indusNavi").attr('class','nav-item nav-link active');
   });
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <div class=container id="projectPage">
				<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom"><h1>업계현황</h1></td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     업계현황에 대한 정보를 나누는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
				<div id="pageTitle">
					<div style="font-size: 60px; font-weight: 100;"><h1>업계현황</h1></div>
					<div style="font-size: 15px; color: gray;">업계현황에 대한 정보를 나누는 게시판입니다.</div>
				</div>
				</div>
			</div>
				<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
            	<div class="tableDiv">
				  	 <div class="row tableHead">					    
		   			 	<div class="col-xl-1 col-2 col-md-1 d-xl-block">번호</div>
					    <div class="col-xl-1 col-md-1 d-none d-md-block">분야</div>
					    <div class="col-xl-1 col-md-1 d-none d-xl-block">직무</div>
					    <div class="col-xl-1 col-md-1 d-none d-md-block"></div>
					    <div class="col-xl-4 col-7 col-md-6">제목</div>
					    <div class="col-xl-1 col-3 col-md-2">작성자</div>
					    <div class="col-xl-2 d-none d-xl-block">작성일</div>
					    <div class="col-xl-1 d-none d-xl-block">조회수</div>
				  	 </div>
            		 <c:choose>
				  		<c:when test="${industryStatusList.size()==0 }">
				  		<div class="row tableBodyNull" style="height:200px;">
				  		<div class="col-12" style="line-height:200px;">작성된 글이 없습니다.</div>
				  		</div>
				  		
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${industryStatusList }" var="i">
				  				<div class="row tableBody p-0">
				  					<div class="col-xl-1 col-2 col-md-1 d-xl-block notTitle">${i.seq }</div>
				  					
									<div class="col-xl-1 col-md-1 d-none d-md-block notTitle" style="font-weight:normal">${i.field}</div>
				  					<div class="col-xl-1 col-md-1 d-none d-xl-block notTitle text-center" style="cursor:default;font-size:12px;">${i.duty}</div>
				  					<div class="col-xl-1 col-md-1 d-none d-md-block"></div>
				  					<div class="col-xl-4 col-7 col-md-6" id=titleForCss>
				  					<div class="row cursorPointer" onclick="location.href='/industry/industryStatusDetailView.do?seq=${i.seq}'">
				  					<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;font-weight:bold;">
				  						${i.title }
				  					</div>	
				  					
				  					<c:if test="${i.commentCount>0 }">
				  						
				  							<div class="pComment font-weight-bold ml-1" style="display:inline-block;margin-top:1px;">${i.commentCount }</div>
				  						
				  					</c:if>
				  					</div>
				  					</div>
				  					<div class="col-xl-1 col-3 col-md-2 notTitle text-center">
				  					<small style="cursor:pointer" onclick="popUp('${i.id}','${i.writer}')">${i.writer }</small>
				  					</div>
				  					<div class="col-xl-2 d-none d-xl-block notTitle">${i.formedWriteDate }</div>
				  					<div class="col-xl-1 d-none d-xl-block notTitle">${i.viewCount }</div>
				  					
				  				</div>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>
            	</div>
            	<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
            		<div class="row pageListFooter">
    				<div class="col-12 order-2 order-lg-1 col-lg-10">
					<form class="form-inline" action="/industry/industrySearch.do" method="post">
					<select name=value style="margin-right:5px;" class="form-control searchSelect" id="searchOption">
						<option value="all">전체(제목+내용)</option>
						<option value="field">분야</option>
						<option value="duty">직무</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
					</select>
					<input class="form-control mr-sm-2" type="text" name=search aria-label="Search" maxlength="100">
					<input class="btn btn-dark my-2 my-sm-0 ml-1" type="button" id=search value="검색">
					</form>
					</div>
				<div class="col-12 order-1 order-lg-2 col-lg-2 text-right">
					<button type="button" class="btn btn-primary" id="write">글쓰기</button>				
				</div>
				</div>
				<div class=row>
	            	<div class=col-12>
	            		<br>
	            	</div>
            	</div>
				<nav aria-label="List navi">
					<ul class="pagination justify-content-center">
						
						<c:forEach items="${pageNavi}" var="navi">									
							<li id="page-navi" class="page-item pageNavi">${navi}</li>
						</c:forEach>
						
					</ul>
				</nav>
			            
            </div>
				<div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            <!--       몸통 끝!!!   -->
            
<!--             <div class=container> -->
<!--                 <div class=row> -->
<!--                     <div class="col-12" id=aroundContent> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
        
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
</body>
		<script>
		$("#search").on("click",function(){
			$("form").submit();
		})
		$("#write").on("click",function(){
			if("${sessionScope.loginInfo.id}" == ""){
        		alert("로그인을 해주세요.");
        		return false;
        	}
			if("${sessionScope.loginInfo.memLevel}"==1){
				alert("권한이 없습니다. 관리자에게 문의하세요.");
				return false;
			}if("${sessionScope.loginInfo.memLevel}"==2){
				alert("권한이 없습니다. 재직자 인증을 해주세요.");
				return false;
			}else{
				location.href="/industry/industryStatusWrite.do";
			}
// 			$.ajax({
// 				url : "/industry/memLevel.do",
// 				type : "post",
// 				dataType : "json",
// 				data : {
// 					id : "${sessionScope.loginInfo.id}"
// 				}
// 			}).done(function(resp){
// 				if(resp > 2){
// 					location.href="/industry/industryStatusWrite.do";	
// 				}else{
// 					alert("권한이 없습니다. 관리자에게 문의하세요.")
// 					return false;
// 				}
				
// 			}).fail(function(resp){
// 				console.log("실패");
// 			})
		});
		</script>
		<c:if test="${industryStatusList.size() != 0}">
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
		//닉네임 눌렀을때 새창 띄우기
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
</html>