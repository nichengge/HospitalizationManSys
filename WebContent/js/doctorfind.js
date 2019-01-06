//职称列表
var listTitle;
//科室列表
var listDepartment;
var $tbody = $("#show");
var start = 0;
var end = 7;

$(function() {
	$("#select").click(select);
	$("#reset").click(reset);
	$('#nameUpdate')
		.on('blur', checkName)
		.on('focus', function() {
			$('.nameUpdateError').empty();
		});
	$("#no").click(no);
	$("#ok").click(ok);

	//为职称的下拉列表增加数据
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "职称"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				listTitle = result.data;
				var $ul = $("#title");
				var $title = $("#select_zhicheng");
				$title.empty();
				$ul.empty();
				if (listTitle.length > 0) {
					for (var i = 0; i < listTitle.length; i++) {
						var common = listTitle[i];
						var $li = "<li id='titlexz' value=" + common.value + ">" + common.name +
							"</li>";
						$ul.append($li);
					}
					for (var i = 0; i < listTitle.length; i++) {
						var common = listTitle[i];
						var $option = "<option value='" + common.value + "'>" + common.name + "</option>";
						$title.append($option);
					}
				}
			}
		}
	});
	//为科室的下拉列表增加数据
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "科室"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				listDepartment = result.data;
				var $ul = $("#depart");
				var $keshi = $("#select_keshi");
				$keshi.empty();
				$ul.empty();
				if (listDepartment.length > 0) {
					for (var i = 0; i < listDepartment.length; i++) {
						var common = listDepartment[i];
						var $li = "<li value=" + common.value + ">" + common.name +
							"</li>";
						$ul.append($li);
					}
					for (var i = 0; i < listDepartment.length; i++) {
						var common = listDepartment[i];
						var $op = "<option value='" + common.value + "'>" + common.name + "</option>";
						$keshi.append($op);
					}
				}
			}
		}
	});
});

function select() {
	var department = $("#departmentvalue").text();
	var title = $("#titlevalue").text();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var name = $("#name").val();
	var state = $("#statevalue").text();
	var data = {
		"name" : name,
		"title" : title,
		"startTime" : startTime,
		"endTime" : endTime,
		"department" : department,
		"state" : state
	};
	//执行查询
	$.ajax({
		url : 'doctor/doctorQuery.do',
		type : 'post',
		data : data,
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				$tbody.empty();
				//分页
				if (list.length > 0) {
					$('.pagination').pagination(list.length, {
						callback : function(page) {
							start = page * this.items_per_page;
							end = (page + 1) * this.items_per_page;
							$tbody.empty();
							showList(list, start, end);
						},
						display_msg : true, //是否显示记录信息
						setPageNo : true //是否显示跳转第几页
					});
					$("#showbuttom").show();
				} else {
					alert("未找到信息！");
					$("#showbuttom").hide();
					$(".clear").click();
				}
				showList(list, start, end);
			}
		}
	});
}
function reset() {
	/*$(":input","#doctor_find_head").val("");
	$(":li","#doctor_find_head").val("请选择");*/
	window.location.reload(true);
}
function showList(list, start, end) {
	if (list.length > 0) {
		for (var i = start; i < end; i++) {
			var doctor = list[i];
			var gender = "";
			var title = "";
			var department = "";
			//将对应的int值转为中文
			for (var j = 0; j < listTitle.length; j++) {
				if (listTitle[j].value == doctor.title) {
					title = listTitle[j].name;
				}
			}
			for (var c = 0; c < listDepartment.length; c++) {
				if (listDepartment[c].value == doctor.department) {
					department = listDepartment[c].name;
				}
			}
			if (doctor.gender == 1) {
				gender = "男";
			} else if (doctor.gender == 2) {
				gender = "女";
			}
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa'>";
			} else {
				trStyle = "<tr>";
			}
			var state = "是";
			if (doctor.state == 1) {
				state = "否";
			}
			var $tr = $(trStyle +
				"<td class='num'>" + (i + 1) + "</td>" +
				"<td class='name'>" + doctor.id + "</td>" +
				"<td class='process'>" + doctor.name + "</td>" +
				"<td class='node'>" + department + "<span style='display:none'>" + doctor.department + "</span></td>" +
				"<td class='num'>" + gender + "<span style='display:none;'>" + doctor.gender + "</span></td>" +
				"<td class='node'>" + title + "<span style='display:none;'>" + doctor.title + "</span></td>" +
				"<td class='time'>" + doctor.workTime + "</td>" +
				"<td class='num'>" + state + "</td>" +
				"<td class='name'><a href='javascript:void(0)' onclick='doctorDelete(this);'>离职</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
				"	<a href='javascript:void(0)' onclick='doctorUpdate(this)'>修改</a></td>"
				+ "</tr>");
			$tbody.append($tr);
		}
	}
}
//删除医生信息
function doctorDelete(obj) {
	//得到所选用户的Id
	var doctorId = obj.parentNode.parentNode.childNodes[1].innerText;
	$.ajax({
		url : 'doctor/doctorDelete.do',
		type : 'post',
		data : {
			"id" : doctorId
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				alert("成功离职！");
			}
			if (result.state == 1) {
				alert("已离职！");
			}
			if (result.state == 3) {
				alert("该医生不存在！");
			}
			window.location.reload();
		}
	});
}
function doctorUpdate(obj) {
	//得到所选医生的Id
	var doctorId = $(obj).parent().parent().children().eq(1).html();
	//获得所选医生的姓名
	var doctorName = $(obj).parent().parent().children().eq(2).html();
	//得到所选医生的科室
	var depart = $(obj).parent().parent().children().eq(3).find("span").text();
	//得到所选医生的性别
	var gender = $(obj).parent().parent().children().eq(4).find("span").text();
	//得到所选医生的职称
	var zhicheng = $(obj).parent().parent().children().eq(5).find("span").text();
	showUser(doctorId, doctorName, depart, gender, zhicheng);
}
//修改医生信息弹窗
$('.showDoctor').Dialog({
	title : '修改医生信息',
	autoOpen : false,
	width : 400,
	height : 300
});

function showUser(doctorId, doctorName, depart, gender, zhicheng) {
	$('.showDoctor').Dialog('open');
	$("#idUpdate").val(doctorId);
	$("#nameUpdate").val(doctorName);
	$("#select_keshi").val(depart);
	$("#select_gender").val(gender);
	$("#select_zhicheng").val(zhicheng);
}
//校验
function checkName() {
	var name = $("#nameUpdate").val();
	if (name == null || "" == name) {
		$(".nameUpdateError").text("*请填写！");
		return false;
	}
	return true;
}

//更新医生信息
function ok() {
	var id = $("#idUpdate").val();
	var name = $("#nameUpdate").val();
	var keshi = $("#select_keshi").val();
	var gender = $("#select_gender").val();
	var zhicheng = $("#select_zhicheng").val();
	//输入校验
	if (checkName()) {
		//校验成功后提交
		$.ajax({
			url : "doctor/updateDoctorMessage.do",
			data : {
				"id" : id,
				"name" : name,
				"keshi" : keshi,
				"gender" : gender,
				"zhicheng" : zhicheng
			},
			type : "post",
			dataType : "JSON",
			success : function(result) {
				if (result.state == 0) {
					alert("更新成功！");
					$('.showDoctor').Dialog('close');
					window.location.reload();
				}
			},
			error : function() {
				alert("更新失败！");
			}
		});
	}
}
function no() {
	$('.showDoctor').Dialog('close');
}