package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;



public class CrearEmpleado extends HttpServlet {

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
        if(controlL.ControlUsuarios(request.getParameter("Usuario"), "")==-2){
            request.getSession().setAttribute("existeUsuario", true);
            response.sendRedirect("inicioSesion/sign-up.jsp");
        }else if( !request.getParameter("ContraseñaEmpleado").equals(request.getParameter("ConfirmarContra")) ){
            request.getSession().setAttribute("noEsIgual", true);
            response.sendRedirect("inicioSesion/sign-up.jsp");
        }else{
            request.getSession().setAttribute("existeUsuario", false);
            request.getSession().setAttribute("noEsIgual", false);
            controlL.crearUsuario(request.getParameter("Usuario"), request.getParameter("NombreEmpleado"), request.getParameter("ApellidoEmpleado"), request.getParameter("DomicilioEmpleado"), request.getParameter("DocumentoEmpleado"), request.getParameter("FechaNacEmpleado"), request.getParameter("CelularEmpleado"), request.getParameter("NacionalidadEmpleado"), request.getParameter("EmailEmpleado"), request.getParameter("ContraseñaEmpleado") );
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
