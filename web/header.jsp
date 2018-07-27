<%-- 
    Document   : header
    Created on : Jul 16, 2018, 4:32:41 PM
    Author     : Hoang Hiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Acadelib - Document for your life</title>
  
<!--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
      <link rel="stylesheet" href="css/test.css">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/js/bootstrap.min.js"></script>
<script src="js/js/jquery-1.11.1.min.js"></script>
<script src="js/js/test.js"></script>
      
      
</head>
<body class="home" style="font-family: Verdana,sans-serif">
  
<div class="navbar navbar-default navbar-static-top">
    
       <div id="wrapper">
        <div class="overlay"></div>
    
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="./home.jsp">
                       Acadelib
                    </a>
                </li>
                <li>
                    <a href="./home.jsp">Home</a>
                </li>
                <li>
                    <a href="./myfriend.jsp">Your friend</a>
                </li>
                <li>
                    <a href="./listrequestfriend.jsp">Friends Requests</a>
                </li>
                
                <li>
                    <a href="./createdocument.jsp">Upload document</a>
                </li>
                
                <li>
                    <a href="UserInfo?userid=${sessionScope.sessionmemberid}">Profile</a>
                </li>
                <li>
                    <a href="./LogoutController">Log out</a>
                </li>
                
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper" style="background-image: url(https://wallpaperstudio10.com/static/wpdb/wallpapers/1920x1080/151059.jpg)">
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            <div class="container">
                <div class="row" >
                    <div class="leftcolumn">
                  <div class="col-lg-8 col-lg-offset-2">
                
                  

    