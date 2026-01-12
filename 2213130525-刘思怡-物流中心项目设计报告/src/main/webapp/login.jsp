<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
</head>

<body>
<input type="text" id="loginUsername" placeholder="请输入用户名（登录）">
<input type="password" id="loginPassword" placeholder="请输入密码（登录）">
<button onclick="loginUser()">登录</button>
<div id="loginResult"></div>

<script>
    // 对输入内容进行编码处理的函数，避免特殊字符导致乱码等问题
    function encodeValue(value) {
        return encodeURIComponent(value).replace(/%20/g, "+");
    }

    function loginUser() {
        const username = document.getElementById('loginUsername').value;
        const password = document.getElementById('loginPassword').value;
        if (!username ||!password) {
            const loginResultDiv = document.getElementById('loginResult');
            loginResultDiv.innerHTML = '用户名和密码不能为空';
            return;
        }
        const params = new URLSearchParams();
        params.append('name', encodeValue(username));
        params.append('password', encodeValue(password));

        fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const loginResultDiv = document.getElementById('loginResult');

                if (result === "1") {

                    window.location.href = 'index.jsp';
                } else {
                    loginResultDiv.innerHTML = result;
                }
            })
            .catch(error => {
                console.error('登录出现错误:', error);
                const loginResultDiv = document.getElementById('loginResult');
                loginResultDiv.innerHTML = '登录出现网络错误，请稍后重试';
            });
    }
</script>
</body>

</html>