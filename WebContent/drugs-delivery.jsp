<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css"/>
<link rel="stylesheet" href="css/info-reg.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>药品发放</h2>
	</div>
	<div class="main">
		<form id="drugs_delivery">
			<table>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>住院号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input results="s" type="search" readonly name="patientId" id="patientId"/>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>姓名：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="patientName" id="patientName" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>药品编号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="search" results="s" readonly name="drugsId" id="drugsId" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label>数量：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="num" id="num" onblur="checkdrugsnum()"/> 
							<input type="hidden" name="num1" id="num1">
						<p class="short-input ue-clear">
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><font color="red">*</font>药品名称：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="drugsName" id="drugsName" />
						</p>
					</td>


					<td>
						<p class="short-input ue-clear">
							<label>单价：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="price" id="price" />
						<p class="short-input ue-clear">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn">
		<a href="javascript:;" class="confirm">发放</a> 
		<a href="javascript:;"  class="clear">重置</a>
	</div>
	<input type="hidden" id="tiao" value="测试中"/>
	<!-- 病人查询 -->
 	<div  class="exitDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
	<!-- 药品查询 -->
	<div  class="drugsDialog">
		<iframe src="stock-query.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/drugs_delivery.js"></script>
<script>
	function checkdrugsnum(){
		if(Number($("#num1").val())<Number($("#num").val())){
		alert("药物库存不够，请联系库房管理员进药！");
		$("#num").val($("#num1").val());
		return false;
		}
	}
</script>
</html>
