<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/Reset_Failed.css">
    <title>Reset_Failed</title>
</head>
<body>
<div id="Container" class="resetfailed">
    <!-- Explanation of why validation failed -->
    <c:choose>
        <c:when test="${linkNotValid}">
            <p>Link not valid, password reset failed.</p>
        </c:when>
        <c:when test="${invalidUser}">
            <p>User not valid, password reset failed.</p>
        </c:when>
        <c:when test="${expired}">
            <p>Time expired, password reset failed.</p>
        </c:when>
    </c:choose>
    <input type="submit" name="" value="Reset">
</div>
</body>
</html>