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
		<h2>用户查询</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<div class="query-conditions ue-clear">
			<div class="conditions name ue-clear">
				<label>用户类型：</label>
				<div class="select-wrap" id="usertype">
					<div class="select-title ue-clear">
						<span>请选择</span><i class="icon"></i>
					</div>
					<ul class="select-list">
						<li value="0">患者</li>
						<li value="1">护士</li>
						<li value="2">医生</li>
						<li value="3">服务前台</li>
						<li value="4">系统管理员</li>
					</ul>
				</div>
			</div>
			<div class="conditions staff ue-clear">
				<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label> <input
					type="text" id="id" />
			</div>
			<div class="conditions time ue-clear">
				<label>注册时间：</label>
				<div class="time-select">
					<input type="date" id="startTime" placeholder="开始时间" />
				</div>
				<span class="line">-</span>
				<div class="time-select">
					<input type="date" id="endTime" placeholder="结束时间" />
				</div>
			</div>
			<div class="conditions staff ue-clear">
				<label>真实姓名：</label> <input type="text" id="username" />
			</div>
		</div>
		<div class="query-btn ue-clear">
			<a href="javascript:void(0);" id="select" class="confirm">查询</a> <a
				href="javascript:void(0);" id="reset" class="clear">清空条件</a>
		</div>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">账号</th>
					<th class="process">真实姓名</th>
					<th class="node">用户类型</th>
					<th class="node">电话号码</th>
					<th class="time">注册时间</th>
					<th class="name">编辑</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear" id="showbuttom"></div>
	<div class="showUser">
		<div class=".ui-dialog-panel">
			<form class="formDialog">
				<p>
					用户名：<input type="text" name="idUpdate" readonly id="idUpdate" />
				</p>
				<p>
					姓&nbsp;&nbsp; 名：<input type="text" name="nameUpdate"
						id="nameUpdate"><label style="color: red;"
						class="nameUpdateError"></label>
				</p>
				<p>
					手机号：<input type="text" name="phoneUpdate" id="phoneUpdate"><label
						style="color: red;" class="phoneUpdateError"></label>
				</p>
				<p>
					权&nbsp;&nbsp; 限：<select id="select_id">
						<option value="0">患者</option>
						<option value="1">护士</option>
						<option value="2">医生</option>
						<option value="3">服务前台</option>
						<option value="4">系统管理员</option>
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
<script type="text/javascript" src="js/userfind.js"></script>
<script type="text/javascript">
	$(".select-title").on("click", function() {
		$(".select-list").hide();
		$(this).siblings($(".select-list")).show();
		return false;
	})
	$(".select-list").on(
			"click",
			"li",
			function() {
				var txt = $(this).text();
				var ok = $(this).val();
				$(this).parent($(".select-list")).siblings($(".select-title"))
						.find("span").text(txt);
				$("#des").val(ok);
			})
</script>
</html>
