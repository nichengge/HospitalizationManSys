var $tbody = $("#show");
var start = 0;
var end = 15;
//加载后执行
$(function(){
	 $(".confirm").click(confirm);
	 $(".clear").click(clear);
});

$(function(){
	/*读取cookie值，判断是什么类型的用户。
	*如果是患者，则把姓名、住院号、床位号设置为只读，
	*并把数据回显出来
	**/
	//cookie内容：{user:用户ID#用户姓名#用户类型描述} 
	var cookie = getCookie('user');
	var userid = cookie.split("#")[0].substring(0);
	var usertype = cookie.split("#")[2].substring(0);
	//alert(usertype);
	if(usertype == 0){//是患者类型的用户
		document.getElementById("patientId").setAttribute("readOnly", false);
		document.getElementById("name").setAttribute("readOnly", false);
		document.getElementById("bedNo").setAttribute("readOnly", false);
		$.ajax({//通过身份证查询patient表的患者信息
			url:"patient/patientQueryBycerificateNo.do",
			data:{"cerificateNo":userid},
			type:"post",
			dataType:"JSON",
			success:function(result){
				if(result.state == 0){
					var list = result.data;
					var lastNameNum = list.length;//只显示最近一次住院记录
					var patientID = list[lastNameNum-1].patientId;
					var patientName = list[lastNameNum-1].name;
					var patientBedNo = list[lastNameNum-1].bedNo
					$("#patientId").val(patientID);
					$("#name").val(patientName);
					$("#bedNo").val(patientBedNo);
				}
			}
		});
	}
});

//执行查询
function confirm(){
	var queryData = $("#signQueryForm").serialize();
	$.ajax({
		url:'sign/signQuery.do',
		type:'post',
		data:queryData,
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				var lists = result.data;
				$tbody.empty();
				//分页
				if(lists.length>0){
				$('.pagination').pagination(lists.length,{
					 callback: function(page){
						 start = page * this.items_per_page;
						 end = (page+1)*this.items_per_page;
						 $tbody.empty();
						 showList(lists,start,end);
						 return true;
					}, 
					display_msg: true,	//是否显示记录信息
					setPageNo: true  //是否显示跳转第几页
				});
				$("#showbuttom").show();
				}else{
					alert("未查询到数据！");
					$("#showbuttom").hide();
					$(".clear").click();
				}
				var linecheck = line_check(lists);
				if(linecheck){
					//显示折线图
					showline(lists);
					//显示表格
					showList(lists,start,end);
				}else{
					//显示表格
					showList(lists,start,end);
				}
				
			}	 		 
		}
	});
}

//显示表格
function showList(lists,start,end){
	if(lists.length>0){
		for(var i=start;i<end;i++){
			var patient = lists[i];
			var ctime = patient.measureTime;
			var newDate = new Date();
			newDate.setTime(ctime);
			var trStyle;
			if(patient.pulse==null){
				patient.pulse=0;
			}
			if(patient.breathing==null){
				patient.breathing=0;
			}
			if((i+1)%2==0){
				trStyle = "<tr style='background-color:#eff6fa'>";
			}else{
				trStyle = "<tr>";
			}
			var measureTime=patient.measureTime.substring(0,patient.measureTime.length-2);
			var $tr = trStyle+
					"<td class='num'>"+patient.bedNo+"</td>"+
					"<td class='num'>"+patient.patientName+"</td>"+
					"<td class='node'>"+patient.patientId+"</td>"+
					"<td class='name'>"+patient.temperature+"</td>"+
					"<td class='name'>"+patient.pulse+"</td>"+
					"<td class='name'>"+patient.bloodPressure+"</td>"+
					"<td class='name'>"+patient.bloodSugar+"</td>"+
					"<td class='time'>"+measureTime+"</td>"+
					"<td class='name'>"+patient.userName+"</td>"+
					"</tr>";
			$tbody.append($tr);
			}
	}
}

//显示折线图
function showline(lists){
	var myChart = echarts.init(document.getElementById('linediv'));
	var option = {
			title: {text: '体征数据变化趋势'},
		    tooltip: {trigger: 'axis'},
		    legend: {left: '25%',data:['体温(℃)','心率(次/分)','血糖(mmol/l)','血压-收缩压(mmHg)','血压-舒张压(mmHg)']},
		    grid: {left: '3%',right: '4%',bottom: '3%',containLabel: true},
		    toolbox: {feature: {saveAsImage: {}}},
		    xAxis: [{type: 'category',boundaryGap: false,data:[]}],//X轴,时间
		    yAxis: {type: 'value'},
		    series: [
		        {name:'体温(℃)',type:'line',stack: '总量',data:[]},
		        {name:'心率(次/分)',type:'line',stack: '总量',data:[]},
		        {name:'血糖(mmol/l)',type:'line',stack: '总量',data:[]},
		        {name:'血压-收缩压(mmHg)',type:'line',stack: '总量',data:[]},
		        {name:'血压-舒张压(mmHg)',type:'line',stack: '总量',data:[]}
		        
		    ]
		};
	//动态装载X轴，时间数据
    option.xAxis[0].data = [];
    for (var i=0; i<lists.length; i++) {
    	var Time=lists[i].measureTime.substring(0,lists[i].measureTime.length-2);
        option.xAxis[0].data.push(Time);
    }
    //动态装载体温数据
    option.series[0].data = [];
    for (var i=0; i<lists.length; i++) {
    	var temperature=lists[i].temperature;
        option.series[0].data.push(temperature);
    }
    //动态装载心率数据
    option.series[1].data = [];
    for (var i=0; i<lists.length; i++) {
    	var pulse=lists[i].pulse;
        option.series[1].data.push(pulse);
    }
    //动态装载血糖数据
    option.series[2].data = [];
    for (var i=0; i<lists.length; i++) {
    	var bloodSugar=lists[i].bloodSugar;
        option.series[2].data.push(bloodSugar);
    }
    //动态装载血压数据-收缩压
    option.series[3].data = [];
    //动态装载血压数据-舒张压
    option.series[4].data = [];
    for (var i=0; i<lists.length; i++) {
    	var bloodPressure=lists[i].bloodPressure;
    	var array = new Array();
    	array=bloodPressure.split("/");
    	var bloodPressure_high = Number(array[0]);
    	var bloodPressure_low = Number(array[1]);
        option.series[3].data.push(bloodPressure_high);
        option.series[4].data.push(bloodPressure_low);
    }
	console.log(option);
	myChart.setOption(option);
}

//生成折线图的条件检测
/*
 * 折线图反应的是一个人(人数=1)的多次(≥2次)体征数据的变化趋势
 * 返回的结果中患者ID有多个则不符合生成折线图的条件
 * 返回的结果中，一个人的体征数据小于2次测量值，则不符合生成折线图的条件
 * */
function line_check(lists){
		if(lists.length == 1){
			return false;
		}
		if(lists.length > 1){
			var counter = 0;
			var firstpatientid = lists[0].patientId;
			for(var i=1;i<lists.length;i++){
				if(lists[i].patientId != firstpatientid){counter += 1;}
			}
			if(counter == 0){
				return true;	
			}
			else{
				return false;
				}
			}
	}


//清空条件按钮
function clear(){
	window.location.reload(true);
}