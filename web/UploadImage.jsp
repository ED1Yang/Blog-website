<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Avatar cut</title>

    <link rel="stylesheet" href="image.css" type="text/css"/>

</head>
<body>
<form action="/UploadImage" method="post">
    <div class="container">
        <div class="imageBox">
            <div class="thumbBox"></div>
            <div class="spinner" style="display: none">Loading...</div>
        </div>
        <div class="action">
            <div class="new-contentarea tc">
                <a href="javascript:void(0)" class="upload-img">
                    <label for="upload-file">Upload</label>
                </a>
                <input type="file" class="" name="upload-file" id="upload-file"/>
            </div>
            <input type="submit" id="btnSave" class="Btnsty_peyton" value="Save">
            <input type="button" id="btnCrop" class="Btnsty_peyton" value="Cut">
            <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+">
            <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-">
            <c:if test="${adminUser}">
                <input type="hidden" value="true" name="adminUser">
            </c:if>
        </div>
        <div class="cropped"></div>
        <div id="text">
        <textarea hidden name="pathname" rows="10" cols="100">

        </textarea>
        </div>
    </div>
</form>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/cropbox.js"></script>
<script type="text/javascript">



    $(window).load(function () {
        var options =
            {
                thumbBox: '.thumbBox',
                spinner: '.spinner',
                imgSrc: 'Avatars/avatar.jpg'
            }
        var cropper = $('.imageBox').cropbox(options);
        $('#upload-file').on('change', function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                options.imgSrc = e.target.result;
                cropper = $('.imageBox').cropbox(options);
            }
            reader.readAsDataURL(this.files[0]);
            this.files = [];
        })
        $('#btnCrop').on('click', function () {

            var img = cropper.getDataURL();
            $('#text textarea').val(img);
            $('.cropped').html('');
            // $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:128px;margin-top:128px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
            // $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
        })
        $('#btnZoomIn').on('click', function () {
            cropper.zoomIn();
        })
        $('#btnZoomOut').on('click', function () {
            cropper.zoomOut();
        })

    });
</script>

<div style="text-align:center;clear:both;padding-top:30px">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>

</body>
</html>
