package servlets.SrvsServicios;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;

/**
 *
 * @author chuky
 */
public class EliminarServicio extends HttpServlet {
    
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

        if(request.getParameter("inputIdServicio")==null){ //Si clickeo el boton eliminar donde Listan los Servicios envia Null
            if( !request.getParameter("inputServiciosCreados").equals("-") ){
                controlL.eliminarServicio(request.getParameter("inputServiciosCreados"));
                response.sendRedirect("servicios.jsp#listarServicios"); 
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun servicio para eliminar.");
            }
        }else{
            if(!request.getParameter("inputIdServicio").equals("")){ //Pero si clickeo el boton eliminar donde va el Id de Servicio envia "".
                controlL.eliminarServicio(request.getParameter("inputIdServicio"));
                response.sendRedirect("servicios.jsp#listarServicios");         
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun servicio para eliminar.");    
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
