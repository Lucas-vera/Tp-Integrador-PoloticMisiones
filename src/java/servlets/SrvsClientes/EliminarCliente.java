package servlets.SrvsClientes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;

public class EliminarCliente extends HttpServlet {

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
        if(request.getParameter("inputIdClienteEliminado")==null){ //Si clickeo el boton eliminar donde Listan los clientes envia Null
            if( !(request.getParameter("inputClientesCreados").equals("-")) ){
                controlL.eliminarCliente( request.getParameter("inputClientesCreados") );
                response.sendRedirect("clientes.jsp#listarClientes");
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun cliente para eliminar.");
            }
        }else{
            if(!request.getParameter("inputIdClienteEliminado").equals("")){ //Pero si clickeo el boton eliminar donde va el Id de Venta envia "".
                controlL.eliminarCliente(request.getParameter("inputIdClienteEliminado"));
                response.sendRedirect("clientes.jsp#listarClientes");
            }else{
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No seleccionó ningun cliente para eliminar.");
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
