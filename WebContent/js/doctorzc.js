$(function() {

	$('#doctorname').on('focus', function() {
		$('#doctorNameError').empty();
	});

	$('#time').on('focus', function() {
		$('#timeError').empty();
	});

	$("#save").click(save);
	// 为职称的下拉列表增加数据
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "职称"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#title");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li id='titlexz' value=" + common.value
								+ ">" + common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
	// 为科室的下拉列表增加数据
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
	$("li").click(function() {
		var str = $(this).val();
		title = str;
	});
});
// 校验方法
function checkName() {
	var name = $("#doctorname").val();
	if (name === "") {
		$("#doctorNameError").css("color", "red");
		$("#doctorNameError").empty().append("*姓名不能为空");
		return false;
	}
	return true;
}

function checkDepart() {
	var depart = $("#departmentvalue").text();
	if (depart == 0) {
		alert("科室不能为空！");
		return false;
	}
	return true;
}

function checkTime() {
	var name = $("#time").val();
	if (name === "") {
		$("#timeError").css("color", "red");
		$("#timeError").empty().append("*入职时间不能为空");
		return false;
	}
	return true;
}

function checkTitles() {
	var depart = $("#titlevalue").text();
	if (depart == 0) {
		alert("医生职称不能为空！");
		return false;
	}
	return true;
}

function checkGender() {
	var gender = $("#gendervalue").text();
	if (gender == 0) {
		alert("性别不能为空！");
		return false;
	}
	return true;
}

function save() {
	// 校验
	if (!(checkName() && checkDepart() && checkTime() && checkTitles() && checkGender())) {
		return false;
	}
	// 保存
	var gender = $("#gendervalue").text();
	var department = $("#departmentvalue").text();
	var title = $("#titlevalue").text();
	var name = $("#doctorname").val();
	var time = $("#time").val();
	// alert("name:"+name+"gender:"+gender+"title:"+title+"time:"+time+"department:"+department);

	var datas = {
		"name" : name,
		"gender" : gender,
		"title" : title,
		"department" : department,
		"time" : time
	};
	$.ajax({
		url : 'doctor/save.do',
		type : 'post',
		data : datas,
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				alert("保存成功");
				window.location.reload();
			}
		},
		error : function(result) {
			alert("保存失败");
		}
	});
}
