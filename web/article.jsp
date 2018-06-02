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
    <c:if test="${Edited}">
        <h6 style="color:red; text-align: center; font-weight: bold">Article Edited</h6>
    </c:if>
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
    <c:if test="${Owner}">
        <form action="./ArticleCreation"  style="display: inline">
            <input type="submit" class="btn" style="background-color: #4CAF50" value="Edit">
            <input type="hidden" value="${article.getId()}" name="article">
        </form>
        <form action="./ArticleDeletion#user-articles" style="display: inline">
            <input type="submit" class="btn" style="background-color: #fb2525" value="Delete">
            <input type="hidden" value="${article.getId()}" name="article">
        </form>
        <br>
        <br>
    </c:if>
    <!--REPLACES THE COMMENT BOX SECTION-->
    <div class="detailBox">
        <div class="titleBox">
            <label>Comment Box</label>
        </div>
        <div class="actionBox">
            <ul class="commentList">
                <c:choose>
                    <c:when test="${comments.size()!=0}">
                        <c:forEach items="${comments}" var="c">
                            <c:if test="${!c.isHidden() || isAdmin}">
                            <li>
                                <div class="commenterImage">
                                    <img src="Avatars/${icons.get(c.getUserName())}" style="display:inline;">
                                    <p style="display: inline"><strong>${c.getUserName()}</strong></p>
                                </div>
                                <div class="commentText">
                                    <p class="">${c.getText()}</p>
                                    <br>
                                    <span class="date sub-text">on ${c.getDate()}</span>
                                </div>
                                <br>
                                <c:if test="${LoggedIn&&(username==c.getUserName()||username==article.getAuthor())}">
                                    <form action="./DeleteComment" method="post" style="display: inline">
                                        <input hidden value="${c.getComment_id()}" name="comment_id">
                                        <input hidden value="${article.getId()}" name="article_id">
                                        <input type="submit" value="Delete">
                                    </form>
                                </c:if>
                                <c:if test="${LoggedIn}">
                                    <form action="./NewComment" method="post" style="display: inline" id="subCommentForm">
                                        <input hidden value="${c.getComment_id()}" name="comment_id">
                                        <input hidden value="${article.getId()}" name="articleId">
                                        <input value="${username}" name="username" hidden>
                                        <input name = "comments" hidden class="subCommentContent" required>
                                        <input type="submit" value="Reply" class="replyButton">
                                    </form>
                                </c:if>
                                <c:choose>
                                    <c:when test="${isAdmin && c.isHidden()}">
                                        <form action="./CommentViewChange" method="post" style="display: inline">
                                            <input hidden value="${c.getComment_id()}" name="comment_id">
                                            <input hidden value="${c.isHidden()}" name="visibility">
                                            <input hidden value="${article.getId()}" name="article">
                                            <input type="submit" value="Show" style="background-color: #4CAF50">
                                        </form>
                                    </c:when>
                                    <c:when test="${isAdmin && !c.isHidden()}">
                                        <form action="./CommentViewChange" method="post" style="display: inline">
                                            <input hidden value="${c.getComment_id()}" name="comment_id">
                                            <input hidden value="${c.isHidden()}" name="visibility">
                                            <input hidden value="${article.getId()}" name="article">
                                            <input type="submit" value="Hide" style="background-color: orange">
                                        </form>
                                    </c:when>
                                </c:choose>
                            </li>
                                <c:if test="${childComments.containsKey(c.getComment_id())}">
                                    <c:forEach items="${childComments.get(c.getComment_id())}" var="d">
                                        <c:if test="${!d.isHidden() || isAdmin}">
                                        <li style="margin-left: 50px">
                                            <div class="commenterImage">
                                                <img src="Avatars/${icons.get(d.getUserName())}" style="display:inline;">
                                                <p style="display: inline"><strong>${d.getUserName()}</strong></p>
                                            </div>
                                            <div class="commentText">
                                                <p class="">${d.getText()}</p>
                                                <br>
                                                <span class="date sub-text">on ${d.getDate()}</span>
                                            </div>
                                            <br>
                                            <c:if test="${LoggedIn&&(username==d.getUserName()||username==article.getAuthor())}">
                                                <form action="./DeleteComment" method="post" style="display: inline">
                                                    <input hidden value="${d.getComment_id()}" name="comment_id">
                                                    <input hidden value="${article.getId()}" name="article_id">
                                                    <input type="submit" value="Delete">
                                                </form>
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${isAdmin && d.isHidden()}">
                                                    <form action="./CommentViewChange" method="post" style="display: inline">
                                                        <input hidden value="${d.getComment_id()}" name="comment_id">
                                                        <input hidden value="${d.isHidden()}" name="visibility">
                                                        <input hidden value="${article.getId()}" name="article">
                                                        <input type="submit" value="Show" style="background-color: #4CAF50">
                                                    </form>
                                                </c:when>
                                                <c:when test="${isAdmin && !d.isHidden()}">
                                                    <form action="./CommentViewChange" method="post" style="display: inline">
                                                        <input hidden value="${d.getComment_id()}" name="comment_id">
                                                        <input hidden value="${d.isHidden()}" name="visibility">
                                                        <input hidden value="${article.getId()}" name="article">
                                                        <input type="submit" value="Hide" style="background-color: orange">
                                                    </form>
                                                </c:when>
                                            </c:choose>
                                        </li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p><strong>There are no comments on this article</strong></p>
                    </c:otherwise>
                </c:choose>
            </ul>
            <c:if test="${LoggedIn}">
            <form class="form-inline" role="form" action="./NewComment" method="post">
                <input value="${username}" name="username" hidden>
                <input value="${article.getId()}" name="articleId" hidden>
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="Your comments" name="comments" id="commentBox" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-default">Post</button>
                </div>
            </form>
            </c:if>
        </div>
    </div>
    <br>
    <p><a href="#top">Back To Top</a></p>
</div>


<div class="bgimg-2">
    <div class="caption">
        <a href="Home.jsp"><span class="border">Home</span> </a>
    </div>
</div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
             $('.replyButton').click(function () {
                 $('.subCommentContent').val($('#commentBox').val())
             })
        </script>

</body>
</html>