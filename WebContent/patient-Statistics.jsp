<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />

<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>区间病人统计</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<form id="patinetStatisticsForm">
			<div class="query-conditions ue-clear">
				<div class="conditions time ue-clear">
					<label>查询时间：</label>
					<div class="time-select">
						<input type="date" id="startTime" name="startTime"
							placeholder="开始时间" />
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
					<th class="node">科室编号</th>
					<th class="name">科室名称</th>
					<th class="node">累计入院</th>
					<th class="node">累计出院</th>
					<th class="node">出院比(%)</th>
				</tr>
			</thead>
			<tbody id="show"></tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>

	<!-- 数据可视化显示区 -->
	<HR style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)"
		width="100%" color=#eaf4fa SIZE=3>
	<div class="title">
		<h2>数据概览</h2>
		<div id="myBarDiv"
			style="height: 600px; width: 100%; display: inline-block; margin: 0 auto"></div>
		<div id="myPieDiv"
			style="height: 400px; width: 100%; display: inline-block; margin: 0 auto"></div>
	</div>
</body>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/patient-Statistics.js"></script>
<script type="text/javascript"></script>
</html>
