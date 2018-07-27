<%-- 
    Document   : Login
    Created on : Jul 24, 2018, 8:50:55 PM
    Author     : Ice Fox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>Acadelib login</title>
        <style>
            body{
                h1 {
                    color: #FFFFFF;
                }
            }
        </style>

        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

        <link rel="stylesheet" href="css/loginstyle.css">


    </head>

    <body>
        <div class="login-wrap">
            <div class="login-html">
                <h1 style="color: white">ACADELIB</h1>
                <h3 style="color: white">Document for your life</h3>
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <form method="POST" action="LoginController">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="email" type="text" name="name" class="input">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" name="password" class="input" data-type="password">
                            </div>
                            <div class="group">
                                <input id="check" type="checkbox" class="check" checked>
                                <label for="check"><span class="icon"></span> Keep me Signed in</label>
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Login">
                            </div>
                        </form>>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a href="#forgot">Forgot Password?</a>
                        </div>
                    </div>
                    <div class="sign-up-htm">
                        <form method="POST" action="SignupController">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="user" type="text" class="input" name="name">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="password">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Email Address</label>
                                <input id="pass" type="text" class="input" name="email">
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Sign Up">
                            </div>
                        </form>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <label for="tab-1">Already Member?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>

</html>

