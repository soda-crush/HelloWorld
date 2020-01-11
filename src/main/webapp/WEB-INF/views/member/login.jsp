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
	color: gray;
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
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <form action="${pageContext.request.contextPath}/member/loginProc" method="post">
            <div class=container>
            	<div class="row">
            	<div class="col-md-1 d-none d-md-block order-md-1"></div>
            		<div class="col-12 col-md-5 order-1 order-md-2">
	            		<img src="/icon/blackArrow.svg"><h4 style="display:inline">로그인</h4>
	            		<div class="row">
	            			<div class="col-8">
	            				<br>
	            				<input type="text" name="id" id="id" class="input1" placeholder="아이디 입력"><br>
	            				<input type="text" name="pw" id="pw" class="input1" placeholder="비밀번호 입력"><br>
	            				아이디를 기억합니다. <input type="checkbox" id="remID">
	            			</div>
	            			<div class="col-2">
	            			<br>
	            			<button id=login>로그인</button>
	            			</div>
	            			<div class="col-2">
	            			<br>
	            			</div>
	            		</div>
            		</div>
            		<div class="col-md-1 d-none d-md-block order-md-3"></div>
            		<div class="col-12 col-md-4 order-2 order-md-4">
            			&emsp;<img src="/icon/whiteArrow.svg"><h4 style="display:inline">처음이신가요?</h4>
            			<br>
            			&emsp;&emsp;<a class=aT href="${pageContext.request.contextPath}/member/signUp">회원가입</a>
            			<h1><br></h1>
            			&emsp;<img src="/icon/whiteArrow.svg"><h4 style="display:inline">기억이 나지 않으신가요?</h4>
            			<br>
            			&emsp;&emsp;<a class=aT href="${pageContext.request.contextPath}/member/findId">아이디</a>ㆍ
            			&emsp;&emsp;<a class=aT href="${pageContext.request.contextPath}/member/findPw">비밀번호 찾기</a>
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
	                    console.log("id:"+id+":");
	                    if(id != "" && id != null){
	                    	$("#id").val(id);
		                    $("#remID").prop("checked","true");
	                    }  
	                }
	            })
        		//체크하는 순간 인풋 내용을 쿠키에 저장
	            $("#remID").on("change",function(){
	                var exDate = new Date();
	                if($("#remID").prop("checked")){
	                    exDate.setDate(exDate.getDate() + 30);
	
	                    var id = $("#id").val();
	                    document.cookie = 
	                        "id = " + id + ";expires=" + exDate.toString();
	                }else{
	                    exDate.setDate(exDate.getDate() -1);
	                    document.cookie = "id =;expires=" + exDate.toString();
	                    //키값이 중요하니까 value는 비워도됨
	                }
	            })
        	
        	//로그인 전 유효성 검사(빈칸인지 아닌지만)
        		$("#login").on("click",function(){
        			var id = $("#id").val();
        			var pw = $("#pw").val();
        			
        			if((id == "")&&(pw == "")){
        				alert("아이디와 비밀번호를 입력하세요.");
        			}else if(id == ""){
        				alert("아이디를 입력하세요.");
        			}else if(pw == ""){
        				alert("비밀번호를 입력하세요.");
        			}else{
        				location.href="member/loginProc";
        			}
        		})
        	
        </script>
</body>
</html>