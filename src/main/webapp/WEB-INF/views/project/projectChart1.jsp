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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageTitle .btn{margin-left:5px;}
	.google-visualization-tooltip { width:300px;}
	rect {stroke-width: 0;}
/* 	text[text-anchor='start'],text[text-anchor='middle'],text[text-anchor='end']{fill:#00ff0000;} */

        
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
            <section class="projectContainer" style="min-height: 100px;">        
               
	            <div class=container id="projectPage">
					<div id="pageTitle" class="row">
						<div class="col-12 col-lg-4"><h1>프로젝트 모집</h1></div>
						<div class="col-12 col-lg-8 pt-2">
							<a class="btn btn-secondary" href="/project/list" role="button">게시판</a>
							<a class="btn btn-primary" href="/project/chart" role="button">그래픽</a>
							<a class="btn btn-secondary" href="/project/map" role="button">지도</a>
						</div>
					</div>				
					<div class="choice">
					
					</div>
					<div class="projectContainer">
						<div class="dateList"></div>
						
						
						
						
						 <div id="timeline1"></div>
						 <div id="timeline2"></div>
					</div>
	            </div>
            
            </section>           
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
			[ 'project', null, myCustomToolTip(), new Date(2020, 1, 1), new Date(2020, 1, 6) ]
        ]);

        var options = {
			hAxis: {
				format: 'yyyy.MM',
				minValue: new Date(2020, 1, 1),
				maxValue: new Date(2020, 3, 1)
			},
			timeline: { 
// 				singleColor: '#e83e8c',
				groupByRowLabel: true,
				barLabelStyle:{fontSize:25},
				showRowLabels: false,
			},
			width:'100%',
			backgroundColor:'#ffff',
			tooltip: {isHtml: true},
			legend: 'none'
        };
        chart.draw(data, options);
        
        
        
        
        
        
        var container = document.getElementById('timeline2');
        var chart = new google.visualization.Timeline(container);  
        var data = new google.visualization.DataTable();
        
        data.addColumn({ type: 'string', id: 'projectItem' });
		data.addColumn({ type: 'string', id: 'dummy' });
        data.addColumn({ type: 'string', role: 'tooltip', 'p': {'html': true}});
        data.addColumn({ type: 'date', id: 'Start' });
        data.addColumn({ type: 'date', id: 'End' });
        data.addRows([
			[ 'project', null, myCustomToolTip(), new Date(2020, 1, 1), new Date(2020, 1, 25) ]
        ]);

        var options = {
			hAxis: {
				format: 'yyyy.MM',
				minValue: new Date(2020, 1, 1),
				maxValue: new Date(2020, 3, 1)
			},
			timeline: { 
// 				singleColor: '#e83e8c',
				groupByRowLabel: true,
				barLabelStyle:{fontSize:25},
				showRowLabels: false,
			},
			width:'100%',
			backgroundColor:'#ffff',
			tooltip: {isHtml: true},
			legend: 'none'
        };
        chart.draw(data, options);
        function myCustomToolTip(){
        	return 'blahblah';
        }
      }

</script>
</body>
</html>
