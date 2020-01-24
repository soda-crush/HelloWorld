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
	div{
/*       	border: 1px solid green;           */
	}
	#cateCmt{
	color:gray;
	font-size: 15px;
	}
	#cateTitle{
		font-size:60px;
	}
	.tableHead{
 		height: 50px; 
		background-color:#e9ecef;
		border-top: 1px solid #dadde0;
		border-bottom: 1px solid #dadde0;
	}
	.tableBody{
		background-color:#ffffff;
		border-top: 1px solid #dadde0;
		border-bottom: 1px solid #dadde0;
	}
	.tableBody:hover{
		background-color:#bfac8e30;
	}
	.tableBody *{
		font-size: 13px;
		color:#4d4d4d;
	}
	.tableBody div{
		height:50px;
	}
	#cate{
	height: 38px;
	border-radius: 6%;
	position:relative;
	top:2px;
	}
	#search{
	height: 38px;
	border-radius: 6%;
	border:1px solid #a8a8a8;
	position:relative;
	top:2px;
	}
	#titleForCss{
	font-size: 16px;
	}
	.orangeFt{
		font-size: 12px;
		color:orange;
	}
 #aroundContent1{ 
  	height: 100px; 
 } 
  #aroundContent{ 
  	height: 150px; 
 } 
 #baseBackgroundColor{
 background-color: #e8e8e890;
 min-height:680px;
 }
 
</style>

<script>
	$(function(){
		$("#itNavi").attr('class','nav-item nav-link active');
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent1>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
 			<div class="container">
 			
				<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100; vertical-align: text-bottom"><h1 class="fontBold" onclick='location.href="${pageContext.request.contextPath}/itnews/itnewsList"'>IT News</h1></td>
								<td></td>
								<td style="font-size: 15px; color: gray; vertical-align: text-bottom">     IT 핫이슈를 공유하는 공간입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;"><h1 class="fontBold">IT News</h1></div>
					<div style="font-size: 15px; color: gray;">IT 핫이슈를 공유하는 공간입니다.</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<p style="font-size:3px;"></p>
				</div>
			</div>
					<div class="row p-0">					    
					    <div class="tableHead d-none col-md-1 d-md-block text-center p1-0 pr-0" style="padding-top:12px;">번호</div>
					    <div class="tableHead d-none col-md-6 d-md-block text-center" style="padding-top:12px;">제목</div>
					    <div class="tableHead d-none col-md-2 d-md-block text-center" style="padding-top:12px;">작성자</div>
					    <div class="tableHead d-none col-md-2 d-md-block text-center" style="padding-top:12px;">작성일</div>
					    <div class="tableHead d-none col-md-1 d-md-block text-center p1-0 pr-0" style="padding-top:12px;">조회</div>				    
					</div>
					
				  	<c:choose>
				  		<c:when test="${list.size()==0 }">
				  		<div class="row"><div class="col-12 text-center" style="height: 150px;line-height: 150px;">작성된 글이 없습니다.</div></div>
				  		</c:when>
				  		<c:otherwise>
				  			<c:forEach items="${list}" var="dto">
				  				<div class="row p-0 tableBody" >
									<div class="col-md-1 d-none d-md-block order-md-1 notTitle text-center pt-3">${dto.seq}</div>
					    			<div class="col-12 col-md-6 order-1 order-md-2 cursorPointer pl-3 pr-3" style="padding-left:0px;padding-right:0px;"  onclick="location.href='${pageContext.request.contextPath}/itnews/detail?seq=${dto.seq}&page=${page}'">
						    		<div class=row>
						    			<div style="max-width:90%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;padding-top:10.8px;padding-left:5px;padding-right:5px;" class="fontBold" id=titleForCss>${dto.title}</div>

						    			<c:if test="${dto.commentCount>0}">
						    			<div style="display:inline;"><p class="orangeFt font-weight-bolder" style="position:relative;top:14px;">${dto.commentCount}</p></div>
						    			</c:if>
					    			</div>
					    			</div>
					    			<div class="col-4 col-md-2 order-2 order-md-3 notTitle text-left text-md-center pt-3 pl-3 pr-0 cursorPointer" onclick="popUp('/Portfolio/toPlog.do?owner=${dto.id}&other=Y')">${dto.writer}</div>
					    			<div class="col-3 col-md-2 order-3 order-md-4 notTitle text-left text-md-center pt-3">${dto.getDate()}</div>
					    			<div class="col-1 col-md-1 order-4 order-md-5 notTitle text-left text-md-center pt-3">${dto.viewCount}</div>
								</div>
				  			</c:forEach>
				  		</c:otherwise>
				  	</c:choose>				    
				
				<form action="${pageContext.request.contextPath}/itnews/searchList" method="get">
					<div class="row" style="position:relative;top:10px;">
						<div class="col-12 col-md-10" style="position:relative;left:-15px;"> 
							<select id=cate name=cate>
								<option value="cateAll">전체</option>
								<option value="cateTitle">제목</option>
								<option value="cateWriter">작성자</option>
							</select>
							<input type="text" name="search" id=search placeholder="검색어를 입력하세요(20자 이내)" maxlength="20">
							<button class="btn btn-secondary" id=searchBtn>검색</button>
						</div>
						<div class="col-12 col-md-2 text-right pt-1">
							<c:if test="${loginInfo!=null}">
							<a class="btn btn-primary text-white" id=writeBtn role="button">글쓰기</a>	
							</c:if>
							<h5><br></h5>
						</div>
					</div>
				</form>
				
				<div class=row>
					<div class="col-12"><nav aria-label="List navi" id="pPageNavi" style="position:relative;top:7px;">${navi}</nav></div>
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
        function popUp(link){
            window.open(link, "pLogPopUp", "width=600,height=600");
         }
        $(".pNavi${page}").addClass("active");
        
        $("#writeBtn").on("click",function(){
        	if(${loginInfo.memLevel==1}){
        		alert("권한이 없습니다. 관리자에게 문의하세요.");
        	}else{
        		location.href="${pageContext.request.contextPath}/itnews/write?page=${page}";
        	}
        })
        
        </script>
</body>
</html>
