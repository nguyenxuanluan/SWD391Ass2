<%-- 
    Document   : createdocument
    Created on : Jul 16, 2018, 9:12:32 PM
    Author     : Hoang Hiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<h3>Change Document:</h3>
<jsp:useBean id="dao" class="model.UserDAO"/>
<jsp:useBean id="documentDAO" class="model.DocumentDAO"/>

<c:set var="document" value="${documentDAO.getDocumentById(param.documentID)}"/>
<form action="ChangeDocumentController" method="post" enctype="multipart/form-data">
    <input type="hidden"  name="documentID" value="${param.documentID}">
    Title:<br>
    <input size="50" type="text" name="title" value="${document.title}">
    <br>
    Content:<br>
    <textarea width="50" type="text" name="content" value="">${document.content}</textarea>
    <br>
    

    
    Attach File:<br>
    <input type="file" name="file">
    <br><br>
    <input type="submit" value="Update">
</form> 
