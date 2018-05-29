<%@ page import="java.io.File" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register for Apollo</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Event Registration Form Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <!-- //custom-theme -->
    <link href="Registration_Form.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- js -->
    <script type="text/javascript" src="jquery-2.1.4.min.js"></script>
    <!-- //js -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- banner -->
<div class="center-container">
    <div class="main">
        <h1 class="w3layouts_head">Sign up to Apollo</h1>
        <div class="w3layouts_main_grid">
            <form action="/Registration" method="post" class="w3_form_post" id="registration">
                  <%--enctype="multipart/form-data">--%>
                <c:if test="${UsernameTaken}">
                    <p style="color:red">Current username has been taken.</p>
                    <br>
                </c:if>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">

								<label>First Name</label>
								<input type="text" name="fname" placeholder="First name" required>
							</span>
                </div>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Surname</label>
								<input type="text" name="lname" placeholder="Surname" required>
							</span>
                </div>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>User Name</label>
								<input type="text" name="uname" class="uname" placeholder="Username" required>
								</span>
                </div>
                      <span class="status"></span><br>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Password</label>
								<input type="password" name="pwd" placeholder="Password" required>
							</span>
                </div>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Country</label>
								<select name="country">
									<option value="none" selected disabled>Select Country</option>
									<option value="AU">Australia</option>
									<option value="EU">Europe</option>
									<option value="IN">India</option>
									<option value="CHN">China</option>
									<option value="NZ">New Zealand</option>
								</select>
							</span>
                </div>
                <div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>Birthday</label>
								<div class="agileits_w3layouts_main_gridl">
									<input class="date" id="datepicker" name="dob" type="date" value="mm/dd/yyyy">
								</div>
									<div class="clear"> </div>
								<label>Profile Picture</label>
							</span>
                    <br>
                    <c:forEach items="${defaultAvatars}" var="i">
                        <img src="Avatars/${i}" width="50px" data-value= "${i}">
                    </c:forEach>
                    <input type="hidden" id="image-value" name="avatar">

                    <div class="w3_main_grid_right" style="display: inline;position: relative; top: -15px;">
                        <input type="submit" value="Upload Image" onclick="isUploading()">
                    </div>
                </div>
                <div class="w3_main_grid">

                    <input hidden type="text" name="upload" id="uploading" value="">

                    <div class="w3_main_grid_right">
                        <input type="submit" value="Submit" onclick="noUploading()" >
                    </div>

                </div>
            </form>
        </div>
        <div class="w3layouts_copy_right">
            <div class="container">
                <p>© 2018 Registration Form. All rights reserved | Design by <a href="#">Apollo</a></p>
            </div>
        </div>
    </div>
</div>
<!-- //footer -->
</body>

<script>
    $('#registration img').click(function () {
// Set the form value
        $('#image-value').val($(this).attr('data-value'));

// Unhighlight all the images
        $('#registration img').removeClass('highlighted');

// Highlight the newly selected image
        $(this).addClass('highlighted');
    });
</script>

<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".uname").change(function () {
            var uname = $(this).val();
            $(".status").html("<img src='Resources/loading.gif'><p> Checking availability...</p>");

            $.ajax({
                type: "POST",
                url: "check",
                data: "uname=" + uname,
                success: function (msg) {
                    $(".status").html(msg);
                }
            });

        });
    });
</script>
<script>
    function noUploading() {
        document.getElementById("uploading").setAttribute("value","false");
    }

    function isUploading() {
        document.getElementById("uploading").setAttribute("value","true");
    }

</script>


</html>