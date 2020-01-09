	/*--------------  visitChange-chart start ------------*/
	if ($('#visitChange').length > 0) {
		
	    var myConfig = {
	        type: "line",
	        'background-color': "#ffffff",
	        scaleX: { //X-Axis
	            labels: ["${visitChange[0].dateis}", "${visitChange[1].dateis}", "${visitChange[2].dateis}", "${visitChange[3].dateis}",
	            	"${visitChange[4].dateis}", "${visitChange[5].dateis}", "${visitChange[6].dateis}", "${visitChange[7].dateis}",
	            	"${visitChange[8].dateis}", "${visitChange[9].dateis}", "${visitChange[10].dateis}"],
	            label: {
	                "font-size": 14,
	                "offset-x": 0,
	            },
	            item: { //Scale Items (scale values or labels)
	                "font-size": 10,
	            },
	            guide: { //Guides
	                "visible": false,
	                "line-style": "solid", //"solid", "dotted", "dashed", "dashdot"
	                "alpha": 1
	            }
	        },
	        plot: { aspect: "spline" },
	        series: [{
	                values: ["${visitChange[0].visitCount}", "${visitChange[1].visitCount}", "${visitChange[2].visitCount}",
	                	"${visitChange[3].visitCount}", "${visitChange[4].visitCount}", "${visitChange[5].visitCount}", 
	                	"${visitChange[6].visitCount}", "${visitChange[7].visitCount}", "${visitChange[8].visitCount}", 
	                	"${visitChange[9].visitCount}", "${visitChange[10].visitCount}", "${visitChange[11].visitCount}"],
	                'line-color': "#0884D9",
	                'line-width': 5 /* in pixels */ ,
	                marker: { 
	                    'background-color': "#067dce",
	                    size: 5,
	                    'border-color': "#067dce",
	                }
	            }
	        ]
	    };
	    
	    zingchart.render({
	        id: 'visitChange',
	        data: myConfig,
	        height: "99%",
	        width: "100%"
	    });

	}

	/*--------------  visitChange-chart END ------------*/
	
	/*--------------  gender Ratio chart END ------------*/
	if ($('#genderRatio').length) {
		
		var male = Number("${genderRatio[0].genderCount}");
		var female = Number("${genderRatio[1].genderCount}");
	    zingchart.THEME = "classic";

	    var myConfig = {
	        "globals": {
	            "font-family": "Roboto"
	        },
	        "graphset": [{
	                "type": "pie",
	                "background-color": "#fff",
	                "legend": {
	                    "background-color": "none",
	                    "border-width": 0,
	                    "shadow": false,
	                    "layout": "float",
	                    "margin": "auto auto 16% auto",
	                    "marker": {
	                        "border-radius": 3,
	                        "border-width": 0
	                    },
	                    "item": {
	                        "color": "%backgroundcolor"
	                    }
	                },
	                "plotarea": {
	                    "background-color": "#FFFFFF",
	                    "border-color": "#DFE1E3",
	                    "margin": "25% 8%"
	                },
	                "labels": [{
	                    "x": "45%",
	                    "y": "47%",
	                    "width": "10%",
	                    "text": male + female + " 명",
	                    "font-size": 17,
	                    "font-weight": 700
	                }],
	                "plot": {
	                    "size": 70,
	                    "slice": 90,
	                    "margin-right": 0,
	                    "border-width": 0,
	                    "shadow": 0,
	                    "value-box": {
	                        "visible": true
	                    },
	                    "tooltip": {
	                        "text": "%v 명",
	                        "shadow": false,
	                        "border-radius": 2
	                    }
	                },
	                "series": [{
	                        "values": [male],
	                        "text": "남자",
	                        "background-color": "#4cff63"
	                    },
	                    {
	                        "values": [female],
	                        "text": "여자",
	                        "background-color": "#fd9c21"
	                    }
	                ]
	            }

	        ]
	    };

	    zingchart.render({
	        id: 'genderRatio',
	        data: myConfig,
	    });
	}
	/*--------------  gender Ratio chart END ------------*/
	
	/*--------------  joinPath start ------------*/

	if ($('#ambarchart4').length > 0) {
		var count0 = Number("${joinPath[0].pathCount}");
		var count1 = Number("${joinPath[1].pathCount}");
		var count2 = Number("${joinPath[2].pathCount}");
		var count3 = Number("${joinPath[3].pathCount}");
		
		
	    var chart = AmCharts.makeChart("ambarchart4", {
	        "type": "serial",
	        "theme": "light",
	        "marginRight": 0,
	        "dataProvider": [{
	            "joinPath": "${joinPath[0].joinPath}",
	            "visits": count0,
	            "color": "#8918FE"
	        }, {
	            "joinPath": "${joinPath[1].joinPath}",
	            "visits": count1,
	            "color": "#7474F0"
	        }, {
	            "joinPath": "${joinPath[2].joinPath}",
	            "visits": count2,
	            "color": "#C5C5FD"
	        }, {
	            "joinPath": "${joinPath[3].joinPath}",
	            "visits": count3,
	            "color": "#FD9C21"
	        }],
	        "valueAxes": [{
	            "axisAlpha": 0,
	            "position": "left",
	            "title": false
	        }],
	        "startDuration": 1,
	        "graphs": [{
	            "balloonText": "<b>[[category]]: [[value]]</b>",
	            "fillColorsField": "color",
	            "fillAlphas": 0.9,
	            "lineAlpha": 0.2,
	            "type": "column",
	            "valueField": "visits"
	        }],
	        "chartCursor": {
	            "categoryBalloonEnabled": false,
	            "cursorAlpha": 0,
	            "zoomable": false
	        },
	        "categoryField": "joinPath",
	        "categoryAxis": {
	            "gridPosition": "start",
	            "labelRotation": 45
	        },
	        "export": {
	            "enabled": false
	        }

	    });
	}
	/*--------------  joinPath END ------------*/
	
	/*-------------- WorkRatio start ------------*/
	if ($('#ampiechart2').length) {
		var num1 = Number("${workRatio[0].levelCount}");
		var num2 = Number("${workRatio[1].levelCount}");
		var num3 = Number("${workRatio[2].levelCount}");
		
	    var chart = AmCharts.makeChart("ampiechart2", {
	        "type": "pie",
	        "theme": "light",
	        "labelRadius": -65,
	        "labelText": "[[title]]%",
	        "dataProvider": [{
	            "title": "기타",
	            "value": num1
	        }, {
	            "title": "비재직자",
	            "value": num2
	        }, {
	            "title": "재직자",
	            "value": num3
	        }],
	        "titleField": "title",
	        "valueField": "value",
	        "export": {
	            "enabled": false
	        },
	        "color": "#fff"
	    });
	}
	/*-------------- WorkRatio end ------------*/
	
	/*--------------  Generation start ------------*/
	if ($('#ambarchart5').length) {
		var num1 = Number("${generationRatio[0].gCount}");
		var num2 = Number("${generationRatio[1].gCount}");
		var num3 = Number("${generationRatio[2].gCount}");
		var num4 = Number("${generationRatio[3].gCount}");
		var num5 = Number("${generationRatio[4].gCount}");
		
		
	    var chart = AmCharts.makeChart("ambarchart5", {
	        "type": "serial",
	        "theme": "light",
	        "dataProvider": [{
	            "name": "${generationRatio[0].generation}",
	            "points": num1,
	            "color": "#7F8DA9"
	        }, {
	            "name": "${generationRatio[1].generation}",
	            "points": num2,
	            "color": "#FEC514"
	        }, {
	            "name": "${generationRatio[2].generation}",
	            "points": num3,
	            "color": "#952FFE"
	        }, {
	            "name": "${generationRatio[3].generation}",
	            "points": num4,
	            "color": "#8282F1"
	        }, {
	            "name": "${generationRatio[4].generation}",
	            "points": num5,
	            "color": "#2599D4"
	        }],
	        "valueAxes": [{
	            "maximum": 100,
	            "minimum": 0,
	            "axisAlpha": 0,
	            "dashLength": 4,
	            "position": "left"
	        }],
	        "startDuration": 1,
	        "graphs": [{
	            "balloonText": "<span style='font-size:13px;'>[[category]]: <b>[[value]]</b></span>",
	            "bulletOffset": 10,
	            "bulletSize": 52,
	            "colorField": "color",
	            "cornerRadiusTop": 8,
	            "customBulletField": "bullet",
	            "fillAlphas": 0.8,
	            "lineAlpha": 0,
	            "type": "column",
	            "valueField": "points"
	        }],
	        "marginTop": 0,
	        "marginRight": 0,
	        "marginLeft": 0,
	        "marginBottom": 0,
	        "autoMargins": false,
	        "categoryField": "name",
	        "categoryAxis": {
	            "axisAlpha": 0,
	            "gridAlpha": 0,
	            "inside": true,
	            "tickLength": 10,
	            "color": "#fff"
	        },
	        "export": {
	            "enabled": false
	        }
	    });
	}
	/*--------------  Generation END ------------*/
	