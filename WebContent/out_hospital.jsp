<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>出院登记</h2>
	</div>

	<div class="main">
		<form id="leaveHospitalForm">
			<table>
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><span style="color: red">*</span>住院号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="search" readonly results="s" name="patientId"
								id="patientId" />
						</p>
					</td>
					<td>
						<p class="short-inpue-clear">
							<label><span style="color: red">*</span>姓
								&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
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
							<label><span style="color: red">*</span>科
								&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="department" id="department" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="gender" id="gender" />
						</p>
					</td>
				</tr>


				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>身份证号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="cardId" id="cardId" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>主治医师：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="doctorName" id="doctorName" />
						</p>
					</td>
				</tr>

				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>入院时间：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="inTime" id="inTime" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>病 房 号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="roomNo" id="roomNo" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>是否结算：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="jiesuan" id="jiesuan" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><span style="color: red">*</span>床 位 号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="bedNo" id="bedNo" />
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn">
		<a href="javascript:void(0);" class="confirm">登记</a> <a
			href="javascript:void(0);" class="clear">重置</a>
	</div>
	<!-- 查询病人 -->
	<div class="showDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%"
			scrolling="auto" height="100%"></iframe>
	</div>
	<!-- 错误提示弹窗 -->
	<div class="showError">
		<div class="dialog-content">
			<div class="ui-dialog-icon"></div>
			<div class="ui-dialog-text">
				<p class="dialog-content">未结算的病人不能办理出院手续！</p>
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
<script type="text/javascript" src="js/discharge-settlement.js"></script>
</html>
