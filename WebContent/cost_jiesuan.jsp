<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>费用结算</h2>
	</div>
	<div class="query">
		<div class="query-conditions ue-clear">
			<div class="conditions staff ue-clear">
				<label><font color="red">*</font>住院号：</label> <input
					type="search" results="s" readonly id="patientId" class="patientId" />
					<label id="patientIdError"></label>
					<input type="text" style="display:none;" id="patientName">
			</div>
			 <div class="query-btn ue-clear">
			<a href="javascript:;" id="select" class="confirm">查询</a>
			<a href="javascript:;" id="reset" class="clear">结算</a>
		</div>
		</div>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">住院号</th>
					<th class="process">姓名</th>
					<th class="node">费用类别</th>
					<th class="node">费用金额(元)</th>
				</tr>
			</thead>
			<tbody id="show">
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
	<!-- 查询病人 -->
	<div  class="showDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
	<!-- 确定弹窗 -->
	<div class="showJiesuanDialog">
		<div class="dialog-content">
			<div class="ui-dialog-icon"></div>
			<div class="ui-dialog-text">
				<p class="dialog-content">确定结算完成？</p>
				<p class="tips">如果是请点击“确定”，否则点“取消”</p>
				<div class="buttons">
					<input type="button" class="button long2 jiesuanOK" value="确定" /> <input
						type="button" class="button long2 jiesuanNO" value="取消" />
				</div>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/expense-settlement.js"></script>
</html>
