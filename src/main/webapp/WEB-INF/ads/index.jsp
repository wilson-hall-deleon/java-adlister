<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<jsp:include page="/WEB-INF/partials/navbar-conditional.jsp"/>

<div class="container">
    <h1>Here Are all the ads!</h1>

    <form action="<c:url value='/ads/search'/>" method="get">
        <div class="form-group">
            <label for="search">Search Ads:</label>
            <input type="text" name="q" id="search" class="form-control" placeholder="Search adlister...">
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    <hr>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2><a href="<c:url value='/ads/show?id=${ad.id}'/>"><c:out value="${ad.title}" /></a></h2>
            <p><c:out value="${ad.description}"/></p>
        </div>
    </c:forEach>
</div>
</body>
</html>
