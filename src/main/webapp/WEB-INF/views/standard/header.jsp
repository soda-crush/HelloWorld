<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <div class=container>
  <c:choose>
			<c:when test="${loginInfo.id ==null}">
			 <div class="row" id="loginCon">
                <div class="col-12 text-right"><a href="${pageContext.request.contextPath}/member/login">로그인</a> 
                | <a href="${pageContext.request.contextPath}/member/signUp">회원가입</a></div>
            </div>
			</c:when>
			<c:otherwise>
			 <div class="row" id="loginCon">
                <div class="col-12 text-right"><p style="display:inline">${sessionScope.loginInfo.nickName}님 환영합니다 Lv.${sessionScope.loginInfo.memLevel}</p>&emsp;<a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a> | <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></div>
            </div>
			</c:otherwise>
	</c:choose>
            
            <div class="row">
                <div class = "d-none d-md-block col-md-2"></div>
                <div class = "col-12 col-md-8" id = "logoCon">
                    <br>
                    <img src="/img/logo7.PNG" id="logo">
                    <br><br>
                </div>
                <div class = "d-none d-md-block col-md-2 text-muted"></div>
            </div>
        </div>

        <nav class="navbar navbar-expand-md navbar-light" style="background-color: #2c2255;margin-bottom:0px;">
          <a class="navbar-brand" href="#"></a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
   				 <span class="navbar-toggler-icon"></span>
  			</button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">

                <div class="navbar-nav box text-center" id="naviCon">
                    <a id="bambooNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/bamboo/bambooList.do">대나무숲</a>
                    <a id="codeNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/code/codeQList.do">코드지식인</a>
                    <a id="indusNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/industry/industryStatusList.do">업계현황</a>
                    <a id="itNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/itnews/itnewsList">IT 뉴스</a>
                    <a id="proNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/project/list">프로젝트</a>
                    <a id="plogNavi" class="nav-item nav-link" href="${pageContext.request.contextPath}/Portfolio/toPlog.do?owner=${loginInfo.id}">P-log</a>
                </div>
            </div>
        </nav>
        <script>
        	$("#logo").on("click",function(){
        		location.href = "${pageContext.request.contextPath}/";
        	})
        	$("#logout").on("click",function(){
        		var result = confirm("정말 로그아웃 하시겠습니까?");
        		if(result){
        			location.href="${pageContext.request.contextPath}/member/logout";
        		}
        	})
        </script>