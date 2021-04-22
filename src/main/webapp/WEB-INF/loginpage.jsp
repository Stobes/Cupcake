<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="background-div">
            <div class="py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h2 class="display-5">Olsker Cupcakes</h2>
                <p class="lead">Log venligst ind</p>
            </div>
            <div class="bg-light mx-auto mb-4" style="width: 80%; height: 300px; border-radius: 21px 21px 21px 21px;">
                <div style="margin-top: 3em; margin-bottom: 3em;">
                    <div style="padding-top: 1em;" class="container">
                        <form name="login" action="${pageContext.request.contextPath}/fc/logincommand"  method="POST">
                            <div class="row mb-3 mt-5">
                                <label class="col-sm-1 col-form-label" for="email">Email</label>
                                <div class="col-sm-4" id="email">
                                    <input class="form-control" type="text" name="email" placeholder="cupcakes@olsker.dk">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-1 col-form-label" for="password">Password</label>
                                <div class="col-sm-4" id="password">
                                    <input class="form-control" type="password" name="password" placeholder="chokolade">
                                </div>
                            </div>
                            <c:if test="${requestScope.error != null }">
                                <p style="color:red">
                                        ${requestScope.error}
                                </p>
                            </c:if>

                            <c:if test="${not empty param.msg}">
                                <p style="font-size: large">${param.msg}</p>
                            </c:if>
                            <button class="btn btn-primary" type="submit" value="Login">Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="mx-auto mb-4" style="width: 80%; height: 100px; border-radius: 21px 21px 21px 21px; background-color: rebeccapurple">
            </div>
        </div>
    </jsp:body>
</t:genericpage>
