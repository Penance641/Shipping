<%--
  Created by IntelliJ IDEA.
  User: 19365
  Date: 2024/12/16
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>前瞻</title>
</head>
<body>
<nav class="navbar navbar - default navbar - fixed - top">
    <div class="container">
        <div class="navbar - header">
            <button type="button" class="navbar - toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon - bar"></span>
                <span class="icon - bar"></span>
                <span class="icon - bar"></span>
            </button>
            <a class="navbar - brand" href="aregister.jsp"><img src="${pageContext.request.contextPath}/image/logo.jpg">物流中心
            </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse clearfix" >
            <ul class="nav navbar-nav">
                <li><a href="#">首页</a></li>
                <li><a href="#">快递栏</a></li>
                <li><a href="#">我要寄件/收件</a></li>
                <li><a href="#">用户中心</a></li>
            </ul>
            <div id="loginGroup" class="btn-group pull-right btn-group-sm">
                <button type="button"
                        class="btn btn-default"
                        data-toggle="modal"
                        data-target="#loginModal">
                    登录
                </button>
                <button type="button"
                        class="btn btn-default"
                        data-toggle="modal"
                        data-target="#regModal">
                    注册
                </button>
            </div>
        </div>
    </div>
</nav>
</body>
</html>
