//病人体征数据录入js
$(function(){
	$("#patientId").click(selectPatient);
	$(".clear").click(clear);
	$(".confirm").click(save);
	$("#measureTime").val(getNowAllFormatDate());
	
});

//保存按钮
function save(){
	var saveData = $("#signEntry").serialize();
	if($("#patientId").val()==""){
		alert("住院编号不能为空！");
		$("#patientId").click();
		return false;
	}
	if($("#measureTime").val()==""){
		alert("时间不能为空！");
		$("#measureTime").click();
		return false;
	}
	if($("#temperature").val()==""){
		alert("体温不能为空！");
		$("#temperature").click();
		return false;
	}
	$.ajax({
		url:"sign/signSave.do",
		data:saveData,
		type:"POST"
	});
	alert("录入成功！");
	window.location.reload();
}

//病人查询
function selectPatient(){
	var ok = $('.patientQuery').Dialog("open");
}
 
$('.patientQuery').Dialog({
	title:'选择病人',
	autoOpen: false,
	width:1000,
	height:400
});

function close(){
	$('.patientQuery').Dialog('close');
}

//重置按钮
function clear(){
	$("#signEntry :input").val("");
}
//获取当前时间(yyyy-mm-dd hh:mm:ss)
function getNowAllFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}
	
