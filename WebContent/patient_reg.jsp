<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<title>医院住院管理系统</title>
<style type="text/css">
#hide input {
	display: none;
}
</style>
</head>
<body>
	<div class="title">
		<h2>入院登记</h2>
	</div>
	<div class="main">
		<form id="patientRegForm">
			<div style="display: none;">
				<input id="nationNo" name="nationNo" value="1" /> <input
					id="departmentNo" name="departmentNo" value="0" /> <input
					id="marryNo" name="marryNo" value="0" /> <input id="typeNo"
					name="typeNo" value="0" /> <input id="wardNo" name="wardNo"
					value="0" /> <input id="bedNo" name="bedNo" value="0" /> <input
					id="doctorNo" name="doctorNo" value="0" /> <input id="statusNo"
					name="statusNo" value="0" /> <input id="genderNo" name="genderNo"
					value="0" />
			</div>
			<table>
				<tr>
					<td><p class="short-inpue-clear">
							<label><font color="red">*</font>姓
								&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="name" id="name" />
						</p></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>身份证号：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="cerificateNo" id="cerificateNo" /> <span
								id="patientError"></span>
						<p class="short-input ue-clear"></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="gender">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="genders">
									<li value="1">男</li>
									<li value="2">女</li>
								</ul>
							</div>
						</div></td>
					<td><p class="short-input ue-clear">
							<label>民 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="nation">
									<span>汉族</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="nations"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label>工作单位：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="workUnit" id="workUnit" />
						<p class="short-input ue-clear"></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>生
								&nbsp;&nbsp;&nbsp;&nbsp;日：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="date" id="birth" name="birth"
								onblur="checkpatientTime()" />
						</p></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>家庭住址：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="homeAddress" id="homeAddress" />
						<p class="short-input ue-clear"></td>
					<td><p class="short-input ue-clear">
							<label>家庭电话：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="homePhone" id="homePhone" />
						<p class="short-input ue-clear"></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label>婚姻状况：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="marry">
									<span>未婚</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="marrys">
									<li value="0">未婚</li>
									<li value="1">已婚</li>
								</ul>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>科
								&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="department">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="depart"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>主治医师：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="doctor">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="doctors"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>病房类型：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="type">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="types"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>病 房 号：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="ward">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="wards"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>床 位 号：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="bed">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="beds"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>入院状况：</label>
						</p></td>
					<td><div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="statu">
									<span>请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="status"
									style="height: 100px; overflow: auto;">
									<li value="1">一般</li>
									<li value="2">急</li>
									<li value="3">危</li>
								</ul>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>紧急联 系 人：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="contacts" id="contacts" />
						</p></td>
					<td><p class="short-input ue-clear">
							<label><font color="red">*</font>手机号：</label>
						</p></td>
					<td><p class="short-input ue-clear">
							<input type="text" name="contactsPhone" id="contactsPhone" />
						<p class="short-input ue-clear"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn">
		<a href="javascript:void(0);" id="register" class="confirm">登记</a> <a
			href="javascript:void(0);" id="reset" class="clear">重置</a>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/patientzc.js"></script>
<script type="text/javascript">
	$("#nation").on("click", function() {
		$("#nations").toggle();
		return false;
	});
	$("#nations").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#nation").find("span").text(txt);
		$("#nationNo").val(label);
	});
	$("#department").on("click", function() {
		$("#depart").toggle();
		return false;
	});
	$("#depart").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#department").find("span").text(txt);
		$("#departmentNo").val(label);
	});
	$("#marry").on("click", function() {
		$("#marrys").toggle();
		return false;
	});
	$("#marrys").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#marry").find("span").text(txt);
		$("#marryNo").val(label);
	});
	$("#type").on("click", function() {
		$("#types").toggle();
		return false;
	});
	$("#types").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#type").find("span").text(txt);
		$("#typeNo").val(label);
	});
	$("#ward").on("click", function() {
		$("#wards").toggle();
		return false;
	});
	$("#wards").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#ward").find("span").text(txt);
		$("#wardNo").val(label);
	});
	$("#bed").on("click", function() {
		$("#beds").toggle();
		return false;
	});
	$("#beds").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#bed").find("span").text(txt);
		$("#bedNo").val(label);
	});
	$("#doctor").on("click", function() {
		$("#doctors").toggle();
		return false;
	});
	$("#doctors").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#doctor").find("span").text(txt);
		$("#doctorNo").val(label);
	});
	$("#statu").on("click", function() {
		$("#status").toggle();
		return false;
	});
	$("#status").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#statu").find("span").text(txt);
		$("#statusNo").val(label);
	});
	$("#gender").on("click", function() {
		$("#genders").toggle();
		return false;
	});
	$("#genders").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#gender").find("span").text(txt);
		$("#genderNo").val(label);
	});
	//时间判断的方法
	var now = new Date();
	var changenow = new Date().getFullYear() + '-'
			+ (new Date().getMonth() + 1) + '-' + new Date().getDate();
	function checkpatientTime() {
		if ($("#birth").val() != "") {
			var PT1 = $("#birth").val();
			//根据日期字符串转换成日期 
			var regEx = new RegExp("\\-", "gi");
			PT1 = PT1.replace(regEx, "/");
			var PT2 = changenow;
			PT2 = PT2.replace(regEx, "/");
			//判断时间
			if (Date.parse(PT1) > Date.parse(PT2)) {
				alert("出生日期错误!");
				$("#birth").val(changenow);
			}
		}
	}
</script>
</html>