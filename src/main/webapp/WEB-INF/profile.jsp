<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <jsp:include page="/WEB-INF/partials/navbar-conditional.jsp"/>

    <div class="container">
        <h1>Welcome, <c:out value="${sessionScope.user.username}"/>!</h1>
        <hr>
        <c:if test="${noAds}">
            <p>You haven't created any ads yet!</p>
        </c:if>
        <c:if test="${not empty ads}">
            <h2>Your ads</h2>
            <c:forEach var="ad" items="${ads}">
                <div class="col-md-6">
                    <h2>
                        <a href="<c:url value='/ads/show?id=${ad.id}'/>">
                            <c:out value="${ad.title}" />
                        </a>
                    </h2>
                    <p><c:out value="${ad.description}"/></p>
                    <form method="post" action="/ads/delete">
                        <input type="hidden" name="id" value="${ad.id}">
                        <button type="submit" class="btn btn-danger delete-btn">Delete</button>
                    </form>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script>
        $('.delete-btn').on('click', function(e) {
            e.preventDefault();
            if (confirm('Are you sure you want to delete this ad?')) {
                $(this).parent('form').submit();
            } else {
                return false;
            }
        });
    </script>
</body>
</html>
