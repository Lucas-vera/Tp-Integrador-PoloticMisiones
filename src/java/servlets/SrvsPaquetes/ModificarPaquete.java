package servlets.SrvsPaquetes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.PaqueteTuristico;

public class ModificarPaquete extends HttpServlet {

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
        
        if(request.getParameter("inputIdPaqueteViejo")!=null){
            if(request.getParameter("inputIdPaqueteViejo").equals("")){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso un paquete para modificar.");
            }else{
                PaqueteTuristico paqueteBuscado=controlL.buscarPaquete(request.getParameter("inputIdPaqueteViejo"));
                sesionCreada.setAttribute("paqueteAModificar", paqueteBuscado);
                response.sendRedirect("paquetesTuristicos.jsp#modificarPaquete");
            }
        }else{
            if(sesionCreada.getAttribute("paqueteAModificar")==null){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso un paquete para modificar.");
            }else{
                if(request.getParameterValues("inputServicioAAgregar")==null && request.getParameterValues("inputServicioAEliminarPaquete")==null){
                    response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");
                }else{
                    if(request.getParameterValues("inputServicioAAgregar")==null){
                        controlL.editarPaquete( (PaqueteTuristico)sesionCreada.getAttribute("paqueteAModificar"), null, request.getParameterValues("inputServicioAEliminarPaquete") );
                        sesionCreada.setAttribute("paqueteAModificar", null); //Vuelvo a setear el atributo en null para poder seguir verificando
                        response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");
                    }
                    else if(request.getParameterValues("inputServicioAEliminarPaquete")==null){
                        controlL.editarPaquete( (PaqueteTuristico)sesionCreada.getAttribute("paqueteAModificar"), request.getParameterValues("inputServicioAAgregar"), null );
                        sesionCreada.setAttribute("paqueteAModificar", null); //Vuelvo a setear el atributo en null para poder seguir verificando
                        response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");
                    }else{
                    controlL.editarPaquete( (PaqueteTuristico)sesionCreada.getAttribute("paqueteAModificar"), request.getParameterValues("inputServicioAAgregar"), request.getParameterValues("inputServicioAEliminarPaquete") );
                    sesionCreada.setAttribute("paqueteAModificar", null); //Vuelvo a setear el atributo en null para poder seguir verificando
                    response.sendRedirect("paquetesTuristicos.jsp#listarPaquetes");
                    }
                }
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
