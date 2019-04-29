<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/form.css">
<title>Insert title here</title>
</head>
<body>
 <div class="card form" id="resetpwd">
    <div class="card-header">
        <h3>修改密码</h3>
    </div>
        <br>
        
        
     <form>
         <div class="row">
           <div class="col-md-6">
           
           
             <div class="form-group">
                <label for="exampleInputEmail1">原密码</label>
                <input type="text" class="form-control" name="password" id="password" aria-describedby="emailHelp" placeholder="请输入原密码">
                <label style="color:red;" class="passwordError"></label>
			</div>
			
			
            <div class="form-group">
               <label for="exampleInputPassword1">新密码</label>
               <input type="password" class="form-control" name="pwd" id="firstpwd" placeholder="请输入新密码">
               <label style="color:red;" class="firstpwdError"></label>
          	 </div>
          	 
          	 
             <div class="form-group">
                <label for="exampleInputPassword1">再次输入</label>
                <input type="password" class="form-control" name="repwd" id="lastpwd" placeholder="请再次输入新密码">
            	<label style="color:red;" class="lastpwdError"></label>
			</div>
			
		</div>
	</div> 
        <button type="submit" class="btn btn-general btn-blue mr-2" id="ok">提交更改</button>  
        <button type="reset" class="btn btn-general btn-white" id="no">重置</button>
  </form>
</div>

</body>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/core.js"></script>
		<script type="text/javascript" src="js/jquery.dialog.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript" src="js/user.js"></script>
		<script type="text/javascript" src="js/modifyPwd.js"></script>
		<script type="text/javascript" src="js/cookie_util.js"></script>

</html>