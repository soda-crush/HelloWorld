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
	.titleBtn{
		background-color : transparent;
		border : none;
		color : black;
	}
	.titleBtn:hover{
		background-color : transparent;
		border : none;
		color : black;
	}
	.infoBoxTop{
		border-top: 1px solid #f5f5f2;
	}
	.infoBox{
		border-bottom : 1px solid #f5f5f2;	
	}
	
	.infoBox>div:first-child{
		background-color : #F3F8FB;
		text-align: center;
	}
	
	.infoBoxBottom>div:first-child{
		background-color : transparent;
	}
	.table{
		min-width: 800px;
	}
	#boardTitle{
		position:relative;
		top:50%;
		left:50%;
		transform:translate(-50%, -50%);
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
                            <h4 class="page-title pull-left">신고글 관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>신고글 관리</span></li>
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
	                            <div class="col-auto text-left mb-3">
			                    	<div class="btn-group" role="group" aria-label="Basic example">
			                   			<button type="button" class="btn btn-flat btn-xs btn-warning" id="listAll">전체</button>
			                    		<button type="button" class="btn btn-flat btn-xs btn-outline-warning" id="waitList">대기중</button>
			                    		<button type="button" class="btn btn-flat btn-xs btn-outline-warning" id="endList">처리완료</button>
			                    	</div>                            		
	                            </div>	
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">번호</th>    
                                                    <th scope="col">상태</th>                                             
                                                	<th scope="col">게시판</th>
                                                    <th scope="col">글번호</th>
                                                    <th scope="col">제목</th>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                    <th scope="col">신고자</th>
                                                    <th scope="col">신고날짜</th>    
                                                    <th scope="col">처리결과</th>                                               
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:choose>
                                            		<c:when test="${list.size() == 0}">
                                            			<tr><th colspan='10'><marquee direction="right">게시물이 없습니다</marquee><th></tr>
                                            		</c:when>
                                            		<c:otherwise>
		                                            	<c:forEach items="${list}" var="dto">
		                                            		<tr>
		                                                    <td>${dto.seq}</td>   
		                                                    <td>
		                                                    	<c:choose>
		                                                    		<c:when test="${dto.state == 'Y'}">		                                                    		
		                                                    			<p class="text-success"><strong>${dto.formedState}</strong></p>
		                                                    		</c:when>
		                                                    		<c:otherwise>
		                                                    			<p class="text-danger"><strong>${dto.formedState}</strong></p>
		                                                    		</c:otherwise>
		                                                    	</c:choose>
		                                                    
		                                                    </td>                                           		
		                                                    <td>${dto.board}</td>
		                                                    <td>${dto.boardSeq}</td>
		                                                    <td colspan='3' class="text-left">
		                                                    	<button type="button" class="btn btn-primary btn-flat btn-xs p-0" data-toggle="modal" data-target="#reportDetail${dto.seq}" id="btn${dto.seq}">
																<strong class="text-primary">
		                                                    	<c:set var="text" value="${dto.title}"/>
		                                                    	<c:choose>
		                                                    		<c:when test="${fn:length(text) > 10}">
		                                                    			<c:set var="value" value="${fn:substring(text, 0, 10)}"/>
		                                                    			${value}...&nbsp;
		                                                    		</c:when>
		                                                    		<c:otherwise>
		                                                    			${dto.title}&nbsp;
		                                                    		</c:otherwise>
		                                                    	</c:choose>
		                                                    	<span class="ti-new-window"></span></strong></button>																 
								                                <!-- Modal -->
								                                <div class="modal fade" id="reportDetail${dto.seq}">
								                                    <div class="modal-dialog modal-dialog-centered" role="document">
								                                    	<form action="${pageContext.request.contextPath}/report/updateReport" method="post" class="col-12">
									                                        <div class="modal-content">
									                                            <div class="modal-header">
									                                                <h5 class="modal-title"><strong>신고 내역</strong></h5>
									                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
									                                            </div>
									                                            <div class="modal-body">
									                                                <div class="content col-12">
									                                                	<div class="row infoBox infoBoxTop">
									                                                		<div class="col-4 pt-2 pb-2">상태</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.state}</div>
									                                                	</div>
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">게시판</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.board}</div>	
									                                                	</div>	
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">게시글번호</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.boardSeq}</div>
									                                                	</div>	
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">제목</div>
									                                                		<div class="col-8 pt-2 pb-2">
									                                                		<button type="button" class="btn btn-primary btn-flat btn-xs p-0 titleBtn" data-toggle="tooltip" data-placement="botton"
																								title="원글 새 창에서 열기" onclick="openWindow('${dto.boardName}', ${dto.boardSeq});">
									                                                    	<c:choose>
									                                                    		<c:when test="${fn:length(text) > 25}">
									                                                    			<c:set var="value" value="${fn:substring(text, 0, 25)}"/>
									                                                    			${value}...&nbsp;
									                                                    		</c:when>
									                                                    		<c:otherwise>
									                                                    			${dto.title}&nbsp;&nbsp;
									                                                    		</c:otherwise>
									                                                    	</c:choose>									                                                		
																							<span data-brackets-id="6920" class="ti-layers text-primary"></span>
																							</button>	
																								
																							</div>
									                                                	</div>									                                                	
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">신고자</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.reporterNick}(${dto.reporterID})</div>
									                                                	</div>		
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">신고날짜</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.formedDate}</div>
									                                                	</div>									                                                	
									                                                	<div class="row infoBox">
									                                                		<div class="col-4 pt-2 pb-2">신고이유</div>
									                                                		<div class="col-8 pt-2 pb-2">${dto.reason}</div>
									                                                	</div>									                                                	
									                                                	<div class="row infoBox infoBoxBottom position-relative">
									                                                		<div class="col-12 pt-2 pb-2">								                                   
									                                                			<select class="custom-select" id="result${dto.seq}">
									                                                				<option selected value="null">처리 방법을 선택해주세요</option>
									                                                				<option value="delete">삭제처리</option>
									                                                				<option value="noMatter">문제없음</option>
									                                                				<option value="noBoard">이미 삭제된 글</option>
									                                                			</select>
									                                                		</div>
									                                                	</div>									                                                								                                                									                                                							                                                	
									                                                </div>
									                                            </div>
									                                            <div class="modal-footer">
									                                            	<button type="button" class="btn btn-primary" id="save${dto.seq}">결과 저장</button>
									                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>                                             
									                                            </div>
									                                        </div>	
									                                	</form>						                          
								                                    </div>
								                                </div>
								                    			<!-- Vertically centered modal end -->																
															</td>
		                                                    <td class="toDetail${dto.seq}">${dto.reporterNick}(${dto.reporterID})</td>
		                                                    <td class="toDetail${dto.seq}">${dto.formedDate}</td>
		                                                    <td class="toDetail${dto.seq}">${dto.formedResult}</td>
		                                               		</tr>
		                                               		<script>		    
		                                               			$("#btn${dto.seq}").css("background-color", "transparent");
		                                               			$("#btn${dto.seq}").css("border", "none");
		                                               			$("#btn${dto.seq}").css("color", "black");
		                                               			
		                                               			$("#save${dto.seq}").on("click", function(){
		                                               				var result = $("#result${dto.seq}").val();
		                                               				console.log(result);
		                                               				if(result == "null"){
		                                               					alert("신고 처리 방법을 선택하지 않았습니다.");
		                                               					return false;
		                                               				}else{
		                                               					$.ajax({		                                               						
		                                               						url:"${pageContext.request.contextPath}/report/updateReport",
		                                               						type:"post",
		                                               						data:{
		                                               							seq: "${dto.seq}",
		                                               							result: result,
		                                               							page:"${page}"
		                                               						},
		                                               						dataType:"json"
		                                               					}).done(function(resp){
		                                               						console.log("ajax성공:"+resp);
		                                               						if(resp.result == true){
		                                               							alert("처리되었습니다.");
		                                               							//$("#reportDetail").modal('hide');
		                                               							location.href="${pageContext.request.contextPath}/report/reportList?page="+resp.page;		                                               							
		                                               						}else{
		                                               							alert("오류가 발생했습니다. 다시 시도해주세요");
		                                               						}
		                                               					});
		                                               				}
		                                           			
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
				<!-- Modal -->
				<div class="modal fade d-none" id="confirm">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">결과</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>처리되었습니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- modal end -->            
                
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
    $("#report").addClass("active");
    
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
	
	function openWindow(boardName, boardSeq){
		window.open("${pageContext.request.contextPath}/adBoard/detailView"+boardName+"?seq="+boardSeq,"","");
	}
	
	$("#listAll").on("click", function(){
		location.href="${pageContext.request.contextPath}/report/reportList";
	})
	
	$("#waitList").on("click", function(){
		location.href="${pageContext.request.contextPath}/report/waitList";
	})
	
	$("#endList").on("click", function(){
		location.href="${pageContext.request.contextPath}/report/endList";
	})
	</script>
</body>
</html>