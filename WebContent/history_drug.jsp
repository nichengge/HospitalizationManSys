<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />

<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>用药历史查询</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<div class="query-conditions ue-clear">
			<form id="findForm">
				<div class="query-conditions ue-clear">
					<div class="conditions staff ue-clear">
						<label id="patientNum">住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input
							type="search" results="s" readonly id="patientId"
							name="patientId" class="patientId" />
					</div>
				</div>
			</form>
		</div>
		<div class="query-btn ue-clear">
			<a href="javascript:;" id="find" class="confirm">查询</a> <a
				href="javascript:;" id="cle" class="clear">清空条件</a>
		</div>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="name">药物编号</th>
					<th class="name">药物名称</th>
					<th class="num">数量</th>
					<th class="num">单价</th>
					<th class="name">使用患者</th>
					<th class="name">派发医生</th>
					<th class="time">派发时间</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
	<!-- 病人查询 -->
	<div class="showDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%"
			scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/history_drug.js"></script>
</html>
