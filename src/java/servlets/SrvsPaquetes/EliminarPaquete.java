package servlets.SrvsPaquetes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;

public class EliminarPaquete extends HttpServlet {

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
        if(request.getParameter("inputIdPaqueteEliminado")==null){ //Si clickeo el boton eliminar donde Listan los Servicios envia Null
            if( !request.getParameter("inputPaquetesCreados").equals("-") ){
                controlL.eliminarPaquete(request.getParameter("inputPaquetesCreados"));
                response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes"); 
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun paquete para eliminar.");
            }
        }else{
            if(!request.getParameter("inputIdPaqueteEliminado").equals("")){ //Pero si clickeo el boton eliminar donde va el Id de Servicio envia "".
                controlL.eliminarPaquete(request.getParameter("inputIdPaqueteEliminado"));
                response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");         
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun paquete para eliminar.");    
            } 
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
