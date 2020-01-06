<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
        h1{
            text-align: center;
        }
        .interval{
            margin-top: 10px;
            margin-bottom: 10px;
            background-color:lightgray;
            border-radius: 8px;
            height:10px;
        }
        textarea{
            border :0px;
            width:100%;
            height: 100px;
            resize: none;
        }
        input{
            width:100%;
        }
        #datepicker,#datepicker2{
            width:20%
        }
        .theme{
            line-height: 100px;
        }
        h4{
            text-align: center;
            background-color:lightgray;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #funcname, #funcexpl{
            text-align: center;
            font-size:10px;
            line-height:20px;
        }
        #funcexpl{
            line-height: 150px;
        }
        #funcname1,#funcname2,#funcname3{
            margin-bottom: 8px;
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

            <form action="${pageContext.request.contextPath}/Portfolio/update.do" method="post" id="updateForm">
            	<input type="hidden" value="${pdto.seq}" name="seq">
	            <div class="container">
		            <h1> 포 트 폴 리 오</h1>
		            <div class="row">
		                <div class="col-3 col-md-2"> 프로젝트명  </div>
		                <div class="col-9 col-md-10"><input id="portfolioTitle" name="portfolioTitle" value="${pdto.portfolioTitle }"> </div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2"> 수행 기간  </div>
		                 <div class="col-9 col-md-10"> <input name="startDateTemp" type="text" id="datepicker">
		                    ~ <input name="endDateTemp" type="text" id="datepicker2"> </div>     
		                             
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2"> 개발 목표 </div>
		                <div class="col-9 col-md-10"> <input id="purpose" name="purpose" value="${pdto.purpose }"></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 개발 환경 </div>
		                <div class="col-9 col-md-10"> <textarea name="environment"> ${pdto.environment }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 구현 기능 </div>
		                <div class="col-9 col-md-10"> <textarea name="allFunction">${pdto.allFunction }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme">  DB 설계 </div>
		                <div class="col-9 col-md-10"> <textarea name="dbUnitPlan">${pdto.dbUnitPlan }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 담당 역할 </div>
		                <div class="col-9 col-md-10"> <textarea name="role">${pdto.role }</textarea></div>               
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3 col-md-2 theme"> 참여/기여도 </div>
		                <div class="col-9 col-md-10"> <textarea name="contribution">${pdto.contribution }</textarea></div>               
		            </div>
		            <h4>구현 기능</h4>
		            <div class="row">
		                <div class="col-3">
		                	<input type="file" id="fileUpload1" name="fileUpload1">
		                	<img id="fileImg1"src="${pdto.image1}" style="height: 100%;width:100%;max-height: 180px;">
		                	<input type="hidden" name ="image1" id="file1" value="${pdto.image1}">
		                </div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"></div>
		                        <div class="col-10 col-sm-10 col-lg-11" id="funcname1"><input name="function1" style="height:18px margin-bottom:" value="${pdto.function1 }"> </div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation1" style="height:150px;">${pdto.explanation1 }</textarea></div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3">
		                	<input type="file" id="fileUpload2" name="fileUpload2">
		                	<img id="fileImg2"src="${pdto.image2}" style="height: 100%;width:100%;max-height: 180px;">
		                	<input type="hidden" name ="image2" id="file2" value="${pdto.image2}">
		                </div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
		                        <div class="col-10 col-sm-10 col-lg-11" id="funcname2"><input name="function2" style="height:18px margin-bottom:" value="${pdto.function2 }"></div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation2" style="height:150px;">${pdto.explanation2 }</textarea></div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		            <div class="row">
		                <div class="col-3">
		                	<input type="file" id="fileUpload3" name="fileUpload3">
		                	<img id="fileImg3"src="${pdto.image3}" style="height: 100%;width:100%;max-height: 180px;">
		                	<input type="hidden" name ="image3" id="file3" value="${pdto.image3}">
		                </div>
		                <div class="col-9">
		                    <div class="row">
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
		                        <div class="col-10 col-sm-10 col-lg-11 " id="funcname3"><input name="function3" style="height:18px margin-bottom:" value="${pdto.function3 }"></div>
		                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
		                        <div class="col-10 col-sm-10 col-lg-11"><textarea name="explanation3" style="height:150px;">${pdto.explanation3 }</textarea></div>
		                    </div>
		                </div>
		            </div>
		            <div class="interval"></div>
		             <div class="row">
		             	<div class="col-3 col-md-2"> 깃 링크  </div>
		                <div class="col-9 col-md-10"><input type="text" name="git" value="${pdto.git }"></div>               
		            </div>
		            <div class="interval"></div>
		            <div style="text-align: end;"><button type="button" id="return">목록으로 돌아가기</button><button id=update type="button">수정 완료</button></div>
		            
		        </div>
			</form>
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
			console.log('${str}');
			console.log('${end}');
			
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', '${str}'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '${end}'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });   
           	$("#return").on("click",function(){
                	location.href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do";
            })
            
            $("#fileUpload1").on("change",function(){
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
	  			    	console.log(resp);
	  			    	$("#fileImg1").attr("src",resp);
	  			    	$("#file1").val(resp);
	  			    	console.log($("#file1").val);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    	console.log(fail);
	  			    })
                })
                $("#fileUpload2").on("change",function(){
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
	  			    	console.log(resp);
	  			    	$("#fileImg2").attr("src",resp);
	  			    	$("#file2").val(resp);
	  			    	console.log($("#file2").val);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    	console.log(fail);
	  			    })
                })
                $("#fileUpload3").on("change",function(){
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
	  			    	console.log(resp);
	  			    	$("#fileImg3").attr("src",resp);
	  			    	$("#file3").val(resp);
	  			    	console.log($("#file3").val);
	  			    }).fail(function(fail){
	  			    	console.log("실패함");
	  			    	console.log(fail);
	  			    })
                })
                
       			$("#update").on("click",function(){
                	console.log($("#portfolioTitle").val());
                	if($("#portfolioTitle").val() && $("#purpose").val()){
                		$("#updateForm").submit();
                	}else{
                		alert("프로젝트명과  개발 목표는 필수 입력 사항입니다.")
                	}
                })
		</script>	
</body>
</html>
