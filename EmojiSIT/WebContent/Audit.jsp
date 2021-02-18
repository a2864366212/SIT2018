<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>审核页面（未完成）</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<link rel="stylesheet" type="text/css" href="css/fxsmall.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="js/modernizr.custom.js"></script>
    <style>
	.imgdiv{
		width: 60%;
		position: fixed;
		top: 0px;
		left: 0px;
		right: 0px;
		bottom: 0px;
		margin: auto;
	}
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

					<!-- Links -->
						<section>
							<ul class="links">
								<li>
									<a href="#">
										<h3>Lorem ipsum</h3>
										<p>Feugiat tempus veroeros dolor</p>
									</a>
								</li>
								<li>
									<a href="#">
										<h3>Dolor sit amet</h3>
										<p>Sed vitae justo condimentum</p>
									</a>
								</li>
								<li>
									<a href="#">
										<h3>Feugiat veroeros</h3>
										<p>Phasellus sed ultricies mi congue</p>
									</a>
								</li>
								<li>
									<a href="#">
										<h3>Etiam sed consequat</h3>
										<p>Porta lectus amet ultricies</p>
									</a>
								</li>
							</ul>
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
									<h2><a href="#">审核功能页面</a></h2>
									<p>审核最涩的表情包</p>
								</div>
								<div class="meta">
									<time class="published" datetime="2015-11-01">2020-12-9</time>
									<a href="#" class="author"><span class="name">Cyh</span><img src="images/0.jpg" alt="" /></a>
								</div>
							</header>
							<!-- <span class="image featured"><img src="images/pic01.jpg" alt="" /></span> -->
							<section>
							<div id="component" class="component component-small">
								<ul class="itemwrap">
									<li class="current">
										<img  class="imgdiv" src="images/15.jpg" alt="img01"/>
									</li>
									<li>
									<img class="imgdiv" src="images/17.jpg" alt="img02"/>
									</li>
									<li>
									<img class="imgdiv" src="images/21.jpg" alt="img03"/>
									</li>
									<li>
									<img class= "imgdiv" src="images/7.jpg" alt="img04"/>
									</li>
									<li>
									<img class="imgdiv" src="images/0.jpg" alt="img05"/>
									</li>
								</ul>
								<nav>
									<a class="prev" href="#">Previous item</a>
									<a class="next" href="#">Next item</a>
								</nav>
							</div>
							<form class="form-horizontal">
								<input type="button">das
							</form>
							</section>
							
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
<script src="js/classie.js"></script>
<script src="js/main.js"></script>
</html>