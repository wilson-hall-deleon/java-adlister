<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<jsp:include page="/WEB-INF/partials/navbar-conditional.jsp"/>

    <div class="container">
        <h1>Create a new Ad</h1>

        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input ${missingTitle != null ? 'style="border: 1px solid red;"' : ''} id="title" name="title" class="form-control" type="text" value="${title}">
                <span ${missingTitle != null ? 'style="color: red;"' : ''}>${missingTitle}</span>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea ${missingDescription != null ? 'style="border: 1px solid red;"' : ''} id="description" name="description" class="form-control" type="text">${description}</textarea>
                <span ${missingDescription != null ? 'style="color: red;"' : ''}>${missingDescription}</span>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
