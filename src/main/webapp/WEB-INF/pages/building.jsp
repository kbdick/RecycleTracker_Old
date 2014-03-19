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

    <link href="<c:url value="/css/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet">
    <script src="<c:url value="/css/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" />"></script>

    <!-- jquery d3js datejs-->
    <script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

    <!-- full screen mode for android devices with site launched from home screen -->
    <meta name="mobile-web-app-capable" content="yes">
</head>
<body>
<div class="container">
    <form accept-charset="UTF-8" action="day/add" class="form-horizontal"
          id="addBin" method="post" prependId = "false">
        <legend>Add a Bin</legend>
        <div class="control-group string required">
            <label class="string required control-label" for="facility"><abbr title="required">*</abbr> Facility</label>
            <div class="controls">
                <input class="string required span6" id="facility" name="facility" size="50" type="text">
            </div>
        </div>
        <div class="control-group integer required">
            <label class="integer required control-label" for="suiteNumber"><abbr title="required">*</abbr> Suite Number</label>
            <div class="controls">
                <input class="integer required span6" id="suiteNumber" name="suiteNumber" size="50" type="integer">
            </div>
        </div>
        <div class="control-group date required">
            <label class="date required control-label" for="date"><abbr title="required">*</abbr>Date</label>
            <div class="controls">
                <input class="date required span6" id="date" name="date" size="50" type="date">
            </div>
        </div>
        <div class="control-group string required">
            <label class="string required control-label" for="weight"><abbr title="required">*</abbr> Weight</label>
            <div class="controls">
                <input class="string required span6" id="weight" name="weight" size="50" type="string">
            </div>
        </div>
        <div class="control-group string required">
            <label class="string required control-label" for="wasteType"><abbr title="required">*</abbr>Waste Type</label>
            <div class="controls">
                <input class="string required span6" id="wasteType" name="wasteType" size="50" type="string">
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" name="commit" type="submit" value="Add Bin">
            <a class="btn btn-danger" href="<c:url value="/"/>">Cancel</a>
        </div>
    </form>
</div>

<table class = "table">
    <c:forEach var="bin" items="${recycleList}">
        <tr>
            <td>${bin.date}</td>
            <td>${bin.suiteNumber}</td>
            <td>${bin.weight}</td>
            <td><input type="button" value="delete" class = "btn btn-danger" onclick="window.location='day/delete?id=${recycleDays.id}'"/></td>
        </tr>
    </c:forEach>
</table>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
</body>
</html>