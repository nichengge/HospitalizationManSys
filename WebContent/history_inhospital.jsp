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
		<h2>历史住院记录查询</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<div class="query-conditions ue-clear">
			<form id="findForm">
				<div class="query-conditions ue-clear">
					<div class="conditions staff ue-clear">
						<label>身&nbsp;&nbsp;份&nbsp;&nbsp;证：</label> <input type="text"
							name="cerificateNo" id="cerificateNo" />
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
					<th class="num">序号</th>
					<th class="name">住院号</th>
					<th class="name">姓名</th>
					<th class="node">性别</th>
					<th class="node">主治医生</th>
					<th class="node">身份证</th>
					<th class="time">入院时间</th>
					<th class="time">出院时间</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/history_inhospital.js"></script>
</html>
