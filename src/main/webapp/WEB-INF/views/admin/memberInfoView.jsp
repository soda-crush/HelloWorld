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
                            <div class="card-body">
                                <div class="media mb-5">
                                    <img class="img-fluid mr-4 profileImg" src="${dto.profileImg}" alt="image">
                                    <div class="media-body">
                                        <h4 class="mb-3">${dto.nickName}(${dto.id })</h4>				
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
										<label for="exampleInputEmail1">Email address</label>
										<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" value="${dto.email}" name="email">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Phone</label>
										<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter phone number" value="${dto.phone}" name="phone">
									</div>
									<div class="text-center">
									<button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">수정하기</button>
									<button type="button" class="btn btn-secondary mt-4 pr-4 pl-4" id="cancelBtn">취소</button>
									</div>
								</form>

							</div>
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
    </script>
</body>
</html>