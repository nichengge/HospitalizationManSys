<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>医院住院管理系统</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link href="css/login-main.css" rel="stylesheet" type="text/css" />

</head>
<body id="body">
<div class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log">
			<form id="loginform" name="loginform" method="post">
				<div class="name">
					<label>用户名</label><input type="text" class="text"  placeholder="用户名" 
					id="username" name="username" size="20px" onblur="cleanNerror();">
				</div>
				
				
			  <div class="pwd">
					<label>密　码</label><input type="password" class="text"  placeholder="密码" 
					id="password"name="password" onblur="cleanPerror();">
				</div>
				
				
			  <div class="chc" id="yzm">
					<label>验证码</label><input type="text" class="chctext" placeholder="验证码" 
					name="Verification" id="Verification" onblur="cleanYerror();">
				  <img src="image.do" id="yzmimage" align="middle" onclick="this.src=this.src+'?'" />
				</div>
				
				
				<div class="message" id="message">
					<label></label>
				</div>
				
				<div>
					<input type="button" id = "login" class="submit" value="登录" onclick="Login();" >
				</div>
				</form>
			</div>
		</div>
	</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>
<script type="text/javascript" src="js/jQuery_airball.js"></script>
<script type="text/javascript" src="js/fun.base.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>Copyrigth  ©️ 2019 &nbsp;&nbsp; <a href="http://www.github.com/yzqyfly/" target="_blank" title="熠睿GitHub主页">熠睿fsci</a></p>
</div>
</body >
</html>