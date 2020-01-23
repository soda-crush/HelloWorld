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
#guest img{
	opacity:50%;
}
.metismenu #guest:hover img, .metismenu #guest.active img {
	opacity:100%;
}
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
	.depthCom{
		border-top: 1px solid #dee2e6;
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
                            <h4 class="page-title pull-left">프로젝트 모집 관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>프로젝트 모집</span></li>
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
	                                                <span>#${dto.seq}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <c:choose>
	                                    	<c:when test="${dto.title != null}">
			                                    <div class="row align-items-center">
			                                        <div class="col-12">
			                                            <div class="invoice-address">
			                                                <h3>${dto.title}</h3>
			                                                <h5>${dto.writer}(${dto.id})</h5>
			                                                <p>${dto.formedWriteDate}
			                                                <hr>
			                                                	<p><label class="sign"><strong>지역</strong></label><span>${dto.location1} ${dto.location2}</span></p>
			                                                	<p><label class="sign"><strong>모집인원</strong></label><span>${dto.capacity}</span></p>
			                                                	<p><label class="sign"><strong>기간</strong></label><span>${dto.formedAllDate}</span></p>
			                                                	<p><label class="sign"><strong>사용언어</strong></label><span>${dto.languages}</span></p>
			                                                <hr>
			                                                <p>${dto.contents }</p>
			                                                <hr>
			                                                	<p><label class="sign"><strong>연락처</strong></label><span>${dto.phone}</span></p>
			                                                	<p><label class="sign"><strong>메일주소</strong></label><span>${dto.email}</span></p>
			                                                <hr>
			                                            </div>
			                                        </div>
			                                    </div>
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <div class="row align-items-center">
			                                        <div class="col-12">
			                                            <div class="invoice-address">
			                                               <p class="text-center">삭제된 글 입니다.</p>
			                                               <hr>
			                                            </div>
			                                        </div>
			                                    </div>	                                    	
	                                    	</c:otherwise>	                                    	
	                                    </c:choose>
	                                   
	                                </div>
	                                <div class="invoice-buttons text-right">
	                                    <a href="${pageContext.request.contextPath}/adBoard/projectList?page=${page}" class="invoice-btn">돌아가기</a>
	                                    <c:if test="${dto.title != null}">
	                                    <a href="${pageContext.request.contextPath}/adBoard/delProject?seq=${dto.seq}" class="invoice-btn">삭제하기</a>
	                                    </c:if>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                                         <!-- basic form start -->
                            <div class="col-12 mt-5 contentCard">
                                <div class="card" id="replyAppend">
                                	<c:choose>
                                		<c:when test="${list.size() == 0}">
                                			<div class="card-body">
                                				<p class="text-center">작성된 댓글이 없습니다.</p>
                                			</div>
                                		</c:when>
                                		<c:otherwise>
                                			<c:forEach items="${list}" var="c">
                                				<c:choose>
                                					<c:when test="${c.contents != null}">
                                						<c:if test="${c.depth == 0}">
			                             					<div class="card-body">
			            										<ul class="nav nav-tabs" id="myTab" role="tablist">
			                										<li class="nav-item">
			                    										<a class="nav-link active" id="home-tab" data-toggle="tab" href="#" role="tab" aria-controls="home" aria-selected="true"><strong>${c.writer}(${c.id})</strong> <small>${c.formedWriteDate}</small></a>
			               											</li>  
			                    										<li class="text-center mt-2 pl-2"><a href="${pageContext.request.contextPath}/adBoard/delProjectCo?page=${page}&seq=${c.seq}&projectSeq=${c.projectSeq}">
			                    										<i data-brackets-id="23054" class="fa fa-trash"></i></a></li>    
			           											</ul>
				            									<div class="tab-content mt-3" id="myTabContent">
				                									<div class="tab-pane fade show active pl-3 pr-3" id="home" role="tabpanel" aria-labelledby="home-tab">				                										
				                    									<p>${c.contents}</p>
				                    									<c:if test="${c.changeDate != null}"><p><small>(수정일 : ${c.formedChangeDate})</small></p></c:if>
				                									</div>              
				           										</div>
			       											</div>                                						
                                						</c:if>
                                						<c:if test="${c.depth == 1}">
			                             					<div class="card-body depthCom ml-5 mr-5 pt-1 pr-0 pb-0">
																<div class="row">
																	<div class="col-1 text-right pt-2 pb-2" style="color:#dee2e6;">┖</div>
																	<div class="col-11 pt-2 pb-2">
																		<div class="row">
																			<div class="col-auto pr-0 mb-2"><strong>${c.writer}(${c.id})&nbsp;&nbsp;</strong></div>
																			<div class="col-auto"><small>${c.formedWriteDate}</small></div>
																			<div class="col-auto p-0"><a href="${pageContext.request.contextPath}/adBoard/delProjectCo?page=${page}&seq=${c.seq}&projectSeq=${c.projectSeq}">
																			<i data-brackets-id="23054" class="fa fa-trash"></i></a></div>
																			<div class="col-12">																
																				<p>${c.contents}</p>
																				<c:if test="${c.changeDate != null}"><p><small>(수정일 : ${c.formedChangeDate})</small></p></c:if>	
																			</div>
																		</div>
																	</div>
																</div>
			       											</div>                                							
                                						</c:if>
                                					</c:when>
                                					<c:otherwise>
                                						<c:if test="${c.depth == 0}">
			                             					<div class="card-body">
			            										<ul class="nav nav-tabs" id="myTab" role="tablist">
			                										<li class="nav-item">
			                    										<a class="nav-link active" id="home-tab" data-toggle="tab" href="#" role="tab" aria-controls="home" aria-selected="true"><strong>${c.writer}(${c.id})</strong> <small>${c.formedWriteDate}</small></a>
			               											</li>     
			           											</ul>
				            									<div class="tab-content mt-3" id="myTabContent">
				                									<div class="tab-pane fade show active pl-3" id="home" role="tabpanel" aria-labelledby="home-tab">
				                    									<p>삭제된 댓글입니다.&nbsp;&nbsp;</p>
				                    									<p><small>(삭제일 : ${c.formedChangeDate})</small></p>
				                									</div>              
				           										</div>
			       											</div>  
                                						</c:if>
                                						<c:if test="${c.depth == 1}">
			                             					<div class="card-body depthCom ml-5 mr-5 pt-1 pr-0 pb-0">
																<div class="row">
																	<div class="col-1 text-right pt-2 pb-2" style="color:#dee2e6;">┖</div>
																	<div class="col-11 pt-2 pb-2">
																		<div class="row">
																			<div class="col-auto pr-0 mb-2"><strong>${c.writer}(${c.id})&nbsp;&nbsp;</strong></div>
																			<div class="col-auto"><small>${c.formedWriteDate}</small></div>
																			<div class="col-12">																				
																				<p>삭제된 댓글입니다.&nbsp;&nbsp;</p>
																				<p><small>(삭제일 : ${c.formedChangeDate})</small></p>
																			</div>
																		</div>
																	</div>
																</div>
			       											</div>                                      						
                                						</c:if>
                                					</c:otherwise>
                                				</c:choose>
                                			</c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                
                                	<c:forEach items="${list}" var="reply">

                                	</c:forEach>
                                </div>
                            </div>
                            <!-- basic form end -->  
	                    
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
	$("#board").addClass("active");
	$("#board").children("ul").addClass("in");
	$("#project").addClass("active");	    
    </script>
</body>
</html>