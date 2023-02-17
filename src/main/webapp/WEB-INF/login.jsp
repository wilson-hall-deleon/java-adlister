<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <jsp:include page="/WEB-INF/partials/navbar-conditional.jsp"/>
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <c:choose>
                    <%--missing username logic--%>
                    <c:when test="${missingUsername != null}">
                        <input id="username" name="username" class="form-control" type="text" style="border: 1px solid red">
                        <span style="color: red">${missingUsername}</span>
                    </c:when>
                    <c:when test="${wrongUsername != null}">
                        <input value="${username}" id="username" name="username" class="form-control" type="text" style="border: 1px solid red">
                        <span style="color: red">${wrongUsername}</span>
                    </c:when>
                    <c:otherwise>
                        <input id="username" name="username" class="form-control" type="text">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <c:choose>
                    <%--missing password logic--%>
                    <c:when test="${missingPassword != null}">
                        <input id="password" name="password" class="form-control" type="password" style="border: 1px solid red">
                        <span style="color: red">${missingPassword}</span>
                    </c:when>
                    <%--wrong password logic--%>
                    <c:when test="${wrongPassword != null}">
                        <input id="password" name="password" class="form-control" type="password" style="border: 1px solid red">
                        <span style="color: red">${wrongPassword}</span>
                    </c:when>
                    <c:otherwise>
                        <input id="password" name="password" class="form-control" type="password">
                    </c:otherwise>
                </c:choose>
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
</body>
</html>
