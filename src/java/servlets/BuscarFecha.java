package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;

public class BuscarFecha extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ControladoraLogica controlL = new ControladoraLogica();
        HttpSession sesionCreada = request.getSession();
        
        double gananciasDelDia = controlL.gananciasDia(request.getParameter("inputFechaBuscada"));
        double gananciasDelMes = controlL.gananciasMes(request.getParameter("inputFechaBuscada"));
        
        sesionCreada.setAttribute("fechaBuscada", request.getParameter("inputFechaBuscada"));
        sesionCreada.setAttribute("gananciasDia", gananciasDelDia);
        sesionCreada.setAttribute("gananciasMes", gananciasDelMes);
        
        response.sendRedirect("usuarioRoot.jsp#buscarFecha");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
