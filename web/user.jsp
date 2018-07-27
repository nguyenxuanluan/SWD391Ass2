<%-- 
    Document   : user
    Created on : Jul 14, 2018, 7:06:35 PM
    Author     : Hoang Hiep
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<div style="background-color: white">
<div class="panel-heading" style="background-color: #44474c">
    <h4 style="color: white"><p><b>${err}</b></p></h4>
</div>
        <p style="margin-left: 10px"><b>Name</b>: ${user.userName}</p>
        <p style="margin-left: 10px"><b>Email</b>: ${user.email}</p>
</div>
        <jsp:useBean id="dao" class="model.AuthorDocumentDAO"/>
        <c:if test = "${sessionmemberid != user.id}">  
            <!--
            <a href="AddFriendController?toUserID=}">Add Friend</a> / 
            
            <a href="AddColleagueController?toUserID=">Is Colleague</a>
            -->
        </c:if>
    <hr>
    <div class="panel panel-info">
        <div class="panel-heading" style="background-color: #44474c">
        <c:if test = "${sessionmemberid == user.id}">  
            <b style="color: white">My Documents (${dao.findDocumentByAuthorUserId(param.userid).size()})</b>
        </c:if>  
        <c:if test = "${sessionmemberid != user.id}">  
            <b style="color: white">${user.userName} 's Documents (${dao.findDocumentByAuthorUserId(param.userid).size()})</b>
        </c:if>  
        </div>
        <div class="panel-body">
            <jsp:useBean id="likeDocumentDAO" class="model.LikeDocumentDAO"/>
            <c:forEach items="${dao.findDocumentByAuthorUserId(param.userid)}" var="i">
                <div class="media">
                <div class="media-body">
                    
                    <h4 class="media-heading"><a href="DocumentController?documentid=${i.documentID}">${i.title}</a></h4>
                    
                    <p>${i.content}</p>
                     <c:if test = "${sessionuser != null}">
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(likeDocumentDAO.convertStringToObjectId(param.userid), i.documentID)==false}">
                        <a class="like" href="LikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-up'></span></a>
                        </c:if>
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(likeDocumentDAO.convertStringToObjectId(param.userid), i.documentID)==true}">
                        <a  class="like" href="DislikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-down'></span></a>
                        </c:if>
                    </c:if>
                        <span class='date'> ${i.getStringFromDate()}</span>
                </div>
            </div>
            </c:forEach>

        </div>


    </div>
    

    <br>
    <br>
    <br>


