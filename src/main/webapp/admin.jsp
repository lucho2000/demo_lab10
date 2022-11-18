<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo_lab10.Bean.Clientes" %><%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 16/11/2022
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sesion" type="com.example.demo_lab10.Bean.Clientes" scope="session" class="com.example.demo_lab10.Bean.Clientes"/>
<% ArrayList<Clientes> listaclientes = (ArrayList<Clientes>) request.getAttribute("lista");%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />
    <title>Administrador-Crear Cliente</title>
</head>
<body>
<div class='container'>
    <div class="row mb-4">
        <div class="col"></div>
        <div class="col-md-6">
            <h1 class='mb-3'>Crear Cliente</h1>
            <form method="post" action="<%=request.getContextPath()%>/ServletAdmin?action=crear">
                <div class="form-group">
                    <label>Número de Documento</label>
                    <select name="documento" class="form-control">
                        <option selected></option>
                        <% for(Clientes li : listaclientes) {%>
                        <option value="<%=li.getNombreDocumento()%>"><%=li.getNombreDocumento()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="text" class="form-control" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <a href="<%=request.getContextPath()%>/ServletAdmin" class="btn btn-danger">Cancelar</a>
            </form>
        </div>
        <div class="col"></div>
    </div>
</div>
</body>
</html>
