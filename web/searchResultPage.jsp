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
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="CSS/MainCSS.css">
    <link rel="stylesheet" type="text/css" href="CSS/searchResults.css">

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
                    <a href="Login_page.jsp"><img src="Resources/avatarimg.png" alt="Name" class="avatar"></a>
                </c:when>
                <c:otherwise>
                    <a href="./UserProfileServlet"><img src="Avatars/${user.getImage()}" alt="Name" class="avatar"></a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Home.jsp">HOME</a></li>
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
                <form class="navbar-form navbar-right" action="./Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" placeholder="search..." class="form-control" style="height: 30px; width: 200px; border-radius: 10px">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit" id = "searchButton">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </form>
            </ul>

        </div>
    </div>
</nav>

<br>

<div class="bg-1" id = "articles" style="top:-9px; position: relative">
    <div class="container">
        <div class="row text-center">
            <br>
            <h1 style="color: white">RESULTS</h1>
            <br>
            <form action="./Sort" method="post" style="margin: 0; padding: 0;display: inline">
                <input type="hidden" value="${keyword}" name="keyword">
                <input type="hidden" value="article_name" name="category">
                <input type="hidden" value="${orderAr}" name="order_article">
                <input type="hidden" value="logo_article" name="logo_name">
                <p data-placement="top" data-toggle="tooltip" title="Title" style="display: inline">
                    <button type="submit" class="btn btn-primary btn-xs">
                        <span class="${logo_article}"></span> Article Name
                    </button>
            </form>

            <form action="./Sort" method="post" style="margin: 0; padding: 0;display: inline">
                <input type="hidden" value="${keyword}" name="keyword">
                <input type="hidden" value="author_id" name="category">
                <input type="hidden" value="${orderAu}" name="order_author">
                <input type="hidden" value="logo_author" name="logo_name">
                <p data-placement="top" data-toggle="tooltip" title="Author" style="display: inline">
                    <button type="submit" class="btn btn-primary btn-xs">
                        <span class="${logo_author}"></span> Author
                    </button>
            </form>

            <form action="./Sort" method="post" style="margin: 0; padding: 0;display: inline">
                <input type="hidden" value="${keyword}" name="keyword">
                <input type="hidden" value="genre" name="category">
                <input type="hidden" value="${orderG}" name="order_genre">
                <input type="hidden" value="logo_genre" name="logo_name">
                <p data-placement="top" data-toggle="tooltip" title="Genre" style="display: inline">
                    <button type="submit" class="btn btn-primary btn-xs">
                        <span class="${logo_genre}"></span> Genre
                    </button>
            </form>

            <form action="./Sort" method="post" style="margin: 0; padding: 0;display: inline">
                <input type="hidden" value="${keyword}" name="keyword">
                <input type="hidden" value="date" name="category">
                <input type="hidden" value="${orderD}" name="order_date">
                <input type="hidden" value="logo_date" name="logo_name">
                <p data-placement="top" data-toggle="tooltip" title="Date" style="display: inline">
                    <button type="submit" class="btn btn-primary btn-xs">
                        <span class="${logo_date}"></span> Date
                    </button>
            </form>

            <br><br>

            <c:forEach items="${ArticlesSearched}" var="article">
                <c:if test="${!article.isHidden() || user.isAdmin()}">
                    <div class="col-lg-4 col-md-8 col-sm-10 col-xs-12">
                        <div class="thumbnail">
                            <div class = "thumbChild">
                                <c:choose>
                                    <c:when test="${article.getGenre() == 'Business'}">
                                        <img src="Resources/Business.png">
                                    </c:when>
                                    <c:when test="${article.getGenre() == 'Technology'}">
                                        <img src="Resources/Technology.jpg">
                                    </c:when>
                                    <c:when test="${article.getGenre() == 'Politics'}">
                                        <img src="Resources/politics.jpg">
                                    </c:when>
                                </c:choose>
                                <h3><strong>${article.getTitle()}</strong></h3>
                                <p>${article.getDate().substring(0,11)}</p>
                                <form action="./ArticleViewer">
                                    <input type="hidden" name="article" value="${article.getId()}">
                                    <input type="submit" value="Read..." class="btn" style="border-radius: 5px">
                                </form>
                                <c:choose>
                                    <c:when test="${user.isAdmin() && article.isHidden()}">
                                        <br>
                                        <form action="./ArticleViewChange#articles" method="post">
                                            <input type="hidden" name="article" value="${article.getId()}">
                                            <input type="hidden" name="visbility" value="${article.isHidden()}">
                                            <input type="submit" value="Show" class="btn" style="background-color: #4CAF50; border-radius: 5px">
                                        </form>
                                    </c:when>
                                    <c:when test="${user.isAdmin() && !article.isHidden()}">
                                        <br>
                                        <form action="./ArticleViewChange#articles" method="post">
                                            <input type="hidden" name="article" value="${article.getId()}">
                                            <input type="hidden" name="visibility" value="${article.isHidden()}">
                                            <input type="submit" value="Hide" class="btn" style="background-color: orange; border-radius: 5px">
                                        </form>
                                    </c:when>
                                </c:choose>
                            </div>
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