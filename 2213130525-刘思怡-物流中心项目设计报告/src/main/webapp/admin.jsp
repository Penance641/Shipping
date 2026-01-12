<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>管理员操作页面</title>
</head>

<body>
<%@ include file="lan.jsp" %>
<!-- 删除用户 -->
<input type="number" id="deleteUserId" placeholder="请输入要删除的用户 ID">
<button onclick="deleteUser()">删除用户</button>
<div id="deleteUserResult"></div>

<!-- 删除快递 -->
<input type="number" id="deletePostPid" placeholder="请输入要删除的快递记录 PID（pid）">
<button onclick="deletePost()">删除快递</button>
<div id="deletePostResult"></div>

<!-- 发布公告 -->
<textarea id="noticeText" placeholder="请输入公告内容"></textarea>
<button onclick="insertNotice()">发布公告</button>
<div id="insertNoticeResult"></div>

<!-- 新增用户 -->
<input type="text" id="newUserName" placeholder="请输入新用户的姓名">
<input type="password" id="newUserPassword" placeholder="请输入新用户的密码">
<button onclick="insertUser()">新增用户</button>
<div id="insertUserResult"></div>

<!-- 更新用户 -->
<input type="number" id="updateUserId" placeholder="请输入要更新的用户 ID">
<input type="text" id="updateUserName" placeholder="请输入更新后的用户姓名">
<button onclick="updateUser()">更新用户</button>
<div id="updateUserResult"></div>

<!-- 新增快递 -->
<input type="text" id="newPostPname" placeholder="请输入新快递的名称">
<input type="text" id="newPostPuc" placeholder="请输入新快递的取件码">
<button onclick="insertPost()">新增快递</button>
<div id="insertPostResult"></div>

<!-- 更新快递 -->
<input type="number" id="updatePostPid" placeholder="请输入要更新的快递记录 ID（pid）">
<button onclick="updatePost()">更新快递</button>
<div id="updatePostResult"></div>

<script>

    function encodeValue(value) {
        return encodeURIComponent(value).replace(/%20/g, "+");
    }

    function deleteUser() {
        const id = document.getElementById('deleteUserId').value;
        const params = new URLSearchParams();
        params.append('id', encodeValue(id));

        fetch('<%=request.getContextPath()%>/admin/deleteUser', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const deleteUserResultDiv = document.getElementById('deleteUserResult');
                if (result === "true") {
                    alert('用户删除成功');
                } else {
                    deleteUserResultDiv.innerHTML = '用户删除失败：' + result;
                }
            })
            .catch(error => {
                console.error('删除用户出现错误:', error);
                const deleteUserResultDiv = document.getElementById('deleteUserResult');
                deleteUserResultDiv.innerHTML = '删除用户出现网络错误，请稍后重试';
            });
    }

    function deletePost() {
        const pid = document.getElementById('deletePostPid').value;
        const params = new URLSearchParams();
        params.append('pid', encodeValue(pid));

        fetch('<%=request.getContextPath()%>/admin/deletePost', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const deletePostResultDiv = document.getElementById('deletePostResult');
                if (result === "true") {
                    alert('快递记录删除成功');
                } else {
                    deletePostResultDiv.innerHTML = '快递记录删除失败：' + result;
                }
            })
            .catch(error => {
                console.error('删除快递出现错误:', error);
                const deletePostResultDiv = document.getElementById('deletePostResult');
                deletePostResultDiv.innerHTML = '删除快递出现网络错误，请稍后重试';
            });
    }

    function insertNotice() {
        const text = document.getElementById('noticeText').value;
        const params = new URLSearchParams();
        params.append('text', encodeValue(text));

        fetch('<%=request.getContextPath()%>/admin/insertNotice', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const insertNoticeResultDiv = document.getElementById('insertNoticeResult');
                if (result === "true") {
                    alert('公告发布成功');
                } else {
                    insertNoticeResultDiv.innerHTML = '公告发布失败：' + result;
                }
            })
            .catch(error => {
                console.error('发布公告出现错误:', error);
                const insertNoticeResultDiv = document.getElementById('insertNoticeResult');
                insertNoticeResultDiv.innerHTML = '发布公告出现网络错误，请稍后重试';
            });
    }

    function insertUser() {
        const name = document.getElementById('newUserName').value;
        const password = document.getElementById('newUserPassword').value;
        const params = new URLSearchParams();
        params.append('name', encodeValue(name));
        params.append('password', encodeValue(password));

        fetch('<%=request.getContextPath()%>/admin/insertUser', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const insertUserResultDiv = document.getElementById('insertUserResult');
                if (result === "true") {
                    alert('用户新增成功');
                } else {
                    insertUserResultDiv.innerHTML = '用户新增失败：' + result;
                }
            })
            .catch(error => {
                console.error('新增用户出现错误:', error);
                const insertUserResultDiv = document.getElementById('insertUserResult');
                insertUserResultDiv.innerHTML = '新增用户出现网络错误，请稍后重试';
            });
    }

    function updateUser() {
        const id = document.getElementById('updateUserId').value;
        const name = document.getElementById('updateUserName').value;
        const params = new URLSearchParams();
        params.append('id', encodeValue(id));
        params.append('name', encodeValue(name));

        fetch('<%=request.getContextPath()%>/admin/updateUser', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const updateUserResultDiv = document.getElementById('updateUserResult');
                if (result === "true") {
                    alert('用户更新成功');
                } else {
                    updateUserResultDiv.innerHTML = '用户更新失败：' + result;
                }
            })
            .catch(error => {
                console.error('更新用户出现错误:', error);
                const updateUserResultDiv = document.getElementById('updateUserResult');
                updateUserResultDiv.innerHTML = '更新用户出现网络错误，请稍后重试';
            });
    }

    function insertPost() {
        const pname = document.getElementById('newPostPname').value;
        const puc = document.getElementById('newPostPuc').value;
        const params = new URLSearchParams();
        params.append('pname', encodeValue(pname));
        params.append('puc', encodeValue(puc));

        fetch('<%=request.getContextPath()%>/admin/insertPost', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const insertPostResultDiv = document.getElementById('insertPostResult');
                if (result === "0") {
                    alert('快递记录新增成功');
                } else {
                    insertPostResultDiv.innerHTML = '快递记录新增失败：' + result;
                }
            })
            .catch(error => {
                console.error('新增快递出现错误:', error);
                const insertPostResultDiv = document.getElementById('insertPostResult');
                insertPostResultDiv.innerHTML = '新增快递出现网络错误，请稍后重试';
            });
    }

    function updatePost() {
        const pid = document.getElementById('updatePostPid').value;
        const params = new URLSearchParams();
        params.append('pid', encodeValue(pid));

        fetch('<%=request.getContextPath()%>/admin/updatePost', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(result => {
                const updatePostResultDiv = document.getElementById('updatePostResult');
                if (result === "true") {
                    alert('快递记录更新成功');
                } else {
                    updatePostResultDiv.innerHTML = '快递记录更新失败：' + result;
                }
            })
            .catch(error => {
                console.error('更新快递出现错误:', error);
                const updatePostResultDiv = document.getElementById('updatePostResult');
                updatePostResultDiv.innerHTML = '更新快递出现网络错误，请稍后重试';
            });
    }
</script>
</body>

</html>