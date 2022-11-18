package com.example.demo_lab10;
import com.example.demo_lab10.Bean.Clientes;
import com.example.demo_lab10.Bean.Contratos;
import com.example.demo_lab10.Bean.Credentials;
import com.example.demo_lab10.Dao.DaoCliente;
import com.example.demo_lab10.Dao.DaoContrato;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCliente", value = "/ServletCliente")
public class ServletCliente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        String id = request.getParameter("id");
        DaoCliente daoCliente = new DaoCliente();
        DaoContrato contratoDao = new DaoContrato();
        switch (action) {
            case "puntaje": //expected loss
                Clientes e = (Clientes) request.getSession().getAttribute("sesion");

                if (e != null && e.getNombreDocumento()!= null) {
                    response.sendRedirect(request.getContextPath());
                } else {
                    request.setAttribute("puntaje", daoCliente.mostrarMaxExpectedLoss(id));
                    view = request.getRequestDispatcher("clientepuntaje.jsp");
                    view.forward(request, response);
                }

                break;
            case "buscarCliente":
                Clientes e1 = (Clientes) request.getSession().getAttribute("sesion");

                if (e1 != null && e1.getNombreDocumento()!= null) {
                    response.sendRedirect(request.getContextPath());
                } else {
                    Clientes cliente = daoCliente.buscarCliente(id);
                    request.setAttribute("client",cliente);
                    view = request.getRequestDispatcher("clientedatos.jsp");
                    view.forward(request, response);
                }
                break;
            case "listarContratos":
                Clientes e2 = (Clientes) request.getSession().getAttribute("sesion");

                if (e2!= null && e2.getNombreDocumento()!= null) {
                    response.sendRedirect(request.getContextPath());
                } else {
                    ArrayList<Contratos> listaContratos = contratoDao.listarContratos();
                    request.setAttribute("listaContratos",listaContratos);
                    view = request.getRequestDispatcher("clientecontratos.jsp");
                    view.forward(request, response);
                }
                break;

            case "mostrarContratos":
                Clientes e3 = (Clientes) request.getSession().getAttribute("sesion");

                if (e3!= null && e3.getNombreDocumento()!= null) {
                    response.sendRedirect(request.getContextPath());
                } else {
                    request.setAttribute("listaContratosxEstado",contratoDao.mostrarContratosxEstado());
                    view = request.getRequestDispatcher("clienteestados.jsp");
                    view.forward(request, response);
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/ServletCliente");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
