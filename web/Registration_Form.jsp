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
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //for-mobile-apps -->
    <!-- //custom-theme -->
    <link href="CSS/Registration_Form.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <!-- //js -->
    <link href='Https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <script src="Https://www.google.com/recaptcha/api.js"></script>
</head>
<c:choose>
<c:when test="${adminUserSetup}">
<body class="bodyAdmin">
</c:when>
<c:otherwise>
<body class="bodyNormal">
</c:otherwise>
</c:choose>
<!-- banner -->
<div class="center-container">
    <div class="main">
        <!-- Slightly different interface for administrators -->
        <c:choose>
            <c:when test="${adminUserSetup}">
                <h1 class="w3layouts_head">Administrative user Setup</h1>
            </c:when>
            <c:otherwise>
                <h1 class="w3layouts_head">Sign up to Apollo</h1>
            </c:otherwise>
        </c:choose>
        <div class="w3layouts_main_grid">
            <form action="./Registration" method="post" class="w3_form_post" id="registration">
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
								<input type="text" name="uname" class="uname" placeholder="Username" required oninput="checkUname()" id="uname">
								</span>
                </div>
                <span class="status"></span><br>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Email</label>
								<input type="email" name="email" placeholder="Email" required>
								</span>
                </div>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Password</label>
								<input type="password" name="pwd" placeholder="Password" required>
							</span>
                </div>
                <div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Country</label>
								<select name="country" required>
									<option value="" selected disabled>Select Country</option>
									<option value="AU">Australia</option>
									<option value="UK">United Kingdom</option>
                                    <option value="US">United States</option>
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
									<input class="date" id="datepicker" name="dob" type="date" value="mm/dd/yyyy" required>
								</div>
									<div class="clear"> </div>
								<label>Profile Picture</label>
							</span>
                    <br>
                    <!-- Generates default avatars -->
                    <c:forEach items="${defaultAvatars}" var="i">
                        <img src="Avatars/${i}" width="50px" data-value="${i}">
                    </c:forEach>
                    <input type="hidden" id="image-value" name="avatar">

                    <div class="w3_main_grid_right" style="display: inline;position: relative; top: -15px;">
                        <c:if test="${adminUserSetup}">
                            <input type="hidden" value="adminUser" name="adminUser">
                        </c:if>
                        <input type="submit" value="Upload Image" onclick="isUploading()">
                    </div>
                </div>
                <div class="g-recaptcha"
                     data-sitekey="6LfV01wUAAAAABs5ANFS_rd39JbsetwQ5jCqfIC3"></div>
                <div class="w3_main_grid">

                    <input hidden type="text" name="upload" id="uploading" value="">

                    <div class="w3_main_grid_right">
                        <c:if test="${adminUserSetup}">
                            <input type="hidden" value="adminUser" name="adminUser">
                        </c:if>
                        <input type="submit" value="Submit" onclick="noUploading()">
                    </div>

                </div>

            </form>
        </div>
        <div class="w3layouts_copy_right">
            <div class="container">
                <p>&copy; 2018 Registration Form. All rights reserved | Design by <a href="Home.jsp">Apollo</a></p>
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
    //Checks username in real time
    function checkUname() {
        var uname = $('#uname').val();
        if(uname != "") {
            $(".status").html("<img src='Resources/loading.gif'><p> Checking availability...</p>");

            $.ajax({
                type: "POST",
                url: "check",
                data: "uname=" + uname,
                success: function (msg) {
                    $(".status").html(msg);
                }
            })
        }
    }
</script>
<script>
    //Sends user to right place depending on uploading or not
    function noUploading() {
        document.getElementById("uploading").setAttribute("value", "false");
    }

    function isUploading() {
        document.getElementById("uploading").setAttribute("value", "true");
    }

</script>
<script>
    //Validates reCAPTCHA input
    window.onload = function() {
        var $recaptcha = document.querySelector('#g-recaptcha-response');

        if($recaptcha) {
            $recaptcha.setAttribute("required", "required");
        }
    };
</script>


</html>