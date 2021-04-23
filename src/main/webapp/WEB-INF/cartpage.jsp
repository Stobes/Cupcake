<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Cart page
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <div class="background-div">
        <div class="py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
            <h2 class="display-5">Olsker Cupcakes</h2>

        </div>
        <div class="bg-light mx-auto mb-4"
             style="width: 80%; height: 400px; min-height: 300px; border-radius: 21px 21px 21px 21px;">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td>Antal</td>
                    <td>Top</td>
                    <td>Bund</td>
                    <td>Pris</td>
                </tr>
                </thead>

                <c:forEach var="cartItem" items="${sessionScope.cart.cartItemsList}">
                    <tr>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.top.description}</td>
                        <td>${cartItem.bottom.description}</td>
                        <td>${cartItem.price}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Pris i alt</td>
                    <td>${sessionScope.cart.totalSum()}</td>
                </tr>
            </table>
            </div>
            <div class="mx-auto mb-4"
                 style="width: 80%; height: 100px; border-radius: 21px 21px 21px 21px; background-color: rebeccapurple">
            </div>
        <div class="row">
            <div class="col">
                <form action="${pageContext.request.contextPath}/fc/index" method="get">
                    <button type="submit" class="btn btn-secondary mt-3">Køb flere kager</button>
                </form>
            </div>

            <div class="col">
                <form action="${pageContext.request.contextPath}/fc/order" method="get">
                    <button type="submit" class="btn btn-primary mt-3">Gå til betaling</button>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>