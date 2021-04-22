<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Demo Page for Customer Roles
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="background-div">
            <div class="my-3 py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h2 class="display-5">Velkommen til Olsker Cupcakes</h2>
                <p class="lead">Øens bedste cupcakes. Vælg og bestil her:</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 75%; height: 300px; border-radius: 21px 21px 0 0;">
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/orderpage">
                            <div class="form-group">
                                <br>
                                <br>
                                <h1>Hello ${sessionScope.email} </h1>
                                You are now logged in as a Customer of our wonderful site.
                                Role: ${sessionScope.role}
                                <br>
                                <br>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>

