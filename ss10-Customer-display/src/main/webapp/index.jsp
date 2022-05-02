<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
    <h1>Customer List</h1>
    <table border="1">
        <tr>
            <th>Namthday</th>
            <th>Adre</th>
            <th>Biress</th>
            <th>Picture</th>
        </tr>

        <% List<Customer> list = (List<Customer>) request.getAttribute("list");
            for (Customer ct : list) { %>
        <tr>
            <td><%= ct.getName()%>
            </td>
            <td><%= ct.getBirthDay()%>
            </td>
            <td><%= ct.getAdress()%>
            </td>
            <td><%= ct.getPicture()%>
            </td>
        </tr>
        <% } %>
</table>
</body>
</html>
