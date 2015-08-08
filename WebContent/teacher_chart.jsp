<%@page import="tools.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:300px"></div>
    <div id="main2" style="height:300px"></div>
    <%
    	String courseId = request.getParameter("courseId");
    	DBManager manager = new DBManager();
    	ArrayList<Integer> grade = manager.getCountInScoreRange(courseId);
    %>
    <!-- ECharts单文件引入 -->
    <script src="./js/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: './dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/pie',
                'echarts/chart/funnel',
                'echarts/chart/bar'
            ],
            DrawCharts
            );
           function DrawCharts(ec) {
        	   Draw1(ec);
        	   Draw2(ec);
           }
            function Draw1(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main2')); 
                
                var option = {
                		
                			    title: {
                			        
                			        textStyle:{
                			            fontSize: 35,
                			            fontWeight: 'bolder',
                			            color: '#436EEE'
                			        },        			        
                			        subtext: '',//在标题下方显示内容
                			    },
                			    tooltip: {
                                    show: true//默认为数据item触发
                                },
                			    toolbox: {
                			        show: true,
                			        feature: {
                			            dataView: {show: true, readOnly: false},
                			            restore: {show: true},
                			            saveAsImage: {show: true}
                			        }
                			    },
                			    calculable: true,
                			    grid: {
                			        borderWidth: 0,
                			        y: 80,
                			        y2: 60
                			    },
                			    xAxis: [
                			        {
                			            type: 'category',
                			            show: true,
                			            data: ['0-60分', '61-69分', '70到79分', '80到89分', '90到100分']
                			        }
                			    ],
                			    yAxis: [
                			        {
                			            type: 'value',
                			            show: true
                			        }
                			    ],
                			    series: [
                			        {
                			            name: '学生分段',
                			            type: 'bar',
                			            itemStyle: {
                			                normal: {
                			                    color: function(params) {
                			                        // build a color map as your need.
                			                        var colorList = [
                			                          '#00FFFF','#B5C334','#FCCE10','#E87C25','#27727B',
                			                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                			                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                			                        ];
                			                        return colorList[params.dataIndex]
                			                    },
                			                    label: {
                			                        show: false,
                			                        position: 'top',
                			                        formatter: '{b}\n{c}'
                			                    }
                			                }
                			            },
                			            data: [<%=grade.get(0)%>,<%=grade.get(1)%>,<%=grade.get(2)%>,<%=grade.get(3)%>,<%=grade.get(4)%>]
                			        }
                			    ]
                			};
                			                    
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
            
            function  Draw2(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                		 title : {
            			        textStyle:{
            			            fontSize: 35,
            			            fontWeight: 'bolder',
            			            color: '#436EEE'
            			        },
                		        x:'center'
                		    },
                		    tooltip : {
                		        trigger: 'item',
                		        formatter: "{a} <br/>{b} : {c} ({d}%)"
                		    },
                		    legend: {
                		        orient : 'vertical',
                		        x : 'left',
                		        data:['0-60','61-69','70-79','80-89','90-100']
                		    },
                		    toolbox: {
                		        show : true,
                		        feature : {          		          
                		            dataView : {show: true, readOnly: false},
                		            magicType : {
                		                show: true, 
                		                type: ['pie', 'funnel'],
                		                option: {
                		                    funnel: {
                		                        x: '25%',
                		                        width: '50%',
                		                        funnelAlign: 'left',
                		                        max: 1548
                		                    }
                		                }
                		            },
                		            restore : {show: true},
                		            saveAsImage : {show: true}
                		        }
                		    },
                		
                		    calculable : true,
                		    series : [
                		        {
                		            name:'学生分段',
                		            type:'pie',
                		            radius : '60%',//半径
                		            center: ['50%', '60%'],//中心
                		            data:[
                		                {value:<%=grade.get(0)%>, name:'0-60'},
                		                {value:<%=grade.get(1)%>, name:'61-69'},
                		                {value:<%=grade.get(2)%>, name:'70-79'},
                		                {value:<%=grade.get(3)%>, name:'80-89'},
                		                {value:<%=grade.get(4)%>, name:'90-100'}
                		            ]
                		        }
                		    ]
                };
                			                    
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        
    </script>
</body>