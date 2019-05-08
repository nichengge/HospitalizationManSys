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
		<h2>入库查询</h2>
	</div>
	<div class="query">
		<form id="durgs_find">
			<div class="query-conditions ue-clear">
				<div class="conditions staff ue-clear">
					<label>药品编号：</label> <input name="drugsId" type="text" />
				</div>
				<div class="conditions staff ue-clear">
					<label>药品名称：</label> <input name="drugsName" type="text" />
				</div>
				<div class="conditions time ue-clear">
					<label>入库时间：</label>
					<div class="time-select">
						<input name="rkStartTime" type="date" placeholder="开始时间" />
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" name="rkEndTime" placeholder="结束时间" />
					</div>
				</div>
				<div class="conditions time ue-clear">
					<label>保质期：</label>
					<div class="time-select">
						<input type="date" name="bzStartTime" placeholder="开始时间" />
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" name="bzEndTime" placeholder="结束时间" />
					</div>
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:void(0);" id="find" class="confirm">查询</a> <a
					href="javascript:void(0);" id="reset" class="clear">清空条件</a>
			</div>
		</form>
	</div>
	<div class="table-box">
		<table>
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">药品编号</th>
					<th class="time">药品名称</th>
					<th class="node">药品数量</th>
					<th class="node">药品单价（元）</th>
					<th class="time">生产日期</th>
					<th class="time">有效日期</th>
					<th class="time">入库日期</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear" id="showbuttom"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/drugs_find.js"></script>
<script type="text/javascript">
	showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
