<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Project.UserDAO.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Articles</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="createPageStylesheet.css">


    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</head>
<body>

    <!-- Creating the NavBar -->
    <header>
        <div class="container">
            <nav style="height: 50px">
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <br><br>

    <!--Creating the Contents-->


    <div class="container">
        <c:choose>
            <c:when test="${editing}">
                <h2>Edit Article</h2>
            </c:when>
            <c:otherwise>
                <h2>Post New Article</h2>
            </c:otherwise>
        </c:choose>
        <hr>
        <br>
    </div>

    <!-- Left-aligned media object -->



    <div class="container">
        <div class="media-left">
            <a href="./UserProfileServlet"><img src="Avatars/${User.getImage()}" class="media-object" style="width:60px; border-radius: 60px"></a>
        </div>
        <div class="media-body">
            <h3 class="media-heading">${User.getUerName()}</h3>
        </div>
    </div>

    <div class="container">
        <!--<h3>Title</h3>-->
        <c:choose>
            <c:when test="${editing}">
            <form action="./EditArticle#user-articles" method="post">
                <input type="hidden" value="${articleId}" name = "articleId">
            </c:when>
            <c:otherwise>
            <form action="./NewArticle#user-articles" method="post">
            </c:otherwise>
        </c:choose>
            <br><br>
            <c:choose>
                <c:when test="${articleGenre != null}">
                    <h4>${articleGenre}</h4>
                    <input type= "hidden" name="category" value="${articleGenre}">
                </c:when>
                <c:otherwise>
                    <select class="dropdown" name="category" required>
                        <option value="" selected disabled>Choose a category</option>
                        <option value="Technology">Technology</option>
                        <option value="Politics">Politics</option>
                        <option value="Business">Business</option>
                    </select>
                </c:otherwise>
            </c:choose>

            <br><br>

            <div class="input-group">
                <span class="input-group-addon" style="font-size: large"><strong>Title</strong></span>
                <c:choose>
                    <c:when test="${articleName != null}">
                        <input id="articleTitle" type="text" class="form-control" name="articleTitle"
                               style="font-size: large;
                                font-family: 'Helvetica';" value="${articleName}" required maxlength="50">
                    </c:when>
                    <c:otherwise>
                        <input id="articleTitle" type="text" class="form-control" name="articleTitle" placeholder="Type your heading here - max 50 characters"
                               style="font-size: large;
                                font-family: 'Helvetica';" required maxlength="50">
                    </c:otherwise>
                </c:choose>
            </div>
            <h4>Tell your story below..</h4>
            <div class="form-group">
                <jsp:include page="Text_Editor.jsp"/>
                <input type="hidden" id = "articleBody" name="articleBody">
            </div>
            <input type="hidden" value="${User.getUerName()}" name="author">
            <input type="date" name="articleDate" id = "datePicker">
            <br><br>
            <input type="submit" value="Publish" class="button">
        </form>
    </div>
    <br>

    <br><br>

    <br><br><br>

    <footer>
        <a class="up-arrow" href="#" data-toggle="tooltip" title="TO TOP">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a><br><br>
        <p>copyright <a href="https://www.apollo.com" data-toggle="tooltip" title="Visit apolloblogs">www.apollo.com</a></p>
    </footer>

    <script>
        $(this).submit(function () {
            $('#articleBody').val(document.getElementById('textfield').contentWindow.document.body.innerHTML);
        });
    </script>
    <c:if test="${articleContent != null}">
        <script>
            $(document).ready(function () {
                document.getElementById('textfield').contentWindow.document.body.innerHTML = '${articleContent}';
            });
        </script>
    </c:if>
    <c:choose>
        <c:when test="${articleDate != null}">
            <script>
            $(this).ready(function () {
            document.getElementById("datePicker").valueAsDate = new Date('${articleDate}')
            })
            </script>
        </c:when>
        <c:otherwise>
            <script>
            $(this).ready(function () {
            document.getElementById("datePicker").valueAsDate = new Date()
            })
            </script>
        </c:otherwise>
    </c:choose>

</body>
</html>
