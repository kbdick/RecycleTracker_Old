<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 1/28/14
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <form action="day/add" method="post">
        <input type="hidden" name="id">
        <label for="date">Date</label>
        <input type="datetime" id="date" name="date"/>
        <label for="wetTrash">Wet Trash</label>
        <input type="text" id="wetTrash" name="wetTrash"/>
        <label for="recycling">Recycling</label>
        <input type="text" id="recycling" name="recycling"/>
        <label for="diversion1">Diversion 1</label>
        <input type="text" id="diversion1" name="diversion1"/>
        <label for="diversion2">Diversion 2</label>
        <input type="text" id="diversion2" name="diversion2"/>
        <label for="metal">Metal</label>
        <input type="text" id="metal" name="metal"/>
        <label for="flourescent">Florescent</label>
        <input type="text" id="flourescent" name="flourescent"/>
        <label for="batteries">Batteries</label>
        <input type="text" id="batteries" name="batteries"/>
        <label for="electronics">Electronics</label>
        <input type="text" id="electronics" name="electronics"/>
        <label for="ballasts">Ballasts</label>
        <input type="text" id="ballasts" name="ballasts"/>
        <label for="compostTons">Compost (Tons)</label>
        <input type="text" id="compostTons" name="compostTons"/>
        <label for="openTop">Open Top</label>
        <input type="text" id="openTop" name="openTop"/>
        <label for="building">Building</label>
        <input type="text" id="building" name="building"/>
        <input type="submit" value="Submit"/>
    </form>

    <table border="1">
        <c:forEach var="recycleDays" items="${recycleList}">
            <tr>
                <td>${recycleDays.date}</td><td><input type="button" value="delete" onclick="window.location='day/delete?id=${recycleDays.id}'"/></td>
            </tr>
        </c:forEach>
    </table>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="<c:url value="/js/bootstrap.min.js" />"></script>
        <script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
</body>
</html>