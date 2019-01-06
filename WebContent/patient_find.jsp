<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />

<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>住院查询</h2>
	</div>
	<form id="patientFindForm">
		<input style="display: none;" id="departmentNo" name="departmentNo"
			type="text" value="" />
		<div class="query">
			<div class="query-conditions ue-clear" id="zhuyuan_find">
				<div class="conditionst name ue-clear">
					<label>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
					<div class="select-wrap">
						<div class="select-title ue-clear" id="department">
							<span>请选择</span><i class="icon"></i>
						</div>
						<ul class="select-list" id="depart"
							style="height: 100px; overflow: auto;">
						</ul>
					</div>
				</div>
				<div class="conditionst staff ue-clear">
					<label>住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input type="text"
						name="patientId" />
				</div>
				<div class="conditionst staff ue-clear">
					<label>病&nbsp;&nbsp;房&nbsp;&nbsp;号：</label> <input type="text"
						name="wardNo" />
				</div>
				<div class="conditionst time ue-clear">
					<label>入院时间：</label>
					<div class="time-select">
						<input type="date" name="start" id="start" placeholder="开始时间" onblur="checkstarttime()"/>
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" name="end" placeholder="结束时间" />
					</div>
				</div>
				<div class="conditionst staff ue-clear">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
						type="text" id="name" name="name" />
				</div>
				<div class="conditionst staff ue-clear">
					<label>床&nbsp;&nbsp;位&nbsp;&nbsp;号：</label> <input type="text"
						name="bedNo" />
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:void(0);" class="confirm">查询</a> <a
					href="javascript:void(0);" class="clear" onclick="window.location.reload()">清空条件</a>
			</div>
		</div>
		<div class="table-box">
			<table>
				<thead>
					<tr>
						<th class="num">序号</th>
						<th class="time">住院号</th>
						<th class="process">姓名</th>
						<th class="num">性别</th>
						<th class="node">科室</th>
						<th class="num">病房</th>
						<th class="num">床位号</th>
						<th class="num">入院情况</th>
						<th class="time">入院时间</th>
					</tr>
				</thead>
				<tbody id="show">
				</tbody>
			</table>
		</div>
	</form>
	<div class="pagination ue-clear" id="showbuttom"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/patientfind.js"></script>
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
function checkstarttime(){
	if($("#start").val()!=""){
	var startTime=$("#start").val();  
    var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
    var endTime=getNowFormatDate();  
    var end=new Date(endTime.replace("-", "/").replace("-", "/"));
	if(endTime<startTime){
		alert("时间错误");
		$("#start").val(getNowFormatDate());
	}
	}

}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
}
</script>
</html>
