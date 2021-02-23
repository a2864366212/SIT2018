<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <link rel='stylesheet prefetch' href="css/reset.css">
	<link rel="stylesheet" href="css/default.css" type="text/css" >
    <link rel="stylesheet" href="css/styles.css" type="text/css">
    <link rel="stylesheet" href="css/checkbox.css" type="text/css">
	<link rel="stylesheet" href="assets/css/main.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>表情上传</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
 
</head>
<style>
    .drag-wrapper{width:600px;  height: 300px;  border: 4px dashed lightblue;   position: relative;  overflow: auto; background: #fff; }
    .drag-wrapper .placelabel{color: lightgrey;text-align: center;position:absolute;top:50%;left:50%;transform: translate(-50%,-50%);color: #b9b7b7;font-size: 16px;}
    #pictureul{list-style: none;display: flex; flex-flow: wrap;padding: 0;margin: 0;}
    #pictureul li{float:left;width:48%;height:140px;margin-left: 1%; margin-top: 5px;position: relative;overflow: hidden; border: 3px solid #eee;box-sizing: border-box;border-radius: 5px;
        background: linear-gradient(145deg, #e6e6e6, #ffffff); box-shadow: 7px 7px 30px #bdbdbd, -7px -7px 30px #ffffff;text-align: center}
    #pictureul li:hover{opacity: .8}
    #pictureul li:hover .delpic{top:7px;}
    #pictureul li p{width: 80%;margin: 10px auto;white-space: normal;overflow: hidden;text-overflow: ellipsis;color:#5f5f5f;font-size:14px;}
    .delpic{position: absolute;top:-30px;width:20px;height:20px;border-radius: 50%;transition:all .5s;background: #0000008c;  display: flex;  justify-content: center;  align-items: center;  font-size: 16px; color:#fff;line-height: 20px; right: 10px;  cursor: pointer;}
    #pictureul li img{
		max-width: 90%;
		max-height: 80%;
	}
    .uploadbtns{padding:5px;background: #117dd1;color:#fff;cursor: pointer;width:70px;text-align: center;border-radius: 2px;font-size: 12px;}
    .uploadbtns:hover{opacity: .8}
    .clearDiv{clear:both;} /* 清除空白盒子的所有浮动 */
</style>
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
									<h2>表情包上传页面</h2>
								</div>
							</header>
							
							<!-- <span class="image featured"><img src="images/pic01.jpg" alt="" /></span> -->
							<section>
								<div style="display:flex;justify-content:center;align-items:center;">
								    <div class="drag-wrapper" id="uploadimg" style="float:left;">
								        <span class="placelabel">拖动或粘贴至此处上传(最多同时上传四张)</span>
								        <ul id="pictureul">
								 
								        </ul>
								    </div> 
							    </div>
							    <!-- <div id="textarea" contenteditable="true" data-text="输入内容..."></div> -->
								<div id="EmojiCaptionTagList">
								</div>
								<div class="clearDiv"></div>
								<div style="text-align:right;display:flex;justify-content:center;align-items:center;" >
										<div class="uploadbtns" onclick="uploadFiles()" style="float:left;margin-top: 10px;">开始上传</div>
										<div class="clearDiv"></div>
										
								</div>
							</section>
							<script src="js/classie.js"></script>
							<script src="js/main.js"></script>
							
						</article>
				</div>
		</div>
</body>
<script>
    var filearr = [];//所有图片文件汇总
    var maxUploadNum=4;//最大上传图片数目
    function addEmojiCaptionTag(){
    	var EmojiLabel="表情"+($('#pictureul').children().length+1)+': ';
    	var EmojiCaptionTagHtml=
    		
    	 '<div style="text-align:right;display:flex;justify-content:center;align-items:center;" name="EmojiCaptionTag">'
    	+'<div style="float:left;margin-top: 10px;margin-right: 10px;" name="EmojiLabel">'+EmojiLabel+'</div>'
    	+'<textarea name="caption" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="文字内容"></textarea>'
    	+'<textarea name="tag" style="float:left;margin-top: 10px;margin-right: 10px;border:0;border-radius:5px;background-color:rgba(241,241,241,.98);height:40px;width: 35%;padding: 10px;resize: none;" placeholder="属性描述"></textarea>'
    	+'<div class="clearDiv"></div>'
    	+'</div>';
    	$("#EmojiCaptionTagList").append(EmojiCaptionTagHtml);
   	}
    //监听拖拽
    $('.drag-wrapper').on('dragover',function(event){
        event.preventDefault();//防止浏览器冒泡，直接打开文件
    }).on('drop',function(event){
        event.preventDefault();
        //数据在event的dataTransfer对象里 
        for(var i = 0; i < event.originalEvent.dataTransfer.files.length; i++){
            var file = event.originalEvent.dataTransfer.files[i];
            //用fileReader实现图片上传
            var fd = new FileReader();
            var fivarype = file.type;//文件类型
            var suff = file.name.substring(file.name.lastIndexOf(".")+1);//后缀名
            fd.readAsDataURL(file);
            if(/^image\/[jpeg|png|gif|jpg]/.test(fivarype)){//判断上传文件的类型
                filearr.push(file);
                (function(e) {
                    fd.onload = function(){//FileReader().onload,在加载完后将会执行次事件
                        //返回的result是base64
                        //动态的绑定移除操作
                        if($('#pictureul').children().length>=maxUploadNum){
                        	//已经达到最大上传数目
                        	//alert("最多同时上传"+maxUploadNum+"张图片");
                        	return ;
                        }
                        var idx=($('#pictureul').children().length+1);
                        var EmojiName="表情"+idx;
                        addEmojiCaptionTag();
                        var html ='<li>'
                        +'<div style="width:100%;height:100%" align="center"><div name="EmojiName">'+EmojiName+'</div><img src="'+this.result+'"/></div><div title="移除" onclick="delpicthis(\''+e+'\',this)" class="delpic">×</div></li>';
                        $("#pictureul").append(html);
                        
                    }
                })(file.name);
                
            }else{
                alert('仅支持拖拽图片')
            }
        }
        
    })
 
    //监听粘贴，仅支持截图后粘贴
    $("#uploadimg").on('paste', function(eventObj) {
        // 处理粘贴事件
        var event = eventObj.originalEvent;
        var imageRe = new RegExp(/image\/.*/);
        var fileList = $.map(event.clipboardData.items, function (o) {
            if(!imageRe.test(o.type)){ return }
            var blob = o.getAsFile();
            return blob;
        });
        if(fileList.length <= 0){
            return
        }else{
            for(var i = 0; i < fileList.length; i++){
                var file = fileList[i];
                //用fileReader实现图片上传
                var fd = new FileReader();
                var fivarype = file.type;//文件类型
                var suff = file.name.substring(file.name.lastIndexOf(".")+1);//后缀名
                fd.readAsDataURL(file);
                if(/^image\/[jpeg|png|gif|jpg]/.test(fivarype)){//判断上传文件的类型
                    filearr.push(file);
                    (function(e) {
                        fd.onload = function(){//FileReader().onload,在加载完后将会执行次事件
                            //返回的result是base64
                            //动态的绑定移除操作
                            if($('#pictureul').children().length>=maxUploadNum){
                            	//已经达到最大上传数目
                            	//alert("最多同时上传"+maxUploadNum+"张图片");
                            	return ;
                            }
                            var idx=($('#pictureul').children().length+1);
                            var EmojiName="表情"+idx;
                            addEmojiCaptionTag();
                            var html ='<li>'
                            +'<div style="width:100%;height:100%" align="center"><div name="EmojiName">'+EmojiName+'</div><img src="'+this.result+'"/></div><div title="移除" onclick="delpicthis(\''+e+'\',this)" class="delpic">×</div></li>';
                            $("#pictureul").append(html);
                            
                        }
                    })(file.name);
 
                }else{
                    alert('仅支持粘贴图片')
                }
            }
        }
        //upload(fileList);
        //阻止默认行为即不让剪贴板内容在div中显示出来
        event.preventDefault();
    });
 
    //移除
    function delpicthis(name,that){
    	var EmojiIdx=($(that).parent().find('div[name=EmojiName]')).html();
    	EmojiIdx = parseInt(EmojiIdx.replace(/[^0-9]/ig,""));
    	var EmojiCaptionTagList=document.getElementById("EmojiCaptionTagList");//删除idx对应EmojiCaptionTag
    	EmojiCaptionTagList.removeChild(EmojiCaptionTagList.childNodes[EmojiIdx-1]);
        $(that).parent().remove();//上传的图片预览ul
        filearr.splice(EmojiIdx-1,1);//上传的图片数组
        var EmojiList=$('div[name=EmojiName]');
        var EmojiLabelList=$('div[name=EmojiLabel]');
        
        len=EmojiList.length;
  		
        for(var i = 0 ; i < len; i++ ){
        	EmojiList[i].innerHTML="表情"+(i+1);
        	EmojiLabelList[i].innerHTML="表情"+(i+1)+': ';
        }
        
    }
    function clean(){
    	$("#EmojiCaptionTagList").empty();//页面元素清除、
    	$("#pictureul").empty();
    	filearr.splice(0,filearr.length);//清空数据
    }
 	function getEmojiCaption(){
 		var captionArr={};//创建一个空对象
 		$('textarea[name=caption]').each(function(index,element){	//index下标 element 当前选中的元素
 			captionArr[index] = $(this).val();//压入对象数组
 		});
 		return captionArr;
 	}
 	function getEmojiTag(){
 		var tagArr={};//创建一个空对象
 		$('textarea[name=tag]').each(function(index,element){	//index下标 element 当前选中的元素
 			tagArr[index] = $(this).val();//压入对象数组
 		});
 		return tagArr;
 	}
    //上传照片
    var uploading = false;//是否处于上传中
    function uploadFiles(){
        if(uploading){
            return;
        }
        if(filearr.length == 0){
            return;
            alert("请先添加上传文件！");
        }
        var captionArr=getEmojiCaption();
        var tagArr=getEmojiTag();
        var form = new FormData();
        form.append("emojiNum",filearr.length);
        for(var c in filearr){
            form.append("emoji-"+c, filearr[c]);
            form.append("caption-"+c, captionArr[c]);
            form.append("tag-"+c, tagArr[c]);
        }
        $.ajax({
            type: 'post',
            data:form,
            url:"EmojiUpload",
            processData: false,
            contentType: false,
            beforeSend: function(){
                uploading = true;    //防止点多次
                console.log("上传中...");;
            },
            success: function(data) {
            	clean();//重置页面
            	var jsonObj = eval('(' + data + ')');
                uploading = false;
                
                if(jsonObj.emojiNum>0){
                	alert("上传成功，数量:"+jsonObj.emojiNum);
                }else{
                    alert("上传异常，失败:"+jsonObj.emojiNum);
                }
            },
            error: function(err) {
                uploading = false;
                clean();//重置页面
                
                console.error("上传异常，error:"+err);
                console.log(err);
            }
        });
    }
</script>
</html>