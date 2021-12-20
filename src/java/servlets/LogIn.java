package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logica.Entidades.ControladoraLogica;
import logica.Entidades.Empleado;

public class LogIn extends HttpServlet {
    String usuarioRoot="Admin";                                                  //Estos datos se ingresan por fuera de la igu, como seteando anteriormente el usuario root. (dueño de la empresa)
    String passRoot="0";
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
        
        String usuario= request.getParameter("username");
        String pass = request.getParameter("password");
        
        HttpSession nuevaSesion = request.getSession();
        int existe= controlL.ControlUsuarios(usuario, pass);
        if(existe>=0){
            if(usuario.equals(usuarioRoot) && pass.equals(passRoot)){
                nuevaSesion.setAttribute("noExisteUsuario", false);
                nuevaSesion.setAttribute("idUser", existe);
                nuevaSesion.setAttribute("usuario", usuario);
                nuevaSesion.setAttribute("pass", pass);
                nuevaSesion.setAttribute("sesionRoot", true);
                
                response.sendRedirect("usuarioRoot.jsp");
            }else{
                Empleado sesionEmpleado= controlL.setearEmpleadoDeSesion(existe);
                //Obtengo la sesion y le asigno el user y la pass para validar
                nuevaSesion.setAttribute("sesionRoot", false);
                nuevaSesion.setAttribute("noExisteUsuario", false);
                nuevaSesion.setAttribute("idUser", existe);
                nuevaSesion.setAttribute("usuario", usuario);
                nuevaSesion.setAttribute("pass", pass);
                nuevaSesion.setAttribute("sesionEmpleado", sesionEmpleado);
           
                response.sendRedirect("inicio.jsp");
            }
            
        }else{
            nuevaSesion.setAttribute("noExisteUsuario", true);
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
