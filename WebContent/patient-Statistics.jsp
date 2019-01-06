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
		<h2>病人统计</h2>
	</div>
	<input style="display:none;" type="text" id="des"/>
	<div class="query">
	<form id="patinetStatisticsForm">
		<div class="query-conditions ue-clear">
			<div class="conditions time ue-clear">
				<label>查询时间：</label>
				<div class="time-select">
					<input type="date" id="startTime" name="startTime" placeholder="开始时间" />
				</div>
				<span class="line">-</span>
				<div class="time-select">
					<input type="date" id="endTime" name="endTime" placeholder="结束时间" />
				</div>
			</div>
		</div>
		<div class="query-btn ue-clear">
			<a href="javascript:void(0);" id="select" class="confirm">查询</a> <a
				href="javascript:void(0);" id="reset" class="clear">清空条件</a>
		</div>
	</form>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="node">科室编号</th>
					<th class="name">科室名称</th>
					<th class="node">入院人数</th>
					<th class="node">入院总人数</th>
					<th class="node">所占百分比（%）</th>
					<th class="node">出院人数</th>
					<th class="node">出院总人数</th>
					<th class="node">所占百分比（%）</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
		<div id="zhanweifu1" style="height: 100px; width: 1123px;display:inline-block" ></div>
		<div id="zhanweifu2" style="height: 100px; width: 100px;display:inline-block" ></div>
		<div id="myBarDiv" style="height: 300px; width: 430px;display:inline-block" ></div>
		<div id="myLineDiv" style="height: 300px; width: 430px;display:inline-block" ></div>
	</div>
	<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/patient-Statistics.js"></script>
<script type="text/javascript">


<!--柱状图数据可视化-->
var myChart = echarts.init(document.getElementById('myBarDiv'));
var option = {
		 title: {
             text: '住院人数统计图'
         },
         tooltip : {
             show : true
         },
         legend : {
             data : [ '住院人数' ]
         },
         xAxis : [ {//横坐标
             type : 'category'
         } ],
         yAxis : [ {//纵坐标
             type : 'value'
         } ],
         series : [ {
             name : '住院人数',//鼠标放到条上的提示字
             type : 'bar'//条形图类型
         } ]
     };
		//加载数据到option
			loadDataBar(option);
		//设置option
			myChart.setOption(option);
</script>

<!--折线图数据可视化-->
<script type="text/javascript">
var myChart = echarts.init(document.getElementById('myLineDiv'));
var option = {
		 title: {
             text: '住院占比图(%)'
         },
         tooltip : {
             show : true
         },
         legend : {
             data : [ '住院人数' ]
         },
         xAxis : [ {//横坐标
             type : 'category'
         } ],
         yAxis : [ {//纵坐标
             type : 'value'
         } ],
         series : [ {
             name : '住院人数',//鼠标放到条上的提示字
             type : 'line'//条形图类型
         } ]
     };
		//加载数据到option
			loadDataLine(option);
		//设置option
			myChart.setOption(option);
</script>
</html>
