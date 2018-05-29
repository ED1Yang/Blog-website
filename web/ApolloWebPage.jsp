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

    <link rel="stylesheet" type="text/css" href="MainCSS.css">

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
                    <li><a href="/UserProfileServlet"><img src="Avatars/${user.getImage()}" alt="Name" class="avatar"></a></li>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#about">ABOUT</a></li>
                <c:if test="${LoggedIn}">
                    <li><a href="/ArticleCreation">ADD ARTICLE</a></li>
                </c:if>
                <li><a href="#articles">ARTICLES</a></li>
                <c:if test="${!LoggedIn}">
                    <li><a href="/RegistrationSetUp">SIGN UP</a></li>
                </c:if>
                <c:if test="${LoggedIn}">
                    <li><a href="/LogOut">LOG OUT</a></li>
                </c:if>
                <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br>

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="position: relative; top: -25px; ">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="Resources/imageMainArticle1.jpg" alt="Technology">
            <div class="carousel-caption">
                <h3>Technology</h3>
                <p>Technology is widely known is lorem ipsum.</p>
            </div>
        </div>

        <div class="item">
            <img src="Resources/imageMainArticle2.jpg" alt="Business">
            <div class="carousel-caption">
                <h3>Business</h3>
                <p>Thank you, Business - A night we won't forget.</p>
            </div>
        </div>

        <div class="item">
            <img src="Resources/imageMainArticle3.jpeg" alt="Politics">
            <div class="carousel-caption">
                <h3>Politics</h3>
                <p>Even though the traffic was a mess, we had the best time.</p>
            </div>
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<div class="container text-center">
    <h1><strong>LATEST ARTICLES</strong></h1>
    <p>We use words</p>
    <p>Lorem ipsum dolor sit amet, qui unum populo bonorum ei. Per no enim utroque probatus, te labore dictas omittam his, illum mnesarchum vel te. Vis ad tota elitr minimum, ne ludus epicuri epicurei pro. His facilisi pertinax an. Pro eripuit denique scribentur ut, est ei ferri epicurei contentiones, vidit antiopam explicari te nam. Sit natum accusata in, in libris apeirian adipisci eam.</p>
</div>


<div class="row">
    <div class="col-sm-4">
        <h3><strong>Technology</strong></h3><br>
        <a href="#technology" data-toggle="collapse">
        <img src="Resources/technology.jpg" class="img-circle subject"
             style="width: 50%;
                    alignment: center;
                    margin-bottom: 5px;
                    margin-right: 10px;
                    border: solid black 2px;
                    padding: 2px">
        </a>
        <div id="technology" class="collapse">
            <br>
            <p>${TechArticle}</p>
        </div>
    </div>
    <div class="col-sm-4">
        <h3><strong>Business</strong></h3><br>
        <a href="#business" data-toggle="collapse">
        <img src="Resources/business.jpg" class="img-circle subject"
             style="width: 50%;
                    alignment: center;
                    margin-bottom: 5px;
                    margin-right: 10px;
                    border: solid black 2px;
                    padding: 2px">
        </a>
        <div id="business" class="collapse">
            <br>
            <p>${BusArticle}</p>
        </div>
    </div>
    <div class="col-sm-4">
        <h3><strong>Politics</strong></h3><br>
        <a href="#politics" data-toggle="collapse">
        <img src="Resources/politics.jpg" class="img-circle subject"
             style="width: 50%;
                    alignment: center;
                    margin-bottom: 5px;
                    margin-right: 10px;
                    border: solid black 2px;
                    padding: 2px">
        </a>
        <div id="politics" class="collapse">
            <br>
            <p>${PolArticle}</p>
        </div>
    </div>
</div>

<br><br><br>

<div class="bg-1" id = "articles">
    <div class="container">
        <div class="row text-center">
            <h1 style="color: white">ALL ARTICLES</h1>
            <c:forEach items="${AllArticles}" var="article">
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
                        <form action="/ArticleViewer">
                            <input type="hidden" name="article" value="${article.getId()}">
                            <input type="submit" value="Read..." class="btn">
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="bg-1" id = "user-articles">
    <div class="container">
        <div class="row text-center">
            <c:if test="${LoggedIn}">
                <h1>YOUR ARTICLES</h1>
                <c:if test="${Added}">
                    <h3 style="font-weight: bold; color: #4CAF50;">Article Added</h3>
                </c:if>
                <c:if test="${deleted}">
                    <h3 style="font-weight: bold; color: #fb2525;">Article Deleted</h3>
                </c:if>
                <c:forEach items="${AllArticles}" var="article">
                    <c:set var="userName" value="${user.getUerName()}"></c:set>
                    <c:if test="${article.getAuthor() == userName}">
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
                            <form action="/ArticleViewer">
                                <input type="hidden" name="article" value="${article.getId()}">
                                <input type="submit" value="Read..." class="btn">
                            </form>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
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