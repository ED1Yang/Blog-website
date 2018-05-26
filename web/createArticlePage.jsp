<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Articles</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">-->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <link rel="stylesheet" type="text/css" href="createPageStylesheet.css">


    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</head>
<body>

    <!-- Creating the NavBar -->
    <header>
        <div class="container">
            <a href="/UserProfileServlet"><img src="Avatars/${User.getImage()}" alt="profileimg" class="profileimg"></a>
            <nav>
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <br><br>

    <!--Creating the Contents-->

    <!--<div style="background-image: url('Resources/imageMainArticle1.jpg')"></div>-->

    <div class="container">
        <h2>Post New Article</h2>
        <hr>
        <br>
    </div>

    <!-- Left-aligned media object -->



    <div class="container">
        <div class="media-left">
            <img src="Avatars/${User.getImage()}" class="media-object" style="width:60px; border-radius: 60px">
        </div>
        <div class="media-body">
            <h3 class="media-heading">${User.getUerName()}</h3>
        </div>
    </div>

    <div class="container">
        <!--<h3>Title</h3>-->
        <form action="/NewArticle" method="post">
            <!--<div class="form-group">-->
                <!--<textarea class="form-control" rows="5" id="articleTitle"></textarea>-->
            <!--</div>-->
            <br><br>

            <select class="dropdown" name="category">
                <option value="Technology">Technology</option>
                <option value="Politics">Politics</option>
                <option value="Business">Business</option>
            </select>

            <br><br>

            <div class="input-group">
                <span class="input-group-addon" style="font-size: large"><strong>Title</strong></span>
                <input id="articleTitle" type="text" class="form-control" name="articleTitle" placeholder="Type your heading here"
                       style="font-size: large;
                            font-family: 'Helvetica';">
            </div>
            <h4>Tell your story below..</h4>
            <div class="form-group">
                <textarea class="form-control" rows="5" id="articleBody" name="articleBody"></textarea>
            </div>
            <input type="hidden" value="${User.getUerName()}" name="author">
            <input type="submit" value="Publish" class="button">
        </form>
    </div>
    <br>

    <!--</div>-->
    <!--<div class="container">-->

        <!--<div class="postArticle-content"-->
             <!--contenteditable="true"-->
             <!--data-default-value="Title-->
                                     <!--Tell your story…">-->
            <!--<section class="section">-->
                <!--<div class="section-content">-->
                    <!--<div class="articleDetails">-->
                        <!--<h3 class="articleTitle">-->
                            <!--<span ><strong>Title</strong></span><br>-->
                        <!--</h3>-->
                        <!--<p class="articleBody" data-scroll="native">-->
                            <!--<span >Tell your story…<br></span><br>-->
                        <!--</p>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</section>-->
        <!--</div>-->
    <!--</div>-->

    <br><br>

    <%--<div class="container">--%>
        <%--<button type="button" class="btn btn-primary">Image</button>--%>
        <%--<button type="button" class="btn btn-primary">Video</button>--%>
        <%--<button type="button" class="btn btn-primary">Embed</button>--%>
    <%--</div>--%>

    <br><br><br>

    <footer>
        <a class="up-arrow" href="#" data-toggle="tooltip" title="TO TOP">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a><br><br>
        <p>copyright <a href="https://www.apollo.com" data-toggle="tooltip" title="Visit apolloblogs">www.apollo.com</a></p>
    </footer>

</body>
</html>
