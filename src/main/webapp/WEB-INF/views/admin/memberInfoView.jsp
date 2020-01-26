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
.main-content-inner{
	padding: 30px 15px 30px;
}
.profileImg{
	width:80px;
	height:80px;
}
</style>
</head>
<body>
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- preloader area end -->     
        <!-- main content area start -->
        <div class="main-content">       
            <div class="main-content-inner">
                <!-- MAIN CONTENT GOES HERE -->
                        <div class="card">
                        	<c:choose>
                        		<c:when test="${dto.phone == null}">
                        			<script>
                        				alert("탈퇴한 회원입니다.");
                        				window.close();
                        			</script>
                        		</c:when>
                        		<c:otherwise>
		                            <div class="card-body">
		                                <div class="media mb-5">
		                                    <img class="img-fluid mr-4 profileImg" src="${dto.profileImg}" alt="image">
		                                    <div class="media-body">
		                                        <h4 class="mb-3">${dto.nickName}(${dto.id })</h4>	
		                                        <button type="button" class="btn btn-flat btn-outline-primary btn-xs pt-1 pb-1" id="plogModify">Plog 공개 여부 변경하기</button>			
											</div>
		                                </div>
		                                
		                                <div class="single-table">
		                                    <div class="table-responsive">
		                                        <table class="table text-center">
		                                            <thead class="text-uppercase bg-light">
		                                                <tr>
		                                                    <th scope="col">가입일</th>
		                                                    <th scope="col">최종방문일</th>
		                                                    <th scope="col">성별/나이</th>
		                                                    <th scope="col">활동점수</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                                <tr>
		                                                    <th scope="row">${dto.formedJoinDate}</th>
		                                                    <td>${dto.formedLastLogin}</td>
		                                                    <td>${dto.formedGender}/${dto.age}</td>
		                                                    <td>${dto.point}</td>
		                                                </tr>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
										<hr>
										<form action="${contextPath.request.contextPath}/admin/memberModify?id=${dto.id}" method="post">
											<div class="form-group">
												<label for="exampleInputEmail1">이메일 주소</label>
												<input type="email" class="form-control" id="email" placeholder="Enter email" value="${dto.email}" name="email">
												<label class="col-12 pt-1" id="emailResult"></label>
											</div>
											<div class="form-group">
												<label for="exampleInputPassword1">휴대전화</label>
												<input type="text" class="form-control" id="phone" placeholder="- 를 빼고 숫자만 입력해주세요" value="${dto.phone}" name="phone">
												<label class="col-12 pt-1" id="phoneResult"></label>
											</div>
											<div class="text-center">
											<button type="submit" class="btn btn-primary mt-4 pr-4 pl-4" id="modifyBtn">수정하기</button>
											<button type="button" class="btn btn-secondary mt-4 pr-4 pl-4" id="cancelBtn">취소</button>
											</div>
										</form>
									</div>                        		
                        		</c:otherwise>
                        	</c:choose>                       
                        </div>
		</div>
        </div>
        <!-- main content area end -->

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
	$("#cancelBtn").on("click",function(){
		window.close();
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
    
    $("#phone").on("focusout", function(){
    	var data = $("#phone").val();
    	var regex = /^01\d\d{3,4}\d{4}$/g;
    	var result = regex.exec(data);
    	
    	if(result == null){
    		$("#phone").css("border", "1px solid red");
    		$("#phoneResult").html("<p class='text-danger'><small>올바른 전화번호가 아닙니다. 다시 확인해주세요.</small></p>");
    	}else{
    		$("#phone").css("border", "1px solid green");
    		$("#phoneResult").html("<p class='text-success'><small>사용가능한 전화번호 입니다.</small></p>");
    	} 
    })
    
    $("#modifyBtn").on("click", function(){
    	var emailResult = $("#emailResult").children("p").css("color");
    	var phoneResult = $("#phoneResult").children("p").css("color");
    	
    	if($("#email").val() == ""){
    		alert("이메일을 입력해주세요");
    		return false;
    	}else if($("#phone").val() == ""){
    		alert("휴대전화 번호를 입력해주세요");
    		return false;
    	}else{
        	if(emailResult == "rgb(220, 53, 69)"){
        		alert("올바른 이메일을 입력해주세요");
        		return false;
        	}else if(phoneResult == "rgb(220, 53, 69)"){
        		alert("사용 가능한 전화번호를 입력해주세요");
        		return false;
        	}    		
    	}
    })
    
    $("#plogModify").on("click", function(){
		var result = confirm("Plog 공개설정을 변경할까요?");
			if(result){
   				$.ajax({
   					url : "${pageContext.request.contextPath}/admin/ifmOpenModify",
   					type : "post",
   					data : {
   						id : "${dto.id}",
   					}
   				}).done(function(resp){
					alert(resp);
   				});
			}	    	
    })
    </script>
</body>
</html>