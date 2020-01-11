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
#home-tab:hover{
cursor:default;
}
	.contentCard{
		max-width: 1000px;
	}
	.sign{
		display: inline-block;
		width: 90px;
	}
	.replyCard{
		border:1px solid #e2e2df;
		margin-bottom:10px;
	}
	div[class^=commentArea]{
		background-color: #f5f5f2;
	}
	.ti-trash{
		color:blue;
	}
	.ti-trash:hover{
		cursor:pointer;
		color:gray;
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
                            <h4 class="page-title pull-left">Code-How</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>Code-How</span></li>
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
				<div class="main-content-inner">
					<div class="row">
						<div class="col-lg-12 mt-5 contentCard">
							<div class="card">
								<div class="card-body">
									<div class="invoice-area">
										<div class="invoice-head">
											<div class="row">
												<div class="iv-left col-6">
													<span>글읽기</span>
												</div>
												<div class="iv-right col-6 text-right">
													<span>#${qdto.seq}</span>
												</div>
											</div>
										</div>
										<div class="row align-items-center">
											<div class="col-12">
												<div class="invoice-address">
													<h1>
														Q&nbsp;<small class="text-muted">${qdto.title}</small>
													</h1>
													<h5 class="mt-3 mb-1">${qdto.writer}(${qdto.id})</h5>
													<p>${qdto.formedWriteDateForAdmin}
													<hr>
													<p>${qdto.content}</p>
													<hr>
												</div>
											</div>
										</div>

									</div>
									<div class="invoice-buttons text-right">
										<a href="${pageContext.request.contextPath}/adBoard/cohowList?page=${page}" class="invoice-btn">돌아가기</a>
										<a href="${pageContext.request.contextPath}/adBoard/delCohow?seq=${qdto.seq}" class="invoice-btn">삭제하기</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 mt-2 mb-2 contentCard">
							<div class="ml-5">
								<h2 class="text-primary">
									A&nbsp;<small class="text-dark"><small>${rdto.size()}개</small></small>
								</h2>
							</div>
						</div>
						<div class="col-lg-12 contentCard">
							<c:choose>
								<c:when test="${rdto.size() >0}">
									<c:forEach items="${rdto}" var="r" varStatus="status">
										<div class="card replyCard">
											<div class="card-body pb-0">
												<div class="invoice-area">
													<div class="invoice-head">
														<div class="row">
															<div class="iv-left col-12">
																<span><strong>${r.writer}(${r.id})</strong>님의 답변입니다</span>
															</div>
														</div>
													</div>
													<div class="row align-items-center">
														<div class="col-12">
															<div class="invoice-address">
																<p>${r.content}</p>
																<p class="mt-3">${r.formedWriteDateForAdmin}</p>
																<hr>
															</div>
														</div>
													</div>			
												</div>
												<div class="invoice-buttons">
													<div class="row">
														<div class="text-left col-6" id="openBtnChange${r.seq}">												
															<button type="button" class="btn btn-secondary mb-3" id="open${r.seq}">댓글열기</button>
														</div>									
														<div class="text-right col-6">
															<button type="button" class="btn btn-secondary mb-3" id="delReply${r.seq}">삭제하기</button>
														</div>
													</div>
													<hr class="m-0">
												</div>
											</div>
											<div class="card-body p-0">
												<div class="commentArea${r.seq}">
													<c:forEach items="${list}" var="c">																										
														<c:choose>
															<c:when test="${c.repSeq == r.seq}">
																<div class="commentBox col-12 pt-2 pb-2">
																	<div class="row">
																		<div class="commentInfo col-12">
																			<div class="row pl-3 pr-3">
																				<div class="col-12"><div class="row">
																				<p class="col-10"><strong>${c.writer}</strong>(${c.id})</p>
																				<p class="col-2 text-right"><i class="ti-trash" id="delCo${c.repSeq}${c.seq}"><small>&nbsp;삭제</small></i></p>
																				</div></div>
																			</div>
																		</div>
																		<div class="commentContents col-12">
																			<p class="col-12">${c.content}</p>
																			<p class="col-12 text-secondary"><small>${c.formedWriteDateForAdmin}</small></p>
																		</div>
																	</div>
																</div>
																<hr class="m-0 mt-2 ml-2 mr-2">																
															</c:when>
														</c:choose>																									
													</c:forEach>
												</div>
											</div>
											<div class="card-body p-2">
												<div class="replyCount">
													<div class="row">
														<div class="col-12">											
															<p class="text-center text-secondary">(${status.count}/${rdto.size()})</p>
														</div>									
													</div>
												</div>											
											</div>
										</div>	
										<script>
											$(".commentArea${r.seq}").css("display", "none");
											$(document).on("click", "#open${r.seq}", function(){
												$(".commentArea${r.seq}").css("display", "block");	
												$(this).remove();
												var btn = $("<button type='button' class='btn btn-secondary mb-3' id='close${r.seq}'>댓글닫기</button>");
												var target = $("#openBtnChange${r.seq}");
												target.append(btn);
											})
											$(document).on("click", "#close${r.seq}", function(){
												$(".commentArea${r.seq}").css("display", "none");	
												$(this).remove();
												var btn = $("<button type='button' class='btn btn-secondary mb-3' id='open${r.seq}'>댓글열기</button>");
												var target = $("#openBtnChange${r.seq}");
												target.append(btn);												
											})
											$("#delReply${r.seq}").on("click", function(){
												//답글 삭제하기
												location.href="${pageContext.request.contextPath}/adBoard/delCohowReply?seq=${qdto.seq}";
											})
											$("#delCo${c.repSeq}${c.seq}").on("click", function(){
												//댓글 삭제하기
											})
										</script>
									</c:forEach>							
								</c:when>
							</c:choose>
						</div>												
					</div>
				</div>
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
</body>
</html>