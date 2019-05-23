//将用户的权限作为全局变量
var start = 0;
var end = 15;
var id = $("#id");
var startTime = $("#startTime");
var endTime = $("#endTime");
var username = $("#username");
var $tbody = $("#show");

$(function() {
	$("#select").click(Query);
	$("#reset").click(Reset);
	$('#nameUpdate').on('blur', checkName).on('focus', function() {
		$('.nameUpdateError').empty();
	});
	$('#phoneUpdate').on('blur', checkPhone).on('focus', function() {
		$('.phoneUpdateError').empty();
	});

	$("#no").click(no);
	$("#ok").click(ok);
});

function Query() {
	// 查询用户
	var ids = id.val();
	var startTimes = startTime.val();
	var endTimes = endTime.val();
	var names = username.val();
	var describe = $("#des").val();
	var data = {
		"id" : ids,
		"startTime" : startTimes,
		"endTime" : endTimes,
		"name" : names,
		"describe" : describe
	};
	$.ajax({
		url : 'account/userQuery.do',
		type : 'post',
		data : data,
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				$tbody.empty();
				// 分页
				if (list.length > 0) {
					$('.pagination').pagination(list.length, {
						callback : function(page) {
							start = page * this.items_per_page;
							end = (page + 1) * this.items_per_page;
							$tbody.empty();
							showList(list, start, end);
							return true;
						},
						display_msg : true, // 是否显示记录信息
						setPageNo : true
					// 是否显示跳转第几页
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

function showList(list, start, end) {
	if (list.length > 0) {
		for (var i = start; i < end; i++) {
			var user = list[i];
			var describe = "";
			// 将用户权限转成中文
			if (user.describe == "0") {
				describe = "患者";
			}
			if (user.describe == "1") {
				describe = "护士";
			}
			if (user.describe == "2") {
				describe = "医生";
			}
			if (user.describe == "3") {
				describe = "服务前台";
			}
			if (user.describe == "4") {
				describe = "系统管理员";
			}
			/*
			 * 超管用户是系统底层后门用户,不允许系统查到, 需要查到超管先删掉SQL语句中的：and user_describe != 5
			 */
			if (user.describe == "5") {
				describe = "超级管理员";
			}
			var trStyle;
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa'>";
			} else {
				trStyle = "<tr>";
			}
			var $tr = $(trStyle
					+ "<td class='num'>"
					+ (i + 1)
					+ "</td>"
					+ "<td class='name'>"
					+ user.id
					+ "</td>"
					+ "<td class='process'>"
					+ user.name
					+ "</td>"
					+ "<td class='node'>"
					+ describe
					+ "<span style='display:none'>"
					+ user.describe
					+ "</span></td>"
					+ "<td class='node'>"
					+ user.phone
					+ "</td>"
					+ "<td class='time'>"
					+ user.createtime
					+ "</td>"
					+ "<td class='name'><a href='javascript:void(0)' onclick='userDelete(this);'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"
					+ "<a href='javascript:void(0)' onclick='userUpdate(this)'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;"
					+ "<a href='javascript:void(0)' onclick='userUpdatePwd(this)'>重置密码</a></td>"
					+ "</tr>");
			$tbody.append($tr);
		}
	}
}

// 删除用户
function userDelete(obj) {
	// 得到所选用户的Id
	var userId = obj.parentNode.parentNode.childNodes[1].innerText;
	$.ajax({
		url : 'account/userDelete.do',
		type : 'post',
		data : {
			"id" : userId
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				alert("删除成功！");
			}
			if (result.state == 3) {
				alert("该用户不存在！");
			}
			window.location.reload()
		}
	});
}
// 修改用户
function userUpdate(obj) {
	// 得到所选用户的Id
	var userId = obj.parentNode.parentNode.childNodes[1].innerText;
	// 获得所选用户的姓名
	var username = $(obj).parent().parent().children().eq(2).html();
	// 得到所选用户的电话
	var userPhone = $(obj).parent().parent().children().eq(4).html();
	// 得到所选用户的权限
	var quanxian = $(obj).parent().parent().children().eq(3).find("span")
			.text();
	showUser(userId, username, userPhone, quanxian);
}
//修改用户密码
function userUpdatePwd(obj) {
	// 得到所选用户的Id
	var userId = obj.parentNode.parentNode.childNodes[1].innerText;
	var defaultpwd = "123456";
	// 提交请求
	$.ajax({
		url : "account/updateUser.do",
		data : {
			"id" : userId,
			"password" : defaultpwd
		},
		type : "post",
		dataType : "JSON",
		async: false,
		success : function(result) {
			if (result.state == 0) {
				alert("密码重置为:123456");
			}else{
				alert("未知异常!");
			}
		}
	});
	
}
function Reset() {
	window.location.reload(true);
}

// 修改用户信息弹窗
$('.showUser').Dialog({
	title : '修改用户信息',
	autoOpen : false,
	width : 430,
	height : 300
});

function showUser(userId, username, userPhone, quanxian) {
	$('.showUser').Dialog('open');
	$("#idUpdate").val(userId);
	$("#nameUpdate").val(username);
	$("#phoneUpdate").val(userPhone);
	$("#select_id").val(quanxian);
}
// 校验
function checkName() {
	var name = $("#nameUpdate").val();
	if (name == null || "" == name) {
		$(".nameUpdateError").text("*请填写！");
		return false;
	}
	return true;
}

function checkPhone() {
	var phone = $("#phoneUpdate").val();
	if (phone == "" || phone == null) {
		$(".phoneUpdateError").text("*请填写！");
		return false;
	}
	var expr = /^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\d{8}$/i;
	if (!expr.test(phone)) {
		$(".phoneUpdateError").text("*填写有误！");
		return false;
	}
	return true;
}

// 更新用户细信息
function ok() {
	debugger;
	var id = $("#idUpdate").val();
	var name = $("#nameUpdate").val();
	var phone = $("#phoneUpdate").val();
	var state = $('#select_id').val();
	// 输入校验
	if (checkName() && checkPhone()) {
		// 校验成功后提交
		$.ajax({
			url : "account/updateUserMessage.do",
			data : {
				"id" : id,
				"name" : name,
				"phone" : phone,
				"state" : state
			},
			type : "post",
			dataType : "JSON",
			success : function(result) {
				if (result.state == 0) {
					alert("更新成功！");
					$('.showUser').Dialog('close');
					window.location.reload()
				}
			},
			error : function() {
				alert("更新失败！");
			}
		});
	}
}
function no() {
	$('.showUser').Dialog('close');
}
