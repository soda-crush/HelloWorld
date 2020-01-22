<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
	<style>
		ul{background-color: lightgray;font-size: 13px;}
		.card{width:200px;height:300px;margin: auto;float :left;}
		.myprofile{float: left;}
		#mycard{ float:none;display:flex;align-items:center;}
        .card-text{font-size:12px;}
		.commentwrite{width:100%;height:100px;padding: 0px;margin-top: 10px;float: left;}
		.commentlist{width:100%;padding: 0px;margin-top: 10px;float: left;}
		.col{margin: 0px;padding: 0px;}
		.content{height:90%;float: left;resize: none;}
		.sendbt{height:90%;float: left;}
		#writer{text-underline-position: auto;margin-right: 30px;}
/*         .projectwrap{background-color:white;border:1px solid #BDBDBD;} */
        a:hover{text-decoration:none;}
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        #plogProject{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
        
        
        iframe.noScrolling{
		  width: 100%;
		  height: 100%;
		  overflow: hidden;
		}
		#applyFrame{
			margin-top:50px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogGuestHeader.jsp"/>
	
 		<div id="plogBaseBackgroundColor">
            <div class=container>
                <div class=row>
                    <div class="col-12" id=plogAroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            	
            <div class="container">
            
	            <div class="row">
	                <div class="col-12 col-md-4 d-md-block d-lg-none myprofile pb-2">
	                    <div>
	                    	<div class="card d-none d-md-block" id="mycard">
		                        <img src="${otherInfo.profileImg }" class="card-img-top" alt="..." style="width: 85%;margin:7.5%;">
		                        <div class="card-body">
		                            <div class="card-title line-over" style="text-align: center;font-size:20px;font-weight:bold;margin-bottom:0px;">${otherInfo.nickName} <span style="font-size:15px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:12px;">POINT <span style="font-size:15px;font-weight:bold;">${point}</span></p>
		                        </div>
	                    	</div>
	                    	<div class="d-md-none" style="background-color:white;border-radius:5px;height:200px;border: 1px solid rgba(0,0,0,.125); padding:15px;margin-right:10px;">
	                    		<div style="float:left">
		                        	<img src="${otherInfo.profileImg }" style="width:150px;margin:10px;">
	                    		</div>
		                        <div style="float:left;margin-top:100px;margin-left:20px;">
	                            <div class="card-title line-over" style="text-align: center;font-size:20px;font-weight:bold;margin-bottom:0px;">${otherInfo.nickName} <span style="font-size:15px;">님</span></div>
		                            <p class="card-text" style="text-align: center;font-size:12px;">POINT <span style="font-size:15px;font-weight:bold;">${point }</span></p>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
	                
	                
	                
	                <div class="col-12 col-md-8 col-lg-12 projectwrap pt-2">
	                
	                	                
						<div class="embed-responsive p-0" style="overflow:hidden;height:655px;" id="makeFrame">
						  <iframe class="noScrolling" src="/project/pLog/makeProjectList?guestConnect=yes"></iframe>
						</div>
	                </div>
	          	</div>
            </div>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script>
        </script>
</body>
</html>
