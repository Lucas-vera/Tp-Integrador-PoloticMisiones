package servlets.SrvsPaquetes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.PaqueteTuristico;

public class BuscarPaquete extends HttpServlet {

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
        HttpSession sesionCreada = request.getSession();
        ControladoraLogica controlL = new ControladoraLogica();
        
        if(!request.getParameter("inputIdPaqueteBuscado").equals("")){
            PaqueteTuristico paqueteBuscado = controlL.buscarPaquete(request.getParameter("inputIdPaqueteBuscado"));
            sesionCreada.setAttribute("paqueteBuscado", paqueteBuscado);
            
            if( (boolean)sesionCreada.getAttribute("sesionRoot") ){
                response.sendRedirect("paquetesTuristicos.jsp#buscarPaquete");  
            }else{
                response.sendRedirect("paquetesEmpleado.jsp#buscarPaquete");                   
            }
        
        }
        else{
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso id del Servicio a buscar.");
        }
    }
    
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
