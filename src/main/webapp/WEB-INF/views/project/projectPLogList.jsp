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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');
   });
</script>
<style>
iframe.noScrolling{
/*   width: 1100px; */
/*   height: 600px; */
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
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <div class=container id="projectPage">						
<!-- 					<div class="embed-responsive embed-responsive-21by9 p-0" style="width:1100px;overflow-x:hidden;height:550px;" id="makeFrame"> -->
					<div class="embed-responsive p-0" style="overflow:hidden;height:655px;" id="makeFrame">
					  <iframe class="noScrolling" src="/project/pLog/makeProjectList"></iframe>
					</div>
					<hr>		
<!-- 					<div class="embed-responsive embed-responsive-21by9 p-0" style="width:1100px;overflow-x:hidden;height:550px;" id="applyFrame"> -->
					<div class="embed-responsive p-0" style="overflow:hidden;height:605px;" id="applyFrame">
					  <iframe class="noScrolling" src="/project/pLog/applyProjectList"></iframe>
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
</body>
</html>