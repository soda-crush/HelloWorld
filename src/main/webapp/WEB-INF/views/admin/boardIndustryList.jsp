<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.contentCard{
		max-width: 1000px;
	}
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
                            <h4 class="page-title pull-left">업계현황</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>업계현황</span></li>
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
                 <!-- Hoverable Rows Table start -->
                    <div class="col-lg-12 mt-5 contentCard">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">전체 목록</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">번호</th>                                                
                                                	<th scope="col">제목</th>
                                                    <th scope="col">작성자</th>
                                                    <th scope="col">작성일</th>
                                                    <th scope="col">조회수</th>
                                                    <th scope="col">삭제</th>                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:choose>
                                            		<c:when test="${list.size() == 0}">
                                            			<tr><th colspan='6'>게시물이 없습니다<th></tr>
                                            		</c:when>
                                            		<c:otherwise>
		                                            	<c:forEach items="${list}" var="dto">
		                                            		<tr>
		                                                    <td class="toDetail${dto.seq}">${dto.seq}</td>                                            		
		                                                    <td class="toDetail${dto.seq} text-left">
		                                                    	<c:set var="text" value="${dto.title}"/>	
		                                                    	<c:choose>
		                                                    		<c:when test="${fn:length(text) > 25}">
				                                                    	<c:set var="value" value="${fn:substring(text, 0, 25)}"/>	                                                    	
																		${value}...	                                                    		
		                                                    		</c:when>
		                                                    		<c:otherwise>
		                                                    			${dto.title}
		                                                    		</c:otherwise>
		                                                    	</c:choose>	
		                                                    </td>
		                                                    <td class="toDetail${dto.seq}">${dto.writer}(${dto.id})</td>
		                                                    <td class="toDetail${dto.seq}">${dto.formedWriteDateForAdmin }</td>
		                                                    <td class="toDetail${dto.seq}">${dto.viewCount}</td>
		                                                    <td><i class="ti-trash" id="delProc${dto.seq }"></i></td>
		                                               		</tr>
		                                               		<script>
		                                               			$("#delProc${dto.seq}").on("click", function(){
		                                               				var result = confirm("이 게시물을 삭제할까요?");
		                                               				if(result){
		                                               					location.href = "${pageContext.request.contextPath}/adBoard/delIndustry?page=${page}&seq=${dto.seq}";
		                                               				}                                              				                                             				
		                                               			})
		                                               			$(".toDetail${dto.seq}").hover(function(){
		                                               				$(".toDetail${dto.seq}").css("cursor", "pointer");
		                                               			});
		                                               			$(".toDetail${dto.seq}").on("click",function(){
		                                               				location.href = "${pageContext.request.contextPath}/adBoard/detailViewIndustry?page=${page}&seq=${dto.seq}";
		                                               			})
		                                               		</script>
		                                            	</c:forEach>                                              		
                                            		</c:otherwise>
                                            	</c:choose>                                                                                                                                        
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="card">
                            <div class="card-body">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                    	<c:choose>
                                    		<c:when test="${pageNavi.size() > 0}">
												<c:forEach items="${pageNavi}" var="navi">									
													<li class="page-item pageNavi">${navi}</li>
												</c:forEach>                                    		
                                    		</c:when>
                                    	</c:choose>  
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        
                    </div>
                    <!-- Hoverable Rows Table end -->
            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <jsp:include page="/WEB-INF/views/standard/adminFooter.jsp"/>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->

    <!-- bootstrap 4 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="${pageContext.request.contextPath }/adRsc/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="${pageContext.request.contextPath }/adRsc/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="${pageContext.request.contextPath }/adRsc/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/scripts.js"></script>
    <script>
		if(${pageNavi.size() > 0}){
			var element = $(".pageNavi");
			var page = "${page}";
			if(page > 0 && page <= 10){
				element[page-1].classList.add('active');
			}else if(page % 10 == 0){
				element[10].classList.add('active');
			}else{
				element[page % 10].classList.add('active');
			}			
		}	
		
		$("#board").addClass("active");
		$("#board").children("ul").addClass("in");
		$("#industry").addClass("active");	 		
    </script>
</body>
</html>