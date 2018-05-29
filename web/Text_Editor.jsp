<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Article Editor</title>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"
            integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="Text_Editor.css">
</head>
<body onload="enableEditMode();">
<div>
    <button type="button" onclick="execCmd('bold');"><i class="fa fa-bold"></i></button>
    <button type="button" onclick="execCmd('italic');"><i class="fa fa-italic"></i></button>
    <button type="button" onclick="execCmd('underline');"><i class="fa fa-underline"></i></button>
    <button type="button" onclick="execCmd('strikethrough');"><i class="fa fa-strikethrough"></i></button>
    <button type="button" onclick="execCmd('justifyLeft');"><i class="fa fa-align-left"></i></button>
    <button type="button" onclick="execCmd('justifyRight');"><i class="fa fa-align-right"></i></button>
    <button type="button" onclick="execCmd('justifyCenter');"><i class="fa fa-align-center"></i></button>
    <button type="button" onclick="execCmd('justifyFull');"><i class="fa fa-align-justify"></i></button>
    <button type="button" onclick="execCmd('cut');"><i class="fa fa-cut"></i></button>
    <button type="button" onclick="execCmd('copy');"><i class="fa fa-copy"></i></button>
    <button type="button" onclick="execCmd('indent');"><i class="fa fa-indent"></i></button>
    <!--<button type="button" onclick="execCmd('outdent');"><i class="fa fa-dedent"></i></button>-->
    <button type="button" onclick="execCmd('subscript');"><i class="fa fa-subscript"></i></button>
    <button type="button" onclick="execCmd('superscript');"><i class="fa fa-superscript"></i></button>
    <button type="button" onclick="execCmd('undo');"><i class="fa fa-undo"></i></button>
    <button type="button" onclick="execCmd('redo');"><i class="fa fa-redo"></i></button>
    <button type="button" onclick="execCmd('insertUnorderedList');"><i class="fa fa-list-ul"></i></button>
    <button type="button" onclick="execCmd('insertOrderedList');"><i class="fa fa-list-ol"></i></button>
    <button type="button" onclick="execCmd('insertParagraph');"><i class="fa fa-paragraph"></i></button>
<select onchange="execCommandWithArg('formatBlock', this.value);">
    <option value="H1">H1</option>
    <option value="H2">H2</option>
    <option value="H3">H3</option>
    <option value="H4">H4</option>
    <option value="H5">H5</option>
    <option value="H6">H6</option>
</select>
    <button type="button" onclick="execCmd('insertHorizontalRule');">HR</button>
    <button type="button" onclick="execCommandWithArg('createLink', prompt('Enter a URL','http://'));"><i class="fa fa-link"></i></button>
    <button type="button" onclick="execCmd('unlink');"><i class="fa fa-unlink"></i></button>
    <button type="button" onclick="toggleSource();"><i class="fa fa-code"></i></button>
    <button type="button" onclick="toggleEdit();">Toggle Edit</button>
    <br>
<select onchange="execCommandWithArg('fontName', this.value);">
    <option value="Arial">Arial</option>
    <option value="Times New Roman">Times New Roman</option>
    <option value="Comic Sans MS">Comic Sans MS</option>
    <option value="Courier">Courier</option>
    <option value="Georgia">Georgia</option>
    <option value="Tahoma">Tahoma</option>
    <option value="Verdana">Verdana</option>
</select>
<select onchange="execCommandWithArg('fontSize', this.value);">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="6">7</option>
</select>
Fore Color: <input type="color" onchange="execCommandWithArg('foreColor', this.value);">
Background: <input type="color" onchange="execCommandWithArg('hiliteColor', this.value);">
<button type="button" onclick="execCommandWithArg('insertImage', prompt('Enter the image URL',''));"><i class="fa fa-file-image"></i></button>
</div>
<br>
<br>
<iframe name="richTextField" style="width: 1000px; height: 500px;" id = "textfield"></iframe>
<script type="text/javascript">

    var showingSourceCode = false;
    var isInEditMode = true;

    function enableEditMode() {
        richTextField.document.designMode = 'On';
    }

    function execCmd(command) {
        richTextField.document.execCommand(command, false, null);
    }
    
    function execCommandWithArg(command, arg) {
        richTextField.document.execCommand(command, false, arg);
    }
    
    function toggleSource() {
       if (showingSourceCode){
           richTextField.document.getElementsByTagName('body')[0].innerHTML =  richTextField.document.getElementsByTagName('body')[0].textContent;
           showingSourceCode = false;
       }else {
           richTextField.document.getElementsByTagName('body')[0].textContent =  richTextField.document.getElementsByTagName('body')[0].innerHTML;
           showingSourceCode = true;
       }
    }

    function toggleEdit() {
        if (isInEditMode){
            richTextField.document.designMode = 'Off';
            isInEditMode = false;
        }else {
            richTextField.document.designMode = 'On';
            isInEditMode = true;
        }

    }

</script>
</body>
</html>