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
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
<style>
	.notification-area {
		text-align:right;
	}
	#chartdiv {
  width: 100%;
  height: 500px;
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
                <!-- 1st report area start -->
                <div class="visitor-area mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-4">
                        <!-- today / total -->
                            <div class="col-12 mt-0 mb-3">
                                <div class="card">
                                <div class="card-body">
                                    <div class="seo-fact sbg1 mb-5">
                                        <div class="p-4 d-flex justify-content-between align-items-center">
                                            <div class="seofct-icon"><i class="ti-thumb-up"></i> TODAY</div>
                                            <h2>${count.today}</h2>                                        </div>
                                        
                                    </div>   
                                    
                                   	<div class="seo-fact sbg2">
                                        <div class="p-4 d-flex justify-content-between align-items-center">
                                            <div class="seofct-icon"><i class="ti-bar-chart"></i> TOTAL</div>
                                            <h2>${count.total}</h2>
                                        </div>
                                    </div> 
                                    
                                </div>
                                </div>
                            </div>                     
                        </div>
                        <div class="col-md-8">
		                        <div class="card col-12">
		                            <div class="card-body">
		                                <div class="d-flex justify-content-between align-items-center">
		                                    <h4 class="header-title mb-0">방문자수 추이</h4>
		                                </div>
		                                <div id="visitChange"></div>
		                            </div>
		                        </div>
                        </div>                       
                    </div>
                </div>
                <!-- 1st report area end -->   
                
               	<!-- 2nd report area start -->
                <div class="visitor-area mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-8">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <div class="d-flex justify-content-between align-items-center">
		                                    <h4 class="header-title mb-0">TOP 5 Member List(point)</h4>
		                                </div>
		                                <div id="chartdiv"></div>
		                            </div>
		                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12">
		                        <div class="card h-full">
		                            <div class="card-body">
		                                <h4 class="header-title mb-0">Hello World! 성별비율</h4>
		                                <div id="genderRatio"></div>
		                            </div>
		                        </div>
		                    </div>
                        </div>                       
                    </div>
                </div>
                <!-- 2nd report area end -->    
               	<!-- 3rd report area start -->
                <div class="visitor-area mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-6">
		                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="col-12">
                                	<h4 class="header-title">새 게시글/삭제된 게시글 수(최근 5일간)</h4>
                                </div>                                 
                                <div id="ambarchart3"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-6">
		                    <div class="col-12 coin-distribution">
		                        <div class="card">
		                            <div class="card-body">
		                                <div class="col-12">
		                                	<h4 class="header-title">새 댓글/삭제된 댓글 수(최근 5일간)</h4>
		                                </div>     		                            
		                                <div id="ambarchart6"></div>
		                            </div>
		                        </div>
		                    </div>
                        </div>                       
                    </div>
                </div>
                <!-- 3rd report area end -->    
                                          
               	<!-- 4th report area start -->
                <div class="visitor-area mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-4">
							<div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <div class="col-12">
		                                	<h4 class="header-title">가입 경로 순위</h4>
		                                </div>		                            
		                                <div id="ambarchart4"></div>
		                            </div>
		                        </div>
                       		</div>
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="col-12">
                                	<h4 class="header-title">재직자/비재직자 비율</h4>
                                </div>
                                <div id="ampiechart2"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="col-12">
                                	<h4 class="header-title">회원 나이대</h4>
                                </div>                            
                                <div id="ambarchart5"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>                                              
                    </div>
                </div>
                <!-- 4th report area end -->                 
                
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

    <!-- start chart js -->
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>

    <!-- start amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <!-- all line chart activation -->
    <script src="${pageContext.request.contextPath }/adRsc/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="${pageContext.request.contextPath }/adRsc/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="${pageContext.request.contextPath }/adRsc/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/bar-chart.js"></script>
    

<script>
$("#monitoring").addClass("active");
</script>
</body>
</html>