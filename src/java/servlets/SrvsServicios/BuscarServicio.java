package servlets.SrvsServicios;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Servicio;


public class BuscarServicio extends HttpServlet {

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
        if(!request.getParameter("inputIdServicioBuscado").equals("")){
            Servicio servicioBuscado = controlL.buscarServicio(request.getParameter("inputIdServicioBuscado"));
            sesionCreada.setAttribute("servicioBuscado", servicioBuscado);
            if( (boolean)sesionCreada.getAttribute("sesionRoot") ){
                response.sendRedirect("servicios.jsp#buscarServicio");  
            }else{
                response.sendRedirect("serviciosEmpleado.jsp#buscarServicio");                   
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
