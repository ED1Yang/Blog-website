<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log-In Page</title>
    <link rel="stylesheet" type="text/css" href="Login_pageCSS.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div id="container" class="loginbox">
    <img src="Resources/avatarimg.png" class="avatar">
    <h1>Login Here</h1>
    <form action = ./LogIn method="post">
        <p>Username</p>
        <input type="text" name="username" placeholder="Enter Username">
        <p>Password</p>
        <input type="password" name="password" placeholder="Enter Password">
        <c:if test="${FailedLogIn}">
            <p style="color:red">Sorry, Incorrect password</p>
            <br>
        </c:if>
        <input type="submit" name="" value="Login">
        <a href="#">Forgot your Password?</a>
        <a href="./RegistrationSetUp">Don't Have an Account?</a>
    </form>


</div>

</body>
</html>