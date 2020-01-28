		var realTitle = $("#oriTitle").val().replace(/modF'Fdom/gi,'"');
		$("#title").val(realTitle);
		$("#loc1 option").filter(function() {
		    return this.text == $("#oriLoc1").val(); 
		}).attr('selected', true);
		loc1_change($("#loc1 option:selected").val(),loc2);
		$("#loc2 option").filter(function() {
		    return this.text == $("#oriLoc2").val(); 
		}).attr('selected', true);
		$("#capacity").val($("#oriCapa").val());
		var fullPhone = $("#oriPhone").val();
		var phoneArr = fullPhone.split("-");
		$("#phone1").val(phoneArr[0]);
		$("#phone2").val(phoneArr[1]);
		$("#phone3").val(phoneArr[2]);
		
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
		});
		
		var data = $("#langData").val();			
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
		var lang = $("#oriLangs").val();
		var langArr = lang.split(",");
		for(var i=0;i<langArr.length;i++){
			elt.tagsinput("add", {value: langArr[i],text: langArr[i]});
		}
		
		$("#modifyBtn").on("click",function(){
			if(($("#loc1").val()==null&$("#loc2").val()==null)|($("#loc1").val()!=0&$("#loc2").val()==null)|$("#capacity").val()==""|$("#startDate").val()==""|$("#endDate").val()==""|$("#languages").val()==""){
				if($("#pInfo").find(".tt-input").val()!=""){
					$("#pInfo").find(".tt-input").val("");
				}
				alert("필수 입력 항목을 확인해주세요");
				return false;										
			}
			if($("#startDate").val()>$("#endDate").val()){
				alert("시작일이 종료일보다 늦은 날짜일 수 없습니다");
				$("#startDate").focus();
				return false;
			}else if($("#startDate").val()==$("#endDate").val()){
				alert("시작일이 종료일과 같은 날짜일 수 없습니다");
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
				var regex1 = /^(\d){3}$/;
	            var data1 = $("#phone1").val();
	            var result1 = regex1.exec(data1);
				if(result1 == null){
					alert("숫자를 입력해주세요");
					$("#phone1").focus();
					return false;
				}            	
				var regex2 = /^(\d){3,4}$/;
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
				var regex = /^\w+@[a-z]+(\.[a-z]+){1,2}$/;
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
			
			var oriCon = $("#contents").val();
			var nonTagCon = oriCon.replace(/(<([^>]+)>)/ig,"");
			$("#nonTagContents").val(nonTagCon);
		});	