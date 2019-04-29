<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>预交费用</h2>
	</div>
	<div class="main">
	<form id="costForm">
		<table>          
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><font color="red">*</font>住院号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="search" results="s" readonly name="patientId" id="patientId" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="patientName" readonly id="patientName" />
						</p> 
					</td>
				</tr>
				
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>科&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="departmentName" readonly id="departmentName" />
						</p> 
					</td>
					<td>
						<p class="short-input ue-clear">
							<label>缴费方式：</label>
							<input type = "text" name="types" id="types" value="现金" style="display:none;">
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="costType">
									<span>现金</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="type">
									<li value="现金">现金</li>
									<li value="银联卡">银联卡</li>
								</ul>
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>主治医生：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="doctorName" readonly id="doctorName" />
						</p> 
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>预交费用：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="account" id="account" />
						<p class="short-input ue-clear">
					</td>
				</tr>
					<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>收款用户：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="userId" readonly readonly id="userId" />
						</p> 
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>收款人姓名：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="userName" readonly id="userName" />
						<p class="short-input ue-clear">
					</td>
					</tr>
				
				<tr>
				<td>
						<p class="short-input ue-clear">
							<label>收款时间：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="collectionTime" readonly id="collectionTime" />
						<p class="short-input ue-clear"> 
					</td>
				</tr>
				
				</table>
				</form>
				<div class="btn">
			<a href="javascript:void(0);"  class="confirm">保存</a> 
			<a href="javascript:void(0);"  class="clear" onclick="window.location.reload()">重置</a>
	</div>
	</div>  
	<!-- 查询病人 -->
	<div  class="showDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
</body>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/prepaidExpenses.js"></script>
 
<script type="text/javascript">
$("#costType").on("click",function(){
	$("#type").toggle();
	return false;
});
$("#type").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#costType").find("span").text(txt);
	$("#types").val(txt);
});
</script>
</html>
