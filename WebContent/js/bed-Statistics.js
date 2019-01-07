var $tbody = $("#show");
var start = 0;
var end = 7;


$(function(){
	$(".confirm").click(confirm);
	$(".clear").click(clear);
	//科室列表
	$.ajax({
		url:'common/list.do',
		type:'post',
		data:{"name":"科室"},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				list = result.data;
				var $ul = $("#depart");
				$ul.append("<li value=''>请选择</li>");
				$ul.empty();
				if(list.length>0){
					for(var i=0;i<list.length;i++){
						var common = list[i];
						var $li = "<li value="+common.value+">"+common.name+
							"</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
});

//查询按钮
function confirm(){
	var queryData = $("#bedStatisticsForm").serialize();
	$.ajax({
		url:"ward/wardStatistics.do",
		async : false, //同步执行
		type:"post",
		data:queryData,
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				var lists = result.data;
				$tbody.empty();
				//分页
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
				//显示列表
				showList(lists,start,end);
			}	 		 
		},
        error : function(errorMsg) {
            alert("加载数据失败");
        }
	});
}

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
			var bfl = 0;
			var use = patient.total-patient.wy;
			if(patient.total==null){
				patient.wy = 0;
				patient.total = 0;
				use = 0;
			}else{
				if(use!=0){
					bfl = (use/patient.total).toFixed(4)*100;
				}
			}
			 
			var $tr = trStyle+
					"<td class='num'>"+(i+1)+"</td>"+
					"<td class='name'>"+patient.parameter_values+"</td>"+
					"<td class='name'>"+patient.parameter_name+"</td>"+
					"<td class='node'>"+patient.total+"</td>"+
					"<td class='node'>"+patient.wy+"</td>"+
					"<td class='node'>"+use+"</td>"+
					"<td class='node'>"+bfl+"%</td>"+
					"</tr>";
			$tbody.append($tr);
			}
	}
}


//清空条件
function clear(){
	$("#department").find("span").text("请选择");
	$("#bedList").find("span").text("请选择");
	$("#typeNo").val("");
	$("#departmentNo").val("");
}



//正负柱状图数据可视化装载数据
function loadDataBar(option) {
	$.ajax({
		url:"ward/wardStatistics.do",
		async : false,  //同步执行
		type:"post",
		data:{},
		dataType:"JSON",
		success:function(result){
			if(result.state==0){
				
	//-------配置柱状图
				//alert("post请求成功");
				var lists = result.data;
              //初始化yAxis[0]的data
              option.yAxis[0].data = [];
              //生成纵横坐标科室标题
              for (var i=0; i<lists.length; i++) {
                  option.yAxis[0].data.push(lists[i].parameter_name);
              }
              
              
              //初始化series[0]-未使用的data
              option.series[0].data = [];
              for (var i=0; i<lists.length; i++) {
                  option.series[0].data.push(lists[i].wy);
              }
              
            //初始化series[1]-床位总数的data
              option.series[1].data = [];
              for (var i=0; i<lists.length; i++) {
                  option.series[1].data.push(lists[i].total);
              }
              
            //初始化series[2]-已使用的data
              option.series[2].data = [];
              for (var i=0; i<lists.length; i++) {
            	  var fushu=-(lists[i].total-lists[i].wy);//全部床位-未使用床位=已使用床位，已使用床位取负数，便于echarts显示
                  option.series[2].data.push(fushu);
              }
          }
      },
      error : function(errorMsg) {
          alert("加载数据失败");
      }
  });//AJAX
}//loadData()