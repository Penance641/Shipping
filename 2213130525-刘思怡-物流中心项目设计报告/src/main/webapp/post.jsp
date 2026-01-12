<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>快递管理</title>
    <link rel="stylesheet" href="styles.css"> <!-- 引入外部CSS文件 -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <h2>快递管理</h2>
    <!-- 输入快递单号的文本框 -->
    <input type="text" id="pucInput" placeholder="请输入快递单号">
    <!-- 查询快递按钮 -->
    <button id="searchButton">查询快递</button>
    <!-- 更新快递状态按钮 -->
    <button id="updateButton">更新快递状态</button>
    <!-- 用于展示快递信息的div -->
    <div id="postInfoDiv" class="post-info"></div>
    <div id="globalErrorMsg" class="error-msg"></div>
</div>

<script>
    $(document).ready(function () {
        // 页面加载时，检查登录状态并获取用户名
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/checkLogin",
            success: function (response) {
                if (response === 1) {
                    // 已登录，从会话中获取用户名
                    var username = '<%=session.getAttribute("username")%>';
                    // 查询快递按钮
                    $("#searchButton").click(function () {
                        var puc = $("#pucInput").val();
                        if (puc === "") {
                            $("#globalErrorMsg").html("请输入快递单号").show();
                            return;
                        } else {
                            $("#globalErrorMsg").html("").hide();
                        }
                        $.ajax({
                            type: "GET",
                            url: "<%=request.getContextPath()%>/post/find",
                            data: {puc: puc, name: username},
                            success: function (post) {
                                if (post) {
                                    var postInfoHtml = "<p>快递名称: " + post.pname + ", 快递状态: " + post.pstate + ", 快递单号: " + post.pid + "</p>";
                                    $("#postInfoDiv").html(postInfoHtml);
                                } else {
                                    $("#postInfoDiv").html("<p>未找到对应的快递信息</p>");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                $("#globalErrorMsg").html("查询快递出现网络错误，请稍后重试：" + textStatus + " - " + errorThrown).show();
                            }
                        });
                    });
                    $("#updateButton").click(function () {
                        var puc = $("#pucInput").val();
                        if (puc === "") {
                            $("#globalErrorMsg").html("请输入快递单号").show();
                            return;
                        } else {
                            $("#globalErrorMsg").html("").hide();
                        }
                        $.ajax({
                            type: "PUT",
                            url: "<%=request.getContextPath()%>/post/update",
                            data: {puc: puc, name: username},
                            success: function (result) {
                                if (result === 1) {
                                    alert("快递状态更新成功");
                                } else {
                                    alert("快递状态更新失败，请稍后重试");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                                $("#globalErrorMsg").html("更新快递状态出现网络错误，请稍后重试：" + textStatus + " - " + errorThrown).show();
                            }
                        });
                    });
                } else {
                    alert("请先登录");
                    window.location.href = "<%=request.getContextPath()%>/login.jsp";
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {

                $("#globalErrorMsg").html("检查登录状态出现网络错误，请稍后重试：" + textStatus + " - " + errorThrown).show();
            }
        });
    });
</script>
</body>

</html>