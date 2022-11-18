<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo_lab10.Bean.Contratos" %>
<%@ page import="com.example.demo_lab10.Dtos.CantidadContratosDto" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17/11/2022
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sesion" type="com.example.demo_lab10.Bean.Clientes" scope="session" class="com.example.demo_lab10.Bean.Clientes"/>
<%
    ArrayList<CantidadContratosDto> listacontrato = (ArrayList<CantidadContratosDto>) request.getAttribute("listaContratosxEstado");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />

    <title>Estados de los Contratos</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a class="navbar-brand" href="#">CLIENTE</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item" >
                <a class="nav-link" href="<%=request.getContextPath()%>/ServletCliente?action=buscarCliente">Datos</a>
            </li>
            <li class="nav-item" >
                <a class="nav-link" href="<%=request.getContextPath()%>/ServletCliente?action=listarContratos">Contratos</a>
            </li>
            <li class="nav-item" >
                <a class="nav-link" href="<%=request.getContextPath()%>/ServletCliente?action=mostrarContratos">Contratos por Estados</a>
            </li>
            <li class="nav-item" >
                <a class="nav-link" href="<%=request.getContextPath()%>/ServletCliente?action=puntaje">Expected Loss</a>
            </li>
        </ul>
    </div>
</nav>
<table class="table">
    <tr>
        <th>Estados</th>
        <th>NORMAL</th>
        <th>CURA</th>
        <th>MORA</th>
    </tr>
    <tr>
        <td>Cantidad de Contratos</td>
        <td><%= listacontrato.get(0)%></td>
        <td><%= listacontrato.get(1)%></td>
        <td><%= listacontrato.get(2)%></td>
    </tr>
</table>
</body>
</html>
