<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <meta name="theme-color" content="#7952b3">
</head>

<body>
    <header style="min-height: 20vh; ">
        <img src="${pageContext.request.contextPath}/images/banner.png" class="image-full-width"/>
        <div class="d-flex flex-column flex-md-row align-items-center p-3 pb-0 px-md-4 bg-light border-bottom shadow-sm">
            <div class="h5 my-0 me-md-auto fw-normal">
                <p style="font-size: larger">
                    <jsp:invoke fragment="header"/>
                </p>
            </div>
            <nav class="my-2 my-md-0 me-md-3">
                <c:if test="${addHomeLink == null }">
                    <a class="p-2 text-dark" href="<%=request.getContextPath()%>">Hjem</a>
                </c:if>
                <a class="p-2 text-dark" href="#">Ordrer</a>
                <c:if test="${sessionScope.role == null}">
                    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/loginpage">Konto</a>
                </c:if>
                <c:if test="${sessionScope.role == 'customer'}">
                    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/customerpage">Konto</a>
                </c:if>
                <c:if test="${sessionScope.role == 'employee'}">
                    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/fc/employeepage">Konto</a>
                </c:if>
            </nav>

            <div>
                <c:if test="${sessionScope.user != null }">
                    ${sessionScope.user.email}
                </c:if>

                <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
                <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
                <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

                <c:if test="${isNotLoginPage && isNotRegisterPage}">
                <c:if test="${sessionScope.user != null }">
                    <a type="button" class="btn btn-sm  btn-outline-secondary"
                       href="${pageContext.request.contextPath}/fc/logoutcommand">Logout</a>
                </c:if>
                <c:if test="${sessionScope.user == null }">
                    <a type="button" class="btn btn-sm  btn-outline-secondary"
                       href="${pageContext.request.contextPath}/fc/loginpage">Login</a>
                    <a type="button" class="btn btn-sm  btn-outline-secondary"
                       href="${pageContext.request.contextPath}/fc/registerpage">Sign up</a>
                </c:if>
            </div>
            </c:if>
        </div>
    </header>
    <div>
        <div class="w-100" style="background-color: rebeccapurple">
            <jsp:doBody/>
        </div>

        <!-- Footer -->
        <div class="footer">
            <footer class="container py-5">
                <div class="row">
                    <div class="col-12 col-md">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img" viewBox="0 0 24 24"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
                        <ul class="list-unstyled text-small">
                            <small class="d-block mb-3 text-muted">&copy;Group B7</small>
                    </div>
                    <div class="col-6 col-md">
                        <h5>Features</h5>
                        <ul class="list-unstyled text-small">
                            <li><a class="link-secondary" href="#">Cool stuff</a></li>
                            <li><a class="link-secondary" href="#">Random feature</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5>Resources</h5>
                        <ul class="list-unstyled text-small">
                            <li><a class="link-secondary" href="#">Resource name</a></li>
                            <li><a class="link-secondary" href="#">Resource</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5>Resources</h5>
                        <ul class="list-unstyled text-small">
                            <li><a class="link-secondary" href="#">Github</a></li>
                            <li><a class="link-secondary" href="#">Education</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5>About</h5>
                        <ul class="list-unstyled text-small">
                            <li><a class="link-secondary" href="#">Team</a></li>
                            <li><a class="link-secondary" href="#">Location</a></li>
                        </ul>
                    </div>
                </div>
            </footer>
            <jsp:invoke fragment="footer"/>
        </div>
    </div>

</body>
</html>