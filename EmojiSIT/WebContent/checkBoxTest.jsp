<%--
  Created by IntelliJ IDEA.
  User: liku
  Date: 2020/12/8
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
</head>
<body>
<style>
    .ul_box {
        margin:0 auto;
        padding:0;
        list-style:none;
        width:600px;
    }
    .ul_box>li {
        padding:10px 10px 0 10px;
        overflow:hidden;
        border-bottom:#e5e5e5 solid 1px;
    }
    .ul_box>li:last-child {
        border-bottom:none;
    }
    .ul_box>li>div {
        float:left;
    }
    .ul_box>li>div:nth-child(1) {
        width:100px;
    }
    .ul_box>li>div:nth-child(2) {
        width:480px;
        overflow:hidden;
    }
    .label_box>label {
        display:block;
        float:left;
        margin:0 10px 10px 0;
        position:relative;
        overflow:hidden;
    }
    .label_box>label>input {
        position:absolute;
        top:0;
        left:-20px;
    }
    .label_box>label>div {
        width:100px;
        text-align:center;
        border:#dddddd solid 1px;
        height:40px;
        line-height:40px;
        color:#666666;
        user-select:none;
        overflow:hidden;
        position:relative;
    }
    .label_box>label>input:checked + div {
        border:#d51917 solid 1px;
        color:#d51917;
    }
    .label_box>label>input:checked + div:after {
        content:'';
        display:block;
        width:20px;
        height:20px;
        background-color:#d51917;
        transform:skewY(-45deg);
        position:absolute;
        bottom:-10px;
        right:0;
        z-index:1;
    }
    .label_box>label>input:checked + div:before {
        content:'';
        display:block;
        width:3px;
        height:8px;
        border-right:#ffffff solid 2px;
        border-bottom:#ffffff solid 2px;
        transform:rotate(35deg);
        position:absolute;
        bottom:2px;
        right:4px;
        z-index:2;
    }

</style>
<h1 style="text-align: center;">纯CSS美化单选/复选框</h1>
<div class="label_box" style="height: 50px;width: 350px;">
    <label>
        <input type="checkbox" name="hobby">
        <div>旅游</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>爬山</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>游泳</div>
    </label>
</div>
<div class="label_box" style="height: 50px;width: 350px;">
    <label>
        <input type="checkbox" name="hobby">
        <div>旅游</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>爬山</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>游泳</div>
    </label>
</div>
<div class="label_box" style="height: 50px;width: 350px;">
    <label>
        <input type="checkbox" name="hobby">
        <div>旅游</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>爬山</div>
    </label>
    <label>
        <input type="checkbox" name="hobby">
        <div>游泳</div>
    </label>
</div>
<h5 style="text-align: center;">helang.love@qq.com</h5>
</body>
</html>