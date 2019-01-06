<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/parameter-setting.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />

<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>参数设置</h2>
	</div>

	<div style="width: 100%; float: right;">

		<table style="width:50%; float: left">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
		<table id="codelist" style="display: none; width:50%; float: right;">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
				</tr>
			</thead>
			<tbody id="showCode">
			</tbody>
		</table>
	</div>
	<div style="width: 100%;">
		<label id="id" style="display: none"></label>
		<table id="codetitle"
			style="display: none; border: none; margin-top: 10px; width: 50%; float: right">
			<thead>
				<tr>
					<td style="float: right"><input type="button" id="codeadd"
						class="button long2 ok" value="新增" /> <input type="button"
						id="codesave" class="button long2 normal" value="保存" /></td>
				</tr>
			</thead>
		</table>
	</div>
	<div class="ErrorDialog">
		<div class="dialog-content">
			<div class="ui-dialog-icon"></div>
			<div class="ui-dialog-text">
				<p class="dialog-content">你确定要删除参数？</p>
				<p class="tips">如果是请点击“确定”，否则点“取消”</p>
				<div class="buttons">
					<input type="button" class="button long2 ok" value="确定" /> <input
						type="button" class="button long2 normal" value="取消" />
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/parameterSetting.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript">
	$("tbody").find("tr:odd").css("backgroundColor", "#eff6fa");

	showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
