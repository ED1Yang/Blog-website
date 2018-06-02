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
    <link rel="stylesheet" type="text/css"  href="aboutus.css" />

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<%--HTM for the Navbar Header--%>
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
                <li><a href="#about">ABOUT</a></li>
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
                <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<%--HTML Code for the Body Content--%>
<div id="content" class="site-content">
    <article>
        <div class="content-1070 center-relative entry-content">
            <div class="content-900 center-relative">
                <h1 class="entry-title">WE MAKE IT FUN!</h1>
            </div>
        </div>
    </article>
</div>

<div class="team">
    <h1>Meet Team GREA</h1>
    <br>
    <div class="row">
        <div class="column">
            <div class="card">
                <img src="Resources/articleImageFileBusiness1.jpg" alt="George" style="width:100%">
                <div class="container">
                    <h2>George</h2>
                    <p class="title">Full Stack Development</p>
                    <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                    <p><button class="button">gsik152@aucklanduni.ac.nz</button></p>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="Resources/articleImageFileBusiness1.jpg" alt="Ron" style="width:100%">
                <div class="container">
                    <h2>Ron</h2>
                    <p class="title">Front-End Development</p>
                    <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                    <p><button class="button">rpag130@aucklanduni.ac.nz</button></p>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <img src="Resources/articleImageFileBusiness1.jpg" alt="Edward" style="width:100%">
                <div class="container">
                    <h2>Edward</h2>
                    <p class="title">Back-End Development</p>
                    <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                    <p><button class="button">ed1yangsso@gmail.com</button></p>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <img src="Resources/articleImageFileBusiness1.jpg" alt="Aravind " style="width:100%">
                <div class="container">
                    <h2>Aravind</h2>
                    <p class="title">Web Development</p>
                    <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                    <p><button class="button">amad295@aucklanduni.ac.nz </button></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%--HTML for the Footer--%>
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