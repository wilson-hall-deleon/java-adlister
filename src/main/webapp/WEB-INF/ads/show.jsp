<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="col-md-6">
        <h2><c:out value="${ad.title}"/></h2>
        <p><c:out value="${ad.description}"/></p>
    </div>
    <div>
        <p>Posted by <c:out value="${user.username}"/></p>
        <p>Contact: <c:out value="${user.email}"/></p>
    </div>
</div>
</body>
</html>
