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
<style>
/* 	#pageTitle{margin-bottom:20px;} */
/* 	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;} */
/* 	#pageTitle .btn{margin-left:5px;} */
/* 	.pComment{margin-left:3px;font-size:13px;color:orange;} */
/* 	a:hover{text-decoration:none;} */
	
	
/* 	.pageNavi{ */
/* 		text-align:center; */
/* 	} */
/* 	#titleForCss a{ */
/* 		color:black; */
/* 		font-size: 17px; */
/* 	} */
/* 	.notTitle{ */
/* 		color:gray; */
/* 		font-size: 15px; */
/* 		text-align: center; */
/* 	} */
/* 	.tableHead{ */
/* 		background-color:#499ed6; */
/* 		color:white; */
/* 	} */
</style>
<script>
   $(function(){
      $("#bambooNavi").attr('class','nav-item nav-link active');
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
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom">대나무숲</td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     자유롭게 익명으로 글을 남기는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;">대나무숲</div>
					<div style="font-size: 15px; color: gray;">자유롭게 익명으로 글을 남기는 게시판입니다.</div>
				</div>
			</div>
           
           		<div class="tableDiv">
            	   	 <div class="row tableHead">					    
		   			 	<div class="col-xl-1 d-none d-xl-block">번호</div>
				   	 	<div class="col-xl-6 col-8 col-md-5">제목</div>
				   	 	<div class="col-xl-2 col-2 col-md-1">작성자</div>
				    	 <div class="col-xl-2 col-2 col-md-2 col-lg-1">작성일</div>
				  	 	<div class="col-xl-1 col-md-4 d-none d-md-block">조회수</div>		
				  	 </div>
          	    	 <c:choose>
				  		<c:when test="${bambooList.size()==0 }">
				  			<div class="row tableBodyNull"><div class="col-12">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${bambooList }" var="b">
				  				<div class="row tableBody p-0">
				  					<div class="col-md-1 d-none d-md-block order-md-1 notTitle">${b.seq }</div>
				  					<div class="col-12 col-md-6 order-1 order-md-2" id=titleForCss>
				  						<div class="row">
				  						<div style="width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;">
				  							<a href="/bamboo/bambooDetailView.do?seq=${b.seq }" style="font-weight:bold;">${b.title}</a>			
				  						</div>
				  						<c:if test="${b.commentCount>0 }">
				  								<div class="pComment font-weight-bold ml-2" style="display:inline-block;">${b.commentCount }</div>
				  							
				  						</c:if>
				  						</div>		
				  						
				  					</div>
				  					<div class="col-2 col-md-2 order-2 order-md-3 notTitle text-center">
				  					<c:choose>
            							<c:when test="${b.writer == sessionScope.loginInfo.id}">
            								${sessionScope.loginInfo.nickName}
            							</c:when>
            							<c:otherwise>
            								익명
            							</c:otherwise>
            						</c:choose>
				  					</div>	
				  					<div class="col-2 col-md-2 order-3 order-md-4 notTitle">${b.formedWriteDate }</div>
				  					<div class="col-1 col-md-1 order-4 order-md-5 notTitle">${b.viewCount }</div>
				  					<div class="col-7 order-5 d-md-none"></div>	
				  				</div>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>
          	    </div>
    			<div class="row pageListFooter">
    			<div class="col-6">
					<form class="form-inline" action="/bamboo/bambooSearch.do" method="post">
					<select name=value class="form-control searchSelect" id="searchOption" style="margin-right:5px;">
						<option value="all">전체(제목+내용)</option>
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
				url : "/bamboo/memLevel.do",
				type : "post",
				dataType : "json",
				data : {
					id : "${sessionScope.loginInfo.id}"
				}
			}).done(function(resp){
				if(resp > 1){
					location.href="/bamboo/bambooWrite.do";
				}else{
					alert("권한이 없습니다. 관리자에게 문의하세요.")
					return false;
				}
				
			}).fail(function(resp){
				console.log("실패");
			})
		})
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
</html>