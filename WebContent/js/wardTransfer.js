$(function(){
	$("#patientId").click(selectPatient);
	$("#ward").click(showWard);
	$("#bed").click(showBed);
	$("#doctor").click(showDoctor);
	$("#department").click(clean);
	$("#type").click(cleans)
	$("#ward").click(cleanBed);
	$(".confirm").click(save);
	$(".clear").click(clear);
	//科室列表
	$.ajax({
		url:'common/list.do',
		type:'post',
		data:{"name":"科室"},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				var list = result.data;
				var $ul = $("#depart");
				$ul.empty();
				if(list.length>0){
					for(var i=0;i<list.length;i++){
						var common = list[i];
						var $li = "<li value="+common.value+">"+common.name+
							"</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
	//病房类型列表
	$.ajax({
		url : 'common/typeList.do',
		type : 'post',
		data : {
			"id" : ""
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#types");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li value=" + common.value + ">"
								+ common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
});

function showWard(){
	var departmentNo = $("#departmentNo").val();
	var typeNo = $("#typeNo").val();
	//病房号列表
	$.ajax({
		url : 'ward/wardQuery.do',
		type : 'post',
		data : {"departmentNo":departmentNo,"typeNo":typeNo},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#wards");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var ward = list[i];
						var $li = "<li value=" + ward.wardNo + ">"
								+ ward.wardNo + "号房</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
}
//展示医生列表
function showDoctor(){
	var departmentNo = $("#departmentNo").val();
	//病房号列表
	$.ajax({
		url : 'doctor/doctorQuery.do',
		type : 'post',
		data : {"department":departmentNo},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#doctors");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var doctor = list[i];
						var $li = "<li value=" + doctor.id + ">"
								+ doctor.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
}


function showBed(){
	var wardNo = $("#wardNo").val();
	//床位列表
	$.ajax({
		url : 'bed/bedQuery.do',
		type : 'post',
		data : {"wardNo":wardNo},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#beds");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var bed = list[i];
						var $li = "<li value=" + bed.bedNo + ">"
								+ bed.bedNo + "号床</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
}

//当点击科室和病房类型时，清空病房号和床位号
function clean(){
	$("#ward").find("span").text("请选择");
	$("#wardNo").val(0);
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
	$("#doctor").find("span").text("请选择");
	$("#doctorNo").val(0);
}

function cleans(){
	$("#ward").find("span").text("请选择");
	$("#wardNo").val(0);
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
}

//清空床位信息
function cleanBed(){
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
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
				console.log(patient[0]);
				$("#departfh").text(patient[0].departmentName);
				$("#departmentNo").val(patient[0].department);
				$("#doctorName").text(patient[0].doctorName);
				$("#doctorNo").val(patient[0].doctorId);
				$("#typefh").text(patient[0].roomTypeName);
				$("#typeNo").val(patient[0].roomType);
				$("#wardfh").text(patient[0].roomNo);
				$("#wardNo").val(patient[0].roomNo);
				$("#bedNofh").text(patient[0].bedNo);
				$("#bedNo").val(patient[0].bedNo);
				//用于存放原来的床位号的病房号
				$("#yroom").val(patient[0].roomNo);
				$("#ybed").val(patient[0].bedNo);
			}
		}
	});
}
//重置
function clear(){
	window.location.reload();
}

//保存
function save(){
	// 提交form表单
	var saveData = $("#wardTransferForm").serialize();
	if($("#patientId").val()==""){
		alert("请选择信息后提交！");
		$("#patientId").click();
		return false;
	}
	$.ajax({
		type:"POST",
		dataType:"json",
		url:"patient/patientUpdate.do",
		data:saveData,
		success:function(result){
			if(result.state==0){
				alert("保存成功！");
			} 
			window.location.reload();
		},
		error:function(result){
			alert("保存成功");
			window.location.reload();
		}
	});
}




//病人的查询弹窗
function selectPatient(){
	var ok = $('.showPatientDialog').Dialog("open");
}

$('.showPatientDialog').Dialog({
	title:'选择病人',
	autoOpen: false,
	width:1000,
	height:400,
});

function close(){
	$('.showPatientDialog').Dialog('close');
	showMessage();
}