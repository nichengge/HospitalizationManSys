//获得cookie中的name
$(function() {
	/* $body = $(".sidebar"); */
	$body = $(".side-navbar");
	// 动态加载页面
	var cookie = getCookie('user');
	// 获取当前用户权限
	var Jurisdiction = cookie.split("#")[2].substring(0, 1);
	if (Jurisdiction == null || Jurisdiction == "") {
		window.location.href = "login.jsp";// 未登陆系统，回到登陆页
	}
	// 患者
	if (Jurisdiction == 0) {
		$("#yaopinguanli").css("display", "");
		$("#kccx").css("display", "");
		$("#jiesuanzhongxin").css("display", "");
		$("#fycx").css("display", "");
		$("#jfjl").css("display", "");
		$("#hulizhongxin").css("display", "");
		$("#lrtzsj").css("display", "");
		$("#tzsjcx").css("display", "");
		$("#zyls").css("display", "");
		$("#yyls").css("display", "");
		$("#gangwei").text("[患者]");
	}

	// 护士
	if (Jurisdiction == 1) {
		$("#ruyuanguanli").css("display", "");
		$("#zycx").css("display", "");
		$("#yaopinguanli").css("display", "");
		$("#ypff").css("display", "");
		$("#jiesuanzhongxin").css("display", "");
		$("#jfjl").css("display", "");
		$("#fycx").css("display", "");
		$("#hulizhongxin").css("display", "");
		$("#lrtzsj").css("display", "");
		$("#tzsjcx").css("display", "");
		$("#yyls").css("display", "");
		$("#chuyuanguanli").css("display", "");
		$("#cycx").css("display", "");
		$("#tongjizhongxin").css("display", "");
		$("#brtj").css("display", "");
		$("#bftj").css("display", "");
		$("#gangwei").text("[护士]");
	}

	// 医生
	if (Jurisdiction == 2) {
		$("#ruyuanguanli").css("display", "");
		$("#zycx").css("display", "");
		$("#yaopinguanli").css("display", "");
		$("#ypff").css("display", "");
		$("#kccx").css("display", "");
		$("#hulizhongxin").css("display", "");
		$("#lrtzsj").css("display", "");
		$("#tzsjcx").css("display", "");
		$("#zyls").css("display", "");
		$("#yyls").css("display", "");
		$("#chuyuanguanli").css("display", "");
		$("#cycx").css("display", "");
		$("#tongjizhongxin").css("display", "");
		$("#brtj").css("display", "");
		$("#bftj").css("display", "");
		$("#gangwei").text("[医生]");
	}

	// 服务前台
	if (Jurisdiction == 3) {
		$("#ruyuanguanli").css("display", "");
		$("#rydj").css("display", "");
		$("#zycx").css("display", "");
		$("#yaopinguanli").css("display", "");
		$("#tycl").css("display", "");
		$("#kccx").css("display", "");
		$("#jiesuanzhongxin").css("display", "");
		$("#fyyj").css("display", "");
		$("#jfjl").css("display", "");
		$("#fycx").css("display", "");
		$("#chuyuanguanli").css("display", "");
		$("#cydj").css("display", "");
		$("#cycx").css("display", "");
		$("#zbfcl").css("display", "");
		$("#tongjizhongxin").css("display", "");
		$("#brtj").css("display", "");
		$("#bftj").css("display", "");
		$("#gangwei").text("[患者服务中心]");
	}

	// 系统管理员
	if (Jurisdiction == 4) {
		$("#bingfangguanli").css("display", "");
		$("#xzbf").css("display", "");
		$("#bfjgtz").css("display", "");
		$("#yaopinguanli").css("display", "");
		$("#yprk").css("display", "");
		$("#rkcx").css("display", "");
		$("#kccx").css("display", "");
		$("#tongjizhongxin").css("display", "");
		$("#brtj").css("display", "");
		$("#bftj").css("display", "");
		$("#yonghuguanli").css("display", "");
		$("#yhzc").css("display", "");
		$("#yhcx").css("display", "");
		$("#yishengguanli").css("display", "");
		$("#yslr").css("display", "");
		$("#yscx").css("display", "");
		$("#canshushezhi").css("display", "");
		$("#cssz").css("display", "");
		$("#yxrz").css("display", "");
		$("#gangwei").text("[系统管理员]");
	}

	// 超级管理员
	if (Jurisdiction == 5) {
		$("#ruyuanguanli").css("display", "");
		$("#rydj").css("display", "");
		$("#zycx").css("display", "");
		$("#bingfangguanli").css("display", "");
		$("#xzbf").css("display", "");
		$("#bfjgtz").css("display", "");
		$("#yaopinguanli").css("display", "");
		$("#yprk").css("display", "");
		$("#ypff").css("display", "");
		$("#tycl").css("display", "");
		$("#rkcx").css("display", "");
		$("#kccx").css("display", "");
		$("#jiesuanzhongxin").css("display", "");
		$("#fyyj").css("display", "");
		$("#jfjl").css("display", "");
		$("#fycx").css("display", "");
		$("#hulizhongxin").css("display", "");
		$("#lrtzsj").css("display", "");
		$("#tzsjcx").css("display", "");
		$("#zyls").css("display", "");
		$("#yyls").css("display", "");
		$("#chuyuanguanli").css("display", "");
		$("#cydj").css("display", "");
		$("#cycx").css("display", "");
		$("#zbfcl").css("display", "");
		$("#tongjizhongxin").css("display", "");
		$("#brtj").css("display", "");
		$("#bftj").css("display", "");
		$("#yonghuguanli").css("display", "");
		$("#yhzc").css("display", "");
		$("#yhcx").css("display", "");
		$("#yishengguanli").css("display", "");
		$("#yslr").css("display", "");
		$("#yscx").css("display", "");
		$("#canshushezhi").css("display", "");
		$("#cssz").css("display", "");
		$("#yxrz").css("display", "");
		$("#gangwei").text("[超级管理员]");
	}

	$.ajax({
		url : 'account/getUser.do',
		type : 'post',
		data : {},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var user = result.data;
				if (user == "" || user == null) {
					alert("未登录");
				} else {
					$("#name").text(user.name);
					$("#id").text(user.id);
				}
			}
		}
	});

	$("#currentTime").css("color", "#000");
	setInterval(function() {
		$("#currentTime").html(current)
	}, 50);// jquery自带方法
});

function current() {

	var d = new Date(), str = '';

	str += d.getFullYear() + '年';

	intMonth = d.getMonth() + 1;

	if (intMonth < 10) {

		intMonth = '0' + intMonth;

	}

	str += intMonth + '月';

	intDay = d.getDate();

	if (intDay < 10) {

		intDay = '0' + intDay;

	}

	str += intDay + '日';

	intHour = d.getHours();

	if (intHour < 10) {

		intHour = '0' + intHour;

	}

	str += '<b>' + intHour + ':';

	intMin = d.getMinutes();

	if (intMin < 10) {

		intMin = '0' + intMin;

	}

	str += intMin + ':';

	intSec = d.getSeconds();

	if (intSec < 10) {

		intSec = '0' + intSec;

	}

	str += intSec + '</b>';

	return str;
}
