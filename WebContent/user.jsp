<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=0.5, maximum-scale=1.0, user-scalable=yes" />

<title>医院住院管理系统</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/font-icon-style.css">
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="css/topstyle.css">
<link rel="stylesheet" href="css/form.css">
</head>

<body>

	<!--顶栏-->
	<header class="header">
		<nav class="navbar navbar-expand-lg ">
			<div class="container-fluid ">


				<!-- 左上标题 -->
				<div class="navbar-header">
					<a href="user.jsp" class="navbar-brand">医院住院管理系统</a> <a
						id="toggle-btn" href="#" class="menu-btn active"> <span></span>
						<span></span> <span></span>
					</a>
				</div>



				<ul
					class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">


					<!-- 右上最大化按钮-->
					<li class="nav-item d-flex align-items-center full_scr_exp"><a
						class="nav-link" href="#"><img src="images/Max.png"
							onclick="toggleFullScreen(document.body)" class="img-fluid"
							alt=""></a></li>


					<!-- 右上角头像-->
					<li class="nav-item dropdown"><a id="profile"
						class="nav-link logout" data-target="#" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
							src="images/userface.png" alt="..."
							class="img-fluid rounded-circle"
							style="height: 30px; width: 30px;"></a>
						<ul aria-labelledby="profile" class="dropdown-menu profile">
							<li>
								<div rel="nofollow" class="dropdown-item d-flex">
									<div class="msg-profile">
										<img src="images/userface.png" alt="..."
											class="img-fluid rounded-circle">
									</div>
									<div class="msg-body">
										<h3 class="h5" id="name"></h3>
										<span id="gangwei"></span>
									</div>
								</div>
								<hr>
							</li>

							<li><a rel="nofollow" class="dropdown-item"
								href="Reset_pwd.jsp" target="iframe"><i class="fa fa-cog"></i>修改密码</a>
								<hr></li>

							<li><a id="exitDialog" rel="nofollow" class="dropdown-item"
								href="javascript:;"><i class="fa fa-power-off"></i>退出系统</a></li>
						</ul></li>


				</ul>
			</div>
		</nav>
	</header>

	<!--侧栏-->
	<div class="page-content d-flex align-items-stretch" id="sidebar">
		<nav class="side-navbar">
			<!--边栏系统时间-->
			<hr>
			<div class="sidebar-header d-flex align-items-center">
				<div class="title">
					<h1 class="h4" id="currentTime"></h1>
				</div>
			</div>
			<hr>



			<ul class="list-unstyled">

				<li id="ruyuanguanli" style="display: none;"><a href="#1"
					aria-expanded="false" data-toggle="collapse"><i
						class="icon-home"></i>入院管理</a>
					<ul id="1" class="collapse list-unstyled">
						<li><a href="patient_reg.jsp" target="iframe" id="rydj"
							style="display: none;">入院登记</a></li>
						<li><a href="patient_find.jsp" target="iframe" id="zycx"
							style="display: none;">住院查询</a></li>
					</ul></li>


				<li id="chuyuanguanli" style="display: none;"><a href="#2"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-interface-windows"></i>出院管理
				</a>
					<ul id="2" class="collapse list-unstyled">
						<li><a href="out_hospital.jsp" target="iframe" id="cydj"
							style="display: none;">出院登记</a></li>
						<li><a href="left-find.jsp" target="iframe" id="cycx"
							style="display: none;">出院查询</a></li>
						<li><a href="ward-transfer.jsp" target="iframe" id="zbfcl"
							style="display: none;">转院/病房</a></li>
					</ul></li>


				<li id="bingfangguanli" style="display: none;"><a href="#3"
					aria-expanded="false" data-toggle="collapse"> <i
						class="fa fa-building-o"></i>病房管理
				</a>
					<ul id="3" class="collapse list-unstyled">
						<li><a href="ward-crease.jsp" target="iframe" id="xzbf"
							style="display: none;">新置病房</a></li>
						<li><a href="ward-price_modify.jsp" target="iframe"
							id="bfjgtz" style="display: none;">病房价格调整</a></li>
					</ul></li>


				<li id="jiesuanzhongxin" style="display: none;"><a href="#4"
					aria-expanded="false" data-toggle="collapse"><i
						class="fa fa-map-o"></i>结算中心</a>
					<ul id="4" class="collapse list-unstyled">
						<li><a href="cost_yujiao.jsp" target="iframe" id="fyyj"
							style="display: none;">费用预缴</a></li>
						<li><a href="costQuery.jsp" target="iframe" id="jfjl"
							style="display: none;">缴费记录</a></li>
						<li><a href="cost_jiesuan.jsp" target="iframe" id="fycx"
							style="display: none;">费用查询</a></li>
					</ul></li>


				<li id="hulizhongxin" style="display: none;"><a href="#5"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-line-chart"></i>护理中心
				</a>
					<ul id="5" class="collapse list-unstyled">
						<li><a href="sign-entry.jsp" target="iframe" id="lrtzsj"
							style="display: none;">录入体征数据</a></li>
						<li><a href="sign-query.jsp" target="iframe" id="tzsjcx"
							style="display: none;">体征数据查询</a></li>
						<li><a href="history_inhospital.jsp" target="iframe"
							id="zyls" style="display: none;">住院历史</a></li>
						<li><a href="history_drug.jsp" target="iframe" id="yyls"
							style="display: none;">用药历史</a></li>
					</ul></li>



				<li id="tongjizhongxin" style="display: none;"><a href="#6"
					aria-expanded="false" data-toggle="collapse"> <i
						class="fa fa-bar-chart"></i>统计中心
				</a>
					<ul id="6" class="collapse list-unstyled">
						<li><a href="patient-Statistics.jsp" target="iframe"
							id="brtj" style="display: none;">病人统计</a></li>
						<li><a href="bed-Statistics.jsp" target="iframe" id="bftj"
							style="display: none;">病房统计</a></li>
					</ul></li>


				<li id="yaopinguanli" style="display: none;"><a href="#7"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-flask"></i>药品管理
				</a>
					<ul id="7" class="collapse list-unstyled">
						<li><a href="drugs-reg.jsp" target="iframe" id="yprk"
							style="display: none;">药品入库</a></li>
						<li><a href="drugs-delivery.jsp" target="iframe" id="ypff"
							style="display: none;">药品发放</a></li>
						<li><a href="drugs-repercussion.jsp" target="iframe"
							id="tycl" style="display: none;">退药处理</a></li>
						<li><a href="inventory-query.jsp" target="iframe" id="rkcx"
							style="display: none;">入库查询</a></li>
						<li><a href="stock-query.jsp" target="iframe" id="kccx"
							style="display: none;">库存查询</a></li>
					</ul></li>


				<li id="yonghuguanli" style="display: none;"><a href="#8"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-user"></i>用户管理
				</a>
					<ul id="8" class="collapse list-unstyled">
						<li><a href="user-reg.jsp" target="iframe" id="yhzc"
							style="display: none;">用户注册</a></li>
						<li><a href="user-find.jsp" target="iframe" id="yhcx"
							style="display: none;">用户查询</a></li>
					</ul></li>


				<li id="yishengguanli" style="display: none;"><a href="#9"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-check"></i>医生管理
				</a>
					<ul id="9" class="collapse list-unstyled">
						<li><a href="doctor-reg.jsp" target="iframe" id="yslr"
							style="display: none;">医生录入</a></li>
						<li><a href="doctor-find.jsp" target="iframe" id="yscx"
							style="display: none;">医生查询</a></li>
					</ul></li>



				<li id="canshushezhi" style="display: none;"><a href="#0"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-list"></i>系统配置
				</a>
					<ul id="0" class="collapse list-unstyled">
						<li><a href="parameter-setting.jsp" target="iframe" id="cssz"
							style="display: none;">参数设置</a></li>
						<li><a href="Log.jsp" target="iframe" id="yxrz"
							style="display: none;">运行日志</a></li>
					</ul></li>


			</ul>
		</nav>

		<!-- 主内容显示区域 -->
		<div class="content-inner form-cont">
			<iframe id="iframe" name="iframe" src="welcome.jsp" width=100%
				height=850pixels frameborder="0"></iframe>
		</div>


	</div>

</body>

<!--Global Javascript -->
<script type="text/javascript" src="js/echarts.js"></script>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/front.js"></script>

<!--  <script type="text/javascript" src="js/index.js"></script>-->
<script type="text/javascript" src="js/Exit_Sys.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript" src="js/user.js"></script>

</html>