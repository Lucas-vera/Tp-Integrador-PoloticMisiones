package servlets.SrvsClientes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;


public class CrearCliente extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ControladoraLogica controlL = new ControladoraLogica();

        controlL.crearCliente(request.getParameter("inputNombreCliente"), request.getParameter("inputApellidoCliente"), request.getParameter("inputDomicilioCliente"), request.getParameter("inputDniCliente"), request.getParameter("inputFechanacCliente"), request.getParameter("inputNacionalidadCliente"), request.getParameter("inputCelularCliente"), request.getParameter("inputEmailCliente"));
        
        response.sendRedirect("clientes.jsp#listarClientes");
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
