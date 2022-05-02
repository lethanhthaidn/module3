<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>
        a{
            text-decoration: none;
        }
        button{
            background-color: brown;
        }
        #create{
            color: white;
        }
    </style>
</head>
<body>
    <h1>Product List</h1>

    <%--            <a href="${pageContext.request.contextPath}/product?action=create">Create new product</a>--%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Date Release</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${list}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.brand}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>
                    <fmt:formatDate value="${product.dateRelease}" pattern="dd/MM/yyyy"></fmt:formatDate>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/product?action=delete&id=${product.id}">Delete</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/product?action=update&id=${product.id}">Update</a>
                </td>
            </tr>
        </c:forEach>

    </table>
    <tr>
        <button><a id="create" href="${pageContext.request.contextPath}/product?action=create">Create new product</a></button>
    </tr>
</body>
</html>
