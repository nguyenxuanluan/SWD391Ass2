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
<div class="panel-heading" style="background-color: #0033CC">
    <h3 style="color: white"><p>${err}</p></h3>
</div>
        <p style="margin-left: 10px"><b>Name</b>: ${user.userName}</p>
        <p style="margin-left: 10px"><b>Email</b>: ${user.email}</p>
</div>>
        <jsp:useBean id="dao" class="model.AuthorDocumentDAO"/>
        <c:if test = "${sessionmemberid != user.id}">  
            <!--
            <a href="AddFriendController?toUserID=}">Add Friend</a> / 
            
            <a href="AddColleagueController?toUserID=">Is Colleague</a>
            -->
        </c:if>
    <hr>
    <div class="panel panel-info">
        <div class="panel-heading" style="background-color: #0033CC">
        <c:if test = "${sessionmemberid == user.id}">  
            <b style="color: white">My Documents<b> (${dao.findDocumentByAuthorUserId(param.userid).size()})
        </c:if>  
        <c:if test = "${sessionmemberid != user.id}">  
            ${user.userName} 's Documents (${dao.findDocumentByAuthorUserId(param.userid).size()})
        </c:if>  
        </div>
        <div class="panel-body">
            <jsp:useBean id="likeDocumentDAO" class="model.LikeDocumentDAO"/>
            <c:forEach items="${dao.findDocumentByAuthorUserId(param.userid)}" var="i">
                <div class="media">
                <div class="media-body">
                    <span class='date'> ${i.publishAt}</span>
                    <h4 class="media-heading"><a href="DocumentController?documentid=${i.documentID}">${i.title}</a></h4>
                     <c:if test = "${sessionuser != null}">
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(likeDocumentDAO.convertStringToObjectId(param.userid), i.documentID)==false}">
                        <a class="like" href="LikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-up'></span></a>
                        </c:if>
                        <c:if test = "${likeDocumentDAO.checkLikeDocument(likeDocumentDAO.convertStringToObjectId(param.userid), i.documentID)==true}">
                        <a  class="like" href="DislikeDocumentController?documentID=${i.documentID}">(${likeDocumentDAO.countLikeDocument(i.documentID)} Likes) <span class='glyphicon glyphicon-thumbs-down'></span></a>
                        </c:if>
                    </c:if>
                    <p>${i.content}</p>
                    
                </div>
            </div>
            </c:forEach>

        </div>


    </div>
    

    <br>
    <br>
    <br>


