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
                    <li><a href="Login_page.jsp"><img src="Avatars/${UserImage}" alt="Name" class="avatar"></a></li>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#about">ABOUT</a></li>
                <li><a href="#getstarted">GET STARTED</a></li>
                <li><a href="#blogs">BLOGS</a></li>
                <c:if test="${!LoggedIn}">
                    <li><a href="RegistrationForm.html">SIGN UP</a></li>
                </c:if>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Comments</a></li>
                        <li><a href="#">Connections</a></li>
                        <li><a href="#">Collections</a></li>
                    </ul>
                </li>
                <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
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
    <h1><strong>TOP BLOGS</strong></h1>
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
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
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
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
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
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
        </div>
    </div>
</div>

<br><br><br>

<div class="bg-1">
    <div class="container">
        <div class="row text-center">
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a target="_blank" href="Resources/imageAddArticle2.jpg">
                        <img src="Resources/imageAddArticle2.jpg">
                    </a>
                    <h3><strong>ArticleTitle1</strong></h3>
                    <p>Date Posted</p>
                    <button class="btn">Read..</button>
                </div>
                <!--<form action="/html/tags/html_form_tag_action.cfm" method="post">-->
                    <!--<div>-->
                        <!--<textarea name="comments" id="comments" style="font-family:sans-serif;font-size:1.2em;">comment box</textarea>-->
                    <!--</div>-->
                    <!--<input type="submit" value="Submit">-->
                <!--</form>-->
            </div>
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a target="_blank" href="Resources/imageAddArticle2.jpg">
                        <img src="Resources/imageAddArticle2.jpg">
                    </a>
                    <h3><strong>ArticleTitle2</strong></h3>
                    <p>Date Posted</p>
                    <button class="btn">Read..</button>
                </div>
                <!--<form action="/html/tags/html_form_tag_action.cfm" method="post">-->
                    <!--<div>-->
                        <!--<textarea name="comments" id="comments" style="font-family:sans-serif;font-size:1.2em;">comment box</textarea>-->
                    <!--</div>-->
                    <!--<input type="submit" value="Submit">-->
                <!--</form>-->
            </div>
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a target="_blank" href="Resources/imageAddArticle3.jpg">
                        <img src="Resources/imageAddArticle3.jpg">
                    </a>
                    <h3><strong>ArticleTitle3</strong></h3>
                    <p>Date Posted</p>
                    <button class="btn">Read..</button>
                </div>
                <!--<form action="/html/tags/html_form_tag_action.cfm" method="post">-->
                    <!--<div>-->
                        <!--<textarea name="comments" id="comments" style="font-family:sans-serif;font-size:1.2em;">comment box</textarea>-->
                    <!--</div>-->
                    <!--<input type="submit" value="Submit">-->
                <!--</form>-->
            </div>
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a target="_blank" href="Resources/imageAddArticle4.jpg">
                        <img src="Resources/imageAddArticle4.jpg">
                    </a>
                    <h3><strong>ArticleTitle4</strong></h3>
                    <p>Date Posted</p>
                    <button class="btn">Read..</button>
                </div>
                <!--<form action="/html/tags/html_form_tag_action.cfm" method="post">-->
                    <!--<div>-->
                        <!--<textarea name="comments" id="comments" style="font-family:sans-serif;font-size:1.2em;">comment box</textarea>-->
                    <!--</div>-->
                    <!--<input type="submit" value="Submit">-->
                <!--</form>-->
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