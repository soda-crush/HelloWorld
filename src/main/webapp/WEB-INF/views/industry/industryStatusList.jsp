<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/list.css" type="text/css"/>

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
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom">업계현황</td>
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
					<div style="font-size: 60px; font-weight: 100;">업계현황</div>
					<div style="font-size: 15px; color: gray;">업계현황에 대한 정보를 나누는 게시판입니다.</div>
				</div>
			</div>
				
            	<div class="tableDiv">
            		<div class="row tableHead">					    
		   			 	<div class="col-xl-1 d-none d-xl-block">번호</div>
					    <div class="col-xl-1 col-2 col-md-2">분야</div>
					    <div class="col-xl-1 col-2 col-md-1">직무</div>
					    <div class="col-xl-5 col-8 col-md-5">제목</div>
					    <div class="col-xl-1 col-lg-1 d-none d-lg-block">작성자</div>
					    <div class="col-xl-2 col-md-4 d-none d-md-block">작성일</div>
					    <div class="col-xl-1 d-none d-xl-block">조회수</div>	
				  	 </div>
            		 <c:choose>
				  		<c:when test="${industryStatusList.size()==0 }">
				  		<div class="row tableBodyNull"><div class="col-12">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${industryStatusList }" var="i">
				  				<div class="row tableBody p-0">
				  					<div class="col-1 col-md-1 d-none d-md-block order-md-1 notTitle">${i.seq }</div>
				  					
									<div class="col-1 col-md-1 d-none d-md-block order-md-1 notTitle">${i.field}</div>
				  					<div class="col-1 col-md-1 d-none d-md-block order-md-1 notTitle">${i.duty }</div>
				  					
				  					<div class="col-5 col-md-5 order-1 order-md-2" id=titleForCss>
				  					<div style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">
				  						<a href="/industry/industryStatusDetailView.do?seq=${i.seq }">${i.title } </a>
				  					</div>	
				  					<c:if test="${i.commentCount>0 }">
				  						
				  							<div class="pComment font-weight-bold ml-2" style="display:inline-block;">${i.commentCount }</div>
				  						
				  					</c:if>
				  					</div>
				  					<div class="col-2 col-md-2 order-2 order-md-3 notTitle text-center">
				  					<a href="/Portfolio/toPlog.do?owner=${i.id }">${i.writer }</a>
				  					</div>
				  					<div class="col-2 col-md-2 order-3 order-md-4 notTitle">${i.formedWriteDate }</div>
				  					<div class="col-1 col-md-1 order-4 order-md-5 notTitle">${i.viewCount }</div>
				  					
				  				</div>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>
            	</div>
            		<div class="row pageListFooter">
    				<div class="col-6">
					<form class="form-inline" action="/industry/industrySearch.do" method="post">
					<select name=value style="margin-right:5px;" class="form-control searchSelect" id="searchOption">
						<option value="all">전체(제목+내용)</option>
						<option value="field">분야</option>
						<option value="duty">직무</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
					</select>
					<input class="form-control mr-sm-2" type="text" name=search aria-label="Search" maxlength="100">
					<input class="btn btn-dark my-2 my-sm-0" type="button" id=search value="검색">
					</form>
					</div>
				<div class="col-6 text-right">
					<button type="button" class="btn btn-primary" id="write">글쓰기</button>				
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
            
            
         
<!--             <div class=container id="projectPage" style="background-color:white"> -->
<!-- 				<div id="pageTitle"> -->
<!-- 					<table> -->
<!-- 							<tr> -->
<!-- 								<td colspan="3" style="font-size: 60px; font-weight: 100;">업계현황</td> -->
<!-- 								<td></td> -->
<!-- 								<td style="font-size: 15px; color: gray;">     업계현황에 대한 정보를 나누는 게시판입니다.</td> -->
<!-- 								<td></td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 				</div>				 -->
<!-- 				<table class="table table-hover"> -->
<!-- 				  <thead class="thead-light"> -->
<!-- 				    <tr> -->
<!-- 				      <th scope="col">글번호</th> -->
<!-- 				      <th scope="col">분야</th> -->
<!-- 				      <th scope="col">직무</th> -->
<!-- 				      <th scope="col">제목</th> -->
<!-- 				      <th scope="col">작성자</th> -->
<!-- 				      <th scope="col">작성일</th> -->
<!-- 				      <th scope="col">조회수</th> -->
<!-- 				    </tr> -->
<!-- 				  </thead> -->
<!-- 				  <tbody> -->
<%-- 				  	<c:choose> --%>
<%-- 				  		<c:when test="${industryStatusList.size()==0 }"> --%>
<!-- 				  		<tr><td colspan="8">작성된 글이 없습니다.</td></tr> -->
<%-- 				  		</c:when> --%>
<%-- 				  		<c:otherwise> --%>
<%-- 				  			<c:forEach items="${industryStatusList }" var="i"> --%>
<!-- 				  				<tr> -->
<%-- 				  					<th scope="row">${i.seq }</th> --%>
<!-- 				  					<td><span class="badge badge-pill badge-success" -->
<%-- 											style="margin: 10; width: 60px;">${i.field}</span></td> --%>
<%-- 				  					<td><span class="badge badge-pill badge-primary">${i.duty }</span></td> --%>
<%-- 				  					<td><a href="/industry/industryStatusDetailView.do?seq=${i.seq }">${i.title }  --%>
<%-- 				  						<c:if test="${i.commentCount>0 }"> --%>
<%-- 				  							<span class="pComment font-weight-bold">${i.commentCount }</span> --%>
<%-- 				  						</c:if> --%>
<%-- 				  						<span class="badge badge-pill badge-danger">${i.newWriteDate}</span> --%>
<!-- 				  						</a> -->
<!-- 				  					</td> -->
<%-- 				  					<td><a href="/Portfolio/toPlog.do?owner=${i.id }">${i.writer }</a></td> --%>
<%-- 				  					<td>${i.formedWriteDate }</td> --%>
<%-- 				  					<td>${i.viewCount }</td> --%>
<!-- 				  				</tr> -->
<%-- 				  			</c:forEach> --%>
<%-- 				  		</c:otherwise> --%>
<%-- 				  	</c:choose>				     --%>
<!-- 				  </tbody> -->
<!-- 				</table> -->
<!-- 				<div class="text-left"> -->
<!-- 					<form action="/industry/industrySearch.do" method="post"> -->
<!-- 					<select name=value> -->
<!-- 						<option value="all">전체(제목+내용)</option> -->
<!-- 						<option value="field">분야</option> -->
<!-- 						<option value="duty">직무</option> -->
<!-- 						<option value="writer">작성자</option> -->
<!-- 						<option value="title">제목</option> -->
<!-- 					</select> -->
<!-- 					<input type="text" name=search> -->
<!-- 					<input type="button" id=search value="검색"> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 				<div class="text-right"> -->
<!-- 					<button type="button" class="btn btn-primary" id="write">글쓰기</button>				 -->
<!-- 				</div> -->
<!-- 				<nav aria-label="List navi"> -->
<!-- 					<ul class="pagination justify-content-center"> -->
						
<%-- 						<c:forEach items="${pageNavi}" var="navi">									 --%>
<%-- 							<li id="page-navi" class="page-item pageNavi">${navi}</li> --%>
<%-- 						</c:forEach> --%>
						
<!-- 					</ul> -->
<!-- 				</nav> -->
				
				
				
<!-- 				 <div class="card"> -->
<!--                             <div class="card-body"> -->
<!--                                 <nav aria-label="Page navigation example"> -->
<!--                                     <ul class="pagination justify-content-center"> -->
<%--                                     	<c:choose> --%>
<%--                                     		<c:when test="${pageNavi.size() > 0}"> --%>
<%-- 												<c:forEach items="${pageNavi}" var="navi">									 --%>
<%-- 													<li class="page-item pageNavi">${navi}</li> --%>
<%-- 												</c:forEach>                                    		 --%>
<%--                                     		</c:when> --%>
<%--                                     	</c:choose>  --%>
<!--                                     </ul> -->
<!--                                 </nav> -->
<!--                             </div> -->
<!--                         </div> -->
				
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
			
			$.ajax({
				url : "/industry/memLevel.do",
				type : "post",
				dataType : "json",
				data : {
					id : "${sessionScope.loginInfo.id}"
				}
			}).done(function(resp){
				if(resp > 2){
					location.href="/industry/industryStatusWrite.do";	
				}else{
					alert("실무자만 입력가능합니다.")
					return false;
				}
				
			}).fail(function(resp){
				console.log("실패");
			})
		});
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
// 		if("${pageNavi.size() > 0}"){
// 		var element = $(".pageNavi");
// 		var page = "${page}";
// 		if(page > 0 && page <= 10){
// 			element[page-1].classList.add('active');
// 		}else if(page % 10 == 0){
// 			element[10].classList.add('active');
// 		}else{
// 			element[page % 10].classList.add('active');
// 		}			
// 	}
		</script>
</html>