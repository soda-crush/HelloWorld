<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<div class=container>
<%-- 	 	<c:choose> --%>
<%-- 			<c:when test="${loginInfo.id ==null}"> --%>
<!-- 			<div class="row" id="loginCon"> -->
<!-- 	        	<div class="col-12 text-right"> -->
<%-- 	        		<a href="${pageContext.request.contextPath}/member/login">로그인</a>  --%>
<%-- 	        		<a href="${pageContext.request.contextPath}/member/signUp">회원가입</a></div> --%>
<!-- 	            </div> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
				<div class="row" id="loginCon">
	            	<div class="col-12">
		            	<div style="float:left">
		            		<a href="${pageContext.request.contextPath}/">메인으로 </a>
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
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</div>

	<nav class="navbar navbar-expand-md navbar-light" style="background-color: #f7941e;margin-bottom:0px;">
		<div style="margin-left:20px;" class="navbar-brand">
			<div style="display:inline;font-size:20px;">P -</div>
			<div style="color:#3b2e72;display:inline;font-size:20px;">Log</div>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav" id="naviCon">
				<a class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do">포트폴리오</a>
				<a class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Plog/toPlogCohow.do">지식인</a>
				<a class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Scrap/itNews.do">내 스크랩</a>
				<a class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/Plog/toPlogProject.do">내 프로젝트</a>
				<a class="nav-item nav-link" style="color:black" href="${pageContext.request.contextPath}/GuestBook/selectList.do">방명록</a>
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	