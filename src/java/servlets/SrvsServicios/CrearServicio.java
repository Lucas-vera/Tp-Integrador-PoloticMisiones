package servlets.SrvsServicios;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;

public class CrearServicio extends HttpServlet {

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
        if(!request.getParameter("inputNombreServicio").equals("")){
            controlL.crearServicio(request.getParameter("inputNombreServicio"), request.getParameter("inputCostoServicio"), request.getParameter("inputFecServicio"), request.getParameter("inputDestinoServicio"), request.getParameter("inputDescripcionServicio"));
            response.sendRedirect("servicios.jsp#listarServicios");
        }else{
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "El servicio debe tener declarado un nombre.");
        }

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
