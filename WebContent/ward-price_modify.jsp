<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>病房价格调整</h2>
	</div>
	<div class="main">

		<div class="table-box">
			<form id="updatePriceForm">
				<input style="display: none;" id="total" name="total" />
				<table>
					<thead>
						<tr>
							<th class="num">序号</th>
							<th class="name">病房类型号</th>
							<th class="process">类型名称</th>
							<th class="node">调整前的价格(元/天)</th>
							<th class="operate">调整后的价格(元/天)</th>
							<th class="operate">上次调整时间</th>
						</tr>
					</thead>
					<tbody id="show">
					</tbody>
				</table>
			</form>
		</div>
		<table>
			<tr>
				<td>
					<div class="query-btn ue-clear"
						style="float: right; margin-right: 40px; margin-bottom: 15px;">
						<a href="javascript:void(0);" id="save" class="confirm">保存</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
<script>
	function check_price(i) {
		if (parseInt($("#price_input_modify" + i).val()) < 1) {
			alert("操作错误！！最低为1！")
			$("#price_input_modify" + i).val("1");
			return false;
		}

	}
	function modify_price1(i) {
		var id = "price_input_modify" + i;
		var id1 = "#price_input_modify" + i;
		var num = document.getElementById(id);
		if ($(id1).val() == "") {
			alert("操作错误！！")
			$(id1).val("1");
			return false;
		}
		if ($(id1).val() == "1") {
			alert("操作错误！！")
			return false;
		}
		num.value = parseInt(num.value) - 1;
	}
	function modify_price2(i) {
		var id = "price_input_modify" + i;
		var id1 = "#price_input_modify" + i;
		var num = document.getElementById(id);
		if ($(id1).val() == "") {
			$(id1).val("1");
		}
		num.value = parseInt(num.value) + 1;
	}
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/wardModify.js"></script>
</html>
