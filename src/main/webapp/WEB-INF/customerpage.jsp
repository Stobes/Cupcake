<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Customer page
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>

        <div class="background-div">
            <div class="py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h2 class="display-5">Velkommen ${sessionScope.email} </h2>
                <p class="lead">Du er nu logget ind som ${sessionScope.role}</p>
            </div>
            <div class="bg-light mx-auto mb-4" style="width: 80%; height: 400px; min-height: 300px; border-radius: 21px 21px 21px 21px;">
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/orderpage">
                            <div class="form-group">
                                <br>
                                <br>
                                Øens bedste cupcakes. Vælg og bestil her:
                                <br>
                                <br>
                                <label for="bottom">Vælg en bund:</label>
                                <select name="bottom" id="bottom">
                                    <c:forEach var="bottom" items="${applicationScope.bottomMap}">
                                        <option value="${bottom.key}" value="${bottom.key}">${bottom.value.description} - ${bottom.value.price} kr.</option>
                                    </c:forEach>
                                </select>

                                <label for="topping">Vælg en topping:</label>
                                <select name="topping" id="topping">
                                    <c:forEach var="topping" items="${applicationScope.toppingMap}">
                                        <option value="${topping.key}" value="${topping.key}" >${topping.value.description} - ${topping.value.price} kr.</option>
                                    </c:forEach>
                                </select>

                                <label for="quantity">Vælg et antal:</label>
                                <input type="number" id="quantity" name="quantity" min="1" max="10" placeholder="1">
                                <c:if test="${requestScope.error != null}">
                                    <p style="color: #2c2c2c;">
                                            ${requestScope.error}
                                    </p>
                                </c:if>

                                <button type="submit" class="btn-primary">Tilføj Til kurv</button>
                                <button type="submit" class="btn-primary">Gå til kurv</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="mx-auto mb-4" style="width: 80%; height: 100px; border-radius: 21px 21px 21px 21px; background-color: rebeccapurple">
            </div>
        </div>
    </jsp:body>

</t:genericpage>

