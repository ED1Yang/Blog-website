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
            <img src="Avatars/${User.getImage()}" alt="profileimg" class="profileimg">
            <nav>
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="#">Publish</a></li>
                    <li><a href="#">Draft</a></li>
                    <!--<li><a href="#">Saved</a></li>-->

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
            <img src="Avatars/${User.getImage()}" class="media-object" style="width:60px">
        </div>
        <div class="media-body">
            <h3 class="media-heading">${User.getUerName()}</h3>
            <p>This text should to "Draft" as soon as user starts typing</p>
        </div>
    </div>

    <br><br>

    <div class="container">

        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Category
                <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><a href="#">Technology</a></li>
                <li><a href="#">Business</a></li>
                <li><a href="#">Politics</a></li>
            </ul>
        </div>
    </div>

    <br><br>

    <div class="container">
        <!--<h3>Title</h3>-->
        <form>
            <!--<div class="form-group">-->
                <!--<textarea class="form-control" rows="5" id="articleTitle"></textarea>-->
            <!--</div>-->

            <div class="input-group">
                <span class="input-group-addon" style="font-size: large"><strong>Title</strong></span>
                <input id="articleTitle" type="text" class="form-control" name="articleTitle" placeholder="Type your heading here"
                       style="font-size: large;
                            font-family: 'Times New Roman';">
            </div>

        </form>
    </div>

    <br>

    <div class="container">
        <h4>Tell your story below..</h4>
        <form>
            <div class="form-group">
                <textarea class="form-control" rows="5" id="articleBody"></textarea>
            </div>
        </form>
    </div>




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

    <div class="container">
        <button type="button" class="btn btn-primary">Image</button>
        <button type="button" class="btn btn-primary">Video</button>
        <button type="button" class="btn btn-primary">Embed</button>
    </div>

    <br><br><br>

    <footer>
        <a class="up-arrow" href="#" data-toggle="tooltip" title="TO TOP">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a><br><br>
        <p>copyright <a href="https://www.apollo.com" data-toggle="tooltip" title="Visit apolloblogs">www.apollo.com</a></p>
    </footer>

</body>
</html>
