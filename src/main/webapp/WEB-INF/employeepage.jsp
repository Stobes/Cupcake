<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Employee page
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="background-div">
            <div class="py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h1>Velkommen ${sessionScope.email} </h1>
                <p> Du er nu logget ind som ${sessionScope.role}.</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 80%; min-height: 300px; height: 400px; border-radius: 21px 21px 21px 21px;">
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/orderpage">
                            <span class="form-group">
                                <br>
                                <br>
                                <h1>Overfør et beløb til kunde konto.</h1>
                                <br>
                                <div class="form-group">
                                    <label for="balance">Indtast et beløb</label>
                                    <input class="form-control" id="balance" type="text" placeholder="Indtast beløb som skal indsættes på konto"/>
                                    <br>
                                    <label for="employee">Vælg en kunde-konto:</label>
                                    <select name="employee" id="employee">
                                        <c:forEach var="employee" items="${applicationScope.employeeMap}">
                                            <option value="${employee.key}">${employee.value.email}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" class="btn-primary">Indsæt beløb</button>
                                </div>


                            </span>
                        </form>
                    </div>
                </div>
            </div>
            <div class="mx-auto mb-4" style="width: 80%; height: 100px; border-radius: 21px 21px 21px 21px; background-color: rebeccapurple">
            </div>
        </div>


    </jsp:body>
</t:genericpage>
