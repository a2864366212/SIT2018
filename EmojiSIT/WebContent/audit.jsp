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
	<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
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
								<ul class="itemwrap" id="emojiList">
									
								</ul>
								<nav>  
									<a class="next" href="#" onclick="renewEmoji()">Next item</a>
									<input hidden id="animatingAttr" value="init"/>
								</nav>
							</div>
							<div id="EmojiCaptionTagList">
								
								<div style="text-align:left;display:flex;justify-content:center;align-items:center;" name="EmojiCaptionTag">
									<div style="float:left;margin-top: 10px;margin-right: 10px;" id="currentCapTag">当前：</div>
									<div name="rawCaption" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;">文字内容</div>
									<div name="rawTag" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;">属性描述</div>
									<div class="clearDiv"></div>
								</div>
								
								<div style="text-align:right;display:flex;justify-content:center;align-items:center;" name="EmojiCaptionTag">
									<div style="float:left;margin-top: 10px;margin-right: 10px;" id="modifiedCapTag">订正：</div>
									<textarea name="caption" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="文字内容"></textarea>
									<textarea name="tag" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="属性描述"></textarea>
									<div class="clearDiv"></div>
								</div>		
							</div>
						
							<div style="text-align:right;display:flex;justify-content:center;align-items:center;" >
									<form class="form-horizontal">
										<button type="button" onclick="modifyEmoji()" style="float:left;height:30px;text-align:center;margin:10px">确认修改</button>
										<button onclick="deleteEmoji()"type="button" onclick="" style="float:left;height:30px;text-align:center;margin:10px" >删除图片</button>
									</form>
									<div class="clearDiv"></div>
							</div>
							</section>
							
						</article>

				</div>
			
		</div>
		
</body>
<script src="js/classie.js"></script>
<script>
var isAnimating = false;
function mainjs(){
	var support = { animations : Modernizr.cssanimations },
		animEndEventNames = {
			'WebkitAnimation' : 'webkitAnimationEnd',
			'OAnimation' : 'oAnimationEnd',
			'msAnimation' : 'MSAnimationEnd',
			'animation' : 'animationend'
		},
		// animation end event name
		animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
		//effectSel = document.getElementById( 'fxselect' ),
		component = document.getElementById( 'component' );
		items = component.querySelector( 'ul.itemwrap' ).children,
		current = 0,
		itemsCount = items.length,
		nav = component.querySelector( 'nav' ),
		navNext = nav.querySelector( '.next' ),
		navPrev = nav.querySelector( '.prev' );
		//isAnimating = false;

	function init() {
		hideNav();
		changeEffect();
		navNext.addEventListener( 'click', function( ev ) { 
			ev.preventDefault(); 
			navigate( 'next' ); 
			
			} );
		///navPrev.addEventListener( 'click', function( ev ) { ev.preventDefault(); navigate( 'prev' ); } );
		//effectSel.addEventListener( 'change', changeEffect );
	}

	function hideNav() {
		nav.style.display = 'none';
	}

	function showNav() {
		nav.style.display = 'block';
	}

	function changeEffect() {
		/*component.className = component.className.replace(/\bfx.*?\b/g, '');
		if( effectSel.selectedIndex ) {
			classie.addClass( component, effectSel.options[ effectSel.selectedIndex ].value );
			showNav();
		}
		else {
			hideNav();
		}*/
		classie.addClass(component,'fxCoverflow');
		showNav();
	}

	function navigate( dir ) {
		//if( isAnimating || !effectSel.selectedIndex ) return false;
		if( isAnimating ) return false;
		isAnimating = true;
		var cntAnims = 0;


		var currentItem = items[ current ];

		if( dir === 'next' ) {
			current = current < itemsCount - 1 ? current + 1 : 0;
		}
		else if( dir === 'prev' ) {
			current = current > 0 ? current - 1 : itemsCount - 1;
		}

		var nextItem = items[ current ];

		var onEndAnimationCurrentItem = function() {
			this.removeEventListener( animEndEventName, onEndAnimationCurrentItem );
			classie.removeClass( this, 'current' );
			classie.removeClass( this, dir === 'next' ? 'navOutNext' : 'navOutPrev' );
			++cntAnims;
			if( cntAnims === 2 ) {
				isAnimating = false;
			}
		}

		var onEndAnimationNextItem = function() {
			this.removeEventListener( animEndEventName, onEndAnimationNextItem );
			classie.addClass( this, 'current' );
			classie.removeClass( this, dir === 'next' ? 'navInNext' : 'navInPrev' );
			++cntAnims;
			if( cntAnims === 2 ) {
				isAnimating = false;
			}
		}

		if( support.animations ) {
			currentItem.addEventListener( animEndEventName, onEndAnimationCurrentItem );
			nextItem.addEventListener( animEndEventName, onEndAnimationNextItem );
		}
		else {
			onEndAnimationCurrentItem();
			onEndAnimationNextItem();
		}

		classie.addClass( currentItem, dir === 'next' ? 'navOutNext' : 'navOutPrev' );
		classie.addClass( nextItem, dir === 'next' ? 'navInNext' : 'navInPrev' );
		
		
	}

	init();
}
</script>


<script>
var maxEmojiNum=4;//最大缓存图片数
var emojiIdx=0;//显示图片的游标
var emojiHolder=[];//显示的图片缓存
var captionHolder=[];//caption缓存
var tagHolder=[];//tag缓存
var captionArr=[];//caption数组
var tagArr=[];//tag数组
var basePath='/img';//图片的虚拟映射根目录

function getEmojiHolder(asyncAttr){
	$.ajax({
        type: 'post',
        data:{"maxEmojiNum":maxEmojiNum,"btn":"getHolder"},
        dataType:"json",
        url:"EmojiAudit",
        async:asyncAttr,
        beforeSend: function(){
            
        },
        success: function(data) {
        	var jsonObj =data;//= eval('(' + data + ')');
        	var emojiNum=jsonObj.emojiNum;
        	emojiHolder.splice(0,emojiHolder.length);//清空缓存数组
        	captionHolder.splice(0,captionHolder.length);
        	tagHolder.splice(0,tagHolder.length);
        	for(var i=0;i<emojiNum;i++){
        		emojiHolder[i]=jsonObj['emoji-'+i];
        		captionHolder[i]=jsonObj['caption-'+i];
        		tagHolder[i]=jsonObj['tag-'+i];
        	}
        },
        error: function(err) {
            
        }
    });
}

function initEmoji(){
	getEmojiHolder(false);//初始化缓存,锁住浏览器
	$('#emojiList').empty();
	var num=emojiHolder.length;
	captionArr=captionHolder.concat();//从缓存中拷贝出来
	tagArr=tagHolder.concat();
	for(var i=0;i<num;i++){
		var imgEmoji=basePath+"/"+emojiHolder[i];
		if(i==0){
			
			$('#emojiList').append('<li class="current"><img  class="imgdiv" src="'+imgEmoji+'" name="emojiImg"/></li>');
		}else{
			$('#emojiList').append('<li><img  class="imgdiv" src="'+imgEmoji+'" name="emojiImg"/></li>');
		}
		if(i==num-1){
			mainjs();
			$("div[name=rawCaption]").html(captionArr[0]);
			$("div[name=rawTag]").html(tagArr[0]);
			$("textarea[name=caption]").html(captionArr[0]);
			$("textarea[name=tag]").html(tagArr[0]);
		}
	}
}
$('#emojiList').ready(function(){//在emojiList元素加载时执行
	initEmoji();
	//alert("初始化完成");
});
function renewEmoji(){
	if(isAnimating)return ;
	emojiIdx=emojiIdx+1;
	if(emojiIdx%maxEmojiNum==0){
		//刷新显示的图片  加载缓存
		var num=emojiHolder.length;
		$("img[name=emojiImg]").each(function(index,element){
			var imgEmoji=basePath+"/"+emojiHolder[index];
			$(this).attr("src",imgEmoji)
		 });
		captionArr=captionHolder.concat();//加载缓存
		tagArr=tagHolder.concat();
		emojiIdx=0;
	}
	if(emojiIdx==parseInt(maxEmojiNum/2)){
		//刷新Holder 缓存
		getEmojiHolder(true);
	}
	$("div[name=rawCaption]").html(captionArr[emojiIdx]);
	$("div[name=rawTag]").html(tagArr[emojiIdx]);
	$("textarea[name=caption]").html(captionArr[emojiIdx]);
	$("textarea[name=tag]").html(tagArr[emojiIdx]);
	
	
}
function modifyEmoji(){//订正图片的文本描述
	var emoji=$('li.current').children('img.imgdiv').attr("src");
	var emojiUuid=emoji.substring(emoji.lastIndexOf('/')+1,emoji.lastIndexOf('.'));
	var caption=$('textarea[name=caption]').val();
	var tag=$('textarea[name=tag]').val();
	$.ajax({
        type: 'post',
        data:{"emojiUuid":emojiUuid,"caption":caption,"tag":tag,"btn":"modify"},
        dataType:"json",
        url:"EmojiAudit",
        async:false,
        success: function(data) {
        	var jsonObj =data;//= eval('(' + data + ')');
        	alert(jsonObj['result-info']);a
        },
        error: function(err) {
            
        }
    });
}
function deleteEmoji(){
	var emoji=$('li.current').children('img.imgdiv').attr("src");
	var emojiUuid=emoji.substring(emoji.lastIndexOf('/')+1,emoji.lastIndexOf('.'));
	$.ajax({
        type: 'post',
        data:{"emojiUuid":emojiUuid,"btn":"delete"},
        dataType:"json",
        url:"EmojiAudit",
        async:false,
        success: function(data) {
        	var jsonObj =data;//= eval('(' + data + ')');
        	alert(jsonObj['result-info']);
        },
        error: function(err) {
            
        }
    });
}
function addEmojiCaptionTag(){
	var EmojiCaptionTagHtml=
		
	 '<div style="text-align:right;display:flex;justify-content:center;align-items:center;" name="EmojiCaptionTag">'
	//+'<div style="float:left;margin-top: 10px;margin-right: 10px;" name="EmojiLabel">'+EmojiLabel+'</div>'
	+'<textarea name="caption" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="文字内容"></textarea>'
	+'<textarea name="tag" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="属性描述"></textarea>'
	+'<div class="clearDiv"></div>'
	+'</div>';
	$("#EmojiCaptionTagList").append(EmojiCaptionTagHtml);
	}
</script>
</html>