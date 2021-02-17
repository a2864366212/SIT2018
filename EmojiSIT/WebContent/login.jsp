<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel='stylesheet prefetch' href="css/reset.css">
<link rel="stylesheet" href="css/default.css" type="text/css" >
<link rel="stylesheet" href="css/styles.css" type="text/css">
<link rel="stylesheet" href="css/checkbox.css" type="text/css">
<link rel="stylesheet" href="assets/css/main.css" />
<!DOCTYPE html>
<html>
<head>
  <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <title>表情包推荐系统登录页面title</title>
</head>
<body style="background-color: #c8c8c8">
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
<div class="htmleaf-container">
  <div class="demo form-bg">
    <div class="container">
      <div class="row">
        <div class="col-md-offset-3 col-md-6">
          <form class="form-horizontal">
            <span class="heading">用户登录</span>
            <div class="form-group">
              <input type="email" class="form-control" id="email" placeholder="电子邮件">
              <i class="fa fa-user"></i>
            </div>
            <div class="form-group help">
              <input type="password" class="form-control" id="pass" placeholder="密码">
              <i class="fa fa-lock"></i>
              <a href="#" class="fa fa-question-circle"></a>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-default" onclick="loginBtnClick();" style="height: 40px">立刻登录</button>
            </div>
            <div style="height: 40px;line-height: 40px; text-align:center;">
              <a href="register.jsp">立即注册</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-2.1.1.min.js"></script>

<script type="text/javascript">
function loginBtnClick(){
	var email=$("input[id=email]").val();
	var pass=$("input[id=pass]").val();
	//邮箱格式验证
	var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
	if(!reg.test(email)){
		alert("邮箱格式不正确");
		return false;
	}	
	$.ajax({
        type: "post",
        dataType: "json",
        url: "Login",
        async:false,
        data:{"email":email,"pass":pass},
        success: function (data) {
        	var jsonObj = eval(data);
        	ajaxRes=jsonObj.result;
        	alert(jsonObj.loginInfo);
    		if(ajaxRes){
    			window.location.href="emojiRecommend.jsp";
    		}
        },
        error:function(){
        	alert("获取用户信息失败，请联系管理员！");
        	}
     });
	
}
</script>


<style>
  .form-bg{
    padding: 2em 0;
  }
  .form-horizontal{
    background: #fff;
    padding-bottom: 40px;
    border-radius: 15px;
    text-align: center;
  }
  .form-horizontal .heading{
    display: block;
    font-size: 35px;
    font-weight: 700;
    padding: 35px 0;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 30px;
  }
  .form-horizontal .form-group{
    padding: 0 40px;
    margin: 0 0 25px 0;
    position: relative;
  }
  .form-horizontal .form-control{
    background: #f0f0f0;
    border: none;
    border-radius: 20px;
    box-shadow: none;
    padding: 0 20px 0 45px;
    height: 40px;
    transition: all 0.3s ease 0s;
  }
  .form-horizontal .form-control:focus{
    background: #e0e0e0;
    box-shadow: none;
    outline: 0 none;
  }
  .form-horizontal .form-group i{
    position: absolute;
    top: 12px;
    left: 60px;
    font-size: 17px;
    color: #c8c8c8;
    transition : all 0.5s ease 0s;
  }
  .form-horizontal .form-control:focus + i{
    color: #00b4ef;
  }
  .form-horizontal .fa-question-circle{
    display: inline-block;
    position: absolute;
    top: 12px;
    right: 60px;
    font-size: 20px;
    color: #808080;
    transition: all 0.5s ease 0s;
  }
  .form-horizontal .fa-question-circle:hover{
    color: #000;
  }
  .form-horizontal .main-checkbox{
    float: left;
    width: 20px;
    height: 20px;
    background: #11a3fc;
    border-radius: 50%;
    position: relative;
    margin: 5px 0 0 5px;
    border: 1px solid #11a3fc;
  }
  .form-horizontal .main-checkbox label{
    width: 20px;
    height: 20px;
    position: absolute;
    top: 0;
    left: 0;
    cursor: pointer;
  }
  .form-horizontal .main-checkbox label:after{
    content: "";
    width: 10px;
    height: 5px;
    position: absolute;
    top: 5px;
    left: 4px;
    border: 3px solid #fff;
    border-top: none;
    border-right: none;
    background: transparent;
    opacity: 0;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
  }
  .form-horizontal .main-checkbox input[type=checkbox]{
    visibility: hidden;
  }
  .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
    opacity: 1;
  }
  .form-horizontal .text{
    float: left;
    margin-left: 7px;
    line-height: 20px;
    padding-top: 5px;
    text-transform: capitalize;
  }
  .form-horizontal .btn{
    float: right;
    font-size: 14px;
    color: #fff;
    background: #00b4ef;
    border-radius: 30px;
    padding: 10px 25px;
    border: none;
    text-transform: capitalize;
    transition: all 0.5s ease 0s;
  }
  @media only screen and (max-width: 479px){
    .form-horizontal .form-group{
      padding: 0 25px;
    }
    .form-horizontal .form-group i{
      left: 45px;
    }
    .form-horizontal .btn{
      padding: 10px 20px;
    }
  }
  .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
  }
</style>
</body>
</html>
