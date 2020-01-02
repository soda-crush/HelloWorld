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
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<style>
	.arrow{
		width:12px;
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
            <form action="${pageContext.request.contextPath}/member/signUpProc">
            <div class="container eleCon">
            
            <div class="row">
            	<div class="col-12">
            		<h4><br></h4>
            		<h3><img src="/icon/whiteArrow.svg">회원가입</h3>
           		</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>아이디</h5>
            		&emsp;<input type=text name=id id=id placeholder="아이디 입력">
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class="col-12 col-sm-6">
            	<h5><img src="/icon/arrow.svg" class=arrow>비밀번호</h5>
            		&emsp;<input type=text name=pw id=pw placeholder="비밀번호 입력">
            	</div>
            	<div class="col-12 col-sm-6">
            	<h5><img src="/icon/arrow.svg" class=arrow>비밀번호 확인</h5>
            		&emsp;<input type=text name=pwRe id=pwRe placeholder="비밀번호 재입력">
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<input type=radio name=empCheck value=unemployee class=emp><h5 style="display:inline">비실무자</h5>
            	</div>
            	<div class=col-12>
            		<br>
            		<input type=radio name=empCheck value=employee class=emp><h5 style="display:inline">실무자</h5>
            		<hr>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div id=empEle style="display:none;">
            	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5 style="display:inline;"><img src="/icon/doubleArrow.svg" class=arrow>회사 메일</h5>
		            	<p style="display:inline;">- 일반 메일일 경우  비실무자로 가입됩니다.</p>
		            		&emsp;<br>&emsp;<input type=text name=empEmail id=empEmail placeholder="메일 주소 입력">
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5><img src="/icon/doubleArrow.svg" class=arrow>인증 코드</h5>
		            		&emsp;<input type=text name=empCode id=empCode placeholder="인증 코드 입력">
	            	</div>
           		 </div>
            </div>
            <div id=unempEle style="display:none">
             	<div class=row>
	            	<div class="col-12 col-sm-6">
		            	<h5><img src="/icon/doubleArrow.svg" class=arrow>개인 메일</h5>
		            		&emsp;<input type=text name=unempEmail id=unempEmail placeholder="메일 주소 입력">
	            	</div>
	            	<div class="col-12 col-sm-6">
		            	<h5><img src="/icon/doubleArrow.svg" class=arrow>인증 코드</h5>
		            		&emsp;<input type=text name=unempCode id=unempCode placeholder="인증 코드 입력">
	            	</div>
           		 </div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/doubleArrow.svg" class=arrow>개인정보 공개여부</h5>
            		&emsp;Programming Log(포트폴리오, Ko-How, 프로젝트 참여현황)를 타인이 열람하는 것에 동의합니다.<br>
            		&emsp;비동의 하실경우 Programmming Log에서 프로필 정보만 공개됩니다.<br>
            		&emsp;동의합니다.<input type="checkbox" name="ifmOpenCheck" id="ifmOpenCheck">
            	</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>닉네임</h5>
            		&emsp;<input type=text name=nickName id=nickName placeholder="닉네임 입력">
            	</div>
            </div>
              <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>주소</h5>
            		&emsp;<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
            		<input type="button" onclick="sample4_execDaumPostcode()" value="찾기"><br>
            		&emsp;<input type="text" id="addr1" name=addr1 placeholder="도로명주소">
            		<input type=text name=addr2 id=addr2 placeholder="상세주소">
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>가입 경로</h5>
            		&emsp;<input type=radio name=joinPath value="지인 추천">지인 추천<br>
            		&emsp;<input type=radio name=joinPath value="'Hello World!' 검색">'Hello World!' 검색<br>
            		&emsp;<input type=radio name=joinPath value="'프로젝트 모집' 검색">'프로젝트 모집' 검색<br>
            		&emsp;<input type=radio name=joinPath value="">기타
            		<input type="text" placeholder="사유를 입력해주세요" id=otherJoinPath name=otherJoinPath><br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<br>
            	</div>
            </div>
            <div class=row>
            	<div class=col-12>
            		<h5><img src="/icon/arrow.svg" class=arrow>성별</h5>
            		&emsp;<input type=radio name="gender" value="men">여성<br>
            		&emsp;<input type=radio name="gender" value="women">남성
            	</div>
            </div>
             <div class=row>
            	<div class=col-12>
            		<h1><br></h1>
            	</div>
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
        
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
        //실무자 비실무자 체크
	        $("input:radio[name=empCheck]").click(function(){
	            if($("input:radio[name=empCheck]:checked").val()=='employee'){
	                $("#empEle").css("display","block");
	                $("#unempEle").css("display","none");
	            }else if($("input:radio[name=empCheck]:checked").val()=='unemployee'){
	            	$("#unempEle").css("display","block");
		            $("#empEle").css("display","none");
	            }
	        });
        //우편번호 api
        
         function sample4_execDaumPostcode() {
        		new daum.Postcode({
            		oncomplete: function(data) {
                		var roadAddr = data.roadAddress;
                		document.getElementById('postcode').value = data.zonecode;
                		document.getElementById("addr1").value = roadAddr;
            		}
        		}).open();
    		}
        
        
        </script>
</body>
</html>
