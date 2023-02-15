<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<jsp:useBean id="user" scope="session" type="com.codeup.adlister.models.User"/>--%>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <!-- /.logged-out -->
        <div id="logged-out" class="navbar-links-logged-out">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">Home</a></li>
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            </ul>
        </div>
        <!-- /.logged-in -->
        <div id="logged-in" class="navbar-links-logged-in">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">Home</a></li>
                <li><a href="/profile">Profile</a></li>
                <li><a href="/logout">Log out</a></li>
            </ul>
        </div>
        <!-- /.container-fluid -->
    </div>
</nav>
