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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/writeBase.css" type="text/css"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
<script src="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/examples/assets/app.css">
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');
   });
</script>
<style>
#pInfo > div:nth-child(4) > div.col-md-7 > div > span > input.tt-input{max-width:620px;}
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
					<h1>프로젝트 모집 글 작성</h1>
				</div>
				
				<form action="/project/writeProc" method="post" id="writeFrm">
					<div id="pageBody">					
						<div id="pInfo">
							<div class="row">
								<div class="col-md-2"><label class="pItem">지역</label><label class="star">*</label></div>
								<div class="col-md-10">
									<select class="form-control form-control-sm pSelect" onChange="loc1_change(this.value,loc2)" id="loc1" name="loc1">
										<option selected disabled>선택</option>
								        <option value='1'>서울</option>
								        <option value='2'>부산</option>
								        <option value='3'>대구</option>
								        <option value='4'>인천</option>
								        <option value='5'>광주</option>
								        <option value='6'>대전</option>
								        <option value='7'>울산</option>
								        <option value='8'>강원</option>
								        <option value='9'>경기</option>
								        <option value='10'>경남</option>
								        <option value='11'>경북</option>
								        <option value='12'>전남</option>
								        <option value='13'>전북</option>
								        <option value='14'>제주</option>
								        <option value='15'>충남</option>
								        <option value='16'>충북</option>
									</select>
									<input type=hidden name="location1" id="location1">
									<select class="form-control form-control-sm pSelect" id="loc2" name="loc2">
										<option selected disabled>선택</option>
									</select>
									<input type=hidden name="location2" id="location2">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">모집인원</label><label class="star">*</label></div>
								<div class="col-md-2">
									<input type="number" id="capacity" name="capacity" class="form-control form-control-sm pSelect" min="1" max="100">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">프로젝트 기간</label><label class="star">*</label></div>
								<div class="col-md-10">
	        						<input type="text" class="form-control form-control-sm datePicker" placeholder="시작일" name="startDate" id="startDate" readonly>
	        						<span> ~ </span>
	        						<input type="text" class="form-control form-control-sm datePicker" placeholder="종료일" name="endDate" id="endDate" readonly>	        						
	    						</div>
							</div>							
							<div class="row">
								<div class="col-md-2"><label class="pItem">사용언어</label><label class="star">*</label></div>
								<div class="col-md-7" style="word-break:break-all;word-break:break-word;">
									<input type="text" class="form-control" id="languages" name="languages" style="word-break:break-all;word-break:break-word;">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">연락처</label></div>
								<div class="col-md-7">
									<input type="tel" class="form-control form-control-sm phone p-1" maxlength="3" id="phone1"> -
									<input type="tel" class="form-control form-control-sm phone p-1" maxlength="4" id="phone2"> -
									<input type="tel" class="form-control form-control-sm phone p-1" maxlength="4" id="phone3">
									<input type="hidden" name="phone" id="phone">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">메일주소</label></div>							
								<div class="col-md-7"><input type="email" class="form-control form-control-sm" id="email" name="email"></div>
							</div>
						</div>
						<div id="pBody">
							<div id="pTitleInput"><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title" maxlength="100"></div>
							<div id="pContentsInput"><textarea class="form-control summernote" name="contents" id="contents"></textarea></div>											
						</div>					
					</div>
					<div id="pageFooter">
						<span><a class="btn btn-secondary" href="/project/list" role="button">목록</a></span>
						<span class="float-right">						
							<a class="btn btn-secondary" href="/project/list" role="button">취소</a>
							<input class="btn btn-primary" type="submit" value="글쓰기" id="writeBtn">						
						</span>
					</div>
				</form>				         
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
        
		<script src="/js/project/location.js"></script>
		<script>		
		$('.summernote').summernote({
			lang: 'ko-KR',
	        placeholder: '내용을 입력해주세요',	        
	        minHeight: 400,
	        maxHeight: 400,
	        toolbar: [
	            ['style', ['style']],
	            ['font', ['bold', 'underline', 'clear']],
	            ['fontname', ['fontname']],
	            ['color', ['color']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['table', ['table']],
	            ['insert', ['link', 'picture', 'hr']],
	            ['view', ['fullscreen']],
	            ['help', ['help']]
	          ]
	    });
		
		$('.datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '+1d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+6m',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true			    
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.			    
		}).on("changeDate", function(e) {
            changeDate : true	//사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
//             console.log(e); 
		});			
		
		var result = ${data};
		var data = JSON.stringify(result);			
		var task = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace("text"),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
			local: jQuery.parseJSON(data) //your can use json type
		});		
		task.initialize();		
		var elt = $("#languages");
		elt.tagsinput({
			itemValue: "value",
			itemText: "text",
			typeaheadjs: {
			  name: "task",
			  displayKey: "text",
			  source: task.ttAdapter()
			}
		});
		
		$("#writeBtn").on("click",function(){	
			if($("#loc1").val()==null|$("#loc2").val()==null|$("#capacity")==null|$("#startDate").val()==""|$("#endDate").val()==""|$("#languages").val()==""){
				alert("필수 입력 항목을 확인해주세요");
				return false;
			}
			if($("#startDate").val()>$("#endDate").val()){
				alert("시작일이 종료일보다 늦은 날짜일 수 없습니다");
				$("#startDate").focus();				
				return false;
			}				
			$("#title").val($.trim($("#title").val())); 				
			if($("#title").val()==""){
				alert("제목을 입력해주세요");
				return false;
			}
			regex = /^[(<p><br></p>)(<p>(&nbsp; )+</p>)]{0,}$/;
		   	var content = $(".summernote").val();
		   	var result = regex.exec(content);
		   	if(result!=null){
		   		alert("내용을 입력해주세요");
		   		$(".note-editable").html("<p><br></p>");
		   		$(".note-placeholder").show();
		   		return false;
		   	}
			if($("#phone1").val()!=""||$("#phone2").val()!=""||$("#phone3").val()!=""){
				var regex1 = /^\d.+?$/;
	            var data1 = $("#phone1").val();
	            var result1 = regex1.exec(data1);
				if(result1 == null){
					alert("숫자를 입력해주세요");
					$("#phone1").focus();
					return false;
				}            	
				var regex2 = /^\d.+?$/;
	            var data2 = $("#phone2").val();
	            var result2 = regex2.exec(data2);
				if(result2 == null){
					alert("숫자를 입력해주세요");
					$("#phone2").focus();
					return false;
				}
				var data3 = $("#phone3").val();
				var result3 = regex2.exec(data3);
				if(result3 == null){
					alert("숫자를 입력해주세요");
					$("#phone3").focus();
					return false;
				}
			}	
		   	$("#phone").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
			if($("#phone").val()=="--"){$("#phone").val("");}
			if($("#email").val()!=""){
				var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/gm;
	            var data = $("#email").val();
	            var result = regex.exec(data);
	            if(result == null){			
					alert("올바른 이메일 형식이 아닙니다");				
					$("#email").focus();
					return false;
	            }					
			}
			var loc1 = $("#loc1").find("option[value='"+$("#loc1").val()+"']").text();
			var loc2 = $("#loc2").find("option[value='"+$("#loc2").val()+"']").text();
			$("input[name=location1]").val(loc1);
			$("input[name=location2]").val(loc2);				
		});
		</script>
</body>
</html>