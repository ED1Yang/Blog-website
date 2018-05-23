<%@ page import="java.io.File" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Registration</title>
    <link rel="stylesheet" type="text/css" href="Register.css">
</head>
<body>
<div class="registration-form">
    <h1>Registration Form</h1>
    <form id="registration" action="/Registration" method="post" enctype="multipart/form-data">
        <c:if test="${UsernameTaken}">
            <p style="color: red">Username is taken, please choose another</p>
        </c:if>
        <input type="text" name="fname" class="personaldetails" placeholder="First name" required>
        <br><br>
        <input type="text" name="lname" class="personaldetails" placeholder="Surname" required>
        <br><br>
        <input type="text" name="uname" class="personaldetails" placeholder="Username" required>
        <br><br>
        <input type="date" name="dob" class="personaldetails" placeholder="DOB" required>
        <br><br>
        <select name="country" class="personaldetails" required>
            <option value="NZ">New Zealand</option>
            <option value="AU">Australia</option>
            <option value="CHN">China</option>
            <option value="IND">India</option>
            <option value="EU">Europe</option>
            <option value="USA">America</option>
            <option value="GB">England</option>
        </select>
        <br><br>
        <input type="password" name="pwd" class="personaldetails" placeholder="New Password" required>
        <br><br>
        <p style="color:white">Select a Profile Picture</p>
        <%
            File folder = new File("H:\\echome\\PGCertInfoTech\\Lectures_Labs\\Project\\web\\Avatars");
            File[] listOfFiles = folder.listFiles();

            for (int i = 0; i < listOfFiles.length; i++) {
                %> <img src="Avatars/<%=listOfFiles[i].getName() %>" width="50px" data-value= "<%=listOfFiles[i].getName()%>"> <%
                }
        %>
        <input type="hidden" id="image-value" name = "avatar" value="">
        <br>
        <p style="color: white">Or choose your own...</p>
        <input id="imageUpload" type="file"
               name="profile_photo" placeholder="Photo">
        <br><br>
        <input type="submit" value="register" id="register">
    </form>
</div>

</body>

<script
        src="http://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>

<script>
    $('#registration img').click(function() {
        // Set the form value
        $('#image-value').val($(this).attr('data-value'));

        // Unhighlight all the images
        $('#registration img').removeClass('highlighted');

        // Highlight the newly selected image
        $(this).addClass('highlighted');
    });
</script>
</html>