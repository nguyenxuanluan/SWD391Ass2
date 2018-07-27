<%-- 
    Document   : createdocument
    Created on : Jul 16, 2018, 9:12:32 PM
    Author     : Hoang Hiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<form action="CreateDocumentController" method="post" enctype="multipart/form-data" style="background-color: white">
    <div class="panel-heading" style="background-color: #44474c">
        <h3 style="color: white"><b>Upload your document</b></h3>
    </div>
    <br>
    <br>
    <b style="margin-left: 10px">Title</b>:<br><br>
    <input size="50" type="text" name="title" value="" style="margin-left: 20px">
    <br>
    <br>
    <b style="margin-left: 10px">Content</b>:<br><br>
    <textarea width="50" type="text" name="content" value="" style="margin-left: 20px"></textarea>
    <br>
    <br>

    <br>
    <br>
    <b style="margin-left: 10px">Attach File:</b><br>
    <input type="file" name="file" style="margin-left: 20px">
    <br>
    <input type="submit" value="Upload" style="margin-left: 20px">
    <br>
    <br>
</form> 
    <script>
        function addUserId(userName){
            console.log("a");
            document.getElementById("coauthor").value+=userName+",";
        }
    </script>
    