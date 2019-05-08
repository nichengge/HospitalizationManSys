<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/season-change.jpg"
	type="image/x-icon">
<title>欢迎使用医院住院管理系统</title>


<link href="http://fonts.googleapis.com/css?family=Abel"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,500"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Dosis:300,400,500,600"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="assets/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/owl.transitions.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link
	href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300"
	rel="stylesheet" type="text/css">
</head>

<body>
	<section class="heading-slider">
		<div id="starting-slider" class="owl-carousel owl-theme">

			<div class="item">
				<div class="slider-1">
					<div class="slider-inner">
						<div class="container">
							<div class="row">
								<div class="slider-inner-text">
									<h1></h1>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="slider-2">
					<div class="slider-inner">
						<div class="container">
							<div class="row">
								<div class="slider-inner-text">
									<h1></h1>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="slider-3">
					<div class="slider-inner">
						<div class="container">
							<div class="row">
								<div class="slider-inner-text">
									<h1></h1>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<section class="starting-text">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<!-- testimonial -->


	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="copy-right-text text-center">
						<a id="nowIP"></a><br> <a target="_blank">当前系统版本:5.1.11_0507_R</a>
						<br> &copy; Copyright 2019 QUT fsci
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/wow.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

	<script>
		new WOW().init();
	</script>

	<script>
		$(document).ready(function() {
			$("#starting-slider").owlCarousel({
				autoPlay : 3000,
				navigation : false, // Show next and prev buttons
				slideSpeed : 700,
				paginationSpeed : 1000,
				singleItem : true
			});
		});
	</script>


	<script>
		$(function() {
			// init Isotope
			var $container = $('.isotope').isotope({
				itemSelector : '.element-item',
				layoutMode : 'fitRows'
			});

			// bind filter button click
			$('#filters').on('click', 'button', function() {
				var filterValue = $(this).attr('data-filter');
				// use filterFn if matches value
				$container.isotope({
					filter : filterValue
				});
			});

			// change is-checked class on buttons
			$('.button-group').each(function(i, buttonGroup) {
				var $buttonGroup = $(buttonGroup);
				$buttonGroup.on('click', 'button', function() {
					$buttonGroup.find('.is-checked').removeClass('is-checked');
					$(this).addClass('is-checked');
				});
			});

		});
	</script>
	<!-- 获取当前IP的JS -->
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		var IP = "当前登录IP:" + returnCitySN['cip'] + "," + returnCitySN['cname'];
		$("#nowIP").text(IP);
		//alert(returnCitySN['cip'] + returnCitySN['cname']);
	</script>
</body>
</html>