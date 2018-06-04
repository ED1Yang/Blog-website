<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="forgetPasswordcss.css">

</head>
<body>

<div id="container" class="loginbox">



    <h1>Forget Password?</h1>
    <form method="post" action="./ForgetPassword">
        <p>Username</p>
        <c:if test="${wrongUsername}">
        <p style="color: red;">UserName doesn't exist.</p>
    </c:if>
        <input type="text" name="username" placeholder="Enter Username">

        <p>Email</p>
        <c:if test="${wrongEmail}">
            <p style="color: red;">UserName doesn't match up with the email address.</p>
        </c:if>
        <input type="email" name="email" placeholder="Enter Your Email">

        <input hidden type="text" name="isFromUser" value="true">
        <input type="submit" name="" value="Send Verification Link">
        <!--<a href="#">Forgot your Password?</a>-->
        <!--<a href="RegistrationForm.html">Don't Have an Account?</a>-->
    </form>


</div>



</body>
</html>