<%@ page import="bean.Products" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Date Release</th>
        </tr>
        <% List<Products> list = (List<Products>) request.getAttribute("list");
        for (Products p : list){ %>
            <tr>
                <td> <%= p.getId()%></td>
                <td> <%= p.getName()%></td>
                <td> <%= p.getBrand()%></td>
                <td> <%= p.getPrice()%></td>
                <td> <%= p.getQuantity()%></td>
                <td> <%= p.getDateRelease()%></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
