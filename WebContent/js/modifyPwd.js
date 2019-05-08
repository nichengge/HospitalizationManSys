//页面加载后执行
$(function() {
	$("#resetpwd").click(modifyPwd);
	$('#password').on('blur', checkpassword).on('focus', function() {
		$('.passwordError').empty();
	});

	$('#firstpwd').on('blur', checkpwd).on('focus', function() {
		$('.firstpwdError').empty();
	});

	$('#lastpwd').on('blur', checklastpwd).on('focus', function() {
		$('.lastpwdError').empty();
	});

	$('#ok').click(save);

	$('#no').click(no);

});

// 页面校验
function checkpassword() {
	var check = false;
	var pwd = $("#password");
	if (pwd.val() == null || "" == pwd.val()) {
		$(".passwordError").text("不能为空");
		return false;
	}
	var cookie = getCookie('user');
	var id = cookie.split("#")[0].substring(0);
	// 发送请求去查看密码是否正确
	$.ajax({
		url : "account/check.do",
		data : {
			"id" : id
		},
		type : "post",
		dataType : "JSON",
		async : false,
		success : function(result) {
			if (result.state == 0) {
				var user = result.data;
				if (user.password == pwd.val()) {
					check = true;
				}
			}
		},
		error : function() {
			alert("ajax请求失败!");
		}
	});
	if (!check) {
		$(".passwordError").text("密码错误");
		return check;
	}
	return true;
}

function checkpwd() {
	var firstpwd = $("#firstpwd");
	if (firstpwd.val() == null || "" == firstpwd.val()) {
		$(".firstpwdError").text("不能为空");
		return false;
	}
	if (firstpwd.val().length > 20) {
		$(".firstpwdError").text("密码长度不得大于20");
		return false;
	}
	return true;
}

function checklastpwd() {
	var lastpwd = $("#lastpwd");
	if (lastpwd.val() == null || "" == lastpwd.val()) {
		$(".lastpwdError").text("不能为空");
		return false;
	}
	if (lastpwd.val() != $("#firstpwd").val()) {
		$(".lastpwdError").text("密码不一致");
		return false;
	}
	return true;
}

$('.showModify').Dialog({
	title : '修改密码',
	autoOpen : false,
	width : 430,
	height : 230
});

function modifyPwd() {
	$('.showModify').Dialog('open');
}

function save() {
	// 保存前的校验
	var a = checkpassword();
	var b = checkpwd();
	var c = checklastpwd();
	var cookie = getCookie('user');
	var id = cookie.split("#")[0].substring(0);
	var password = $("#firstpwd").val();
	if (a == true && b == true && c == true) {
		// 提交请求
		$.ajax({
			url : "account/updateUser.do",
			data : {
				"id" : id,
				"password" : password
			},
			type : "post",
			dataType : "JSON",
			success : function(result) {
				if (result.state == 0) {
					alert("保存成功！");
					$('.showModify').Dialog('close');
					window.location.href = "welcome.jsp";// 修改成功，重新回到欢迎页
				}
			}
		});
	}
}

function no() {
	$('.showModify').Dialog('close');
}
