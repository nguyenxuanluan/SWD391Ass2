<%-- 
    Document   : footer
    Created on : Jul 16, 2018, 4:33:05 PM
    Author     : Hoang Hiep
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
</div>
<div class="col-sm-3">
    <div class="panel panel-default panel-custom">
        
        
        <div class="panel-heading">
            <div class="form-group has-feedback">
					<input type="text" class="form-control-nav" placeholder=" Search" id="search" aria-describedby="search1">
					
				</div>
             <script>
                                document.getElementById("search")
                                    .addEventListener("keyup", function(event) {
                                    event.preventDefault();
                                    if (event.keyCode === 13) {
                                        window.location.href = '/SWD391Ass2/searchresult.jsp?input='+document.getElementById("search").value;
                                    }
                                });
                            </script>
            <h3 class="panel-title">
                
            
                People you may know:

                ${message}
                
                <c:if test = "${sessionuser != null}">
                    <div class="bigRight">
                        <br>
                        <jsp:include page="AllRequestFriendSent"/>

                    </div>
                </c:if>

            </h3>
        </div>
        <div class="panel-body">

            <!-- People  -->

        </div>

    </div>
</div>
</div>
</div>
<script src="js/main.js" type="text/javascript"></script>
</body>

</html>
