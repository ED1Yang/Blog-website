<%--
  Created by IntelliJ IDEA.
  User: gsik152
  Date: 24/05/2018
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="MainCSS.css">

</head>
<body>

<div class="bgimg-2">
    <div class="caption">
        <c:choose>
            <c:when test="${article.getGenre == 'Business'}">
                <span class="border">BUSINESS</span>
            </c:when>
            <c:when test="${article.getGenre == 'Technology'}">
                <span class="border">TECHNOLOGY</span>
            </c:when>
            <c:when test="${article.getGenre == 'Politics'}">
                <span class="border">POLITICS</span>
            </c:when>
        </c:choose>
        <span class="border">BUSINESS</span>
    </div>
</div>

<div style="color: #777;background-color:white;text-align:center;padding:50px 80px;text-align: justify;">
    <h3 style="text-align:center;">
        <strong>${article.getTitle}</strong></h3>
    <h6 style="text-align:center;">
        Posted by: </h6>
    <p>Lorem ipsum dolor sit amet, fabulas dolorum singulis mei eu, in vix justo nusquam. Sed at everti melius oporteat. Veniam copiosae ne sit. Ex unum dicat delicata qui, posse imperdiet ut nec, hinc mentitum appareat his ne.  Per in prima nemore ornatus, et stet lobortis mandamus mea. Quot paulo epicurei vis ei. Illum constituto vis id. Per in hendrerit deseruisse, eu ius adhuc laudem aperiri. Erat oportere nec ea, est vocent legimus platonem an. Assum nostrum ad eam, tollit laoreet eu mei, mea cotidieque eloquentiam ea.
        Lorem ipsum dolor sit amet, ne quando commune eum, te phaedrum efficiantur vis. Malis numquam maiestatis in per, placerat sadipscing te vim. Ut his epicuri concludaturque, sed agam atomorum disputationi te, sed deleniti appetere gloriatur ut. Albucius corrumpit ad sed, an feugiat inermis reprimique est.
    <p> Etiam tation detraxit eum in. Et graeco scripta sea, eu pri scripta inciderint, laudem fabulas vulputate ad has. Eam te augue semper, eu nam aeque vituperata, pro cu quis maluisset. Cum at sint persius propriae, in eos zril oblique deserunt. At vel oblique accusam dolores, tantas nostrud te eos, pro no apeirian consequuntur.</p>
    At eos simul prodesset, vim ex suas accommodare. Ad quas feugiat accusam pro, mei idque principes eu. Cu dolore deterruisset nam, posse atqui usu ut. Sea ut oporteat antiopam mediocrem. Ea per feugait omittam ponderum, voluptua moderatius mea ut. Vim in diceret fabellas, no eum sint lucilius iracundia, eum in utamur latine ullamcorper.
    At legere lobortis nec. Cu altera deleniti sea, eu qui eros dolor, cum tale imperdiet ex. Audiam democritum scriptorem eu est. In sit dicunt docendi, ei usu tractatos adolescens abhorreant.
    Te est veritus menandri, et eum assum bonorum vulputate. In eam aperiri luptatum oportere. Tation scribentur his an, laudem iriure deseruisse ne eum. Mei et tota maiorum nominati, his ferri consul incorrupte ex, est eu movet dolore. Per an augue libris regione, sint dicat iracundia cu usu.
    </p><br>
    <img src="Resources/imageMainArticle1.jpg" alt="Business"
         style="width: 98.5%;
            border: solid;
            border-color: black;
            padding: 5px;">
    <p><br>
        Lorem ipsum dolor sit amet, vel quodsi quaeque similique at, pri eu iusto malorum denique, eu sed habeo inani. An duis animal accumsan pri, vix no legimus salutatus conceptam. Nec an agam accumsan oporteat. Id vis nullam labores, ea percipit probatus his, cu modus accumsan incorrupte pri. Reque appetere ei sea, qui te cetero eligendi erroribus, vel dolorem repudiare ne.
        Tale discere legendos ut eos. Elitr disputando ex sit. Pro tota mundi no, solet maiorum no sed, purto vivendo nominavi vix an. Mel stet molestiae eu, et eos natum zril. Sit praesent voluptatum et, id nam munere dictas, sumo persius luptatum at sea. Aliquip dolorum sadipscing eam no.
        Ei his tation option, mea ea molestie tincidunt. Scripta maiestatis cu eam, eu deseruisse efficiantur vim, ne per labores vulputate scripserit. Persius recusabo vel et. Qui at etiam scripta referrentur, mei id dolorum mediocritatem, pro alterum civibus splendide ne. Vero impedit repudiare ad mea.
        Persius voluptua democritum usu ea, cu enim libris nec, an nullam recteque vix. Dico euripidis ius et, pri eu aperiri maluisset consetetur. Assum indoctum eu mei, eam ut porro graeci debitis, qui meliore rationibus dissentiet ex. Ea elit novum sit.
        Dicam quaeque an duo, usu in meliore adversarium, eos ad affert iisque. Euismod interpretaris est in, eu quo tempor dicunt eligendi. Altera aliquam et vel. In etiam principes duo, no semper debitis commune ius. Facete mediocrem mea ea.
    </p><br>
    <form action="/html/tags/html_form_tag_action.cfm" method="post">
            <textarea name="comments" id="comments"
                      style="width: 30%;
              height: 70px;
              padding: 2%;
              font-size: 1.2em;
              background-color: snow;
              color: gray;
              font-family: Tahoma;
              font-size: small;
              text-align: left">Hey.... say something nice!</textarea><br>
        <input type="submit" value="Submit" style="background-color: lightgray">
    </form>
    <br>
    <p><a href="#top">Back To Top</a></p>
</div>

<!--<div class="bgimg-2">-->
<!--<div class="caption">-->
<!--<span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">More texts below</span>-->
<!--</div>-->
<!--</div>-->

<!--<div style="position:relative;">-->
<!--<div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: justify;">-->
<!--<p>Dicam quaeque an duo, usu in meliore adversarium, eos ad affert iisque. Euismod interpretaris est in, eu quo tempor dicunt eligendi. Altera aliquam et vel. In etiam principes duo, no semper debitis commune ius. Facete mediocrem mea ea.</p>-->
<!--</div>-->
<!--</div>-->

<!--<div class="bgimg-3">-->
<!--<div class="caption">-->
<!--<span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">SCROLL UP</span>-->
<!--</div>-->
<!--</div>-->

<!--<div style="position:relative;">-->
<!--<div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: justify;">-->
<!--<p>Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>-->
<!--</div>-->
<!--</div>-->

<div class="bgimg-2">
    <div class="caption">
        <a href="#"> <span class="border">More stories here</span> </a>
    </div>
</div>

</body>
</html>