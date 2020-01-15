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
	.notification-area {
		text-align:right;
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
                            <h4 class="page-title pull-left">모니터링</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>모니터링</span></li>
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
</body>
</html>