<%@ page import="Project.UserDAO.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="Profile.css">
</head>
<body>


<div class="container">
    <c:if test="${updated}">
        <p>User profile picture updated successfully!</p>
    </c:if>

    <c:if test="${removed}">
        <p>User profile picture removed successfully!</p>
    </c:if>
    <div class="row profile">
        <div class="col-md-3">
            <div class="profile-sidebar">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic">
                    <img src="Avatars/${user.getImage()}" class="img-responsive"
                         alt="">
                    <%--Question 1: Built link to the picture folder--%>
                </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">
                        <p>${user.getUerName()}</p>
                        <%--Marcus Doe--%>
                    </div>
                    <div class="profile-usertitle-job">
                        Blogger
                    </div>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <!-- SIDEBAR BUTTONS -->
                <div class="profile-userbuttons">
                    <a href="UploadImage.jsp">
                        <button type="button" class="btn btn-success btn-sm">Change</button>
                    </a>
                    <a href="./RemoveImage">
                        <button type="button" class="btn btn-danger btn-sm">Remove</button>
                    </a>
                </div>
                <!-- END SIDEBAR BUTTONS -->
                <!-- SIDEBAR MENU -->
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li class="active">
                            <a href="#">
                                <i class="glyphicon glyphicon-ok"></i>
                                Overview </a>
                        </li>
                        <li>
                            <a href="./AccountSetting">
                                <i class="glyphicon glyphicon-user"></i>
                                Account Settings </a>
                        </li>
                        <li>
                            <a href="Home.jsp">
                                <i class="glyphicon glyphicon-home"></i>
                                Home </a>
                        </li>
                        <li>
                            <a href="./SelfDeletion">
                                <i class="glyphicon glyphicon-remove"></i>
                                Delete your account</a>
                        </li>
                    </ul>
                </div>
                <!-- END MENU -->
            </div>
        </div>
        <div class="col-md-9">
            <div class="profile-content">
                <c:choose>
                    <c:when test="${user.getDescription() != null}">
                        <p style="color: black">${user.getDescription()}</p>
                    </c:when>
                    <c:otherwise>
                        <p style="color: black">Add a description about yourself!</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<center>
    <strong>Powered by <span id = "webname">Apollo</span> <a href="" target="_blank"></a></strong>
</center>
<br>
<br>

</body>
</html>