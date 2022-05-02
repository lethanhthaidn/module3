
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update new product</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/product">
    <h1>Create new product</h1>
    <table border="1">
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" value="${id}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Brand</td>
            <td><input type="text" name="brand"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td><input type="text" name="quantity"></td>
        </tr>
        <tr>
            <td>Date Release</td>
            <td><input type="text" name="dateRelease"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit">
            </td>
        </tr>

    </table>
    <input type="hidden" name="action" value="update">
</form>

</body>
</html>
