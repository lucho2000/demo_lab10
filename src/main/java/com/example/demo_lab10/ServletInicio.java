package com.example.demo_lab10;

import com.example.demo_lab10.Bean.Clientes;
import com.example.demo_lab10.Bean.Credentials;
import com.example.demo_lab10.Dao.DaoCliente;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletInicio", value = "/ServletInicio")
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        DaoCliente cli = new DaoCliente();
        switch (action) {
            case "login":
                String user = request.getParameter("usuario");
                String pass = request.getParameter("password");
                Credentials cre = null;
                try {
                    cre = cli.buscarUsuario(user,pass);
                    System.out.println("hola cre");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                if(cre != null){
                    HttpSession session = request.getSession();
                    session.setAttribute("sesion",cre);
                    int a = cre.getTipoUsuario();
                    System.out.println("cre valido");
                    System.out.println(a);
                    if (a==1){
                        ArrayList<Clientes> listaclientes = null;
                        listaclientes = cli.listarClientes();
                        request.setAttribute("lista",listaclientes);
                        System.out.println("manda admin");
                        view = request.getRequestDispatcher("/admin.jsp");
                        view.forward(request,response);
                    } else if (a==2) {
                        view = request.getRequestDispatcher("/cliente.jsp");
                        System.out.println("jijija");
                        view.forward(request,response);
                    }
                }else {
                    request.getSession().setAttribute("infono","Datos erroneos");
                    System.out.println("error");
                    response.sendRedirect(request.getContextPath());
                }
                break;
        }
    }
}
