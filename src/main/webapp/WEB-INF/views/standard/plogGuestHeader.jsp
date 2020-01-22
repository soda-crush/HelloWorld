<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<div class=container>
				<div class="row" id="loginCon">
	            	<div class="col-12">
		            	<div style="float:left;cursor:pointer;" onClick="location.href='${pageContext.request.contextPath}/'">
		            		<img src="/img/pavicon.png" style="height:14px;">
		            		<a>메인으로 </a>
		            	</div>
		            	<div style="float:right">
			            	<div style="float:right">
				            	<a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a> |
				            	<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			            	</div>
			            	<div style="float:right" class="d-none d-sm-block"><p style="display:inline">${sessionScope.loginInfo.nickName}님 환영합니다 Lv.${sessionScope.loginInfo.memLevel}</p>&emsp;</div>
		            	</div>
		            </div>
		    	</div>
	</div>

	<nav class="navbar navbar-expand-md navbar-light" style="background-color: #f7941e;margin-bottom:0px;">
		<div style="margin-left:20px;cursor:pointer;" class="navbar-brand" onClick="location.href='${pageContext.request.contextPath}/Portfolio/toPlogmain.do'">
			<div style="display:inline;font-size:20px;">P -</div>
			<div style="color:#3b2e72;display:inline;font-size:20px;">Log</div>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav" id="naviCon">
				<a id="plogPortfolio" class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Portfolio/toGuestPlogmain.do">포트폴리오</a>
				<a id="plogProject" class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Plog/toGuestProject.do">프로젝트</a>
				<a id="plogGuestBook" class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/GuestBook/toGuestSelectList.do">방명록</a>
			</div>
		</div>
	</nav>
	<script>
		$(".logo").on("click",function(){
			location.href = "${pageContext.request.contextPath}/Portfolio/toPlogmain.do";
		})
		$("#logout").on("click",function(){
			var result = confirm("정말 로그아웃 하시겠습니까?");
			if(result){
				location.href="${pageContext.request.contextPath}/member/logout";
			}
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	