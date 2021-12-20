package servlets.SrvsPaquetes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Servicio;

public class CrearPaquete extends HttpServlet {

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
        String[] serviciosSeleccionados = request.getParameterValues("inputServiciosDelPaquete");
        List<Servicio> servicios= new ArrayList();
        for(String servicio : serviciosSeleccionados){
            servicios.add( controlL.buscarServicio(servicio) );
        }
        controlL.crearPaqueteTuristico(servicios);
        
        response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");
       
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
