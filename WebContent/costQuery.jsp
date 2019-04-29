<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>费用查询</h2>
	</div>
	<form id="costQueryForm"> 
	<div class="query">
		<div class="query-conditions ue-clear">
			<div class="conditionst staff ue-clear">
				<label id="patientNum">&nbsp;&nbsp;住院号：</label> <input
					type="text" id="patientId" name="patientId"/>
			</div>
			<div class="conditionst staff ue-clear">
				<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
					type="text" id="patientName" name="patientName" />
			</div>
			<div class="conditionst time ue-clear">
				<label>&nbsp;&nbsp;缴费时间：</label>
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
				href="javascript:void(0);" id="reset" class="clear" >清空条件</a>
		</div>
	</div>
	</form>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">账单号</th>
					<th class="name">住院号</th>
					<th class="name">付款账户</th>
					<th class="node">预交金额</th>
					<th class="node">缴费方式</th>
					<th class="time">缴费时间</th>
					<th class="name">收款用户</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
 
	<div class="pagination ue-clear" id="showbuttom"></div>
	<!-- 查询病人 -->
	<div  class="showDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/costQuery.js"></script>
<script type="text/javascript">
</script>
</html>
