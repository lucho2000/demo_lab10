<%@ page import="com.example.demo_lab10.Bean.Contratos" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17/11/2022
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sesion" type="com.example.demo_lab10.Bean.Clientes" scope="session" class="com.example.demo_lab10.Bean.Clientes"/>
<%
    ArrayList<Contratos> listacontrato = (ArrayList<Contratos>) request.getAttribute("listaContratos");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />

    <title>Contratos</title>
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
        <th>Número de Contrato</th>
        <th>Divisa</th>
        <th>Estado</th>
        <th>Meses en ese estado</th>
    </tr>
    <% for(Contratos cont : listacontrato) {%>
    <tr>
        <td><%= cont.getNroDeContrato()%></td>
        <td><%= cont.getDivisa()%></td>
        <% int estado = cont.getEstado();%>
        <% if(estado==0) {%>
        <td>NORMAL</td>
        <%}%>
        <% if(estado==1) {%>
        <td>CURA</td>
        <%}%>
        <% if(estado==2) {%>
        <td>MORA</td>
        <%}%>
        <td><%= cont.getMesesEnEseEstado()%></td>
    </tr>
    <% }%>
</table>
</body>
</html>
