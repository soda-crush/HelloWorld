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
.input1{
	width:100%;
}
button{
	width:60px;
	height: 60px;
}
#kakaoLogin{
	background-color: #f1c40f;
}
.aT{
	font-size: 14px;
	color: #858585;
}
.aT:hover{
	font-size: 14.6px;
	color: black;
	text-decoration: none;
}
 #aroundContent1{ 
  	height: 140px; 
 } 
 h4{
 color:black;}
  #baseBackgroundColor{
 background-color: #e8e8e890;
 }
</style>
</head>
<body>
	<c:choose>
		<c:when test="${result==false}">
			<script>
				alert("아이디 혹은 비밀번호가 일치하지 않습니다. 다시시도하여 주십시오.");
			</script>
		</c:when>
	</c:choose>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent1>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <form action="${pageContext.request.contextPath}/member/loginProc" method="post">
            <div class=container style="min-height: 350px;">
            	<div class="row">
            	<div class="col-md-1 d-none d-md-block order-md-1"></div>
            		<div class="col-12 col-md-5 order-1 order-md-2 pl-5">
	            		<img src="/icon/blackArrow.svg"><h4 style="display:inline;position:relative;top:3.5px;left:10px;" class=fontBold>로그인</h4>
	            		<div class="row">
	            			<div class="col-8">
	            				<br>
	            				<input type="text" name="id" id="id" class="input1" placeholder="아이디 입력"><br>
	            				<input type="password" name="pw" id="pw" class="input1" placeholder="비밀번호 입력"><br>
	            				<p style="color:black;display:inline;">아이디를 기억합니다.</p> <input type="checkbox" id="remID">
	            				<input type="text" name="noMemPath" value="${noMemPath}" style="display:none">
	            				<input type="text" name="seq" value="${seq}" style="display:none">
	            			</div>
	            			<div class="col-2">
	            			<br>
	            			<button id=login class=fontBold>로그인</button>
	            			</div>
	            			<div class="col-2">
	            			<br>
	            			</div>
	            		</div>
            		</div>
            		<div class="col-md-1 d-none d-md-block order-md-3"></div>
            		<div class="col-12 col-md-4 order-2 order-md-4 pt-5 pt-md-0 pl-5">
            			<img src="/icon/whiteArrow.svg"><h4 style="display:inline;position:relative;top:3.5px;left:10px;" class=fontBold>처음이신가요?</h4>
            			<br>
            			<a class="aT" href="${pageContext.request.contextPath}/member/signUp" style="position:relative;left:35px;">회원가입</a>
            			<h3><br></h3>
            			<img src="/icon/whiteArrow.svg"><h4 style="display:inline;position:relative;top:3.5px;left:10px;" class=fontBold>기억이 나지 않으신가요?</h4>
            			<br>
            			<a class="aT" href="${pageContext.request.contextPath}/member/findId" style="position:relative;left:35px;">아이디</a><p style="display:inline;position:relative;left:35px;">ㆍ</p>
            			<a class="aT pl-0" href="${pageContext.request.contextPath}/member/findPw" style="position:relative;left:30px;">비밀번호 찾기</a>
            		</div>
            	<div class="col-md-1 d-none d-md-block order-md-5"></div>
            	</div>
            </div>
            </form>
            
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
        	//아이디 기억
        		//객체생성
	            function cookieAsJSON(){
	                var cookieJSON ={};
	                var cookie = document.cookie;
	                var trimedCookie = cookie.replace(/ /g,""); 
	                var entryArr = trimedCookie.split(";");
	                for(var i = 0 ; i < entryArr.length;i++){
	                    var entry = entryArr[i].split("=");
	                    cookieJSON[entry[0]] = entry[1];
	                 }
	                return cookieJSON;
	            }
	            
	            //로딩이 끝나는 순간
	            $(function(){
	                if(document.cookie != ""){
	                    var cookie = cookieAsJSON();
	                    var id = cookie.id;
	                    if(id != "" && id != null){
	                    	$("#id").val(id);
		                    $("#remID").prop("checked","true");
	                    }  
	                }
	            })
	                 
	            
        	
        	//로그인 전 유효성 검사(빈칸인지 아닌지만)
        		$("#login").on("click",function(){
        			var id = $("#id").val();
        			var pw = $("#pw").val();
        			
        			if((id == "")&&(pw == "")){
        				alert("아이디와 비밀번호를 입력하세요.");
        				return false;
        			}else if(id == ""){
        				alert("아이디를 입력하세요.");
        				return false;
        			}else if(pw == ""){
        				alert("비밀번호를 입력하세요.");
        				return false;
        			}else{
        				  var exDate = new Date();
        				 if($("#remID").prop("checked")){
        					 
        					 //로그인하는 순간 체크 되어있으면 아이디 쿠키에 저장
        					 exDate.setDate(exDate.getDate() + 30);
        						
      	                    var id = $("#id").val();
      	                    document.cookie = 
      	                        "id = " + id + ";expires=" + exDate.toString();
        				 }else{
        					 exDate.setDate(exDate.getDate() -1);
     	                    document.cookie = "id =;expires=" + exDate.toString();
        				 }
        				
        				location.href="member/loginProc";
        			}
        		})
        	
        </script>
</body>
</html>