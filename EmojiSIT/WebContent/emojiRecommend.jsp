<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>推荐功能页面</title>
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<link rel="stylesheet" type="text/css" href="css/fxsmall.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- <script src="js/modernizr.custom.js"></script>  -->
	<script src="js/ScrollPicLeft.js"></script>
    <style>
	html,body,ul,li{margin:0; padding:0;}
	ul,li{ list-style:none;}
	.dd_main{ width:1100px;height:200px;text-align:center;}
	.zl_left { width:35px; float:left; text-align:left; padding-top:60px}
	.zl_right { width:35px; float:right; text-align:right; padding-top:60px}
	.zl_content { width:1020px; height:153px; float:left; overflow:hidden;}
	.zl_content ul li { width:130px; padding:0 10px; text-align:center; float:left;}
	.welcome{ position:fixed; width:100%; text-align:center; bottom:30px;}
	.welcome a{ color:#0350B8;}
	.td_img{
		max-width: 100%;
		max-height: 100%;
	}

</div>
	</style>
</head>
<body style="background-color: #c8c8c8">
<!-- Header -->
<header id="header">
	<a href="#" style="display:block;margin-left:20px;">表情包智能推荐</a>
	<nav class="links">
		<ul>
			<li><a href="emojiRecommend.jsp">表情推荐</a></li>
			<li><a href="#">上传表情</a></li>
		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="search">
				<a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</li>
			<li class="menu">
				<a class="fa-bars" href="#menu">Menu</a>
			</li>
		</ul>
	</nav>
</header>
	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Menu -->
				<section id="menu">

					<!-- Search -->
						<section>
							<form class="search" method="get" action="#">
								<input type="text" name="query" placeholder="Search" />
							</form>
						</section>
	

					<!-- Actions -->
						<section>
							<ul class="actions stacked">
								<li><a href="#" class="button large fit">Log In</a></li>
							</ul>
						</section>

				</section>

			<!-- Main -->
				<div id="main">

					<!-- Post -->
						<article class="post">
							<header>
								<div class="title">
									<h2><a href="#">推荐功能页面</a></h2>
									<p>推荐刚做的表情包</p>
								</div>
								<div class="meta">
									<time class="published" datetime="2015-11-01">2020-12-9</time>
									<a href="#" class="author"><span class="name">Cyh</span><img src="images/0.jpg" alt="" /></a>
								</div>
							</header>
							
							<!-- <span class="image featured"><img src="images/pic01.jpg" alt="" /></span> -->
							<section>
								<div class="dd_main">  
								  <div class="zl_left" id="Left_Photo"><a href="javascript:void(0)"><img src="images/zl_tb1.jpg" width="24" height="32" /></a></div>
								  <div class="zl_content">
								    <ul id="ISL_Photo">
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/logo.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/0.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/17.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/15.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/21.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								      <li>
									      <div style="height:150px;">
									      	<div style="width:80px;height:80px;border:1px;">
									      		<img class= "td_img" src="images/7.jpg"/>
								      		</div>
								      		<div style="width:80px;height:80px;border:1px;">
									      		<input type="text" value="testRate">
								      		</div>
									      </div>
								      </li>
								    </ul>
								  </div>
								  <div class="zl_right" id="Right_Photo"><a href="javascript:void(0)"><img src="images/zl_tb2.jpg" width="24" height="32" /></a></div>
								</div>
								<script type="text/javascript">
									var scrollPhoto = new ScrollPicleft();
									scrollPhoto.scrollContId   = "ISL_Photo"; // 内容容器ID""
									scrollPhoto.arrLeftId      = "Left_Photo";//左箭头ID
									scrollPhoto.arrRightId     = "Right_Photo"; //右箭头ID
									scrollPhoto.frameWidth     = 1000;//显示框宽度
									scrollPhoto.pageWidth      = 1000; //翻页宽度
									scrollPhoto.speed          = 10; //移动速度(单位毫秒，越小越快)
									scrollPhoto.space          = 10; //每次移动像素(单位px，越大越快)
									scrollPhoto.autoPlay       = false; //自动播放
									scrollPhoto.autoPlayTime   = 3; //自动播放间隔时间(秒)
									scrollPhoto.initialize(); //初始化	
								</script>
							</section>
							<script src="js/classie.js"></script>
							<script src="js/main.js"></script>
							<!-- <div id="textarea" contenteditable="true" data-text="输入内容..."></div> -->
							<form method="get" action="#">
								<textarea style="border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height: 100px;padding: 10px;resize: none;" placeholder="在此输入..."></textarea>
								<div style="text-align:right" class=NULL>
									<button type="submit" style="height:30px;text-align:center;margin:10px">提交</button>
								</div>
							</form>
							
							<footer>
								<ul class="stats">
									<li><a href="#">General</a></li>
									<li><a href="#" class="icon solid fa-heart">28</a></li>
									<li><a href="#" class="icon solid fa-comment">128</a></li>
								</ul>
							</footer>
						</article>

				</div>


		</div>
		
</body>
</html>