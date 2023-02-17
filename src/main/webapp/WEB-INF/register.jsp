<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<jsp:include page="partials/navbar-conditional.jsp"/>

<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <c:choose>
                <%--missing username logic--%>
                <c:when test="${missingUsername != null}">
                    <input value="${username}" id="username" name="username" class="username" type="text" style="border: 1px solid red">
                    <span style="color: red">${missingUsername}</span>
                </c:when>
                <%--dupe username logic--%>
                <c:when test="${dupeUsername != null}">
                    <input value="${username}" id="username" name="username" class="username" type="text" style="border: 1px solid red">
                    <span style="color: red">${dupeUsername}</span>
                </c:when>
                <c:otherwise>
                    <input value="${username}" id="username" name="username" class="username" type="text">
                </c:otherwise>
            </c:choose>
        </div>
        <%--email logic--%>
        <div class="form-group">
            <label for="email">Email</label>
            <c:choose>
                <%--missing email logic--%>
                <c:when test="${missingEmail != null}">
                    <input value="${email}" id="email" name="email" class="email" type="text" style="border: 1px solid red">
                    <span style="color: red">${missingEmail}</span>
                </c:when>
                <%--dupe email logic--%>
                <c:when test="${dupeEmail != null}">
                    <input value="${email}" id="email" name="email" class="email" type="text" style="border: 1px solid red">
                    <span style="color: red">${dupeEmail}</span>
                </c:when>
                <c:otherwise>
                    <input value="${email}" id="email" name="email" class="email" type="text">
                </c:otherwise>
            </c:choose>
        </div>
        <%--empty password logic--%>
        <div class="form-group">
            <label for="password">Password</label>
            <c:choose>
                <c:when test="${missingPassword != null}">
                    <input id="password" name="password" class="password" type="password" style="border: 1px solid red">
                    <span style="color: red">${missingPassword}</span>
                </c:when>
                <c:when test="${passwordsDontMatch != null}">
                    <input id="password" name="password" class="password" type="password" style="border: 1px solid red">
                    <span style="color: red">${passwordsDontMatch}</span>
                </c:when>
                <c:otherwise>
                    <input id="password" name="password" class="password" type="password">
                </c:otherwise>
            </c:choose>
        </div>
        <%--confirm password logic--%>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <c:choose>
                <c:when test="${missingPassword != null}">
                    <input id="confirm_password" name="confirm_password" class="password" type="password" style="border: 1px solid red">
                    <span style="color: red">${missingPassword}</span>
                </c:when>
                <c:when test="${passwordsDontMatch != null}">
                    <input id="confirm_password" name="confirm_password" class="password" type="password" style="border: 1px solid red">
                    <span style="color: red">${passwordsDontMatch}</span>
                </c:when>
                <c:otherwise>
                    <input id="confirm_password" name="confirm_password" class="password" type="password">
                </c:otherwise>
            </c:choose>
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>
</body>
</html>
