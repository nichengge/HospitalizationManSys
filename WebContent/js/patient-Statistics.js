var $tbody = $("#show");
var start = 0;
var end = 15;
$(function(){
	$(".confirm").click(select);
	$(".clear").click(clear);
});

//查询按钮
function select(option){
	//Post请求查询数据
	var queryData = $("#patinetStatisticsForm").serialize();
	$.ajax({
		url:"patient/patientStatistics.do",
		async : false,  //这里选择异步为false，那么这个程序执行到这里的时候会暂停，等待数据加载
		type:"post",
		data:queryData,
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				var lists = result.data;
				$tbody.empty();			
		//表格数据分页
				$('.pagination').pagination(lists.length,{
					 callback: function(page){
						 start = page * this.items_per_page;
						 end = (page+1)*this.items_per_page;
						 $tbody.empty();
						 showList(lists,start,end);
						 return true;
					}, 
					display_msg: true,	//是否显示记录信息
					setPageNo: true   //是否显示跳转第几页
				});	
				//显示条形图
				showbar(lists);
				//显示饼图
				showpie(lists);
				//显示表格内容
				showList(lists,start,end);
				//
			}
        },
        	error : function(errorMsg) {
            alert("加载数据失败");
        } 
	});
}

//显示表格内容
function showList(lists,start,end){
	if(lists.length>0){
		for(var i=start;i<end;i++){
			var patient = lists[i];
			var trStyle;
			var outpercent = (patient.outNum/patient.inNum)*100;
			if((i+1)%2==0){
				trStyle = "<tr style='background-color:#eff6fa'>";
			}else{
				trStyle = "<tr>";
			}
			if(patient.inNum == null){
				patient.inNum = 0;
				patient.inPercentage = 0;
				outpercent = 0;
			}
			if(patient.outNum == null){
				patient.outNum = 0;
				patient.outPercentage = 0;
				outpercent = 0;
			}
			var $tr = trStyle+
					"<td class='node'>"+patient.parameter_values+"</td>"+
					"<td class='num'>"+patient.parameter_name+"</td>"+
					"<td class='node'>"+patient.inNum+"</td>"+
					"<td class='node'>"+patient.outNum+"</td>"+
					"<td class='node'>"+outpercent.toFixed(2)+"%</td>"+
					"</tr>";
					//"<td class='node'>"+patient.inTotal+"</td>"+
					//"<td class='node'>"+patient.outTotal+"</td>"+
					//"<td class='node'>"+patient.inPercentage*100+"%</td>"+
			$tbody.append($tr);
		}
	}	
}

//显示条形图
function showbar(lists){
	var myChart = echarts.init(document.getElementById('myBarDiv'));
	var option = {
			 title: {text: '各科室区间累计入院统计图',x:'center'},
	         tooltip : {show : true},
	         legend : {orient: 'vertical',right: 'right',data: ['科室']},
	         xAxis : [{type : 'category'}],
	         yAxis : [{type : 'value'} ],
	         series : [{type : 'bar', name: '科室'}]//每一个柱状条
	     	};
	//坑1：图例：legend(图例)属性的的data值要与series属性的name值一致
	/*坑2：图例legend(图例)没有option.legend.data方法，
			动态加载图例要使用option.legend = 数据源，
			其中数据源是data列表：data[]
			具体使用方法见showpie(lists)函数的动态构造图例部分
			*/
	//动态构造横坐标值
    option.xAxis[0].data = [];
    for (var i=0; i<lists.length; i++) {
        option.xAxis[0].data.push(lists[i].parameter_name);
    }
    //动态构造每一个竖条数据
    option.series[0].data = [];
    for (var i=0; i<lists.length; i++) {
        option.series[0].data.push(lists[i].inNum);
    }
    //option装载到echarts
	myChart.setOption(option,true);
}

//显示饼图
function showpie(lists){
	var myChart = echarts.init(document.getElementById('myPieDiv'));
	var option = {
		    title : {text: '各科室患者占比(%)',subtext: '科室占比=(科室总入院/全院总入院)*100%',x:'center'},
		    tooltip : {trigger: 'item',formatter: "{a} <br/>{b} : {c} ({d}%)"},
		    legend: {data: []},
		    series : [{name: '科室',type: 'pie',radius : '55%',center: ['50%', '60%'],
		            data:[],//data的数据格式[{value:1,name:XX-1},{value:2,name:XX-2},{value:3,name:XX-3}...]
		            itemStyle: {emphasis: {shadowBlur: 10,shadowOffsetX: 0,shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	//构造科室名称集
	var parameter_name_list = new Array();
	for (var i=0; i<lists.length; i++) {
		 parameter_name_list[i] = lists[i].parameter_name;
	    }
	var datalegend = {data:parameter_name_list,orient: 'vertical',right: 'right'};
	//console.log(option);//向浏览器控制台打印日志
	//动态构造图例
    option.legend = datalegend;
    //动态装载数据
    option.series[0].data = [];
    for (var i=0; i<lists.length; i++) {
    	var tempdict = {value:lists[i].inNum, name:lists[i].parameter_name}
        option.series[0].data.push(tempdict);
    }
    //console.log(option);
	myChart.setOption(option);
}			

//清空条件按钮
function clear(){
	$("#patinetStatisticsForm :input").val("");
}