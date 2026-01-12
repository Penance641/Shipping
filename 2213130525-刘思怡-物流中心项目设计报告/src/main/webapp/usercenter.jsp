<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户中心</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .user-info {
            background-color: #a1d2a7;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
        }

        .password-change-section {
            padding: 20px;
        }

        button {
            background-color: #007bff;
            color: #191919;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 用户信息展示区域 -->
<%@ include file="lan.jsp" %>
<div class="user-info" style="padding-top: 30px">
    <span id="usernameSpan"></span>，欢迎来到用户中心！
</div><fieldset>
    <legend>用户信息</legend>
<h1>用户信息</h1>
<p>用户ID：test</p>
<p>用户姓名：000049</p>
<!-- 密码修改区域 -->
<div class="password-change-section">
    <input type="password" id="oldPasswordInput" placeholder="请输入旧密码">
    <input type="password" id="newPasswordInput" placeholder="请输入新密码">
    <button id="changePasswordButton">修改密码</button>
</div>
</fieldset>
<script>
    // 页面加载时，检查用户是否登录
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/checkLogin",
            success: function (response) {
                if (response === 1) {  // 表示已登录
                    // 从会话中获取用户名
                    var username = '<%=session.getAttribute("username")%>';
                    $("#usernameSpan").text(username);

                    $("#changePasswordButton").click(function () {
                        var oldPassword = $("#oldPasswordInput").val();
                        var newPassword = $("#newPasswordInput").val();
                        if (oldPassword === "" || newPassword === "") {
                            alert("旧密码和新密码不能为空");
                            return;
                        }
                        // 发送修改密码请求到后端
                        $.ajax({
                            type: "PUT",
                            url: "<%=request.getContextPath()%>/change",
                            data: {
                                password: oldPassword,
                                newpassword: newPassword
                            },
                            success: function (result) {
                                if (result === 1) {
                                    alert("密码修改成功");
                                } else if (result === -3) {
                                    alert("用户不存在");
                                } else if (result === -4) {
                                    alert("旧密码不正确");
                                } else {
                                    alert("密码修改失败，请稍后重试");
                                }
                            },
                            error: function () {
                                alert("修改密码请求出现网络错误，请稍后重试");
                            }
                        });
                    });
                } else {

                    window.location.href = "<%=request.getContextPath()%>/login.jsp";
                }
            },
            error: function () {
                alert("检查登录状态出现网络错误，请稍后重试");
            }
        });
    });
</script>
</body>
</html>