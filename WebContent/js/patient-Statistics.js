var $tbody = $("#show");
var start = 0;
var end = 7;
$(function(){
	$(".confirm").click(select);
	$(".clear").click(clear);
});

//查询按钮
function select(option){
	var queryData = $("#patinetStatisticsForm").serialize();
	$.ajax({
		url:"patient/patientStatistics.do",
		async : false,  //同步执行
		type:"post",
		data:queryData,
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				var lists = result.data;
				$tbody.empty();
				
				
//-------------分页-------------------
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
				
				
//-----------显示表格内容-------------------
				showList(lists,start,end);
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
			if((i+1)%2==0){
				trStyle = "<tr style='background-color:#eff6fa'>";
			}else{
				trStyle = "<tr>";
			}
			if(patient.inNum==null){
				patient.inNum = 0;
				patient.inPercentage = 0;
			}
			if(patient.outNum==null){
				patient.outNum = 0;
				patient.outPercentage = 0;
			}
			var $tr = trStyle+
					"<td class='num'>"+(i+1)+"</td>"+
					"<td class='node'>"+patient.parameter_values+"</td>"+
					"<td class='num'>"+patient.parameter_name+"</td>"+
					"<td class='node'>"+patient.inNum+"</td>"+
					"<td class='node'>"+patient.inTotal+"</td>"+
					"<td class='node'>"+patient.inPercentage*100+"%</td>"+
					"<td class='node'>"+patient.outNum+"</td>"+
					"<td class='node'>"+patient.outTotal+"</td>"+
					"<td class='node'>"+patient.outPercentage*100+"%</td>"+
					"</tr>";
			$tbody.append($tr);
		}
	}
	
	
}

//清空条件按钮
function clear(){
	$("#patinetStatisticsForm :input").val("");
}


//柱状图数据可视化装载数据
function loadDataBar(option) {
	$.ajax({
		url:"patient/patientStatistics.do",
		async : false,  //同步执行
		type:"post",
		data:{},
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				
	//-------配置柱状图
				//alert("post请求成功");
				var lists = result.data;
                //初始化xAxis[0]的data
                option.xAxis[0].data = [];
                //生成横坐标标题
                for (var i=0; i<lists.length; i++) {
                    option.xAxis[0].data.push(lists[i].parameter_name);
                   // alert(lists[i].parameter_name+'住院'+lists[i].inNum+'人！');
                   // alert("进入X轴循环");
                }
                //初始化series[0]的data
                option.series[0].data = [];
                //生成纵坐标值  
                for (var i=0; i<lists.length; i++) {
                    option.series[0].data.push(lists[i].inNum);
                   // alert("进入Y轴循环");
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
}//loadData()


//折线图数据可视化装载数据
function loadDataLine(option) {
	$.ajax({
		url:"patient/patientStatistics.do",
		async : false,  //同步执行
		type:"post",
		data:{},
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				
	//-------配置柱状图
				//alert("post请求成功");
				var lists = result.data;
                //初始化xAxis[0]的data
                option.xAxis[0].data = [];
                //生成横坐标标题
                for (var i=0; i<lists.length; i++) {
                    option.xAxis[0].data.push(lists[i].parameter_name);
                   // alert(lists[i].parameter_name+'住院'+lists[i].inNum+'人！');
                   // alert("进入X轴循环");
                }
                //初始化series[0]的data
                option.series[0].data = [];
                //生成纵坐标值  
                for (var i=0; i<lists.length; i++) {
                    option.series[0].data.push(lists[i].inPercentage*100);
                   // alert("进入Y轴循环");
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
}//loadData()