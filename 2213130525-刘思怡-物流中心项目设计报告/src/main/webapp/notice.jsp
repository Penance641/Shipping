<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>通知展示页面</title>
</head>

<body>
<h1>通知内容列表</h1>
<%
    String noticeContentsStr = (String) request.getAttribute("noticeContents");
    if (noticeContentsStr!= null) {
        String[] noticeContentsArray = noticeContentsStr.split(";");
        for (String noticeText : noticeContentsArray) {
%>
<p><%= noticeText %></p>
<%
        }
    }
%>
</body>

</html>