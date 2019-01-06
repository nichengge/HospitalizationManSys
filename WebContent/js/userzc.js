//网页加载以后执行的方法
var ok=0;
$(function(){
	$('#register').click(register);
	$('#reset').click(reset);
	
	$('#accountNo')
	.on('blur', checkAccountNo)
	.on('focus', function(){
		$('#accountError').empty();
	});
	
	$('#password')
	.on('blur', checkPassword)
	.on('focus', function(){
		$('#passwordError').empty();
	});
	
	$('#phone')
	.on('blur', checkPhone)
	.on('focus', function(){
		$('#phoneError').empty();
	});
	
	
	$('#name')
	.on('blur', checkName)
	.on('focus', function(){
		$('#nameError').empty();
	});
	
	$('#repwd')
	.on('blur', checkRepwd)
	.on('focus', function(){
		$('#repwdError').empty();
	});
	
	$("li").click(function(){
		var str = $(this).val();
		ok = str;
	});
});

function checkAccountNo(){
	var account = $('#accountNo').val();
	if(account==''||account==null){
		$("#accountError").css("color","red");
		$("#accountError").empty().append("*用户名不能为空");
		return false;
	}
	//校验用户名是否重复
	$.ajax({
		url:'account/check.do',
		type:'post',
		data:{"id":account},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				$("#accountError").css("color","red");
				$("#accountError").empty().append("*用户名已被使用");
				return false;
			}else{
				$("#accountError").css("color","green");
				$("#accountError").empty().append("*用户名可用");
			}
		}
	});
	return true;
}

function checkPassword(){
	var password = $("#password").val();
	if(password === ""){
		$("#passwordError").css("color","red");
		$("#passwordError").empty().append("*密码不能为空");
		return false;
	}
	return true;
}

function checkName(){
	var name = $("#name").val();
	if(name === ""){
		 $("#nameError").css("color","red");
		 $("#nameError").empty().append("*真实姓名不能为空");
		 return false;
	}
	return true;
}

function checkPhone(){
	var phone = $("#phone").val();
	if(phone===""){
		$("#phoneError").css("color","red");
		$("#phoneError").text("*手机号不能为空");
		return false;
	}
	var expr =  /^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\d{8}$/i;
	if(!expr.test(phone)){
		$("#phoneError").css("color","red");
		$("#phoneError").text("*填写有误！");
		return false;
	}
	return true;
}

//再次输入密码的校验
function checkRepwd(){
	var repwd = $("#repwd").val();
	var password = $("#password").val();
	if(repwd === ""){
		$("#repwdError").css("color","red");
		$("#repwdError").empty().append("*再次输入密码不能为空");
		return false;
	}
	if(password != repwd){
		$("#repwdError").css("color","red");
		$("#repwdError").empty().append("*两次密码不一致");
		return false;
	}
	return true;
}
//注册按钮
function register(){
	//校验
	if(!(checkAccountNo()&&checkName()&&checkPassword()&&checkRepwd()&&checkPhone())){
		return false;
	}
	var id = $("#accountNo").val();
	var name = $("#name").val();
	var password = $("#password").val();
	var phone = $("#phone").val();
	
	$.ajax({
		url:'account/register.do',
		type:'post',
		data:{"id":id,"name":name,"password":password,"phone":phone,"describe":ok},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				alert("注册成功");
			}else{
				alert("注册失败");
			}
			window.location.reload();
		}
	});
}
//重置按钮
function reset(){
	$(":input","#zhuce").val("");
}
 