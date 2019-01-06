$(function(){
	$("#patientId").click(selectPatient);	
	$(".confirm").click(confirm);
	$(".clear").click(clear);
	$(".ok").click(closeError);
	$(".normal").click(closeError);
});

//保存按钮
function confirm(){
	//校验
	var patientId = $("#patientId").val();
	if(patientId==null||""==patientId){
		alert("病人不存在！");
		return false;
	}
	var jiesuan = $("#jiesuan").val();
	if(jiesuan=="否"){
		showError();
		return false;
	}
	//出院登记
	var url = "patient/patientLeave.do";
	var data = {"patientId":patientId,"roomNo":$("#roomNo").val(),"bedNo":$("#bedNo").val()};
	$.post(url,data,function(result){
		alert("登记成功！");
		window.location.reload();
	});
}

//重置按钮
function clear(){
	$("#leaveHospitalForm :input").val("");
}
//错误提示弹窗
$('.showError').Dialog({
	title:'错误提示信息',
	autoOpen: false,
	width:400,
	height:200
});

function showError(){
	$('.showError').Dialog('open');
}

function closeError(){
	$('.showError').Dialog('close');
}

//病人的查询弹窗
function selectPatient(){ 
	$("#patientIdError").empty();
	$('.showDialog').Dialog("open");
}

$('.showDialog').Dialog({
	title:'选择病人',
	autoOpen: false,
	width:1000,
	height:400
});

function close(){
	$('.showDialog').Dialog('close');
	//关闭之前进行页面显示
	showMessage();
}

//展示病人信息
function showMessage(){
	$.ajax({
		url:"patient/patientQuery.do",
		type:"post",
		data:{"patientId":$("#patientId").val()},
		dataType:"JSON",
		async:false,
		success:function(result){
			if(result.state==0){
				var patient = result.data;
				var gender = "女";
				var settlementState = "是";
				if(patient[0].gender==1){
					gender = "男";
				}
				if(patient[0].settlementState==0){
					settlementState = "否";
				}
				console.log(patient[0]);
				$("#patientName").val(patient[0].name);
				$("#cardId").val(patient[0].cerificateNo);
				$("#gender").val(gender);
				$("#inTime").val(patient[0].admissionTime);
				$("#department").val(patient[0].departmentName);
				$("#doctorName").val(patient[0].doctorName);
				$("#roomNo").val(patient[0].roomNo);
				$("#jiesuan").val(settlementState);
				$("#bedNo").val(patient[0].bedNo);
			}
		}
	});
}

