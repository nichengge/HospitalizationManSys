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
		<h2>药品入库</h2>
	</div>
	<div class="main">
		<form id="drugsForm" method="post">
			<table>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>编号：<a href="javascript:;" id ="drugQuery"><img src="images/find.png" ></a>
							</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" id="drugsId" name="drugsId" size="30px!important;" />
						</p>
						
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>药品名称：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="drugsName" id="drugsName" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><font color="red">*</font>生产厂商：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="manufacturer" id="manufacturer" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>数 &nbsp;量：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" name="num" id="num" onblur="checknumb()"/>
						<p class="short-input ue-clear">
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>生产日期</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="date" name="productionTime" id="productionTime" onblur="checkproductionTime()"/>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>保质期</label>
						</p>
					</td>
					<td>
						<p class="short">
							<span><input id="year" name="year" type="text" />&nbsp;&nbsp;年</span>
							<span><input id="mouth" name="mouth" type="text" />&nbsp;&nbsp;月</span>
							<span><input id="day" name="day" type="text" />&nbsp;&nbsp;日</span>
						</p>
					</td>
				</tr>
				<tr>
				<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>入库日期</label>
						</p>
				</td>
				<td>
						<p class="short-input ue-clear">
							<input type="text" id="inTime" name="inTime"
							 readonly="readonly"/>
						</p>
				</td>
				<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>单 &nbsp;价：</label>
						</p>
				</td>
				<td>
						<p class="short-input ue-clear">
							<input type="text" name="price" id="price" />
						</p>
				</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>供货单位</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input id="supply" name="supply" type="text" />
						</p>
					</td>
				</tr>
			</table>	
		</form>
	</div>
	<div class="btn">
		<a href="javascript:void(0);" id="save" class="confirm">保存</a> <a
			href="javascript:void(0);" id="reset" class="clear">重置</a>
	</div>
	<!-- 药品查询 -->
	<div  class="drugsDialog">
		<iframe src="stock-query.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%">
		</iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/drugs_reg.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});
showRemind('input[type=text], textarea','placeholder');
//时间判断的方法
var now = new Date(); 
var changenow=new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
inTime.value=changenow;
function checkproductionTime(){
if($("#productionTime").val()!=""){
var PT1=$("#productionTime").val(); 
//根据日期字符串转换成日期 
var regEx = new RegExp("\\-","gi"); 
PT1=PT1.replace(regEx,"/");
var PT2=changenow; 
PT2=PT2.replace(regEx,"/"); 
//判断时间
	if(Date.parse(PT1)>Date.parse(PT2)){
	alert("生产日期错误!");
	$("#productionTime").val(changenow);
	}
}}
//检查数字输入框
function checknumb(){
if($("#num").val()!=""){
	if(Number($("#num").val())<=0){
		alert("不能为负！");
		$("#num").val("");
		return false;
	}
	}
	}
</script>
</html>
