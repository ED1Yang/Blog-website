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

<c:choose>
    <c:when test="${article.getGenre() == 'Business'}">
        <div class="bgimg-2">
    </c:when>
    <c:when test="${article.getGenre() == 'Technology'}">
        <div class="bgimg-1">
    </c:when>
    <c:when test="${article.getGenre() == 'Politics'}">
        <div class="bgimg-3">
    </c:when>
</c:choose>
    <div class="caption">
        <c:choose>
            <c:when test="${article.getGenre() == 'Business'}">
                <span class="border">BUSINESS</span>
            </c:when>
            <c:when test="${article.getGenre() == 'Technology'}">
                <span class="border">TECHNOLOGY</span>
            </c:when>
            <c:when test="${article.getGenre() == 'Politics'}">
                <span class="border">POLITICS</span>
            </c:when>
        </c:choose>
    </div>
</div>

<div style="color: #777;background-color:white;text-align:center;padding:50px 80px;text-align: justify;">
    <h3 style="text-align:center;">
        <strong>${article.getTitle()}</strong></h3>
    <h6 style="text-align:center;">
        Posted by: ${article.getAuthor()}</h6>
    <h6 style="text-align: center">
        Date: ${article.getDate().substring(0,11)}
    </h6>
    <p>
        ${article.getContent()}
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
        <a href="Home.jsp"> <span class="border">More stories here</span> </a>
    </div>
</div>

</body>
</html>