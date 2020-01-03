<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
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
        .container{
            margin:auto;
            background-color: #efefef;
        }
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

            
            <div class="container">
            <h1> 포 트 폴 리 오</h1>
            <div class="row">
                <div class="col-3 col-md-2"> 프로젝트명  </div>
                <div class="col-9 col-md-10"><input value="Hello World(세미 프로젝트)"> </div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2"> 수행 기간  </div>
                <div class="col-9 col-md-10"> <input type="text" id="datepicker">
                    ~ <input type="text" id="datepicker2"> </div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2"> 개발 목표 </div>
                <div class="col-9 col-md-10"> <input value="Hello World(세미 프로젝트)Hello World(세미 프로젝트)Hello World(세미 프로젝트)"> </div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2 theme"> 개발 환경 </div>
                <div class="col-9 col-md-10"> <textarea> </textarea></div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2 theme"> 구현 기능 </div>
                <div class="col-9 col-md-10"> <textarea> </textarea></div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2 theme">  DB 설계 </div>
                <div class="col-9 col-md-10"> <textarea> </textarea></div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2 theme"> 담당 역할 </div>
                <div class="col-9 col-md-10"> <textarea> </textarea></div>               
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3 col-md-2 theme"> 참여/기여도 </div>
                <div class="col-9 col-md-10"> <textarea> </textarea></div>               
            </div>
            <h4>구현 기능</h4>
            <div class="row">
                <div class="col-3"><img src="lion.png" style="height: 100%;width:100%;max-height: 180px;"></div>
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
                        <div class="col-10 col-sm-10 col-lg-11" id="funcname1"><input value="Hello World(세미 프로젝트)" style="height:18px margin-bottom:"> </div>
                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
                        <div class="col-10 col-sm-10 col-lg-11"><textarea style="height:150px;">123</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3"><img src="lion.png" style="height: 100%;width:100%;max-height: 180px;"></div>
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
                        <div class="col-10 col-sm-10 col-lg-11" id="funcname2"><input value="Hello World(세미 프로젝트)" style="height:18px margin-bottom:"> </div>
                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
                        <div class="col-10 col-sm-10 col-lg-11"><textarea style="height:150px;">123</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="interval"></div>
            <div class="row">
                <div class="col-3"><img src="lion.png" style="height: 100%;width:100%;max-height: 180px;"></div>
                <div class="col-9">
                    <div class="row">
                        <div class="col-2 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
                        <div class="col-10 col-sm-10 col-lg-11 " id="funcname3"><input value="Hello World(세미 프로젝트)" style="height:18px margin-bottom:"> </div>
                        <div class="col-2 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
                        <div class="col-10 col-sm-10 col-lg-11"><textarea style="height:150px;">123</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="interval"></div>
            <div style="text-align: end;"><button>작성 완료</button></div>
            
        </div>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
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
                        ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                        ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
                    });

                    //input을 datepicker로 선언
                    $("#datepicker").datepicker();                    
                    $("#datepicker2").datepicker();

                    //From의 초기값을 오늘 날짜로 설정
                    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                    //To의 초기값을 내일로 설정
                    $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                });
		</script>	
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
</body>
</html>
