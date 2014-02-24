<%--
  Created by IntelliJ IDEA.
  User: alexthornburg
  Date: 2/21/14
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />"/>
    <title>Home</title>
</head>

<body>
<jsp:include page="../pages/topMenu.jsp" />
<h1 id="banner">Unauthorized</h1>
<hr/>

<p class="message">Access denied!</p>
</body>
</html>