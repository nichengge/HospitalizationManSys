<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>体征数据查询</h2>
	</div>
	<form id="signQueryForm">
		<input style="display: none;" id="departmentNo" name="departmentNo"
			type="text" value="" />
		<div class="query">
			<div class="query-conditions ue-clear">
				<div class="conditions staff ue-clear">
					<label>住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input type="text"
						name="patientId" id="patientId"/>
				</div>
				<div class="conditions staff ue-clear">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
						type="text" id="name" name="name" />
				</div>
				<div class="conditions time ue-clear">
					<label>测量时间：</label>
					<div class="time-select">
						<input type="date" name="start" placeholder="开始时间" />
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" name="end" placeholder="结束时间" />
					</div>
				</div>
				 
				<div class="conditions staff ue-clear">
					<label>床&nbsp;&nbsp;位&nbsp;&nbsp;号：</label> <input type="text"
						name="bedNo" id="bedNo"/>
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:void(0);" class="confirm">查询</a> <a
					href="javascript:void(0);" class="clear">清空条件</a>
			</div>
		</div>
		<div class="table-box">
			<table>
				<thead>
					<tr>
						<th class="num">床号</th>
						<th class="name">姓名</th>
						<th class="node">住院号</th>
 						<th class="name">体温(℃)</th>
						<th class="name">心率(次/分)</th>
						<th class="name">血压(mmHg)</th>
						<th class="name">血糖(mmol/l)</th>
						<th class="time">录入时间</th>
						<th class="name">护理医师</th>
					</tr>
				</thead>
				<tbody id="show"></tbody>
			</table>
		</div>
	</form>
	<div class="pagination ue-clear" id="showbuttom"></div>
	<!-- 数据可视化显示区 -->
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#eaf4fa SIZE=3>
	<div class="title">
		<h2>变化趋势</h2>
		<div id="linediv" style="height: 400px; width: 100%;display:inline-block;margin:0 auto" ></div>
	</div>
</body>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/sign-query.js"></script>
<script type="text/javascript"></script>
</html>
