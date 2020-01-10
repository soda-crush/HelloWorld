<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
									<select class="form-control form-control-sm pSelect" name="location1" onChange="loc1_change(this.value,location2)" id="location1">
										<option selected value=''>선택</option>
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
									<select class="form-control form-control-sm pSelect" name="location2" id="location2">
										<option selected value=''>선택</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">모집인원</label><label class="star">*</label></div>
								<div class="col-md-2">
									<select class="form-control form-control-sm pSelect" name="capacity" id="capacity">
										<option selected disabled>인원</option>
									    <option value="1">1</option>
									    <option value="2">2</option>
									    <option value="3">3</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">기간</label><label class="star">*</label></div>
								<div class="col-md-10">
	        						<input type="text" id="startInputDate" class="form-control form-control-sm datePicker" placeholder="시작일" name="startInputDate">
	        						<span> ~ </span>
	        						<input type="text" id="endInputDate" class="form-control form-control-sm datePicker" placeholder="종료일" name="endInputDate">
	        						<input type="hidden" id="startDate" name="startDate">
									<input type="hidden" id="endDate" name="endDate">
	    						</div>
							</div>							
							<div class="row">
								<div class="col-md-2"><label class="pItem">사용언어</label><label class="star">*</label></div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="languages" name="languages">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">연락처</label></div>
								<div class="col-md-7">
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="3" id="phone1"> -
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="4" id="phone2"> -
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="4" id="phone3">
									<input type="hidden" name="phone" id="phone">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">메일주소</label></div>							
								<div class="col-md-7"><input type="email" class="form-control form-control-sm" id="email" name="email"></div>
							</div>
						</div>
						<div id="pBody">
							<div id="pTitleInput"><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title"></div>
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
        
        <script>
			$('.summernote').summernote({
				lang: 'ko-KR',
		        placeholder: '내용을 입력해주세요',	        
		        minHeight: 400,
		        maxHeight: 400	        
		    });
			
			$('.datePicker').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '+1d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+1y',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
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
                console.log(e); 
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
				console.log($("#location1").val());
				console.log($("#location2").val());
				return false;
				
				var time = new Date($("#startInputDate").val()).getTime();				
				$("#startDate").val($("#startInputDate").val()+" 00:00:00.000000000");
				$("#endDate").val($("#endInputDate").val()+" 00:00:00.000000000");
				if($("#location1").val()==null|$("#location2").val()==null|$("#capacity")==null|$("#startDate").val()==""|$("#endDate").val()==""|$("#languages").val()==""){
					alert("필수 입력 항목을 확인해주세요");
					return false;
				}
				if($("#startDate").val()>$("#endDate").val()){
					alert("시작일이 종료일보다 늦은 날짜일 수 없습니다");
					return false;
				}				
				$("#title").val($.trim($("#title").val())); 				
				if($("#title").val()==""){
					alert("제목을 입력해주세요");
					return false;
				}
				$("#phone").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
				if($("#phone").val()=="--"){$("#phone").val("");}	

				
				var loc1 = $("#location1").find("option[value='"+$("#location1").val()+"']").text();
				var loc2 = $("#location2").find("option[value='"+$("#location2").val()+"']").text();
				console.log(loc1);
				console.log(loc2);
				return false;
				$("#location1").val(loc1);
				$("#location2").val(loc2);
			});
			
			
			
			
			 var loc1Num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
			 var loc1Name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');

			 var loc2Num = new Array();
			 var loc2Name = new Array();

			 loc2Num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
			 loc2Name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

			 loc2Num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
			 loc2Name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');

			 loc2Num[3] = new Array(58,59,60,61,62,63,64,65);
			 loc2Name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');

			 loc2Num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
			 loc2Name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');

			 loc2Num[5] = new Array(76,77,78,79,80);
			 loc2Name[5] = new Array('광산구','남구','동구','북구','서구');

			 loc2Num[6] = new Array(81,82,83,84,85);
			 loc2Name[6] = new Array('대덕구','동구','서구','유성구','중구');

			 loc2Num[7] = new Array(86,87,88,89,90);
			 loc2Name[7] = new Array('남구','동구','북구','중구','울주군');

			 loc2Num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
			 loc2Name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');

			 loc2Num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
			 loc2Name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');

			 loc2Num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
			 loc2Name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');

			 loc2Num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
			 loc2Name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');

			 loc2Num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
			 loc2Name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

			 loc2Num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
			 loc2Name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

			 loc2Num[14] = new Array(230,231,232,233);
			 loc2Name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

			 loc2Num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
			 loc2Name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

			 loc2Num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
			 loc2Name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

			 function loc1_change(num,loc2sel){
				 if(num == '') return;
				 var val = loc2Num[num];
				 var name = loc2Name[num];
				 for(i=loc2sel.length-1; i>=0; i--){
				    loc2sel.options[i] = null;
				    loc2sel.options[0] = new Option('선택','');   
				    
				 }
	
				if(loc2Name[0] === undefined){
				   for(i=0; i<name.length; i++){
				   loc2sel.options[i+1] = new Option(name[i],val[i]);
				 } 
				}		 
			}
       </script>
</body>
</html>