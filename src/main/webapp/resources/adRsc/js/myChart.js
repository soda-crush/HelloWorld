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
	                values: ["${visitChange[0].visitCount}", "${visitChange[1].visitCount}", "${visitChange[2].visitCount}", "${visitChange[3].visitCount}",
	                	"${visitChange[4].visitCount}", "${visitChange[5].visitCount}", "${visitChange[6].visitCount}", "${visitChange[7].visitCount}", 
	                	"${visitChange[8].visitCount}", "${visitChange[9].visitCount}", "${visitChange[10].visitCount}", "${visitChange[11].visitCount}"],
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
	
	