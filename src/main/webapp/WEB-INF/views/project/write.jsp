<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker.css" type="text/css"/>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageFooter{padding-top:10px;}
	#pBody{margin-top:20px;}
	#pInfo *,#pBody *{font-size:15px;}
	#pInfo .pItem{margin-top:8px;}
	#pInfo .star{color:red;}
	#pInfo .row{margin-top:10px;}
	#pInfo .custom-select{width:100px;}	
	#pInfo .phone{display:inline;width:60px;}
	#pBody #pTitleInput,#pContentsInput{margin-top:10px;}
	.datePicker{display:inline;width:110px;text-align:center;}
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
				<div id="pageTitle">
					<h1>프로젝트 모집</h1>
				</div>
				<div id="pageBody">					
					<div id="pInfo">
						<div class="row">
							<div class="col-2"><label class="pItem">지역</label><label class="star">*</label></div>
							<div class="col-2">
								<select class="custom-select">
									<option selected>지역</option>
								    <option value="1">One</option>
								    <option value="2">Two</option>
								    <option value="3">Three</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-2"><label class="pItem">모집인원</label><label class="star">*</label></div>
							<div class="col-2">
								<select class="custom-select">
									<option selected>인원</option>
								    <option value="1">One</option>
								    <option value="2">Two</option>
								    <option value="3">Three</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-2"><label class="pItem">기간</label><label class="star">*</label></div>
							<div class="col-10">
        						<input type="text" id="startDatePick" class="form-control datePicker" value="시작일">
        						<span> ~ </span>
        						<input type="text" id="endDatePick" class="form-control datePicker" value="종료일">        						
    						</div>
						</div>							
						<div class="row">
							<div class="col-2"><label class="pItem">사용언어</label><label class="star">*</label></div>
							<div>
<!-- 								부트스트랩 업로딩태그 -->
							</div>
						</div>
						<div class="row">
							<div class="col-2"><label class="pItem">연락처</label></div>
							<div class="col-7">
								<input type="text" class="form-control phone p-1" maxlength="3"> -
								<input type="text" class="form-control phone p-1" maxlength="4"> -
								<input type="text" class="form-control phone p-1" maxlength="4">
							</div>
						</div>
						<div class="row">
							<div class="col-2"><label class="pItem">메일주소</label></div>							
							<div class="col-7"><input type="text" class="form-control" id="email"></div>
						</div>
					</div>
					<div id="pBody">
						<div id="pTitleInput"><input type="text" class="form-control" placeholder="제목을 입력해주세요"></div>
						<div id="pContentsInput"><textarea class="form-control summernote"></textarea></div>											
					</div>					
				</div>
				<div id="pageFooter">
					<span><a class="btn btn-secondary" href="/project/list" role="button">목록</a></span>
					<span class="float-right">						
						<a class="btn btn-secondary" href="/project/list" role="button">취소</a>
						<a class="btn btn-primary" href="#" role="button">글쓰기</a>						
					</span>
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
			$('.summernote').summernote({
		        placeholder: '내용을 입력해주세요',	        
		        minHeight: 300,
		        maxHeight: 300,
		        
		    });
			

			
			$('.datePicker').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+1y',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    //datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			    //daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    //daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    //title: "시작일",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.			    
			}).on("changeDate", function(e) {
                //이벤트의 종류
                //show : datePicker가 보이는 순간 호출
                //hide : datePicker가 숨겨지는 순간 호출
                //clearDate: clear 버튼 누르면 호출
                changeDate : true	//사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                //changeMonth : 월이 변경되면 호출
                //changeYear : 년이 변경되는 호출
                //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
                
                console.log(e);// 찍어보면 event 객체가 나온다.
                //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
                // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
                // 위와 같은 형태로 보인다. 
                // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
			});//datepicker end		
			//.datepicker("setDate", new Date())
        </script>
</body>
</html>