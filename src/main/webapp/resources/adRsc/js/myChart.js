/*--------------  visitChange-chart start ------------*/
if ($('#visitChange').length > 0) {
	var num1 = Number("${visitChange[0].visitCount}");
	var num2 = Number("${visitChange[1].visitCount}");
	var num3 = Number("${visitChange[2].visitCount}");
	var num4 = Number("${visitChange[3].visitCount}");
	var num5 = Number("${visitChange[4].visitCount}");
	var num6 = Number("${visitChange[5].visitCount}");
	var num7 = Number("${visitChange[6].visitCount}");
	var num8 = Number("${visitChange[7].visitCount}");
	var num9 = Number("${visitChange[8].visitCount}");
	var num10 = Number("${visitChange[9].visitCount}");
	var num11 = Number("${visitChange[10].visitCount}");
	
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
                values: [num1, num2, num3, num4, num5, num6, num7, num8, num9, num10, num11],
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
	
	/*--------------  TOP5 START ------------*/	
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		/**
		 * Chart design taken from Samsung health app
		 */
		var top1 = Number("${top5List[0].point}");
		var top2 = Number("${top5List[1].point}");
		var top3 = Number("${top5List[2].point}");
		var top4 = Number("${top5List[3].point}");
		var top5 = Number("${top5List[4].point}");
		 
		var chart = am4core.create("chartdiv", am4charts.XYChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.paddingBottom = 30;

		chart.data = [{
		    "name": "${top5List[0].nickName}(${top5List[0].id})",
		    "steps": top1,
		    "href": "${top5List[0].profileImg}"
		}, {
		    "name": "${top5List[1].nickName}(${top5List[1].id})",
		    "steps": top2,
		    "href": "${top5List[1].profileImg}"
		}, {
		    "name": "${top5List[2].nickName}(${top5List[2].id})",
		    "steps": top3,
		    "href": "${top5List[2].profileImg}"
		}, {
		    "name": "${top5List[3].nickName}(${top5List[3].id})",
		    "steps": top4,
		    "href": "${top5List[3].profileImg}"
		}, {
		    "name": "${top5List[4].nickName}(${top5List[4].id})",
		    "steps": top5,
		    "href": "${top5List[4].profileImg}"
		}];

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "name";
		categoryAxis.renderer.grid.template.strokeOpacity = 0;
		categoryAxis.renderer.minGridDistance = 10;
		categoryAxis.renderer.labels.template.dy = 35;
		categoryAxis.renderer.tooltip.dy = 35;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.inside = true;
		valueAxis.renderer.labels.template.fillOpacity = 0.3;
		valueAxis.renderer.grid.template.strokeOpacity = 0;
		valueAxis.min = 0;
		valueAxis.cursorTooltipEnabled = false;
		valueAxis.renderer.baseGrid.strokeOpacity = 0;

		var series = chart.series.push(new am4charts.ColumnSeries);
		series.dataFields.valueY = "steps";
		series.dataFields.categoryX = "name";
		series.tooltipText = "{valueY.value}";
		series.tooltip.pointerOrientation = "vertical";
		series.tooltip.dy = - 6;
		series.columnsContainer.zIndex = 100;

		var columnTemplate = series.columns.template;
		columnTemplate.width = am4core.percent(50);
		columnTemplate.maxWidth = 66;
		columnTemplate.column.cornerRadius(60, 60, 10, 10);
		columnTemplate.strokeOpacity = 0;

		series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
		series.mainContainer.mask = undefined;

		var cursor = new am4charts.XYCursor();
		chart.cursor = cursor;
		cursor.lineX.disabled = true;
		cursor.lineY.disabled = true;
		cursor.behavior = "none";

		var bullet = columnTemplate.createChild(am4charts.CircleBullet);
		bullet.circle.radius = 30;
		bullet.valign = "bottom";
		bullet.align = "center";
		bullet.isMeasured = true;
		bullet.mouseEnabled = false;
		bullet.verticalCenter = "bottom";
		bullet.interactionsEnabled = false;

		var hoverState = bullet.states.create("hover");
		var outlineCircle = bullet.createChild(am4core.Circle);
		outlineCircle.adapter.add("radius", function (radius, target) {
		    var circleBullet = target.parent;
		    return circleBullet.circle.pixelRadius + 10;
		})

		var image = bullet.createChild(am4core.Image);
		image.width = 60;
		image.height = 60;
		image.horizontalCenter = "middle";
		image.verticalCenter = "middle";
		image.propertyFields.href = "href";

		image.adapter.add("mask", function (mask, target) {
		    var circleBullet = target.parent;
		    return circleBullet.circle;
		})

		var previousBullet;
		chart.cursor.events.on("cursorpositionchanged", function (event) {
		    var dataItem = series.tooltipDataItem;

		    if (dataItem.column) {
		        var bullet = dataItem.column.children.getIndex(1);

		        if (previousBullet && previousBullet != bullet) {
		            previousBullet.isHover = false;
		        }

		        if (previousBullet != bullet) {

		            var hs = bullet.states.getKey("hover");
		            hs.properties.dy = -bullet.parent.pixelHeight + 30;
		            bullet.isHover = true;

		            previousBullet = bullet;
		        }
		    }
		})

		}); // end am4core.ready()
	
	/*--------------  TOP5 End ------------*/	
	
	/*--------------  boardLog start ------------*/
	if ($('#ambarchart3').length) {
	    var chart = AmCharts.makeChart("ambarchart3", {
	        "type": "serial",
	        "theme": "light",
	        "categoryField": "date",
	        "rotate": true,
	        "startDuration": 1,
	        "categoryAxis": {
	            "gridPosition": "start",
	            "position": "left"
	        },
	        "trendLines": [],
	        "graphs": [{
	                "balloonText": "새 글:[[value]]",
	                "fillAlphas": 0.8,
	                "id": "AmGraph-1",
	                "lineAlpha": 0.2,
	                "title": "새 글",
	                "type": "column",
	                "valueField": "새 글",
	                "fillColorsField": "color"
	            },
	            {
	                "balloonText": "삭제된 글:[[value]]",
	                "fillAlphas": 0.8,
	                "id": "AmGraph-2",
	                "lineAlpha": 0.2,
	                "title": "삭제된 글",
	                "type": "column",
	                "valueField": "삭제된 글",
	                "fillColorsField": "color2"
	            }
	        ],
	        "guides": [],
	        "valueAxes": [{
	            "id": "ValueAxis-1",
	            "position": "top",
	            "axisAlpha": 0
	        }],
	        "allLabels": [],
	        "balloon": {},
	        "titles": [],
	        "dataProvider": [{
	                "date": "${boardLog[0].dateis}",
	                "새 글": "${boardLog[0].newBoard}",
	                "삭제된 글": "${boardLog[0].delBoard}",
	                "color": "#7474f0",
	                "color2": "#C5C5FD"
	            },
	            {
	                "date": "${boardLog[1].dateis}",
	                "새 글": "${boardLog[1].newBoard}",
	                "삭제된 글": "${boardLog[1].delBoard}",
	                "color": "#7474f0",
	                "color2": "#C5C5FD"
	            },
	            {
	                "date": "${boardLog[2].dateis}",
	                "새 글": "${boardLog[2].newBoard}",
	                "삭제된 글": "${boardLog[2].delBoard}",
	                "color": "#7474f0",
	                "color2": "#C5C5FD"
	            },
	            {
	                "date": "${boardLog[3].dateis}",
	                "새 글": "${boardLog[3].newBoard}",
	                "삭제된 글": "${boardLog[3].delBoard}",
	                "color": "#7474f0",
	                "color2": "#C5C5FD"
	            },
	            {
	                "date": "${boardLog[4].dateis}",
	                "새 글": "${boardLog[4].newBoard}",
	                "삭제된 글": "${boardLog[4].delBoard}",
	                "color": "#7474f0",
	                "color2": "#C5C5FD"
	            }
	        ],
	        "export": {
	            "enabled": false
	        }

	    });
	}
	/*--------------  boardLog END ------------*/
	
	/*--------------  ComLog start ------------*/
	if ($('#ambarchart6').length) {
	    var chart = AmCharts.makeChart("ambarchart6", {
	        "type": "serial",
	        "theme": "light",
	        "handDrawn": true,
	        "handDrawScatter": 3,
	        "legend": {
	            "useGraphSettings": true,
	            "markerSize": 12,
	            "valueWidth": 0,
	            "verticalGap": 0
	        },
	        "dataProvider": [{
	            "year": "${comLog[0].dateis}",
	            "새 댓글": "${comLog[0].newCom}",
	            "삭제된 댓글": "${comLog[0].delCom}",
	            "color": "#952FFE"
	        }, {
	            "year": "${comLog[1].dateis}",
	            "새 댓글": "${comLog[1].newCom}",
	            "삭제된 댓글": "${comLog[0].delCom}",
	            "color": "#5182DE"
	        }, {
	            "year": "${comLog[2].dateis}",
	            "새 댓글": "${comLog[2].newCom}",
	            "삭제된 댓글": "${comLog[0].delCom}",
	            "color": "#8282F1"
	        }, {
	            "year": "${comLog[3].dateis}",
	            "새 댓글": "${comLog[3].newCom}",
	            "삭제된 댓글": "${comLog[0].delCom}",
	            "color": "#B369FE"
	        }, {
	            "year": "${comLog[4].dateis}",
	            "새 댓글": "${comLog[4].newCom}",
	            "삭제된 댓글": "${comLog[0].delCom}",
	            "color": "#51ADDD"
	        }],
	        "valueAxes": [{
	            "minorGridAlpha": 0.08,
	            "minorGridEnabled": true,
	            "position": "top",
	            "axisAlpha": 0
	        }],
	        "startDuration": 1,
	        "graphs": [{
	            "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b></span>",
	            "title": "새 댓글",
	            "type": "column",
	            "fillAlphas": 1,
	            "fillColorsField": "color",
	            "valueField": "새 댓글"
	        }, {
	            "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b></span>",
	            "bullet": "round",
	            "bulletBorderAlpha": 1,
	            "lineColor": "#AA59FE",
	            "bulletColor": "#FFFFFF",
	            "useLineColorForBulletBorder": true,
	            "fillAlphas": 0,
	            "lineThickness": 2,
	            "lineAlpha": 1,
	            "bulletSize": 7,
	            "title": "삭제된 댓글",
	            "valueField": "삭제된 댓글"
	        }],
	        "rotate": true,
	        "categoryField": "year",
	        "categoryAxis": {
	            "gridPosition": "start"
	        },
	        "export": {
	            "enabled": false
	        }

	    });
	}
	/*--------------  comLog END ------------*/