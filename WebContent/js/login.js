//登录按钮
function Login(){
	//登录时进行校验
	var name = $("#username").val();
	var password = $("#password").val();
	var Verification = $("#Verification").val();//获取验证码
	//校验用户名是否为空
	if(name==""||name==null){
		$("#message").html("用户名为空");
		return false;
	}
	//判断密码是否为空
	if(password==""||password==null){
		$('#message').html("密码为空");
		return false;
	}
	//判断验证码是否为空
	if(Verification==""||Verification==null){
		$('#message').html("验证码为空");
		return false;
	}
	//登陆提交请求
	$.ajax({
		url: 'account/login.do',
		type: 'POST',
		data: {'username':name,'password':password,'Verification':Verification},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来 的JsonResult对象
			// state 和 data属性是在sonResult中定义的Bean属性
			if(result.state==0){ 
				window.location.href='user.jsp';//登陆成功，跳转用户主页
				return;
			}
			var field = result.state;
			if(field==1){
				//显示用户名错误
				$('#message').empty().append(result.message);
			}
			if(field==2){
				//显示密码错误
				$('#message').empty().append(result.message);
			}
			if(field==3){
				//验证码错误
				$("#message").empty().append(result.message);
			}
		}
	});	 
}
 //清空页面的提示信息（失去焦点的时候调用）
function cleanNerror(){
	$("#message").html("");
}

function cleanPerror(){
	$("#message").html("");
}

function cleanYerror(){
	$("#message").html("");
}

//页面上的重置
function onReset(){
	$("input").attr("value","");
}

//回车登录
$(document).keydown(function (event) {
	if (event.keyCode == 13) {
	$("#login").click();
	}
	});