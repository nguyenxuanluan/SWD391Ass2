<%-- 
    Document   : createdocument
    Created on : Jul 16, 2018, 9:12:32 PM
    Author     : Hoang Hiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
 <div class="panel-heading" style="background-color: #0033CC">
     <h3 style="color: white"><b>Change Document:</b></h3>
</div>
<jsp:useBean id="dao" class="model.UserDAO"/>
<jsp:useBean id="documentDAO" class="model.DocumentDAO"/>

<c:set var="document" value="${documentDAO.getDocumentById(param.documentID)}"/>
<form action="ChangeDocumentController" method="post" enctype="multipart/form-data"  style="background-color: white">
    <input type="hidden"  name="documentID" value="${param.documentID}">
    <br>
    <b style="margin-left: 10px">Title:</b><br>
    <input size="50" type="text" name="title" value="${document.title}" style="margin-left: 20px">
    <br>
    <br>
    <b style="margin-left: 10px">Content:</b><br>
    <textarea width="50" type="text" name="content" value="" style="margin-left: 20px">${document.content}</textarea>
    <br>
    

    
    <b style="margin-left: 10px">Attach File:</b><br>
    <input type="file" name="file" style="margin-left: 20px">
    <br>
    <input type="submit" value="Update" style="margin-left: 20px">
    <br>
    <br>
</form> 
