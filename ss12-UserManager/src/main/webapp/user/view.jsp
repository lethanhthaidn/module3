<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>list user</h2>
    <table border="1">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>email</th>
            <th>country</th>
        </tr>
        <c:forEach items="${listUser}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
