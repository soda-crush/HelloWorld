<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<style>
div{
	border: 1px solid green;
}
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
</style>
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
            
            <div class=container>
            	<div class="row">
            	<div class="col-1"></div>
            		<div class="col-5">
            		<h4>로그인</h4>
            		<div class="row">
            			<div class="col-8">
            				<input type="text" name="id" id="id" class="input1" placeholder="아이디 입력"><br>
            				<input type="text" name="pw" id="pw" class="input1" placeholder="비밀번호 입력"><br>
            				아이디를 기억합니다. <input type="checkbox" id="remID">
            			</div>
            			<div class="col-2">
            			<button id=login>로그인</button>
            			</div>
            			<div class="col-2">
            			<button id=kakaoLogin><span></span>로그인</button>
            			</div>
            		</div>
            		</div>
            		<div class="col-5">
            		
            		</div>
            	<div class="col-1"></div>
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
	                    $("#id").val(cookie.id);
	                    $("#remID").prop("checked","true");
	                    
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