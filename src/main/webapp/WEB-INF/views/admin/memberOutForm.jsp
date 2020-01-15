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
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/adRsc/images/icons/favicon.ico"/>
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
<!-- jquery latest version -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.main-content-inner{
	padding: 30px 15px 30px;
}
.profileImg{
	width:60px;
	height:60px;
}
#nickName{
	font-size:25px;
	vertical-align:middle;
}
textarea{
	position:relative;
	height:50px;
	top:-15px;
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
				<div class="card-body pb-0">
					<div class="media">
						<div class="row">
							<div class="col-3 text-center">
								<img class="img-fluid profileImg" src="${dto.profileImg}" alt="image">
							</div>
							<div class="col-9">
								<div class="row">
								<div class="col-12" id="nickName"><strong>${dto.nickName}(${dto.id })</strong></div>
								<div class="col-12"><small>탈퇴사유를 선택하지 않으시면 강퇴가 불가능합니다.</small></div>
								</div>							
							</div>
						</div>
					</div>
					<hr>
				</div>
				<form action="${pageContext.request.contextPath}/admin/memberOut" method="post" class="col-12">
					<div class="form-group m-0">
                    <div class="custom-control custom-radio pb-2">
                    	<input type="radio" id="radio1" name="reason" class="custom-control-input"
                    	value="성인/도박 등 불법광고 및 스팸활동">
                    	<label class="custom-control-label" for="radio1" id="this">성인/도박 등 불법광고 및 스팸활동</label>
                   	</div>
                    <div class="custom-control custom-radio pb-2">
                    	<input type="radio" id="radio2" name="reason" class="custom-control-input"
                    	value="바람직하지 않은 활동(광고, 도배 등)">
                    	<label class="custom-control-label" for="radio2">바람직하지 않은 활동(광고, 도배 등)</label>
                   	</div>
                    <div class="custom-control custom-radio pb-2">
                    	<input type="radio" id="radio3" name="reason" class="custom-control-input"
                    	value="Hello World 자체 운영 원칙에 위배되는 활동">
                    	<label class="custom-control-label" for="radio3">Hello World 자체 운영 원칙에 위배되는 활동</label>
                   	</div>                  	                   	                   	
                    <div class="custom-control custom-radio pb-2">
                    	<input type="radio" id="radio4" name="reason" class="custom-control-input" value="etc">
                    	<label class="custom-control-label col-12" for="radio4"></label>
                    	<textarea class="form-control pt-0" aria-label="With textarea" id="etcReason" placeholder="기타  사유를 입력해주세요"
                    	disabled></textarea>                    	
                   	</div>    	
					</div>
					<input type="hidden" value="${dto.id}" name="id">
					<input type="hidden" id="submitData" name="etcReason">
					<hr class="mt-0">
					<div class="text-center mb-4">
						<button type="button" class="btn btn-primary" id="out">강퇴하기</button>
						<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$("input:radio[name=reason]").on("click", function(){
			var reasonVal = $("input:radio[name=reason]:checked").val();
			if(reasonVal == "etc"){
				$("#etcReason").attr("disabled", false);
			}else{
				$("#etcReason").attr("disabled", true);
			}
		})
		
		$("#out").on("click", function(){
			var reason = $("input:radio[name=reason]:checked").val();
			if(reason == null){
				alert("탈퇴 사유를 선택해주세요");
				return false;
			}else{
				var reasonVal = $("input:radio[name=reason]:checked").val();
				if(reasonVal == "etc"){
					$("#submitData").val($("#etcReason").val());
					if($("#submitData").val() == ""){
						alert("탈퇴 사유를 입력해주세요");
						return false;
					}
				}
			}
			$("form").submit();
		})
	</script>
	<!-- main content area end -->


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
    </script>
</body>
</html>