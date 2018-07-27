<%-- 
    Document   : document
    Created on : Jul 16, 2018, 9:26:23 PM
    Author     : Hoang Hiep
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

    <jsp:useBean id="dao" class="model.DocumentDAO"/>
    <jsp:useBean id="likeDocumentDAO" class="model.LikeDocumentDAO"/>
    
    <div class="panel panel-info" style="background-color: #4f4d4d">
        <div class="panel-heading" style="background-color: #44474c">
            <h4 style="color: white" align="center"><b>Documents</b></h4>
        </div>
        <div class="panel-body">
            
            
            <c:forEach items="${dao.findAllDocument()}" var="i">
                <div class="media">
                 <div class="media-body">
                     <h4 class="media-heading" ><a href="DocumentController?documentid=${i.documentID}" style="color:#99ffff">${i.title}</a></h4>
                    <p style="color: white">${i.content}</p>
                    <span class='date' style="color: white"> ${i.getStringFromDate()}</span>
                    
                    <c:if test = "${sessionuser != null}">
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(sessionmemberid, i.documentID)==false}">
                        <a class="like" style="float: left"href="LikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-up'></span></a>
                        </c:if>
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(sessionmemberid, i.documentID)==true}">
                        <a  class="like" href="DislikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-down'></span></a>
                        </c:if>
                    </c:if>
                </div>
            </div>
            </c:forEach>

        </div>


    </div>

    <br>
    <br>
    <br>
