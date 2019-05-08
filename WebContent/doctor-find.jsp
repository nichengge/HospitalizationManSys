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
<style type="text/css">
#titlevalue, #departmentvalue, #statevalue {
	display: none;
}
</style>
</head>
<label id="titlevalue"></label>
<label id="departmentvalue"></label>
<label id="statevalue"></label>
<body>
	<div class="title">
		<h2>医生查询</h2>
	</div>
	<div class="query">
		<form id="doctor_find_head">

			<div class="query-conditions ue-clear">

				<div class="conditionst name ue-clear">
					<label>&nbsp;&nbsp;科室：</label>
					<div class="select-wrap">
						<div class="select-title ue-clear" id="department">
							<span>请选择</span><i class="icon"></i>
						</div>
						<ul class="select-list" id="depart"
							style="height: 100px; overflow: auto;">
						</ul>
					</div>
				</div>
				<div class="conditionst staffs ue-clear">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
						id="name" type="text" />
				</div>
				<div class="conditionst time ue-clear">
					<label>&nbsp;&nbsp;入职时间：</label>
					<div class="time-select">
						<input type="date" id="startTime" placeholder="开始时间" />
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" id="endTime" placeholder="结束时间" />
					</div>
				</div>
				<div class="conditionst name ue-clear">
					<label>职称：</label>
					<div class="select-wrap">
						<div class="select-title ue-clear" id="titles">
							<span>请选择</span><i class="icon"></i>
						</div>
						<ul class="select-list" id="title">
						</ul>
					</div>
				</div>
				<div class="conditionst name ue-clear">
					<label>是否离职：</label>
					<div class="select-wrap">
						<div class="select-title ue-clear" id="states">
							<span>请选择</span><i class="icon"></i>
						</div>
						<ul class="select-list" id="state">
							<li value="-1">请选择</li>
							<li value="1">是</li>
							<li value="0">否</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:;" id="select" class="confirm">查询</a> <a
					href="javascript:;" id="reset" class="clear">清空条件</a>
			</div>
		</form>
	</div>
	<div class="table-box">
		<table>
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">医生编号</th>
					<th class="process">姓名</th>
					<th class="node">科室</th>
					<th class="num">性别</th>
					<th class="node">职称</th>
					<th class="time">入职时间</th>
					<th class="num">是否在职</th>
					<th class="name">编辑</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear" id="showbuttom"></div>
	<div class="showDoctor">
		<div class=".ui-dialog-panel">
			<form class="formDialog">
				<p>
					编&nbsp;&nbsp; 号：<input type="text" name="idUpdate" readonly
						id="idUpdate" />
				</p>
				<p>
					姓&nbsp;&nbsp; 名：<input type="text" name="nameUpdate"
						id="nameUpdate"><label style="color: red;"
						class="nameUpdateError"></label>
				</p>
				<p>
					科&nbsp;&nbsp; 室：<select id="select_keshi">
					</select>
				</p>
				<p>
					性&nbsp;&nbsp; 别：<select id="select_gender">
						<option value="1">男</option>
						<option value="2">女</option>
					</select>
				</p>
				<p>
					职&nbsp;&nbsp; 称：<select id="select_zhicheng">
					</select>
				</p>
				<div class="buttons">
					<br> <input type="button" style="margin-left: 40px"
						class="button long2 ok" id="ok" value="确定" /> <input
						type="button" style="margin-left: 80px"
						class="button long2 normal" id="no" value="取消" />
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/doctorfind.js"></script>

<script type="text/javascript">
	$("#department").on("click", function() {
		$("#depart").toggle();
		return false;
	});
	$("#depart").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#department").find("span").text(txt);
		$("#departmentvalue").text(label);

	});
	$("#titles").on("click", function() {
		$("#title").toggle();
		return false;
	});
	$("#title").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#titles").find("span").text(txt);
		$("#titlevalue").text(label);
	});
	$("#states").on("click", function() {
		$("#state").toggle();
		return false;
	});
	$("#state").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#states").find("span").text(txt);
		$("#statevalue").text(label);
	});

	$("tbody").find("tr:odd").css("backgroundColor", "#eff6fa");

	showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
