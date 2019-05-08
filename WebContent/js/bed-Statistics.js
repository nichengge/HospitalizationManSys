var $tbody = $("#show");
var start = 0;
var end = 15;

$(function() {
	$(".confirm").click(confirm);
	$(".clear").click(clear);
	// 科室列表
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "科室"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				list = result.data;
				var $ul = $("#depart");
				$ul.append("<li value=''>请选择</li>");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li value=" + common.value + ">"
								+ common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
});

// post请求查询
function confirm() {
	var queryData = $("#bedStatisticsForm").serialize();
	$.ajax({
		url : "ward/wardStatistics.do",
		async : false, // 同步执行,异步执行的话发送请求和渲染数据是并行执行的，但是渲染数据要依赖发送请求的返回值，所以不能异步执行
		type : "post",
		data : queryData,
		dataType : "JSON",
		success : function(result) {
			if (result.state == 0) {
				var lists = result.data;
				$tbody.empty();
				// 分页
				$('.pagination').pagination(lists.length, {
					callback : function(page) {
						start = page * this.items_per_page;
						end = (page + 1) * this.items_per_page;
						$tbody.empty();
						showList(lists, start, end);
						return true;
					},
					display_msg : true, // 是否显示记录信息
					setPageNo : true
				// 是否显示跳转第几页
				});
				// 显示扇形图
				showpie(lists);
				// 显示条形图
				showbar(lists);
				// 显数据表格
				showList(lists, start, end);
			}
		},
		error : function(errorMsg) {
			alert("加载数据失败");
		}
	});
}

// 显示表格数据
function showList(lists, start, end) {
	if (lists.length > 0) {
		for (var i = start; i < end; i++) {
			var patient = lists[i];
			var trStyle;
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa'>";
			} else {
				trStyle = "<tr>";
			}
			var bfl = 0;
			var use = patient.total - patient.wy;
			if (patient.total == null) {
				patient.wy = 0;
				patient.total = 0;
				use = 0;
			} else {
				if (use != 0) {
					bfl = (use / patient.total).toFixed(4) * 100;
				}
			}

			var $tr = trStyle + "<td class='num'>" + (i + 1) + "</td>"
					+ "<td class='name'>" + patient.parameter_values + "</td>"
					+ "<td class='name'>" + patient.parameter_name + "</td>"
					+ "<td class='node'>" + patient.total + "</td>"
					+ "<td class='node'>" + patient.wy + "</td>"
					+ "<td class='node'>" + use + "</td>" + "<td class='node'>"
					+ bfl + "%</td>" + "</tr>";
			$tbody.append($tr);
		}
	}
}

// 显示正负柱状图
function showbar(lists) {
	var myChart1 = echarts.init(document.getElementById('bardiv'));
	var option1 = {
		title : {
			text : '各科室病床使用情况统计图',
			subtext : '床位总数 = 未使用 + 已使用',
			x : 'center'
		},
		tooltip : {
			trigger : 'axis',
			axisPointer : {
				type : 'shadow'
			}
		},
		legend : {
			data : [ '未使用', '已使用', '床位总数' ],
			right : 'right'
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		xAxis : [ {
			type : 'value'
		} ],
		yAxis : [ {
			type : 'category',
			axisTick : {
				show : false
			},
			data : []
		} ],
		series : [ {
			name : '未使用',
			type : 'bar',
			label : {
				normal : {
					show : true,
					position : 'inside'
				}
			},
			data : []
		}, {
			name : '已使用',
			type : 'bar',
			stack : '总量',
			label : {
				normal : {
					show : true,
					position : 'left'
				}
			},
			data : []
		}, {
			name : '床位总数',
			type : 'bar',
			stack : '总量',
			label : {
				normal : {
					show : true
				}
			},
			data : []
		} ]
	};
	// 动态生成纵坐标科室名称数据
	option1.yAxis[0].data = [];
	for (var i = 0; i < lists.length; i++) {
		option1.yAxis[0].data.push(lists[i].parameter_name);
	}
	// 动态装载series[0]-未使用的数据
	option1.series[0].data = [];
	for (var i = 0; i < lists.length; i++) {
		option1.series[0].data.push(lists[i].wy);
	}
	// 动态装载series[1]-已使用的数据
	option1.series[1].data = [];
	for (var i = 0; i < lists.length; i++) {
		var fushu = -(lists[i].total - lists[i].wy);// 全部床位-未使用床位=已使用床位，已使用床位取负数，便于echarts显示
		option1.series[1].data.push(fushu);
	}
	// 动态装载series[2]-床位总数的数据
	option1.series[2].data = [];
	for (var i = 0; i < lists.length; i++) {
		option1.series[2].data.push(lists[i].total);
	}
	// 装载到echarts
	myChart1.setOption(option1);
}

// 显示扇形图
function showpie(lists) {
	var myChart2 = echarts.init(document.getElementById('piediv'));
	var option2 = {
		title : {
			text : '各科室病床使用率(%)',
			subtext : '科室病床使用率 = (已使用/科室床位总数)*100%',
			x : 'center'
		},
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b} : {c} ({d}%)"
		},
		legend : {
			data : [ '已使用', '未使用' ],
			right : 'right'
		},
		series : [ {
			name : '',
			type : 'pie',
			radius : '55%',
			center : [ '50%', '60%' ],
			data : [],// data的数据格式[{value:1,name:XX-1},{value:2,name:XX-2},{value:3,name:XX-3}...]
			itemStyle : {
				emphasis : {
					shadowBlur : 10,
					shadowOffsetX : 0,
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				}
			}
		} ]
	};
	/*
	 * 如果只选择了一个科室，则显示当前选择的科室的病床使用率 如果选择了全部，则显示全部可是的病床使用率
	 */
	if (lists.length == 1) {
		// 装载科室名称
		option2.series[0].name = lists[0].parameter_name;
		// 动态装载数据
		option2.series[0].data = [];
		var use = lists[0].total - lists[0].wy;
		var used = {
			value : use,
			name : '已使用'
		}// 已使用
		var unuse = {
			value : lists[0].wy,
			name : '未使用'
		}// 未使用
		option2.series[0].data.push(used);
		option2.series[0].data.push(unuse);
	} else if (lists.length > 1) {
		// 科室名称设置为全部科室
		option2.series[0].name = '全部科室';
		// 动态装载数据，计算全部已用和未用
		option2.series[0].data = [];
		var sumwy = 0;// 各科室全部未用
		var sumbed = 0;// 各科室全部床位
		for (var i = 0; i < lists.length; i++) {
			sumwy += lists[i].wy
			sumbed += lists[i].total
		}
		var sumused = sumbed - sumwy;// 各科室全部使用
		var used = {
			value : sumused,
			name : '已使用'
		}// 已使用
		var unuse = {
			value : sumwy,
			name : '未使用'
		}// 未使用
		option2.series[0].data.push(used);
		option2.series[0].data.push(unuse);
	}
	// console.log(option2);
	myChart2.setOption(option2);
}

// 清空条件
function clear() {
	$("#department").find("span").text("请选择");
	$("#bedList").find("span").text("请选择");
	$("#typeNo").val("");
	$("#departmentNo").val("");
	// $('#data_see_div').empty();
	// $('#showList').empty();
}
