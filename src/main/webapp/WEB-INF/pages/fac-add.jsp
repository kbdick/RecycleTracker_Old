<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 3/12/14
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
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
${result}
<div class="container">
    <form accept-charset="UTF-8" action="facility" class="form-horizontal"
          id="addFacility" method="post" prependId = "false">
        <legend>Add Facility</legend>
        <div class="control-group string required">
            <label class="string required control-label" for="name"><abbr title="required">*</abbr>Name</label>
            <div class="controls">
                <input class="string required span6" id="name" name="name" size="50" type="text">
            </div>
        </div>
        <div class="control-group string required">
            <label class="string required control-label" for="address"><abbr title="required">*</abbr>Address</label>
            <div class="controls">
                <input class="string required span6" id="address" name="address" size="50" type="text">
            </div>
        </div>

        <div class="control-group integer required">
            <label class="integer required control-label" for="barcodeId"><abbr title="required">*</abbr>BarcodeId</label>
            <div class="controls">
                <input class="integer span6" id="barcodeId" name="barcodeId" size="50" type="integer">
            </div>
        <div class="control-group string">
         <label class="string control-label" for="scrollbar">Scrolling Text</label>
                <div class="controls">
                    <input class="string span6" id="scrollbar" name="scrollbar" size="50" type="text">
                </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" name="commit" type="submit" value="Create Facility">
            <a class="btn btn-danger" href="<c:url value="/"/>">Cancel</a>
        </div>
    </form>
</div>
<hr>
<footer>
    <p>Recycle Tracker</p>
</footer>
</body>

</html>