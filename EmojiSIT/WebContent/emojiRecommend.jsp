<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>推荐功能页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jqcloud-1.0.4.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="css/jqcloud.css" />
	<script src="bower_components/jqcloud2/dist/jqcloud.min.js"></script>
	<link rel="stylesheet" href="bower_components/jqcloud2/dist/jqcloud.min.css">
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<link rel="stylesheet" type="text/css" href="css/fxsmall.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- <script src="js/modernizr.custom.js"></script>  -->
	<script src="js/ScrollPicLeft.js"></script>
    <style>
    .append_div {
		background: black;color:#FFFFFF; opacity:0.5; text-align: center; position: absolute; height: 50px; width:200px; 
	}
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
	.cleanfloat::after{display: block; clear: both; content:""; visibility: hidden; height: 0;}/*清浮动*/
	.cleanfloat ul li{list-style:none; float:left; color:#ccc; cursor:pointer;width:15px;height:15px;padding:0px;}/*五角星样式*/
	.hs,.cs{color:#f00 !important ;}/*五角星点击后样式*/
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
			<li><a href="emojiUpload.jsp">上传表情</a></li>
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
								</div>
								<div class="meta">
									<time class="published"><%Date d = new Date();SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");String now = df.format(d);out.println(now);%></time>
									<a href="#" class="author"><span class="name">用户姓名-头像图片</span><img src="images/0.jpg" alt="" /></a>
								</div>
							</header>
							
							<!-- <span class="image featured"><img src="images/pic01.jpg" alt="" /></span> -->
							<section>
								<div class="dd_main">  
								  <div class="zl_left" id="Left_Photo"><a href="javascript:void(0)"><img src="images/zl_tb1.jpg" width="24" height="32" /></a></div>
								  <div class="zl_content">
								    <ul id="ISL_Photo">
								      
								    </ul>
								  </div>
								  <div class="zl_right" id="Right_Photo"><a href="javascript:void(0)"><img src="images/zl_tb2.jpg" width="24" height="32" /></a></div>
								</div>
							</section>
							
							<div class="" style="width: 100%;">
								<div id="tagCloud" style="width: 400px; margin: 0px auto; height: 400px; border: 1px solid #ccc; "></div>
							</div>
							
							<form method="get" action="#">
								<textarea id="queryTxt" style="border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height: 50px;padding: 10px;resize: none;margin:10px" placeholder="在此输入查询文本..."></textarea>
								<textarea id="queryTagList" style="border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height: 50px;padding: 10px;resize: none;margin:10px" placeholder="在此输入标签，以空格分隔"></textarea>
								<div style="text-align:right" class=NULL>
									<button type="button" onclick="queryEmoji()" style="height:30px;text-align:center;margin:10px">搜索</button>
									<!-- 
									<button type="button" onclick="tagCloudShow()" style="height:30px;text-align:center;margin:10px">标签云刷新</button>
									-->
								</div>
							</form>
							
							
						</article>
				</div>
		</div>
</body>

<script src="js/classie.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	//获取图片  发送查询的query文本
	var maxEmojiNum=5;//列表最大图片数目
    var emojiHolder=new Array();
    var captionHolder=new Array();
    var tagHolder=new Array();
    var basePath='/img';//图片的虚拟映射根目录
    
    function initEmojiHolder(){
    	for(var i=0;i<maxEmojiNum;i++){
    		emojiHolder.push("1b4d9cfb-5ac1-462e-b7e1-8295814ed703.jpg");
    	}
    }

	function showEmoji(){
		$('#ISL_Photo').children().remove();
		for(var i=0;i<maxEmojiNum;i++){
			var imgEmoji=basePath+"/"+emojiHolder[i];
			var emojiHtml=
				'<li style="margin:20px;"><div style="height:180px;width:180px;align-items:center; display: -webkit-flex;justify-content:center">'
					+'<div style="width:130px;height:130px;border:1px;">'
						+'<img class= "td_img" src="'+imgEmoji+'"/>'
					+'</div>'
					+'<div style="width:20px;"><div>👍</div><div>👎</div></div>'
					+'</div></li>';
			$('#ISL_Photo').append(emojiHtml);
		}
	}
	initEmojiHolder();
	showEmoji();
	
	function queryEmoji(){
		var queryTxt=$('#queryTxt').val();
		var queryTagList=$('#queryTagList').val();
		$.ajax({
	        type: 'post',
	        data:{"maxEmojiNum":maxEmojiNum,"btn":"queryBtn","queryTxt":queryTxt,"queryTagList":queryTagList},
	        dataType:"json",
	        url:"EmojiRecommend",
	        async:false,
	        beforeSend: function(){
	        	
	            
	        },
	        success: function(data) {
	        	var jsonObj =data;//= eval('(' + data + ')');
	        	var emojiNum=jsonObj.emojiNum;
	        	
	        	emojiHolder.splice(0,emojiHolder.length);//清空缓存数组
	        	captionHolder.splice(0,captionHolder.length);
	        	tagHolder.splice(0,tagHolder.length);
	        	
	        	for(var i=0;i<emojiNum;i++){
	        		emojiHolder.push(jsonObj['emoji-'+i]);
	        		captionHolder.push(jsonObj['caption-'+i]);
	        		tagHolder.push(jsonObj['tag-'+i]);
	        	}
	        	
	        	showEmoji();
	        },
	        error: function(err) {
	            
	        }
	    });
	}
</script>
<script>
	function userBehavior(){
		$.ajax({
	        type: "post",
	        dataType: "json",
	        url: "EmojiRecommend",
	        data:{"userBehavior":"{\"uid\":\"user_id\",\"eid\":\"emoji_id\",\"type\":\"click\",\"timestamp\":\"2021-03-02\"}"},
	        success: function () {
	        	alert("前端埋点数据发送成功");
	        },
	        error:function(){
	        	alert("前端埋点数据发送失败");
	        	}
	     });
	}
    $(function () {
        $(".cleanfloat ul li").hover(function(){
            $(this).addClass('hs');
            $(this).prevAll().addClass('hs');
        },function(){
            $(this).removeClass('hs');
            $(this).prevAll().removeClass('hs');
        })

        $(".cleanfloat ul li").click(function () {
            $(this).addClass('cs');
            $(this).prevAll().addClass('cs');
            $(this).nextAll().removeClass('cs');
        })
    })
</script>
<script type="text/javascript">
	//标签云
	var tagFreqList =new Array();
	
	function on_mouseover(e, ev) {
		var txt = $(e).html();
		ev = ev || event;
		$.each(tagFreqList, function(i, item) {
			if(txt == item[0]){
				var html = item[0]+"<br />曝光数"+item[1]+"<br />"+item[2];
				$("#tagCloud").after("<div class='append_div' style='left:" + ev.clientX + "px; top:" + ev.clientY + "px; '>" + html + "</div>");
				return;
			}
			
		});
	}
	
	function renewTagCloudData(){
		$.ajax({
	        type: "post",
	        dataType: "json",
	        url: "EmojiRecommend",
	        data:{"renewTagCloudData":1},
	        async:false,
	        success: function(data) {
	        	var jsonObj =data;
	        	var etagNum=jsonObj.etagNum;
	        	tagFreqList.splice(0,tagFreqList.length);
	        	
	        	for(var i=0;i<etagNum;i++){
	        		var tag=jsonObj['etag-'+i];
	        		var freq=parseInt(jsonObj['freq-'+i]);
	        		tagFreqList.push([tag,freq]);
	        	}
	        },
	        error:function(){
	        	alert("更新标签云数据失败");
	        	}
	     });
		
	}
	
	function tagCloudShow() {
		renewTagCloudData();//更新标签云数据
		//alert(tagFreqList);
		
		var string_ = "";
		for (var i = 0; i < tagFreqList.length; i++) {
			var string_f = tagFreqList[i][0];
			var string_n = tagFreqList[i][1];
			string_ += "{text: '" + string_f + "', weight: '" + string_n + "',html: {'class': 'span_list'}},";
			//string_ += "{text: '" + string_f + "', weight: '" + string_n + "',html: {'class': 'span_list',onmouseover:'on_mouseover(this,event)',onmouseout:'on_mouseout()'}},";
		}
		//alert(string_);
		
		var string_list = string_;
		var word_list = eval("[" + string_list + "]");
		$("#tagCloud").jQCloud(word_list,{
	        removeOverflowing: true,
	        height: 200,
	        width : 400
	    });
	}
	
	tagCloudShow();//页面加载时显示标签云

	function on_mouseout() {
		$(".append_div").remove();
	}
</script>
</html>