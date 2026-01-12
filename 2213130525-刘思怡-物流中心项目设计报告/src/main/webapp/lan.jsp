<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="style.css" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>物流中心页面</title>
    <!-- 添加页面基础样式 -->
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        .navbar.navbar-fixed-top {
            background-color: #333;
            color: white;
            padding: 10px;
            position: relative;
            z-index: 1;
        }


        .page-wrapper {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('image/backgroud.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            z-index: -1;
        }
    </style>
</head>

<body>

<div class="page-wrapper"></div>
<nav class="navbar navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">
                <img src="${pageContext.request.contextPath}/image/logo.jpg" class="logo-img" style="width: 30%;height: auto" alt="物流中心">
                物流中心
            </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">首页</a></li>
                <li><a href="notice.jsp">通知</a></li>
                <li><a href="post.jsp">快递</a></li>
                <li><a href="usercenter.jsp">用户中心</a></li>
            </ul>
            <div id="loginGroup" class="btn-group pull-right btn-group-sm">
                <button type="button" class="btn btn-default login-btn" id="loginButton" data-toggle="modal"
                        data-target="#login">
                    <a href="login.jsp" style="color: inherit;text-decoration: none;">登录</a>
                </button>
                <button type="button" class="btn btn-default reg-btn" id="regButton" data-toggle="modal"
                        data-target="#aregister">
                    <a href="aregister.jsp" style="color: inherit;text-decoration: none;">注册</a>
                </button>
            </div>
        </div>
    </div>
</nav>

<script>
    window.onload = function () {

        var username = '<%= session.getAttribute("username")!= null? session.getAttribute("username") : ""%>';
        if (username!== "") {

            var loginGroup = document.getElementById('loginGroup');
            loginGroup.style.display = 'none';


            var userInfoDiv = document.createElement('div');
            userInfoDiv.className = 'user-info';
            userInfoDiv.innerHTML = '<span>欢迎, ' + username + '</span>';
            var navbar = document.querySelector('.navbar');
            navbar.insertBefore(userInfoDiv, loginGroup);
        }
    };

    function logout() {
        fetch('<%=request.getContextPath()%>/logout', {
            method: 'POST'
        })
            .then(response => {
                if (response.ok) {
                    // 注销成功后，刷新页面以恢复初始状态（显示登录和注册按钮等）
                    window.location.reload();
                } else {
                    alert('注销出现问题，请稍后重试');
                }
            })
            .catch(error => {
                console.error('注销请求出错:', error);
                alert('注销请求出现网络错误，请稍后重试');
            });
    }
</script>
</body>

</html>