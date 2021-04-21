<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <script type="text/javascript" src="static/js/Store.js"></script>
</head>


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
                                    <option value="${bottom.key}" value="${bottom.key}">${bottom.value.description} - ${bottom.value.price} kr.</option>
                                </c:forEach>
                            </select>

                            <label for="topping">Vælg en topping:</label>

                            <select name="topping" id="topping">
                                <c:forEach var="topping" items="${applicationScope.toppingMap}">
                                    <option value="${topping.key}" value="${topping.key}" >${topping.value.description} - ${topping.value.price} kr.</option>
                                </c:forEach>
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
            <section class="container content-section">
                <h2 class="section-header">CART</h2>
                <div class="cart-row">
                    <span class="cart-item cart-header cart-column">ITEM</span>
                    <span class="cart-price cart-header cart-column">PRICE</span>
                    <span class="cart-quantity cart-header cart-column">QUANTITY</span>
                </div>
                <div class="cart-items">
                    <div class="cart-row">
                        <div class="cart-item cart-column">
                            <img class="cart-item-image" src="Images/Shirt.png" width="100" height="100">
                            <span class="cart-item-title">T-Shirt</span>
                        </div>
                        <span class="cart-price cart-column">$19.99</span>
                        <div class="cart-quantity cart-column">
                            <input class="cart-quantity-input" type="number" value="1">
                            <button class="btn btn-danger" type="button">REMOVE</button>
                        </div>
                    </div>
                    <div class="cart-row">
                        <div class="cart-item cart-column">
                            <img class="cart-item-image" src="Images/Album 3.png" width="100" height="100">
                            <span class="cart-item-title">Album 3</span>
                        </div>
                        <span class="cart-price cart-column">$9.99</span>
                        <div class="cart-quantity cart-column">
                            <input class="cart-quantity-input" type="number" value="2">
                            <button class="btn btn-danger" type="button">REMOVE</button>
                        </div>
                    </div>
                </div>
                <div class="cart-total">
                    <strong class="cart-total-title">Total</strong>
                    <span class="cart-total-price">$39.97</span>
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