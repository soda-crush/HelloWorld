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
                        <!-- today -->
                            <div class="col-12 mt-0 mb-3">
                                <div class="card">
                                    <div class="seo-fact sbg1">
                                        <div class="p-4 d-flex justify-content-between align-items-center">
                                            <div class="seofct-icon"><i class="ti-thumb-up"></i> TODAY</div>
                                            <h2>${count.today}</h2>                                        </div>
                                        
                                    </div>
                                </div>
                            </div> 
                        <!-- total -->
                            <div class="col-12 mt-md-5 mb-3">
                                <div class="card">
                                    <div class="seo-fact sbg2">
                                        <div class="p-4 d-flex justify-content-between align-items-center">
                                            <div class="seofct-icon"><i class="ti-share"></i> TOTAL</div>
                                            <h2>${count.total}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                        </div>
                        <div class="col-md-8">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <div class="d-flex justify-content-between align-items-center">
		                                    <h4 class="header-title mb-0">Overview</h4>
		                                    <select class="custome-select border-0 pr-3">
		                                        <option selected>Last 24 Hours</option>
		                                        <option value="0">01 July 2018</option>
		                                    </select>
		                                </div>
		                                <div id="verview-shart"></div>
		                            </div>
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
		                                    <h4 class="header-title mb-0">Overview</h4>
		                                </div>
		                                <div id="chartdiv"></div>
		                            </div>
		                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12 coin-distribution">
		                        <div class="card h-full">
		                            <div class="card-body">
		                                <h4 class="header-title mb-0">Coin Distribution</h4>
		                                <div id="coin_distribution"></div>
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
                                <div id="ambarchart3"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-6">
		                    <div class="col-12 coin-distribution">
		                        <div class="card">
		                            <div class="card-body">
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
                                <div id="ambarchart4"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="ampiechart2"></div>
                            </div>
                        </div>
		                    </div>                        
                        </div>
                        <div class="col-md-4">
		                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="ampiechart3"></div>
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
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
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
<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

/**
 * Chart design taken from Samsung health app
 */

var chart = am4core.create("chartdiv", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.paddingBottom = 30;

chart.data = [{
    "name": "Monica",
    "steps": 45688,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/monica.jpg"
}, {
    "name": "Joey",
    "steps": 35781,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/joey.jpg"
}, {
    "name": "Ross",
    "steps": 25464,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/ross.jpg"
}, {
    "name": "Phoebe",
    "steps": 18788,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/phoebe.jpg"
}, {
    "name": "Rachel",
    "steps": 15465,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/rachel.jpg"
}, {
    "name": "Chandler",
    "steps": 11561,
    "href": "https://www.amcharts.com/wp-content/uploads/2019/04/chandler.jpg"
}];

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "name";
categoryAxis.renderer.grid.template.strokeOpacity = 0;
categoryAxis.renderer.minGridDistance = 10;
categoryAxis.renderer.labels.template.dy = 35;
categoryAxis.renderer.tooltip.dy = 35;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.inside = true;
valueAxis.renderer.labels.template.fillOpacity = 0.3;
valueAxis.renderer.grid.template.strokeOpacity = 0;
valueAxis.min = 0;
valueAxis.cursorTooltipEnabled = false;
valueAxis.renderer.baseGrid.strokeOpacity = 0;

var series = chart.series.push(new am4charts.ColumnSeries);
series.dataFields.valueY = "steps";
series.dataFields.categoryX = "name";
series.tooltipText = "{valueY.value}";
series.tooltip.pointerOrientation = "vertical";
series.tooltip.dy = - 6;
series.columnsContainer.zIndex = 100;

var columnTemplate = series.columns.template;
columnTemplate.width = am4core.percent(50);
columnTemplate.maxWidth = 66;
columnTemplate.column.cornerRadius(60, 60, 10, 10);
columnTemplate.strokeOpacity = 0;

series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
series.mainContainer.mask = undefined;

var cursor = new am4charts.XYCursor();
chart.cursor = cursor;
cursor.lineX.disabled = true;
cursor.lineY.disabled = true;
cursor.behavior = "none";

var bullet = columnTemplate.createChild(am4charts.CircleBullet);
bullet.circle.radius = 30;
bullet.valign = "bottom";
bullet.align = "center";
bullet.isMeasured = true;
bullet.mouseEnabled = false;
bullet.verticalCenter = "bottom";
bullet.interactionsEnabled = false;

var hoverState = bullet.states.create("hover");
var outlineCircle = bullet.createChild(am4core.Circle);
outlineCircle.adapter.add("radius", function (radius, target) {
    var circleBullet = target.parent;
    return circleBullet.circle.pixelRadius + 10;
})

var image = bullet.createChild(am4core.Image);
image.width = 60;
image.height = 60;
image.horizontalCenter = "middle";
image.verticalCenter = "middle";
image.propertyFields.href = "href";

image.adapter.add("mask", function (mask, target) {
    var circleBullet = target.parent;
    return circleBullet.circle;
})

var previousBullet;
chart.cursor.events.on("cursorpositionchanged", function (event) {
    var dataItem = series.tooltipDataItem;

    if (dataItem.column) {
        var bullet = dataItem.column.children.getIndex(1);

        if (previousBullet && previousBullet != bullet) {
            previousBullet.isHover = false;
        }

        if (previousBullet != bullet) {

            var hs = bullet.states.getKey("hover");
            hs.properties.dy = -bullet.parent.pixelHeight + 30;
            bullet.isHover = true;

            previousBullet = bullet;
        }
    }
})

}); // end am4core.ready()
</script>
</body>
</html>