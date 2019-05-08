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
		<h2>运行日志</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<div class="query-conditions ue-clear">
			<div class="conditions name ue-clear">
				<label>事件类型：</label>
				<div class="select-wrap" id="eventtype">
					<div class="select-title ue-clear">
						<span>请选择</span><i class="icon"></i>
					</div>
					<ul class="select-list">
						<li value="1">ERROR</li>
						<li value="2">WARN</li>
						<li value="3">INFO</li>
						<li value="4">DEBUG</li>
					</ul>
				</div>
			</div>
			<div class="conditions time ue-clear">
				<label>事件时间：</label>
				<div class="time-select">
					<input type="date" id="startTime" placeholder="开始时间" />
				</div>
				<span class="line">-</span>
				<div class="time-select">
					<input type="date" id="endTime" placeholder="结束时间" />
				</div>
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
					<th class="num">事件序号</th>
					<th class="node">事件类型</th>
					<th class="time">事件时间</th>
					<th class="name">事件描述</th>
					<th class="name">操作</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear" id="showbuttom"></div>
	<div class="showUser" id="logs">
		<div class=".ui-dialog-panel">
			<p>
				事件序号：<label style="color: red;" class="nameUpdateError" id="logid"></label>
			</p>
			<p>
				事件类型：<label style="color: red;" class="nameUpdateError" id="logtype"></label>
			</p>
			<p>
				事件时间：<label style="color: red;" class="phoneUpdateError"
					id="logcreate_time"></label>
			</p>
			<p>
				事件详情：
				<textarea rows="10" cols="45" name="logdetial" id="logdetial"
					readonly style="resize: none"></textarea>
			</p>
		</div>
		<div class="buttons">
			<br> <input type="button" style="margin-left: 80px"
				class="button long2 normal" id="previous" onclick='PreviousLog()'
				value="⏮上一个" /> <input type="button" style="margin-left: 80px"
				class="button long2 normal" id="next" onclick='NextLog()'
				value="下一个⏭" />
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.paginationForLogJSP.js"></script>
<script type="text/javascript" src="js/log.js"></script>
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
