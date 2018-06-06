<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="Https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="Https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="Https://code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="CSS/Password_Reset.css">

</head>
<body>

<div id="container" class="loginbox">
    <h1>Reset Password</h1>
    <p id="info" style="color: red;"></p>
    <form method="post" action="./PasswordReset">
        <p>New Password</p>
        <input type="password" id="input1" name="" placeholder="Enter New Password">
        <p>Re-Enter Password</p>
        <input type="password" id="input2" name="password" placeholder="Re-Enter New Password" oninput="check2pwd()" >
        <input hidden name="username" value="${username}">
        <input type="submit" name="" value="Submit" id = "submit">
    </form>

</div>


<script>
    //Compares passwords for validation in real time
    function check2pwd() {
        if(input1.value != input2.value) {
            document.getElementById("info").innerHTML="Passwords don't match, please type again.";
            document.getElementById("submit").disabled = true;

        }else{
            document.getElementById("info").innerHTML="";
            document.getElementById("submit").disabled = false;
        }
    }
</script>
</body>
</html>