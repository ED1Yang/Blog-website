<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Settings</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Account.css">

    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".uname").change(function(){
                var uname = $(this).val();
                $(".status").html("<img src='Resources/loading.gif'><p> Checking availability...</p>");

                $.ajax({
                    type: "POST",
                    url: "check",
                    data: "uname="+ uname,
                    success: function(msg){
                        $(".status").html(msg);
                    }
                });

            });
        });
    </script>



</head>
<body>
<div class="container">
    <c:if test="${isChanged}">
        <p>Changes saved successfully!</p>
        <br>
    </c:if>
    <c:if test="${noChange}">
        <p>No changes have been made.</p>
        <br>
    </c:if>

    <button class="btn btn-info" data-title="Back" data-toggle="modal" data-target="#home" onclick="location.href = '/UserProfileServlet'">
        &larr; Back
    </button>

    <br><br>
    <form class="needs-validation" novalidate method="post" action="NewUserInformation" >
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">First name</label>
                <input type="text" class="form-control" id="validationCustom01" value="${user.getFirstName()}" name="fname" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
                <div class="invalid-feedback">
                    Please enter your first name.
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustom02">Last name</label>
                <input type="text" class="form-control" id="validationCustom02" value="${user.getLastName()}" name="lname" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
                <div class="invalid-feedback">
                    Please enter your last name.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="date">DOB</label>
                <input type="text" class="form-control" id="date" value="${user.getDateOfBirth()}" name="dob"  required>
                <div class="invalid-feedback">
                    Please provide Date of Birth.
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationCustom03">Password</label>
                <input type="password" class="form-control" id="validationCustom03" value="${user.getPassword()}" name="pword" required>
                <div class="invalid-feedback">
                    Please provide a valid city.
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationCustomUsername">Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                    </div>
                    <input type="text" class="uname" id="validationCustomUsername" value="${user.getUerName()}" aria-describedby="inputGroupPrepend" name="username" required>
                    &nbsp;&nbsp;
                    &nbsp;
                    <span class="status"></span>
                    <div class="invalid-feedback">
                        Please choose a username.
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationCustom04">Country</label>
                <input type="text" class="form-control" id="validationCustom04" value="${user.getCountry()}" name="country" required>
                <div class="invalid-feedback">
                    Please provide a valid state.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationCustom04">Email</label>
                <input type="email" class="form-control" id="validationCustom" value="${user.getEmail()}"  name ="email" required>
                <div class="invalid-feedback">
                    Please provide a valid state.
                </div>
            </div>

        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="validationdesc">Description</label>
                <input type="text" class="form-control" id="validationdesc" value="${user.getDescription()}" name="description" required>
            </div>
        </div>

        <button class="btn btn-danger" type="submit">Save</button>
    </form>

</div> <!-- /container -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
    $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
</script>
</body>
</html>