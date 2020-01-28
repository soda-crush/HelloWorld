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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/mainBase.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
	    div{font-size:13px;}
        textarea{border :0px;width:100%;height: 100px;resize: none;}
        input{width:100%;}
        #datepicker,#datepicker2{width:20%}
        .theme{line-height: 100px;}
        h4{text-align: center;background-color:lightgray;padding-top: 10px;padding-bottom: 10px;}
        #funcname, #funcexpl{text-align: center;font-size:10px;line-height:20px;}
        #funcexpl{line-height: 150px;}
		.redStar{color:red;}
        #funcname1,#funcname2,#funcname3{margin-bottom: 8px;}
        .line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
        #plogPortfolio{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
        .page{background-color:white;border-radius:5px;padding:10px;border: 1px solid rgba(0,0,0,.125);}
        input, textarea{border: 1px solid rgba(0,0,0,.125);;background-color:#EAEAEA}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
 		<div id="plogBaseBackgroundColor">
            <div class=container>
                <div class=row>
                    <div class="col-12" id=plogAroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            <form action="${pageContext.request.contextPath}/Portfolio/update.do" method="post" id="updateForm">
            	<input type="hidden" value="${pdto.seq}" name="seq">
	            <div class="container">
		            <div class="page">
			            <h1> 포 트 폴 리 오</h1>
			            <div class="row">
			                <div class="col-3 col-md-2"><span class=redStar>*</span>프로젝트명  </div>
			                <div class="col-9 col-md-10"><input id="portfolioTitle" name="portfolioTitle" maxlength="100"> </div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2"> 수행 기간  </div>
			                 <div class="col-9 col-md-10"> <input name="startDateTemp" type="text" id="datepicker" style="width:80px;">
			                    ~ <input name="endDateTemp" type="text" id="datepicker2" style="width:80px;"> </div>         
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2"><span class=redStar>*</span>개발 목표 </div>
			                <div class="col-9 col-md-10"> <input id="purpose" name="purpose" maxlength="300"></div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 개발 환경 </div>
			                <div class="col-9 col-md-10"> <textarea name="environment" maxlength="1300"> ${pdto.environment }</textarea></div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 구현 기능 </div>
			                <div class="col-9 col-md-10"> <textarea name="allFunction" maxlength="1300">${pdto.allFunction }</textarea></div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme">  DB 설계 </div>
			                <div class="col-9 col-md-10"> <textarea name="dbUnitPlan" maxlength="1300">${pdto.dbUnitPlan }</textarea></div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 담당 역할 </div>
			                <div class="col-9 col-md-10"> <textarea name="role" maxlength="1300">${pdto.role }</textarea></div>               
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 참여/기여도 </div>
			                <div class="col-9 col-md-10"> <textarea name="contribution" maxlength="1300">${pdto.contribution }</textarea></div>               
			            </div>
		            </div>
		            <div class="page" style="margin-top:20px;">
			            <h4 style="background-color: #f7941e;">구현 기능</h4>
			            <div class="row">
			                <div class="col-12 col-sm-3 col-xl-2">
			                	<input type="file" id="fileUpload1" name="fileUpload1" accept="image/*">
			                	<img id="fileImg1"src="${pdto.image1}" style="height: 95%;width:100%;max-height: 170px;">
			                	<input type="hidden" name ="image1" id="file1" value="${pdto.image1}">
			                </div>
			                <div class="col-12 col-sm-9 col-xl-10">
			                    <div class="row">
			                        <div class="col-3 col-lg-2" id="funcname"><span class=redStar>*</span>기능명</div>
			                        <div class="col-9 col-lg-10" id="funcname1"><input id="function1"  name="function1" style="height:18px margin-bottom:" maxlength="100"> </div>
			                        <div class="col-3 col-lg-2" id="funcexpl"><span class=redStar>*</span>설명</div>
			                        <div class="col-9 col-lg-10"><textarea id="funce1" name="explanation1" style="height:150px;" maxlength="1300">${pdto.explanation1 }</textarea></div>
			                    </div>
			                </div>
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-12 col-sm-3 col-xl-2">
			                	<input type="file" id="fileUpload2" name="fileUpload2" accept="image/*">
			                	<img id="fileImg2"src="${pdto.image2}" style="height: 95%;width:100%;max-height: 170px;">
			                	<input type="hidden" name ="image2" id="file2" value="${pdto.image2}">
			                </div>
			                <div class="col-12 col-sm-9 col-xl-10">
			                    <div class="row">
			                        <div class="col-3 col-lg-2" id="funcname"> 기능명</div>
			                        <div class="col-9 col-lg-10" id="funcname2"><input id="function2" name="function2" style="height:18px margin-bottom:" maxlength="100"></div>
			                        <div class="col-3 col-lg-2" id="funcexpl" > 설명</div>
			                        <div class="col-9 col-lg-10"><textarea name="explanation2" style="height:150px;" maxlength="1300">${pdto.explanation2 }</textarea></div>
			                    </div>
			                </div>
			            </div>
			            <hr class="sp">
			            <div class="row">
			                <div class="col-12 col-sm-3 col-xl-2">
			                	<input type="file" id="fileUpload3" name="fileUpload3" accept="image/*">
			                	<img id="fileImg3"src="${pdto.image3}" style="height: 95%;width:100%;max-height: 170px;">
			                	<input type="hidden" name ="image3" id="file3" value="${pdto.image3}">
			                </div>
			                <div class="col-12 col-sm-9 col-xl-10">
			                    <div class="row">
			                        <div class="col-3 col-lg-2" id="funcname"> 기능명</div>
			                        <div class="col-9 col-lg-10" id="funcname3"><input id="function3" name="function3" style="height:18px margin-bottom:" maxlength="100"></div>
			                        <div class="col-3 col-lg-2" id="funcexpl" > 설명</div>
			                        <div class="col-9 col-lg-10"><textarea name="explanation3" style="height:150px;" maxlength="1300">${pdto.explanation3 }</textarea></div>
			                    </div>
			                </div>
			            </div>
			            <hr class="sp">
			             <div class="row">
			             	<div class="col-3 col-md-2"> 깃 링크  </div>
			                <div class="col-9 col-md-10"><input id="git" type="text" name="git" maxlength="200"></div>               
			            </div>
			            <hr class="sp">
		            </div>
			       	<div style="text-align: end;margin-top:20px;">
			     		<button class="btn btn-info" type="button" id="update">수정 완료</button>
						<button class="btn btn-secondary" type="button" id="return">목록</button>
					</div>
		        </div>
			</form>
			<input type="hidden" id="oriPortfolioTitle" value="${pdto.modPortfolioTitle }">	
			<input type="hidden" id="oriPurpose" value="${pdto.modPurpose }">	
			<input type="hidden" id="oriFunction1" value="${pdto.modFunction1 }">	
			<input type="hidden" id="oriFunction2" value="${pdto.modFunction2 }">	
			<input type="hidden" id="oriFunction3" value="${pdto.modFunction3 }">
			<input type="hidden" id="oriGit" value="${pdto.modGit }">		
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
		var realPortfolioTitle = $("#oriPortfolioTitle").val().replace(/modF'Fdom/gi,'"');
		$("#portfolioTitle").val(realPortfolioTitle);
		var realPurpose = $("#oriPurpose").val().replace(/modF'Fdom/gi,'"');
		$("#purpose").val(realPurpose);
		var realFunction1 = $("#oriFunction1").val().replace(/modF'Fdom/gi,'"');
		$("#function1").val(realFunction1);
		var realFunction2 = $("#oriFunction2").val().replace(/modF'Fdom/gi,'"');
		$("#function2").val(realFunction2);
		var realFunction3 = $("#oriFunction3").val().replace(/modF'Fdom/gi,'"');
		$("#function3").val(realFunction3);
		var realGIt = $("#oriGit").val().replace(/modF'Fdom/gi,'"');
		$("#git").val(realGIt);
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-10Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });

            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
			
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', '${str}'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '${end}'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });   
           	$("#return").on("click",function(){
                	location.href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do";
            })
            
            $("#fileUpload1").on("change",function(){
	  			var ext = this.value.split('.').pop().toLowerCase();
	 			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
	  			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
	  				return;
	  		    }
	  				var data = new FormData();
	  				data.append("fileUpload1", $('#fileUpload1').prop('files')[0]);
	  				$.ajax({
	  			        url: "${pageContext.request.contextPath}/Portfolio/fileUpload1.do",
	  			        type: "POST",
	  			        data: data,
	  			        contentType: false,
	  			        processData: false,
	  			        cache: false
	  			    }).done(function(resp){
	  			    	$("#fileImg1").attr("src",resp);
	  			    	$("#file1").val(resp);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    })
                })
                $("#fileUpload2").on("change",function(){
		  			var ext = this.value.split('.').pop().toLowerCase();
		  			console.log(ext);
		 			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		  			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		  				return;
		  		    }
	  				var data = new FormData();
	  				data.append("fileUpload2", $('#fileUpload2').prop('files')[0]);
	  				$.ajax({
	  			        url: "${pageContext.request.contextPath}/Portfolio/fileUpload2.do",
	  			        type: "POST",
	  			        data: data,
	  			        contentType: false,
	  			        processData: false,
	  			        cache: false
	  			    }).done(function(resp){
	  			    	$("#fileImg2").attr("src",resp);
	  			    	$("#file2").val(resp);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    })
                })
                $("#fileUpload3").on("change",function(){
		  			var ext = this.value.split('.').pop().toLowerCase();
		 			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		  			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		  				return;
		  		    }
	  				var data = new FormData();
	  				data.append("fileUpload3", $('#fileUpload3').prop('files')[0]);
	  				$.ajax({
	  			        url: "${pageContext.request.contextPath}/Portfolio/fileUpload3.do",
	  			        type: "POST",
	  			        data: data,
	  			        contentType: false,
	  			        processData: false,
	  			        cache: false
	  			    }).done(function(resp){
	  			    	$("#fileImg3").attr("src",resp);
	  			    	$("#file3").val(resp);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    })
                })
       			$("#update").on("click",function(){
                    if($("#portfolioTitle").val() && $("#purpose").val() && $("#function1").val() && $("#funce1").val() ){
                   		$("#updateForm").submit();
                   	}else{
                   		alert("프로젝트명과  개발 목표는 구현기능 1은 필수 입력 사항입니다.")
                   	}
           		})
		</script>	
</body>
</html>
