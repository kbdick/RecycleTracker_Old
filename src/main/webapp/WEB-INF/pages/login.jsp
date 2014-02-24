<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 2/21/14
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
<title>RecycleTracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- FontAwesome CSS -->
<link href="<c:url value="/css/font-awesome.css" />" rel="stylesheet">

<!-- RecycleTracker CSS -->
<link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<!-- jquery d3js datejs-->
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

<!-- full screen mode for android devices with site launched from home screen -->
<meta name="mobile-web-app-capable" content="yes">

<!-- jquery cycle -->
<script type="text/javascript">
    $(function() {
        $('#slideshowmain').cycle();
        function onBefore() {
            $('#title').html(this.alt);
        }
    });
</script>

</head>
<body>
<sec:authorize access="isAuthenticated()">
    Username: <sec:authentication property="principal.username" />
    Role: <sec:authentication property="principal.authorities"/>
</sec:authorize>
<div class="container">
    <c:if test="${not empty message}">
        <div class="span6 offset2 alert">${message}</div>
    </c:if>
    <div class="span6 offset2 well">
        <form class="form-horizontal" action="<c:url value="/j_spring_security_check"/>" method="post">
            <legend>Sign In</legend>
            <div class="control-group">
                <label class="control-label" for="j_username">Username</label>
                <div class="controls">
                    <input type="text" id="j_username" name="j_username" placeholder="User Name">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="j_password">Password</label>
                <div class="controls">
                    <input type="password" id="j_password" name="j_password" placeholder="Password">
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-primary">Sign in</button>
                    <button type="submit" class="btn btn-danger">Reset</button>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    Not a User? <a href="<c:url value="/user/add"/>">Register Here</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>