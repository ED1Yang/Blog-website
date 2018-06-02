<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Apollo</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--Links for the Search Box--%>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="MainCSS.css">
    <link rel="stylesheet" type="text/css" href="searchResults.css">

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <c:choose>
                <c:when test="${!LoggedIn}">
                    <li><a href="Login_page.jsp"><img src="Resources/avatarimg.png" alt="Name" class="avatar"></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="./UserProfileServlet"><img src="Avatars/${user.getImage()}" alt="Name" class="avatar"></a></li>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${LoggedIn}">
                    <li><a href="./ArticleCreation">ADD ARTICLE</a></li>
                </c:if>
                <li><a href="#articles">ARTICLES</a></li>
                <c:if test="${!LoggedIn}">
                    <li><a href="./RegistrationSetUp">SIGN UP</a></li>
                </c:if>
                <c:if test="${LoggedIn}">
                    <li><a href="./LogOut">LOG OUT</a></li>
                </c:if>
                <c:if test="${user.isAdmin()}">
                    <li><a href = "./UserAdmin">USER ADMINISTRATION</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<br>

<div class="bg-1" id = "articles">
    <div class="container">
        <div class="row text-center">
            <h1 style="color: white">RESULTS</h1>
            <c:forEach items="${ArticlesSearched}" var="article">
                <c:if test="${!article.isHidden() || user.isAdmin()}">
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <c:choose>
                                <c:when test="${article.getGenre() == 'Business'}">
                                    <img src="Resources/business.jpg">
                                </c:when>
                                <c:when test="${article.getGenre() == 'Technology'}">
                                    <img src="Resources/technology.jpg">
                                </c:when>
                                <c:when test="${article.getGenre() == 'Politics'}">
                                    <img src="Resources/politics.jpg">
                                </c:when>
                            </c:choose>
                            <h3><strong>${article.getTitle()}</strong></h3>
                            <p>${article.getDate().substring(0,11)}</p>
                            <form action="./ArticleViewer">
                                <input type="hidden" name="article" value="${article.getId()}">
                                <input type="submit" value="Read..." class="btn">
                            </form>
                            <c:choose>
                                <c:when test="${user.isAdmin() && article.isHidden()}">
                                    <br>
                                    <form action="./ArticleViewChange#articles" method="post">
                                        <input type="hidden" name="article" value="${article.getId()}">
                                        <input type="hidden" name="visbility" value="${article.isHidden()}">
                                        <input type="submit" value="Show" class="btn" style="background-color: #4CAF50">
                                    </form>
                                </c:when>
                                <c:when test="${user.isAdmin() && !article.isHidden()}">
                                    <br>
                                    <form action="./ArticleViewChange#articles" method="post">
                                        <input type="hidden" name="article" value="${article.getId()}">
                                        <input type="hidden" name="visibility" value="${article.isHidden()}">
                                        <input type="submit" value="Hide" class="btn" style="background-color: orange">
                                    </form>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<footer class="text-center">
    <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a><br><br>
    <p>copyright <a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit apolloblogs">www.apollo.com</a></p>
</footer>

<script>
    $(document).ready(function(){
        // Initialize Tooltip
        $('[data-toggle="tooltip"]').tooltip();
    })
</script>
</body>
</html>