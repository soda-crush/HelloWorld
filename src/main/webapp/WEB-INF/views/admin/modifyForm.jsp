<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/adFavicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/metisMenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/typography.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/default-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/adRsc/css/responsive.css">
<!-- modernizr css -->
<script src="${pageContext.request.contextPath }/adRsc/vendor/modernizr-2.8.3.min.js"></script>
<style>
#guest #plogLogo{
	display:block;
}

#guest #plogLogoActive{
	display:none;
}

.metismenu #guest:hover #plogLogo, .metismenu #guest.active #plogLogo {
	display:none;
}

.metismenu #guest:hover #plogLogoActive, .metismenu #guest.active #plogLogoActive {
	display:block
}
	.notification-area {
		text-align:right;
	}
	.card{
		max-width: 800px;
	}	
</style>
</head>
<body>
	<!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <!-- sidebar menu area start -->
        <jsp:include page="/WEB-INF/views/standard/adminSidebar.jsp"/>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <jsp:include page="/WEB-INF/views/standard/adminHeader.jsp"/>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">정보변경</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>정보변경</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="${pageContext.request.contextPath }/adRsc/images/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Administrator <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/logout">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
			<!-- MAIN CONTENT GOES HERE -->              
            	<!-- basic form start -->
				<div class="col-12 mt-5">
                	<div class="card">
                    	<div class="card-body">
                        	<h4 class="header-title">정보 변경하기</h4>
                            <form action="${pageContext.request.contextPath }/admin/modifyInfo" method="post">
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <div class="row pl-3 pr-3">
                                    <input type="password" class="form-control col-12 col-md-6" id="password" placeholder="Password" name="password" required>
                                    <label class="col-12 col-md-6 pt-1" id="pwResult"></label>
                                    </div>
                               	</div>
                                <div class="form-group">
                                	<label for="passwordCheck">비밀번호 확인</label>
                                	<div class="row pl-3 pr-3">
                                   	<input type="password" class="form-control col-12 col-md-6" id="passwordCheck" placeholder="Password Check" required>
                                   	<label class="col-12 col-md-6 pt-1" id="pwCheckResult"></label>
                                   	</div>
                                </div>
                                <div class="form-group mb-0">
                                	<label for="exampleInputEmail1">이메일 주소</label>
                                	<div class="row pl-3 pr-3">
                                    <input type="text" class="form-control col-12 col-md-6" id="email" aria-describedby="emailHelp" placeholder="Enter Email" name="email"
                                    value="${email}" required>     
                                    <label class="col-12 col-md-6 pt-1" id="emailResult"></label>       
                                    </div>                                   
                               	</div>           
                                <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4" id="btn">변경하기</button>
							</form>
						</div>
                  	</div>
				</div>
				<!-- basic form end -->       
            </div>      
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <jsp:include page="/WEB-INF/views/standard/adminFooter.jsp"/>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
   
    <!-- jquery latest version -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- bootstrap 4 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slicknav.min.js"></script>

    <!-- others plugins -->
    <script src="${pageContext.request.contextPath }/adRsc/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/scripts.js"></script>
    <script>
    $("#modify").addClass("active");
    
    $("#password").on("focusout", function(){
    	var data = $("#password").val();
    	var regex = /^[a-zA-z0-9]{4,12}$/;
    	var result = regex.exec(data);
    	
    	if(result == null){
    		$("#password").css("border", "1px solid red");
    		$("#pwResult").html("<p class='text-danger'><small>4~12자의 영문 대/소문자, 숫자만 사용 가능</small></p>");
    	}else{
    		$("#password").css("border", "1px solid green");
    		$("#pwResult").html("<p class='text-success'><small>사용 가능한 비밀번호</small></p>");
    	}
    })
    
    $("#passwordCheck").on("click", function(){
    	if($("#password").val() == ""){
    		alert("비밀번호를 먼저 입력해주세요");
    		$("#password").focus();
    	}
    })
    
    $("#passwordCheck").on("keyup", function(){
    	var pw = $("#password").val();
    	var pwCheck = $("#passwordCheck").val()
    	if(pw == pwCheck){
    		$("#passwordCheck").css("border", "1px solid green");
    		$("#pwCheckResult").html("<p class='text-success'><small>비밀번호가 일치합니다</small></p>");
    	}else{
    		$("#passwordCheck").css("border", "1px solid red");
    		$("#pwCheckResult").html("<p class='text-danger'><small>비밀번호가 일치하지않습니다.</small></p>");
    	}    	
    })
    
    $("#password").on("keyup", function(){
    	if($("#passwordCheck").val() != ""){
        	var pw = $("#password").val();
        	var pwCheck = $("#passwordCheck").val()
        	if(pw == pwCheck){
        		$("#passwordCheck").css("border", "1px solid green");
        		$("#pwCheckResult").html("<p class='text-success'><small>비밀번호가 일치합니다</small></p>");
        	}else{
        		$("#passwordCheck").css("border", "1px solid red");
        		$("#pwCheckResult").html("<p class='text-danger'><small>비밀번호가 일치하지않습니다.</small></p>");
        	}
    	}
    })
    
    $("#email").on("focusout", function(){
    	var data = $("#email").val();
    	var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/g;
    	var result = regex.exec(data);
    	
    	if(result == null){
    		$("#email").css("border", "1px solid red");
    		$("#emailResult").html("<p class='text-danger'><small>올바른 이메일이 아닙니다. 다시 확인해주세요.</small></p>");
    	}else{
    		$("#email").css("border", "1px solid green");
    		$("#emailResult").html("<p class='text-success'><small>사용가능한 이메일 입니다.</small></p>");
    	}    	
    })
    
    $("#btn").on("click", function(){
    	var pwResult = $("#pwResult").children("p").css("color");
    	var pwCheckResult = $("#pwCheckResult").children("p").css("color");
    	var emailCheckResult = $("#emailResult").children("p").css("color");
		
    	if($("#password").val() == ""){
    		alert("비밀번호를 입력해주세요");
    		return false;
    	}else if($("#passwordCheck").val() == ""){
    		alert("비밀번호가 일치하는지 확인해주세요");
    		return false;
    	}else if($("#email").val() == ""){
    		alert("이메일을 입력해주세요");
    		return false;
    	}else{
        	if(pwResult == "rgb(220, 53, 69)"){
        		alert("비밀번호 양식을 확인해주세요");
        		return false;
        	}else if(pwCheckResult == "rgb(220, 53, 69)"){
        		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
        		return false;
        	}else if(emailCheckResult == "rgb(220, 53, 69)"){
        		alert("올바른 이메일이 아닙니다. 다시 확인해주세요");
        		return false;
        	}        		
    	}	
    })
    
    </script>
</body>
</html>