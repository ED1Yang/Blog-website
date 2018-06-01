<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Project.UserDAO.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adding and Deleting Users</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="addcreate.css">

</head>
<body>
    <div class="container" id="table">
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-info btn-md" data-title="Home" data-toggle="modal" data-target="#home" onclick="location.href = 'Home.jsp'">
                    <span class="glyphicon glyphicon-home"></span>
                </button>
                <h2>Manage Users</h2>
                <br>
                <c:if test="${deleted}">
                    <h4 style="color: #fb2525">User deleted</h4>
                </c:if>
                <div class="table-responsive">
                    <table id="mytable" class="table table-bordred table-striped">
                        <thead>
                        <th>First Name</th>
                    <th>Last Name</th>
                        <th>Username</th>
                        <th>Country</th>
                        <th>Email</th>
                        <th>Delete</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.getFirstName()}</td>
                            <td>${user.getLastName()}</td>
                            <td>${user.getUerName()}</td>
                            <td>${user.getCountry()}</td>
                            <td>${user.getEmail()}</td>
                            <td>
                                <form action="./DeleteUser" method="post">
                                    <input type="hidden" value="${user.getUerName()}" name="username">
                                <p data-placement="top" data-toggle="tooltip" title="Remove">
                                    <c:choose>
                                        <c:when test="${currentUser.getUerName() == user.getUerName()}">
                                            <button disabled type="submit" class="btn btn-danger btn-xs" data-title="Remove" data-toggle="modal" data-target="#remove" >
                                                <span class="glyphicon glyphicon-minus-sign"></span>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" class="btn btn-danger btn-xs" data-title="Remove" data-toggle="modal" data-target="#remove" >
                                                <span class="glyphicon glyphicon-minus-sign"></span>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                </form>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <form action="./RegistrationSetUp" method="post">
                        <p data-placement="top" data-toggle="tooltip" title="Remove">
                            <input type="hidden" value="true" name="adminUserSetup">
                            <button type="submit" class="btn btn-primary btn-sm" data-title="Add User" data-toggle="modal" data-target="#remove" >
                                <span class="glyphicon glyphicon-plus-sign"></span>
                            </button>
                            Add User
                        </p>
                    </form>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>