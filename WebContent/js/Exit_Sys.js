//清除cookie，退出系统
$('#exitDialog').click(function(e) {
	// $('#exitDialog').Dialog('close');

	// 发送请求到后台清空cookie
	$.ajax({
		url : "account/clearCookie.do",
		type : "POST"
	});
	window.location.href = "login.jsp";

});