package servlets.SrvsEmpleados;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;

/**
 *
 * @author chuky
 */
public class BuscarEmpleado extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        if(!request.getParameter("inputIdEmpleadoBuscado").equals("")){
            Empleado empleadoBuscado=controlL.buscarEmpleado(request.getParameter("inputIdEmpleadoBuscado"));
            sesionCreada.setAttribute("empleadoBuscado", empleadoBuscado);

            response.sendRedirect("empleados.jsp#buscarEmpleado");
        }else{
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso id del empleado a buscar");
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
