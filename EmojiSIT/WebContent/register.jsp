<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel='stylesheet prefetch' href="css/reset.css">
	<link rel="stylesheet" href="css/default.css" type="text/css" >
    <link rel="stylesheet" href="css/styles.css" type="text/css">
    <link rel="stylesheet" href="css/checkbox.css" type="text/css">
	<link rel="stylesheet" href="assets/css/main.css" />
<!DOCTYPE html>
<html>
<head>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>注册</title>
</head>
<body style="background-color: #c8c8c8">

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

		<!-- multistep form -->
		<form id="msform">
			<!-- progressbar -->
			<ul id="progressbar">
					<li class="active" style="color: black">账号设置</li>
					<li style="color: black">个人详细信息</li>
					<li style="color: black">爱好选择</li>
			</ul>
			<!-- fieldsets -->
			<fieldset>
				<h2 class="fs-title">创建你的账号</h2>
				<h3 class="fs-subtitle">这是第一步</h3>
				<input type="text" name="email" placeholder="Email地址" />
				<input type="password" name="pass" placeholder="密码" />
				<input type="password" name="cpass" placeholder="重复密码" />
				<input type="button" name="next" class="next action-button" value="Next" style="line-height: normal;"/>
			</fieldset>
			<fieldset>
				<h2 class="fs-title">个人详细信息</h2>
				<h3 class="fs-subtitle">个人详细信息是保密的，不会被泄露</h3>
				<input type="text" name="fname" placeholder="昵称" />
				<input type="text" name="lname" placeholder="姓名" />
				<input type="text" name="phone" placeholder="电话号码" />
				<textarea name="address" placeholder="家庭住址"></textarea>
				<input type="button" name="previous" class="previous action-button" value="Previous" style="line-height: normal;"/>
				<input type="button" name="next" class="next action-button" value="Next" style="line-height: normal;"/>
				<!-- <input type="submit" name="submit" class="submit action-button" value="Submit" /> -->
			</fieldset>
			<fieldset>
				<h2 class="fs-title" style="height: 10px;width: 260px;">爱好选择</h2>
				<h3 class="fs-subtitle" style="height: 10px;width: 260px;">选择你感兴趣的领域</h3>
				<div class="label_box" style="height: 50px;width: 266px;">
					<label>
						<input name="hobby" type="checkbox">
						<div>旅游</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>爬山</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>游泳</div>
					</label>
				</div>
				<div class="label_box" style="height: 50px;width: 266px;">
					<label>
						<input name="hobby" type="checkbox">
						<div>旅游</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>爬山</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>游泳</div>
					</label>
				</div>
				<div class="label_box" style="height: 50px;width: 266px;">
					<label>
						<input name="hobby" type="checkbox">
						<div>旅游</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>爬山</div>
					</label>
					<label>
						<input name="hobby" type="checkbox">
						<div>游泳</div>
					</label>
				</div>
				<!--
					<input type="text" name="x-weibo" placeholder="新浪微博" />
					<input type="text" name="t-weibo" placeholder="腾讯微博" />
					<input type="text" name="qq" placeholder="腾讯QQ" />
				-->
				<input type="button" name="previous" class="previous action-button" value="Previous" style="line-height: normal;"/>
				<input type="submit" name="submit" class="submit action-button" value="Submit" style="line-height: normal;"/>
			</fieldset>
		</form>

	
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/jquery.easing.min.js" type="text/javascript"></script>
	<script>
	var current_fs, next_fs, previous_fs;
	var left, opacity, scale;
	var animating;
	$('.next').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    $('#progressbar li').eq($('fieldset').index(next_fs)).addClass('active');
	    next_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 1 - (1 - now) * 0.2;
	            left = now * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'transform': 'scale(' + scale + ')' });
	            next_fs.css({
	                'left': left,
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.previous').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    previous_fs = $(this).parent().prev();
	    $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass('active');
	    previous_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 0.8 + (1 - now) * 0.2;
	            left = (1 - now) * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'left': left });
	            previous_fs.css({
	                'transform': 'scale(' + scale + ')',
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.submit').click(function () {
	    return false;
	});
	</script>
</body>
</html>
