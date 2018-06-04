<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Email_Sent.css">
    <title>Email_Sent</title>
</head>
<body>
<div id="Container" class="EmailSent">
    <p>${username}, a verification email has been sent to: ${email}</p>
    <p>Please check your email to reset the password.</p>
    <a href="Home.jsp" style="cursor: pointer"><input type="submit" name="" value="Home" style="cursor: pointer"></a>
    <br><br><br><br>
</div>
</body>
</html>