<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user.username == null}">
  <script>
    document.getElementById("logged-in").style.display = "none";
    document.getElementById("logged-out").style.display = "block";
  </script>
</c:if>

<c:if test="${sessionScope.user.username != null}">
  <script>
    document.getElementById("logged-out").style.display = "none";
    document.getElementById("logged-in").style.display = "block";
  </script>
</c:if>