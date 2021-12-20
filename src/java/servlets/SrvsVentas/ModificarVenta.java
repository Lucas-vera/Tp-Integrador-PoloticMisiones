package servlets.SrvsVentas;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;
import logica.Entidades.Venta;

public class ModificarVenta extends HttpServlet {
    
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
        HttpSession sesionCreada = request.getSession();
        Empleado empleadoEnSesion = (Empleado)sesionCreada.getAttribute("sesionEmpleado");
        ControladoraLogica controlL = new ControladoraLogica();
        if(request.getParameter("inputIdVentaAModificar")!=null){
            if(request.getParameter("inputIdVentaAModificar").equals("")){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso una venta para modificar.");
            }else{
                Venta ventaBuscada=controlL.buscarVentaPorEmpleado(request.getParameter("inputIdVentaAModificar"), empleadoEnSesion);
                sesionCreada.setAttribute("ventaAModificar", ventaBuscada);
                response.sendRedirect("ventas.jsp#modificarVenta");
            }   
        }else{
            if(sesionCreada.getAttribute("ventaAModificar")==null){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se ingreso una venta existente.");
            }else{
                controlL.editarVenta((Venta)sesionCreada.getAttribute("ventaAModificar"), request.getParameter("inputPagoVentaNueva"), request.getParameter("inputFechaVentaNueva"), request.getParameter("inputClienteVentaNuevo"), request.getParameter("inputQueEsNuevo"));
                sesionCreada.setAttribute("ventaAModificar", null);             //Vuelvo a setear el atributo en null para poder seguir verificando
                sesionCreada.setAttribute("sesionEmpleado", controlL.buscarEmpleado( String.valueOf(empleadoEnSesion.getId()) )); //Vuelvo a setear la sesion de Empleado para que se actualicen los datos.
                response.sendRedirect("ventas.jsp#listarVentas");
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
