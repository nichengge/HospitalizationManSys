$(function() {
	$("#ward").click(showWard);
	$("#bed").click(showBed);
	$("#doctor").click(showDoctor);
	$("#department").click(clean);
	$("#type").click(cleans);
	$("#ward").click(cleanBed);
	$("#register").click(register);
	$("#reset").click(reset);

	// 民族列表
	$.ajax({
		url : 'common/nationList.do',
		type : 'post',
		data : {
			"id" : ""
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#nations");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li id='nationxz' value=" + common.value
								+ ">" + common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
	// 科室列表
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "科室"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#depart");
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
	// 病房类型列表
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
// 重置
function reset() {
	$(":input", "#patientRegForm").val("");
}

function showWard() {
	var departmentNo = $("#departmentNo").val();
	var typeNo = $("#typeNo").val();
	// 病房号列表
	$.ajax({
		url : 'ward/wardQuery.do',
		type : 'post',
		data : {
			"departmentNo" : departmentNo,
			"typeNo" : typeNo
		},
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
// 展示医生列表
function showDoctor() {
	var departmentNo = $("#departmentNo").val();
	// 医生列表
	$.ajax({
		url : 'doctor/doctorQuery.do',
		type : 'post',
		data : {
			"department" : departmentNo
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#doctors");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var doctor = list[i];
						var $li = "<li value=" + doctor.id + ">" + doctor.name
								+ "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
}

function showBed() {
	var wardNo = $("#wardNo").val();
	// 床位列表
	$.ajax({
		url : 'bed/bedQuery.do',
		type : 'post',
		data : {
			"wardNo" : wardNo
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#beds");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var bed = list[i];
						var $li = "<li value=" + bed.bedNo + ">" + bed.bedNo
								+ "号床</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
}

// 当点击科室和病房类型时，清空病房号和床位号
function clean() {
	$("#ward").find("span").text("请选择");
	$("#wardNo").val(0);
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
	$("#doctor").find("span").text("请选择");
	$("#doctorNo").val(0);
}

function cleans() {
	$("#ward").find("span").text("请选择");
	$("#wardNo").val(0);
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
}

// 清空床位信息
function cleanBed() {
	$("#bed").find("span").text("请选择");
	$("#bedNo").val(0);
}

function register() {
	// 校验
	var name = $("#name").val();
	if (name == null || name == "") {
		alert("患者姓名不能为空");
		return false;
	}
	var name = $("#contacts").val();
	if (name == null || name == "") {
		alert("联系人不能为空");
		return false;
	}
	var homePhoneLen = $("#homePhone").val().length;
	if (homePhoneLen > 11) {
		alert("家庭电话长度不正确!");
		return false;
	}
	var birth = $("#birth").val();
	if (birth == null || birth == "") {
		alert("生日不能为空");
		return false;
	}
	var cerificateNo = $("#cerificateNo").val();
	if (cerificateNo == null || cerificateNo == "") {
		alert("身份证号不能为空");
		return false;
	}
	var cardId = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
	if (!cardId.test(cerificateNo)) {
		alert("身份证格式不正确！");
		return false;
	}
	var homeAddress = $("#homeAddress").val();
	if (homeAddress == null || homeAddress == "") {
		alert("家庭住址不能为空！");
		return false;
	}
	var contacts = $("#contactsPhone").val();
	if (contacts == null || contacts == "") {
		alert("联系人电话不能为空！");
		return false;
	}
	var contactsPhoneNum = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
	if (!contactsPhoneNum.test(contacts)) {
		alert("联系人手机号不正确!");
		return false;
	}
	var departmentNo = $("#departmentNo").val();
	if (departmentNo == 0) {
		alert("科室不能为空！");
		return false;
	}

	var typeNo = $("#typeNo").val();
	if (typeNo == 0) {
		alert("病房类型不能为空！");
		return false;
	}
	var wardNo = $("#wardNo").val();
	if (wardNo == 0) {
		alert("病房不能为空！");
		return false;
	}
	var bedNo = $("#bedNo").val();
	if (bedNo == 0) {
		alert("床位不能为空！");
		return false;
	}
	var doctorNo = $("#doctorNo").val();
	if (doctorNo == 0) {
		alert("主治医生不能为空！");
		return false;
	}
	var saveData = $("#patientRegForm").serialize();
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "patient/patientAdd.do",
		data : saveData,
		success : function(result) {
			if (result.state == 0) {
				alert("保存成功！");
			}
			window.location.reload();
		},
		error : function(result) {
			alert("保存失败");
			window.location.reload();
		}

	});
}
