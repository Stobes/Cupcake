<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Demo Page for Employee Roles
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="background-div">
            <div class="my-3 py-3 me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <h1>Hello ${sessionScope.email} </h1>
                <p> You are now logged in as a EMPLOYEE of our wonderful site.</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 75%; height: 300px; border-radius: 21px 21px 0 0;">
                <div style="margin-top: 3em;margin-bottom: 3em;">
                    <div class="container">
                        <form method="post" action="${pageContext.request.contextPath}/fc/orderpage">
                            <div class="form-group">
                                <br>
                                <br>
                                <h1>Overfør et beløb til kunde konto.</h1>
                                <br>
                                <a> bla bla lorem upsim</a>
                                <div class="form-group">
                                    <label for="balance">Indtast et beløb</label>
                                    <input class="form-control" id="balance" name="balance" type="text" placeholder="15kr"/>
                                    <br>
                                    <label for="employee">Vælge en kunde-konto:</label>
                                    <select name="employee" id="employee">
                                        <c:forEach var="employee" items="${applicationScope.employeeMap}">
                                            <option value="${employee.key}">${employee.value.email}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" class="btn-primary">Indsæt beløb</button>
                                </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>
</t:genericpage>
