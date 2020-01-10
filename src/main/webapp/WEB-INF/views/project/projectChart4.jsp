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
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
<style>
	#pageTitle{margin-bottom:40px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.google-visualization-tooltip { width:300px;}
	rect {stroke-width: 0;}
	svg{height:110px;}
/* 	text[text-anchor='start'],text[text-anchor='middle'],text[text-anchor='end']{fill:#00ff0000;} */
	.projectList{margin-bottom:10px;}	
	.pTextInfo label.N{background-color:limegreen;}
	.pTextInfo label.Y{background-color:red;}
	.pTextInfo label{color:white;}
	.pTextInfo{padding:10px;padding-left:15px;background-color:#ffffff;border-radius:10px 0px 0px 10px;}
	.fa-share-alt,.fa-bookmark{margin-left:15px;}
    .pInfoBox span{font-size:15px;display:inline-block;}
/*     .pInfoBox span:not(:first-of-type){margin-left:15px;} */
	.pInfoBox span:first-of-type{width:120px;}
	.pInfoBox span:nth-of-type(2){width:90px;}
    .pTitleBox{font-weight:bold;}     
    .projectList:hover{cursor:pointer;} 
	.pGraphItem{border-radius:0px 10px 10px 0px;}
	.pGraphItem div{height:100px;}   
	.pGraphBar{border-radius:0px 10px 10px 0px;}   
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
            <section class="projectContainer">        
               
	            <div class=container id="projectPage">
					<div id="pageTitle" class="row">
						<div class="col-12 col-lg-4"><h1>프로젝트 모집</h1></div>
						<div class="col-12 col-lg-8 pt-2">
							<a class="btn btn-secondary" href="/project/list" role="button">게시판</a>
							<a class="btn btn-danger" href="/project/chart" role="button">그래픽</a>
							<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
						</div>
					</div>	
					
								
					<div class="choice">
<!-- 					정렬선택 -->
					</div>
            		
            		<div class="projectBoxes">
						<c:choose>
							<c:when test="${projectList.size()==0 }">
					  			<div class="row"><div class="col-12">모집중인 프로젝트가 없습니다.</div></div>
					  		</c:when>
					  		<c:otherwise>
					  			<c:forEach items="${projectList }" var="p">
									<div class="row projectList">
										<div class="col-5 pTextInfo">
											<label class="${p.state } badge badge-pill ml-0" id="stateLabel">${p.stateInKor }</label>
											<i class="fa fa-share-alt"></i><i class="fa fa-bookmark"></i>
											<span class="float-right"><i class="fa fa-calendar-check-o"></i> ${p.formedAllDate }</span>
											<div class="pTitleBox">${p.title }</div>
											<div class="pInfoBox">
												<span><i class="fa fa-map-marker"></i> ${p.location1 } ${p.location2 }</span>
												<span><i class="fa fa-user"></i> ${p.capacity }명</span>
												<span><i class="fa fa-check"></i> ${p.languages }</span>
											</div>
										</div>
										
										<div class="col-7 pGraphBar p-0">
											<div class="pGraphItem" id="timeline${p.seq }"></div>
										</div>
										
									</div>					
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
						            </div>
            
            </section>
					
                    
               
	            		<div class="dateList"></div>
						

					
	                       
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
      google.charts.load('current', {'packages':['timeline'],'language':'ko'});
      google.charts.setOnLoadCallback(drawChart);
      var seq = ${p.seq};
      
      $(document).on("","",function(){
    	  
      })
      function drawChart() {
        var container = document.getElementById('timeline1');
        var chart = new google.visualization.Timeline(container);  
        var data = new google.visualization.DataTable();
        
        data.addColumn({ type: 'string', id: 'projectItem' });
		data.addColumn({ type: 'string', id: 'dummy' });
        data.addColumn({ type: 'string', role: 'tooltip', 'p': {'html': true}});
        data.addColumn({ type: 'date', id: 'Start' });
        data.addColumn({ type: 'date', id: 'End' });
        data.addRows([
			[ 'project', null, myCustomToolTip(), new Date(2020, 2, 1), new Date(2020, 2, 30) ]
        ]);
        var options = {
			hAxis: {
				format: 'yyyy.MM.dd',
				minValue: new Date(2020, 1, 1),
				maxValue: new Date(2020, 3, 1)
			},
			timeline: { 
// 				singleColor: '#e83e8c',
				singleColor: '#ffc107',
				groupByRowLabel: true,
				barLabelStyle:{fontSize:30},
				showRowLabels: false,
			},
			width:'400px',
			backgroundColor:'#e3e3e3',
			tooltip: {isHtml: true},
			legend: 'none'
        };
        chart.draw(data, options);
        
        
        
        
        
//         var container = document.getElementById('timeline2');
//         var chart = new google.visualization.Timeline(container);  
//         var data = new google.visualization.DataTable();
        
//         data.addColumn({ type: 'string', id: 'projectItem' });
// 		data.addColumn({ type: 'string', id: 'dummy' });
//         data.addColumn({ type: 'string', role: 'tooltip', 'p': {'html': true}});
//         data.addColumn({ type: 'date', id: 'Start' });
//         data.addColumn({ type: 'date', id: 'End' });
//         data.addRows([
// 			[ 'project', null, myCustomToolTip(), new Date(2020, 1, 1), new Date(2020, 1, 25) ]
//         ]);
//         var options = {
// 			hAxis: {
// 				format: 'yyyy.MM',
// 				minValue: new Date(2020, 1, 1),
// 				maxValue: new Date(2020, 3, 1)
// 			},
// 			timeline: { 
// // 				singleColor: '#e83e8c',
// 				groupByRowLabel: true,
// 				barLabelStyle:{fontSize:25},
// 				showRowLabels: false,
// 			},
// 			width:'100%',
// 			backgroundColor:'#ffff',
// 			tooltip: {isHtml: true},
// 			legend: 'none'
//         };
//         chart.draw(data, options);
        function myCustomToolTip(){
        	return 'blahblah';
        }
      }
</script>
</body>
</html>