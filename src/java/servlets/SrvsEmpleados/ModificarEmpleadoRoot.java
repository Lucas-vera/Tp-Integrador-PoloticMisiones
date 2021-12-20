package servlets.SrvsEmpleados;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;

public class ModificarEmpleadoRoot extends HttpServlet {
    
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
        ControladoraLogica controlL = new ControladoraLogica();

        if(request.getParameter("inputIdEmpleadoViejo")!=null){
            if(request.getParameter("inputIdEmpleadoViejo").equals("")){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso un Empleado a modificar");
            }else{
                Empleado empleadoBuscado= controlL.buscarEmpleado(request.getParameter("inputIdEmpleadoViejo"));
                sesionCreada.setAttribute("empleadoAModificar", empleadoBuscado);
                response.sendRedirect("empleados.jsp#modificarEmpleado");            
            }
        }else{
            if(sesionCreada.getAttribute("empleadoAModificar")==null){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se ingreso un Empleado existente.");
            }else{
                controlL.editarEmpleado((Empleado)sesionCreada.getAttribute("empleadoAModificar"), request.getParameter("inputNombreEmpleadoNuevo"), request.getParameter("inputApellidoEmpleadoNuevo"), request.getParameter("inputDomicilioEmpleadoNuevo"), request.getParameter("inputDniEmpleadoNuevo"), request.getParameter("inputFechanacEmpleadoNuevo"), request.getParameter("inputNacionalidadEmpleadoNuevo"), request.getParameter("inputCelularEmpleadoNuevo"), request.getParameter("inputEmailEmpleadoNuevo"), request.getParameter("inputCargoEmpleadoNuevo"), request.getParameter("inputSueldoEmpleadoNuevo"));
                sesionCreada.setAttribute("empleadoAModificar", null); //Vuelvo a setear el atributo en null para poder seguir verificando
                response.sendRedirect("empleados.jsp#listarEmpleados");
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
