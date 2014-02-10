<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 1/28/14
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>RecycleTracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />"/>
    <link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />"/>
    <link rel="stylesheet" href="<c:url value="/css/bootstrap-responsive.min.css" />"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
    <body>

    <div class="container">

        <!-- Static navbar -->
        <div class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">RecycleTracker</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">RecycleTracker</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Buildings <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <c:forEach var="building" items="${buildings}" >
                                <li><a href = "${building}/">${building}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    <div class="pagination-centered">
        <img src="<c:url value="/images/recycletrackerlogo.png" />" alt="logo" id="logo" >
    </div>
</div>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="<c:url value="/js/bootstrap.min.js" />"></script>
        <script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>


</body>
</html>