package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Entidades.*;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    PaqueteTuristicoJpaController paqueteJPA = new PaqueteTuristicoJpaController();
    ServicioJpaController servicioJPA = new ServicioJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();

//--------------------------CRUD CLIENTE-----------------------------------------
    public void crearCliente(Cliente cliente) {
        clienteJPA.create(cliente);
    }
    //metodos eliminar    
    public void eliminarCliente(Cliente cliente) {
        try {
            clienteJPA.destroy(cliente.getId());
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarCliente(int id) {
        try {            
            clienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura   
    public Cliente lecturaClienteEspecifico(int id){
        try {
            return clienteJPA.findCliente(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<Cliente> listarClientes(){
        
        return clienteJPA.findClienteEntities();
    }
    
    //metodo para modificacion
    public void modificarCliente(Cliente cliente){
        try {
            clienteJPA.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarClienteYId(int idViejo, Cliente cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/
//-------------------------------------------------------------------------------
    //-----------------------CRUD EMPLEADO---------------------------------------
    public void crearEmpleado (Empleado empleado) {
        empleadoJPA.create(empleado);
    }
    
   //metodos eliminar      
    public void eliminarEmpleado(int id) {
        try {
            empleadoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura   
    public Empleado lecturaEmpleadoEspecifico(int id){
        try {
            return empleadoJPA.findEmpleado(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<Empleado> listarEmpleados(){
        
        return empleadoJPA.findEmpleadoEntities();
    }
    
    //metodo para modificacion
    public void modificarEmpleado(Empleado empleado){
        try {
           empleadoJPA.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarEmpleadoYId(int idViejo, Cliente cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/
//-------------------------------------------------------------------------------
//---------------------------CRUD USUARIO----------------------------------------
    public void crearUsuario(Usuario usuario) {
        usuarioJPA.create(usuario);
    }
    
    //metodo eliminar    
    public void eliminarUsuario(int id) {
        try {
            usuarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura
    public Usuario lecturaUsuarioEspecifico(int id){
        try {
            return usuarioJPA.findUsuario(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<Usuario> listarUsuarios(){
        
        return usuarioJPA.findUsuarioEntities();
    }
    
    //metodo para modificacion
    public void modificarUsuario(Usuario usuario){
        try {
           usuarioJPA.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarUsuarioYId(int idViejo, Cliente cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/
//-------------------------------------------------------------------------------
//---------------------------CRUD VENTA------------------------------------------
    public void crearVenta(Venta venta) {
        ventaJPA.create(venta);
    }
    
    //metodo eliminar    
    public void eliminarVenta(int id) {
        try {
            ventaJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura
    
    public Venta lecturaVentaEspecifica(int id){
        try {
            return ventaJPA.findVenta(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<Venta> listarVentas(){
        
        return ventaJPA.findVentaEntities();
    }
    
    //metodo para modificacion
    public void modificarVenta(Venta venta){
        try {
           ventaJPA.edit(venta);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarUsuarioYId(int idViejo, Cliente cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/
//-------------------------------------------------------------------------------
//---------------------------CRUD PAQUETE TURISTICO------------------------------
    public void crearPaquete(PaqueteTuristico paquete) {
        paqueteJPA.create(paquete);
    }
    
    //metodos eliminar       
    public void eliminarPaquete(int id) {
        try {
            paqueteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura   
    public PaqueteTuristico lecturaPaqueteEspecifico(int id){
        try {
            return paqueteJPA.findPaqueteTuristico(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<PaqueteTuristico> listarPaquetes(){
        
        return paqueteJPA.findPaqueteTuristicoEntities();
    }
    
    //metodo para modificacion
    public void modificarPaquete(PaqueteTuristico paquete){
        try {
           paqueteJPA.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarPaqueteYId(int idViejo, PaqueteTuristico cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/
//-------------------------------------------------------------------------------
//-----------------------------CRUD SERVICIO-------------------------------------
    public void crearServicio(Servicio servicio) {
        servicioJPA.create(servicio);
    }
    
    //metodos eliminar       
    public void eliminarServicio(int id) {
        try {
            servicioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //metodos lectura   
    public Servicio lecturaServicioEspecifico(int id){
        try {
            return servicioJPA.findServicio(id);
        } catch (Exception e) {
            System.out.println("El cliente no fue encontrado en la base de datos");
        }
        
        return null; 
        
    } 
    
    public List<Servicio> listarServicios(){
        
        return servicioJPA.findServicioEntities();
    }
    
    //metodo para modificacion
    public void modificarServicio(Servicio servicio){
        try {
           servicioJPA.edit(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  /*  A TERMINAR
    public void modificarPaqueteYId(int idViejo, PaqueteTuristico cliente) throws Exception{
        Cliente viejo= lecturaClienteEspecifico(idViejo);
        crearCliente(cliente);
        List<Cliente> totalClientes= listarClientes();
        if(viejo!=null){
            eliminarCliente(viejo);
        }
    }*/

//-------------------------------------------------------------------------------
}
