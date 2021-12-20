package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;


public class ModificarEmpleado extends HttpServlet {

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
        ControladoraLogica controlL= new ControladoraLogica();
        HttpSession sesionCreada = request.getSession();
        Empleado empleadoSesion= (Empleado)sesionCreada.getAttribute("sesionEmpleado");

        Empleado empleadoModificado= controlL.editarEmpleado(empleadoSesion,  sesionCreada.getAttribute("idUser")  , request.getParameter("inputNombre"), request.getParameter("inputApellido"), request.getParameter("inputDomicilio"), request.getParameter("inputDni"), request.getParameter("inputFechanac"), request.getParameter("inputNacionalidad"), request.getParameter("inputCelular"), request.getParameter("inputEmail"), request.getParameter("inputUsuario"), request.getParameter("inputPass"), empleadoSesion.getCargo(), empleadoSesion.getSueldo());
        sesionCreada.setAttribute("sesionEmpleado", empleadoModificado);
        
        if( empleadoSesion.getUsuario_empleado().getUser().equals(request.getParameter("inputUsuario")) && empleadoSesion.getUsuario_empleado().getPass().equals(request.getParameter("inputPass")) ){
            response.sendRedirect("editarUsuario-Empleado.jsp");
        }else{
            response.sendRedirect("index.jsp");
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
