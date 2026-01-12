<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
</head>

<body>
<%@ include file="lan.jsp" %>
<input type="text" id="registerUsername" placeholder="请输入用户名（注册）">
<input type="password" id="registerPassword" placeholder="请输入密码（注册）">
<button onclick="registerUser()">注册</button>
<div id="registerResult"></div>

<script>
    // 对输入内容进行编码处理的函数，避免特殊字符导致乱码等问题
    function encodeValue(value) {
        return encodeURIComponent(value).replace(/%20/g, "+");
    }

    function registerUser() {
        const username = document.getElementById('registerUsername').value;
        const password = document.getElementById('registerPassword').value;
        // 使用URLSearchParams构建表单格式的数据，并对参数值进行编码
        const params = new URLSearchParams();
        params.append('name', encodeValue(username));
        params.append('password', encodeValue(password));

        fetch('/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const registerResultDiv = document.getElementById('registerResult');
                if (result === "1") {
                    alert('注册成功');
                } else {
                    registerResultDiv.innerHTML = '注册失败：' + result;
                }
            })
            .catch(error => {
                console.error('注册出现错误:', error);
                const registerResultDiv = document.getElementById('registerResult');
                registerResultDiv.innerHTML = '注册出现网络错误，请稍后重试';
            });
    }
</script>
</body>

</html>