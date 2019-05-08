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
		<h2>库存查询</h2>
	</div>
	<div class="query">
		<form id="stock_query">
			<div class="query-conditions ue-clear">
				<div class="conditions staff ue-clear">
					<label>药品编号：</label> <input name="drugsId" type="text" />
				</div>
				<div class="conditions staff ue-clear">
					<label>药品名称：</label> <input name="drugsName" type="text" />
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
					<th class="name">药品名称</th>
					<th class="node">药品价格</th>
					<th class="node">药品数量</th>
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
<script type="text/javascript" src="js/stock_query.js"></script>
<script type="text/javascript">
	
</script>
</html>
