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
	.nameBtn{
		border: 1px solid transparent !important;
		background-color:transparent !important;
		color: black;
	}
	.show>.btn-secondary.dropdown-toggle ,
	.btn-secondary.focus, .btn-secondary:focus {
		color: darkgray !important;
	}
	.dropright .dropdown-toggle::after{
		display:none;
	}
	.contentCard{
		max-width: 1000px;
	}
	.table{
		min-width: 400px;
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
                            <h4 class="page-title pull-left">회원관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>불량회원관리</span></li>
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
			                   			<button type="button" class="btn btn-flat btn-xs btn-outline-warning" id="listAll">전체</button>
			                    		<button type="button" class="btn btn-flat btn-xs btn-warning" id="blackList">불량회원</button>
			                    	</div>                            		
	                            </div>	
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-center">
                                            <thead class="text-uppercase">
                                                <tr>
<!--                                                 	<th scope="col"><input type="checkbox" id="checkAll" onclick="checkAll()"></th> -->
                                                	<th scope="col">
                                                	<div class="row d-sm-none"><div class="col-12">닉네임</div><div class="col-12">(아이디)</div></div>
                                                	<div class="row d-none d-sm-block">닉네임(아이디)</div>
                                                	</th>
                                                    <th scope="col">최종방문일</th>   
                                                    <th scope="col">레벨</th>  
                                                    <th scope="col">신고횟수</th>                                             
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:choose>
                                            		<c:when test="${list.size() == 0}">
                                            			<tr><th colspan='3'><marquee direction="right">결과가 없습니다</marquee></th></tr>
                                            		</c:when>
                                            		<c:otherwise>
		                                            	<c:forEach items="${list}" var="dto">
		                                            		<tr>
		<!--                                             		<td class="align-self-center"><input type="checkbox"></td> -->
			                                                <td scope="row">
																<div class="btn-group dropright">
																  <button class="btn btn-secondary btn-sm dropdown-toggle nameBtn p-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-boundary="viewport">
																    ${dto.nickName}(${dto.id})&nbsp;&nbsp;&nbsp;<i class="fa fa-external-link"></i>
																  </button>
																  <div class="dropdown-menu">
																    <p class="dropdown-item" id="memberInfo${dto.id}">회원정보</p>
																    <c:choose>
																    	<c:when test="${dto.memLevel == '1'}">
																    		<p class="dropdown-item" id="memberStart${dto.id}">활동정지 해제</p>	
																    	</c:when>
																    	<c:otherwise>
																    		<p class="dropdown-item" id="memberStop${dto.id}">활동정지</p>
																    	</c:otherwise>
																    </c:choose>														    
																    <p class="dropdown-item" id="memberOut${dto.id}">강제탈퇴</p>
																  </div>
																</div>
		                                                    </td>
		                                                    <td>${dto.formedLastLogin}</td>
		                                                    <td>${dto.memLevel}</td>
		                                                    <td>${dto.reportCount}</td>
		                                               		</tr>
		                                               		<form action="${pageContext.request.contextPath}/admin/memberOut" method="post" id="frm${dto.id}">
		                                               			<input type="hidden" name="id" value="${dto.id}">
		                                               			<input type="hidden" name="reason" id="reason${dto.id}">
		                                               		</form>
		                                               		<script>
		                                           			$("#memberInfo${dto.id}").on("click", function(){
		                                           				window.open("${pageContext.request.contextPath}/admin/getMemberInfo?id=${dto.id}","","width=600px,height=526px,top=300px,left=600px");
		                                           			})
		                                           			$("#memberStop${dto.id}").on("click", function(){
		                                           				var result = confirm("${dto.nickName}(${dto.id}) 님을 활동정지 하시겠습니까?");
		                                           				if(result){
		                                           					location.href = "${pageContext.request.contextPath}/admin/stopForBlack?id=${dto.id}";
		                                           				};
		                                           			})
		                                           			$("#memberStart${dto.id}").on("click", function(){
		                                           				var result = confirm("${dto.nickName}(${dto.id}) 님 활동정지를 해제할까요?");
		                                           				if(result){
		                                           					location.href = "${pageContext.request.contextPath}/admin/startForBlack?id=${dto.id}";
		                                           				};
		                                           			})
		                                           			$("#memberOut${dto.id}").on("click", function(){
		                                           				var result = prompt("${dto.nickName}(${dto.id}) 님 강제 탈퇴 이유를 적어주세요");
		                                           				if(result == null){
		                                           					return false;
		                                           				}else if(result == ""){
		                                           					alert("강제 탈퇴 이유를 적어주세요");
		                                           				}else{
		                                           					$("#reason${dto.id}").val(result);
		                                           					$("#frm${dto.id}").submit();
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
                                <hr>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
										<c:forEach items="${pageNavi}" var="navi">									
											<li class="page-item pageNavi">${navi}</li>
										</c:forEach>
                                    </ul>
                                </nav>
                            </div>                                                   
                        </div>                        
				</div>
                    <!-- Hoverable Rows Table end -->
               	<div class="col-lg-12 mt-1 contentCard">
					<div class="card">
						<div class="card-body pt-1 pb-1">
							<form action="${pageContext.request.contextPath}/admin/searchBlack" method="get" id="frm">
							<div class="form-group row mt-1 mb-1 justify-content-center">
									<div class="col-sm-2 my-1 p-0 pl-1 pr-1">
	                                <select class="form-control form-control-sm" name="col">
	                                    <option value="id">아이디</option>
	                                    <option value="nickName">닉네임</option>
	                                </select>
	                                </div>
	                                <div class="col-sm-6 my-1 pl-1 pr-1">
									<input type="text" class="form-control form-control-sm" id="searchWord" name="searchWord"
									placeholder="검색어를 입력하세요">
									</div>
									<div class="col-sm-2 my-1 p-0 pl-1 pr-1 text-center">
									<button type="button" class="btn btn-primary btn-xs btn-block" id="searchBtn">검색</button>
									</div>
							</div>
							</form>
						</div>
					</div>
				</div>
            </div>
        </div>
        <!-- main content area end -->
		<!-- footer area start-->
		<jsp:include page="/WEB-INF/views/standard/adminFooter.jsp" />
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
	 
	 $("#searchBtn").on("click", function(){	 
		var regex = /^[\w,가-힣,ㄱ-ㅎ,ㅏ-ㅣ]+/g;
		var data = $("#searchWord").val();
		var result = regex.exec(data);
		if(result == null){
			alert("검색어를 다시 확인해주세요. 영어대소문자, 숫자, 한글만 가능합니다");
		}else{
			$("#frm").submit();
		}
	 });
	 
	$("#member").addClass("active");
	$("#member").children("ul").addClass("in");
	$("#blackMember").addClass("active");	
	
	 $("#listAll").on("click", function(){
		 location.href="${pageContext.request.contextPath}/admin/memberList";
	 })
	 
	 $("#blackList").on("click", function(){
		 location.href="${pageContext.request.contextPath}/admin/blackList";
	 })	
	</script>
</body>
</html>