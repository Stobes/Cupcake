<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>


<t:genericpage>


    <jsp:attribute name="header">
         Homepage
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <div class="background-div">
            <div class="py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h2 class="display-5">Velkommen til Olsker Cupcakes</h2>
                <p class="lead">Øens bedste cupcakes. Vælg og bestil her:</p>
            </div>
            <div class="bg-light mx-auto mb-4"
                 style="width: 80%; height: 400px; min-height: 300px; border-radius: 21px 21px 21px 21px;">
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/cartcommand">
                            <div class="row">
                                <div class="col">
                                    <br>
                                    <br>
                                    Øens bedste cupcakes. Vælg og bestil her:
                                    <br>
                                    <br>
                                    <div class="form-group">
                                        <label class="form-check-label" for="bottom">Vælg en bund:</label>
                                        <select class="form-control" name="bottom" id="bottom">
                                            <c:forEach var="bottom" items="${applicationScope.bottomList}">
                                                <option value="${bottom.id}">${bottom.description} - ${bottom.price} kr.</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <div class="form-group">
                                        <label class="form-check-label" for="topping">Vælg en topping:</label>
                                        <select class="form-control" name="topping" id="topping">
                                            <c:forEach var="topping" items="${applicationScope.bottomList}">
                                                <option value="${topping.id}">${topping.description} - ${topping.price} kr.</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <div class="form-group">
                                        <label for="quantity">Vælg et antal:</label>
                                        <select class="form-control" name="quantity" id="quantity">
                                            <c:forEach var="quantity" begin="1" end="5">
                                                <option value="${quantity}">${quantity}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${requestScope.error != null}">
                                <p style="color: #2c2c2c;">
                                        ${requestScope.error}
                                </p>
                            </c:if>
                            <br/>
                            <button type="submit" class="btn btn-primary">Tilføj Til kurv</button>

                        </form>
                    </div>
                </div>
            </div>
            <div class="mx-auto mb-4"
                 style="width: 80%; height: 100px; border-radius: 21px 21px 21px 21px; background-color: rebeccapurple">
            </div>
        </div>


    </jsp:body>
</t:genericpage>