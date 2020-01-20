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
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/js/summernote-ko-KR.js"></script>

<style>
#home-tab:hover{
cursor:default;
}
.notification-area {
text-align:right;
}
.contentCard{
	max-width: 1000px;
}
.note-toolbar {
	z-index:1;
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
                            <h4 class="page-title pull-left">공지사항</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="${pageContext.request.contextPath }/admin/main">Home</a></li>
                                <li><span>공지사항</span></li>
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
	                            <form action="${pageContext.request.contextPath}/admin/modifyNotice?page=${page}" method="post" enctype="multipart/form-data">
	                                <div class="invoice-area">
	                                    <div class="invoice-head">
	                                        <div class="row">
	                                            <div class="iv-left col-12">
	                                                <span>수정하기</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row align-items-center">
	                                        <div class="col-12">
	                                            <div class="invoice-address mb-2">
													<input type="text" class="form-control form-control-lg" name="title" maxlength="100"
													id="title" placeholder="제목을 입력해주세요" value="${dto.title}">
	                                            </div>
	                                            <div class="invoice-address">
	                                            	<textarea class="form-control summernote" name="content" id="content">${dto.content}</textarea>
	                                            </div>
	                                        </div>
	                                    </div>                                   
	                                </div> 
	                                <input type="hidden" value="${dto.seq}" name="seq">
	                                <div class="btn-area mt-2 text-center">
	                                	<button type="submit" class="btn btn-primary mr-2" id="modifyBtn">수정</button>
	                                	<button type="button" class="btn btn-secondary ml-2" id="back">취소</button>
	                                </div>
	                            </form>                                  
                            </div>
                        </div>                       
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

    <!-- others plugins -->
    <script src="${pageContext.request.contextPath }/adRsc/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/adRsc/js/scripts.js"></script>
    <script>
    $('.summernote').summernote({
        placeholder: '내용을 입력해주세요',	        
        minHeight: 300,
        maxHeight: 300,   
        lang: 'ko-KR',
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'hr']],
            ['view', ['fullscreen']],
            ['help', ['help']]
      ]
    });  
    
    $("#modifyBtn").on("click", function(){
    	var regex = /^[(<p><br></p>)(<p>(&nbsp; )+</p>)]{0,}$/g;
    	var content = $(".summernote").val();
    	var result = regex.exec(content);
    	   
    	$("#title").val($.trim($("#title").val())); 
    	
    	if(($("#title").val() == "")&&(result != null)){
    		alert("제목과 내용을 입력해주세요.");
    	    return false;
    	}else if(result != null){
    	    alert("내용을 입력해 주세요.");
    	    return false;
    	}else if($("#title").val()==""){
    	    alert("제목을 입력해 주세요.");
    	    return false;
    	}		
    })    
    
	$("#back").on("click",function(){
		var result = confirm("모든 입력 내용이 사라집니다. 글쓰기를 취소할까요?");
		if(result){
			location.href="noticeDetailView?page=${page}&seq=${dto.seq}";
		}		
	})        	
    $("#notice").addClass("active");
    </script>
</body>
</html>