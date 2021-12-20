package servlets.SrvsClientes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.Cliente;
import logica.Entidades.ControladoraLogica;

public class ModificarCliente extends HttpServlet {

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

        if(request.getParameter("inputIdClienteViejo")!=null){
            if(request.getParameter("inputIdClienteViejo").equals("")){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No ingreso un Cliente a modificar");
            }else{
                Cliente clienteBuscado=controlL.buscarCliente(request.getParameter("inputIdClienteViejo"));
                sesionCreada.setAttribute("clienteAModificar", clienteBuscado);
                response.sendRedirect("clientes.jsp#modificarCliente");            
            }
        }else{
            if(sesionCreada.getAttribute("clienteAModificar")==null){
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se ingreso un cliente existente.");
            }else{
                controlL.editarCliente((Cliente)sesionCreada.getAttribute("clienteAModificar"), request.getParameter("inputNombreClienteNuevo"), request.getParameter("inputApellidoClienteNuevo"), request.getParameter("inputDomicilioClienteNuevo"), request.getParameter("inputDniClienteNuevo"), request.getParameter("inputFechanacClienteNuevo"), request.getParameter("inputNacionalidadClienteNuevo"), request.getParameter("inputCelularClienteNuevo"), request.getParameter("inputEmailClienteNuevo"));
                sesionCreada.setAttribute("clienteAModificar", null); //Vuelvo a setear el atributo en null para poder seguir verificando
                response.sendRedirect("clientes.jsp#listarClientes");
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
