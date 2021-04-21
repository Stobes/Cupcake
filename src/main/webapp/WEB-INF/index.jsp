<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>




    <jsp:attribute name="header">
         Olsker Cupcakes
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div>
            <h2>Velkommen til Olsker Cupcakes</h2>
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/orderpage">
                            <div class="form-group">
                                Øens bedste cupcakes. Vælg og bestil her:</br>
                                <label for="bottom">Vælg en bund:</label>

                                <select name="bottom" id="bottom">
                                    <c:forEach var="bottom" items="${applicationScope.bottomMap}">
                                        <option value="${bottom.key}">${bottom.value.description}</option>
                                    </c:forEach>



                                </select>

                                <label for="topping">Vælg en topping:</label>

                                <select name="topping" id="topping">
                                    <option value="Chocolate">Chocolate</option>
                                    <option value="Blueberry">Blueberry</option>
                                    <option value="Raspberry">Raspberry</option>
                                    <option value="Crispy">Crispy</option>
                                    <option value="Strawberry">Strawberry</option>
                                    <option value="Rum/Raisin">Rum/Raisin</option>
                                    <option value="Orange">Orange</option>
                                    <option value="Lemon">Lemon</option>
                                    <option value="Bluecheese">Blue cheese</option>
                                </select>
<%--                                    <div class="form-group">--%>
                                    <label for="quantity">Vælg et antal:</label>
                                    <input type="number" id="quantity" name="quantity" min="1" max="10" placeholder="1">
                                    <c:if test="${requestScope.error != null}">
                                    <p style="color: red;">
                                            ${requestScope.error}
                                    </p>
                                    </c:if>
                                    <button type="submit" class="btn-primary">Tilføj Til kurv</button>
                                    <button type="submit" class="btn-primary">Gå til kurv</button>
                            </div>


                        </form>
                    </div>
                </div>
            <c:if test="${sessionScope.role == 'employee' }">
            <p style="font-size: larger">This is what you can do,
                since your are logged in as an employee</p>
            <p><a href="fc/employeepage">Employee Page</a>
                </c:if>

                <c:if test="${sessionScope.role == 'customer' }">
            <p style="font-size: larger">This is what you can do, since your
                are logged in as a customer</p>
            <p><a href="fc/customerpage">Customer Page</a>
                </c:if>

        </div>


    </jsp:body>
</t:genericpage>