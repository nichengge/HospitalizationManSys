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
<style type="text/css">
#hide input {
	 display:none;
}
</style>
</head>

<body>
	<div class="title">
		<h2>转科室/病房</h2>
	</div>
	<div class="main">
		<form id="wardTransferForm">
			<div id="hide">
					<input id="departmentNo" name="departmentNo" value="0" /> 
					<input id="typeNo" name="typeNo" value="0" /> 
					<input id="wardNo" name="wardNo"value="0" /> 
					<input id="bedNo" name="bedNo" value="0" /> 
					<input id="doctorNo" name="doctorNo" value="0" />
					<input id="ybed" name="ybed" />
					<input id="yroom" name="yroom" />
					
			</div>
			<table>
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><font color="red"></font>住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="search" readonly results="s" name="patientId" id="patientId" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						</p>
					</td>
					<td>
					 	<p class="short-input ue-clear">
							<input type="text" readonly name="patinetName" id="patientName" />
						</p>
					</td>
				</tr>
				<tr>
									<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>科
								&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="department">
									<span id="departfh">请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="depart"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div>
					</td>
									<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>主治医师：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="doctor">
									<span id="doctorName">请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="doctors"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>病房类型：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="type">
									<span id="typefh">请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="types"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div>
					</td>
				<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>病 房 号：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="ward">
									<span id="wardfh">请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="wards"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>床 位 号：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<div class="select-title ue-clear" id="bed">
									<span id="bedNofh">请选择</span><i class="icon"></i>
								</div>
								<ul class="select-list" id="beds"
									style="height: 100px; overflow: auto;">
								</ul>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn">
		<a href="javascript:void(0);" id="register" class="confirm">保存</a> <a
			href="javascript:void(0);" id="reset" class="clear">重置</a>
	</div>
	<div  class="showPatientDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/wardTransfer.js"></script>
<script type="text/javascript">
$("#department").on("click",function(){
	$("#depart").toggle();
	return false;
});
$("#depart").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#department").find("span").text(txt);
	$("#departmentNo").val(label);
});
$("#type").on("click",function(){
	$("#types").toggle();
	return false;
});
$("#types").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#type").find("span").text(txt);
	$("#typeNo").val(label);
});
$("#ward").on("click",function(){
	$("#wards").toggle();
	return false;
});
$("#wards").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#ward").find("span").text(txt);
	$("#wardNo").val(label);
});
$("#bed").on("click",function(){
	$("#beds").toggle();
	return false;
});
$("#beds").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#bed").find("span").text(txt);
	$("#bedNo").val(label);
});
$("#doctor").on("click",function(){
	$("#doctors").toggle();
	return false;
});
$("#doctors").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#doctor").find("span").text(txt);
	$("#doctorNo").val(label);
});
$("#statu").on("click",function(){
	$("#status").toggle();
	return false;
});
$("#status").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#statu").find("span").text(txt);
	$("#statusNo").val(label);
});
</script>
</html>
  