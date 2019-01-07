<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>病房统计</h2>
	</div>
	<form id="bedStatisticsForm">
	<input style="display: none;" id="departmentNo" name="departmentNo" type="text" />
	<div class="query">
			<div class="query-conditions ue-clear">
				<div class="conditions name ue-clear">
					<label>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
					<div class="select-wrap">
						<div class="select-title ue-clear" id="department">
							<span>请选择</span><i class="icon"></i>
						</div>
						<ul class="select-list" id="depart"
							style="height: 100px; overflow: auto;">
						</ul>
					</div>
				</div>
			</div>
		<div class="query-btn ue-clear">
			<a href="javascript:void(0);" id="select" class="confirm">查询</a> <a
				href="javascript:void(0);" id="reset" class="clear">清空条件</a>
		</div>
	</div>
	</div>
	</form>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">科室编号</th>
					<th class="name">科室名称</th>
					<th class="node">床位总数</th>
					<th class="node">未使用</th>
					<th class="time">已使用</th>
					<th class="name">使用率</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
	<div id="zhanweifu1" style="height: 50px; width: 1123px;display:inline-block" ></div>
	<div id="zhanweifu2" style="height: 500px; width: 200px;display:inline-block" ></div>
	<div id="zftxtdiv" style="height: 500px; width: 630px;display:inline-block" ></div>
</body>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/bed-Statistics.js"></script>
<script type="text/javascript">
$("#department").on("click",function(){
	$("#depart").toggle();
	return false;
});
$("#depart").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#department").find("span").text(txt);
	$("#departmentNo").val(label);
});
</script>

<!-- 正负条形图数据可视化 -->
<script type="text/javascript">
var myChart = echarts.init(document.getElementById('zftxtdiv'));
option = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data:['未使用', '已使用', '总床位']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    yAxis : [
	        {
	            type : 'category',
	            axisTick : {show: false},
	        }
	    ],
	    series : [
	        {
	            name:'未使用',
	            type:'bar',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'inside'
	                }
	            },
	        },
	        {
	            name:'总床位',
	            type:'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true
	                }
	            },
	        },
	        {
	            name:'已使用',
	            type:'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'left'
	                }
	            },
	        }
	    ]
	};
	//加载数据到option
		loadDataBar(option);
	//设置option
		myChart.setOption(option);
</script>
</html>
