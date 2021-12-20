package servlets.SrvsVentas;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;

public class EliminarVenta extends HttpServlet {
    
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
        HttpSession sesionCreada = request.getSession();
        if(request.getParameter("inputIdVenta")==null){ //Si clickeo el boton eliminar donde Listan las Ventas envia Null
            if( !(request.getParameter("inputVentaCreada").equals("-")) ){
                controlL.eliminarVenta(request.getParameter("inputVentaCreada"), (Empleado)sesionCreada.getAttribute("sesionEmpleado"));
                response.sendRedirect("ventas.jsp#listarVentas");
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ninguna venta para eliminar.");
            }
        }else{
            if(!request.getParameter("inputIdVenta").equals("")){ //Pero si clickeo el boton eliminar donde va el Id de Venta envia "".
                controlL.eliminarVenta(request.getParameter("inputIdVenta"), (Empleado)sesionCreada.getAttribute("sesionEmpleado"));
                response.sendRedirect("ventas.jsp#listarVentas");
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ninguna venta para eliminar.");
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
