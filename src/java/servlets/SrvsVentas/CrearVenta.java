package servlets.SrvsVentas;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;


public class CrearVenta extends HttpServlet {

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
        try {
            HttpSession sesionCreada = request.getSession();
            controlL.crearVenta(request.getParameter("inputFecVenta"), request.getParameter("inputPago"), request.getParameter("inputClienteVenta"), request.getParameter("inputQueEs"), (Empleado)sesionCreada.getAttribute("sesionEmpleado"));

        } catch (Exception ex) {
            Logger.getLogger(CrearVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("ventas.jsp#listarVentas");
            

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
