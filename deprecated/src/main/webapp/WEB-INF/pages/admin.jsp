<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 3/11/14
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
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
    <script src="https://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

    <!-- basic royalslider stylesheet -->
    <link rel="stylesheet" href="../../js/royalslider/royalslider.css">

    <!-- skin stylesheet (change it if you use another) -->
    <link rel="stylesheet" href="../../js/royalslider/skins/minimal-white/rs-minimal-white.css">

    <link rel="stylesheet" href="../../js/slidebars/0.9/slidebars.min.css">
    <link rel="stylesheet" href="../../js/slidebars/0.9/slidebars-theme.css">

    <script src="../../js/slidebars/0.9/slidebars.min.js"></script>


    <!-- Main slider JS script file -->
    <!-- Create it with slider online build tool for better performance. -->
    <script src="../../js/royalslider/jquery.royalslider.min.js"></script>

    <!-- full screen mode for android devices with site launched from home screen -->
    <meta name="mobile-web-app-capable" content="yes">

</head>
<body>
<div class="btn-group btn-group-justified">
    <div class="btn-group">
        <a href ="admin/add/facility">
            <button type="button" class="btn btn-default">Add Facility</button>
        </a>
    </div>
    <div class="btn-group">
        <a href ="admin/add/floor">
            <button type="button" class="btn btn-default">Add Floor</button>
        </a>
    </div>
    <div class="btn-group">
        <a href ="admin/add/unit">
            <button type="button" class="btn btn-default">Add Unit</button>
        </a>
    </div>
    <div class="btn-group">
        <a href ="admin/add/waste">
            <button type="button" class="btn btn-default">Add Waste Type</button>
        </a>
    </div>
    <div class="btn-group">
        <a href ="user/add">
            <button type="button" class="btn btn-default">Add User</button>
        </a>
    </div>
</div>
<c:if test="${flag == 'nothing'}">
    <p>Add Some Stuff!<p>
</c:if>

 <c:if test="${flag == 'something'}">
<h1>Facilities</h1>
<table class="table">
    <thead>
    <tr>
        <th>Facility Name</th>
        <th>Address</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>${facility.name}</td>
            <td>${facility.address}</td>
            <td><input type="button" value="delete" class = "btn btn-danger" onclick="window.location='admin/facility/delete?id=${facility.id}'"/></td>
        </tr>
    <tr>
    </tbody>
</table>

<c:if test="${floorFlag == 'something'}">
<h1>Floors</h1>
<table class="table">
    <thead>
    <tr>
        <th>Floor Barcode</th>
        <th>Floor Number</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="floors" items="${floors}">
        <tr>
            <td>${floors.barcodeId}</td>
            <td>${floors.floorNumber}</td>
            <td><input type="button" value="delete" class = "btn btn-danger" onclick="window.location='admin/floor/delete?id=${floor.id}'"/></td>
        </tr>
    </c:forEach>
    <tr>
    </tbody>
</table>
</c:if>

<c:if test="${unitFlag == 'something'}">
<h1>Units</h1>
<table class="table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Suite Number</th>
        <th>Floor Number</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="units" items="${units}">
        <tr>
            <td>${units.name}</td>
            <td>${units.suiteNumber}</td>
            <td>${units.floorNumber}</td>
            <td><input type="button" value="delete" class = "btn btn-danger" onclick="window.location='admin/unit/delete?id=${units.id}'"/></td>
        </tr>
    </c:forEach>
    <tr>
    </tbody>
</table>
</c:if>

<c:if test="${binFlag == 'something'}">
<h1>Bins</h1>
<table class="table">
    <thead>
    <tr>
        <th>Date</th>
        <th>Suite</th>
        <th>Weight</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="bin" items="${bins}">
        <tr>
            <td>${bin.date}</td>
            <td>${bin.suiteNumber}</td>
            <td>${bin.weight}</td>
            <td><input type="button" value="delete" class = "btn btn-danger" onclick="window.location='day/delete?id=${recycleDays.id}'"/></td>
        </tr>
    </c:forEach>
    <tr>
    </tbody>
</table>
    </c:if>
</c:if>


</body>
</html>