package logica.Entidades;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import persistencia.ControladoraPersistencia;


public class ControladoraLogica {
    ControladoraPersistencia control = new ControladoraPersistencia();
    
//----------------------------------------------------------------------CRUD CLIENTE----------------------------------------------------------------------------------------------------------
    public void crearCliente(String nombre, String apellido, String direccion, String dni, String fecha_nac, String nacionalidad, String celular, String email) {
        Cliente cliente= new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setFecha_nac(LocalDate.parse(fecha_nac));
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        
        control.crearCliente(cliente);
    }
    
    public void eliminarCliente(String id) {
        control.eliminarCliente( Integer.parseInt(id) );
    }
    
    public Cliente buscarCliente(String id){
        return control.lecturaClienteEspecifico(Integer.parseInt(id));
    }
    
    public void editarCliente(Cliente clienteAEditar, String nombre, String apellido, String domicilio, String dni, String fechaNac, String nacionalidad, String celular, String email){
        clienteAEditar.setNombre(nombre);
        clienteAEditar.setApellido(apellido);
        clienteAEditar.setDireccion(domicilio);
        clienteAEditar.setDni(dni);
        clienteAEditar.setFecha_nac(LocalDate.parse(fechaNac));
        clienteAEditar.setNacionalidad(nacionalidad);
        clienteAEditar.setCelular(celular);
        clienteAEditar.setEmail(email);
    
        control.modificarCliente(clienteAEditar);
    }
    
    public List<Cliente> listarClientes(){
        return control.listarClientes();
    }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------CRUD VENTA----------------------------------------------------------------------------------------------------------
    
    public void crearVenta(String fechaVenta, String medioPago, String clienteVentaS, String servicioOPaquete, Empleado empleadoEnSesion) {
        
        Venta venta = new Venta();
        Cliente clienteVenta;
        Servicio servicioVenta;
        PaqueteTuristico paqueteVenta;
         
        venta.setFecha_venta( LocalDate.parse(fechaVenta) );
        venta.setMedio_pago( medioPago );
        venta.setNum_venta(0);
        control.crearVenta(venta);
        Venta ventaCreadaEnBD= obtenerUltimaVentaCreada();

        empleadoEnSesion.agregarVentaAlEmpleado(ventaCreadaEnBD);
        control.modificarEmpleado(empleadoEnSesion); //Actualizo la BD del Empleado
        
        if( !(clienteVentaS.equals("-")) ){ //Verifico si esta vacio el input Cliente o selecciono alguno
            clienteVenta= control.lecturaClienteEspecifico( Integer.parseInt(clienteVentaS) );
            clienteVenta.agregarVentaAlCliente(ventaCreadaEnBD);
            control.modificarCliente(clienteVenta); //Actualizo la BD del Cliente
        }
        
        servicioVenta = servicioOPaquete( servicioOPaquete ); //Si devuelve null es PaqueteTuristico
        if(servicioVenta!=null){
            servicioVenta.agregarVentaAlServicio(ventaCreadaEnBD);
            control.modificarServicio(servicioVenta); //Actualizo la BD del Servicio
        }else{
            paqueteVenta= control.lecturaPaqueteEspecifico(Integer.parseInt( servicioOPaquete ));
            paqueteVenta.agregarVentaAlPaquete(ventaCreadaEnBD);
            control.modificarPaquete(paqueteVenta); //Actualizo la BD del Paquete
        }
        
    }
    
    public void eliminarVenta(String id, Empleado empleadoEnSesion){
        int existe; //Variable de control
        Venta ventaBD = buscarVenta(id);
        existe = empleadoEnSesion.buscarVentaEnEmpleado(ventaBD);
        empleadoEnSesion.eliminarVentaAlEmpleado(existe);
        control.modificarEmpleado(empleadoEnSesion);
      

            
        List<Servicio> serviciosTotales = listarServicios();                //CONTROLO SI LA VENTA SE RELACIONA CON ALGUN SERVICIO Y ELIMINO LA RELACION
        for(Servicio servicio : serviciosTotales){
            existe= servicio.buscarVentaEnServicio(ventaBD);
            if(existe>=0){                                                  //SI ENCUENTRA LA VENTA DEVUELVE EL INDEX QUE VA A SER 0 O MAYOR, SINO -1
                servicio.eliminarVentaAlServicio(existe);
                control.modificarServicio(servicio);
            }
        }
            
        List<PaqueteTuristico> paquetesTotales = listarPaquetes();          //CONTROLO SI LA VENTA SE RELACIONA CON ALGUN PAQUETE Y ELIMINO LA RELACION
        for(PaqueteTuristico paquete : paquetesTotales){
            existe= paquete.buscarVentaEnPaquete(ventaBD);
            if(existe>=0){
                paquete.eliminarVentaAlPaquete(existe);
                control.modificarPaquete(paquete);
            }
        }
            
        List<Cliente> clientesTotales = listarClientes();                   //CONTROLO SI LA VENTA SE RELACIONA CON ALGUN CLIENTE Y ELIMINO LA RELACION
        for(Cliente cliente : clientesTotales){
            existe= cliente.buscarVentaEnCliente(ventaBD);
            if(existe>=0){
                cliente.eliminarVentaAlCliente(existe);
                control.modificarCliente(cliente);
            }
        }
            
        control.eliminarVenta(Integer.parseInt(id));

    }
    
    public Venta buscarVenta(String id){
        return control.lecturaVentaEspecifica(Integer.parseInt(id));
    }
    
    public void editarVenta(Venta venta, String medioPago, String fechaVenta, String clienteNuevo, String queEsNuevo){
        venta.setFecha_venta(LocalDate.parse(fechaVenta));
        venta.setMedio_pago(medioPago);
        
        Cliente clienteViejo= clientePertenecienteAVenta(venta);                //Elimino la venta de la lista en el Cliente correspondiente si existe
        if(clienteViejo!=null){
            clienteViejo.eliminarVentaAlCliente( clienteViejo.buscarVentaEnCliente(venta) );
            control.modificarCliente(clienteViejo);
        }
        Cliente clienteVenta= buscarCliente( clienteNuevo );    //Agrego la venta a la lista en el Cliente correspondiente
        clienteVenta.agregarVentaAlCliente(venta);
        control.modificarCliente(clienteVenta);                                 //Actualizo la informacion del Cliente
        
        Servicio servicioVenta = servicioOPaquete( queEsNuevo ); //Si devuelve null es PaqueteTuristico
        PaqueteTuristico paqueteVenta;
        if(servicioVenta!=null){
            Servicio servicioViejo = servicioPertenecienteAVenta(venta);        //Elimino la venta de la lista en el Servicio correspondiente si existe
            if(servicioViejo!=null){
                servicioViejo.eliminarVentaAlServicio( servicioViejo.buscarVentaEnServicio(venta) );
                control.modificarServicio(servicioViejo);
            }
            PaqueteTuristico paqueteViejo= paquetePertenecienteAVenta(venta);
            if(paqueteViejo!=null){                                             //Elimino la venta de la lista en el Paquete correspondiente si existe
                paqueteViejo.eliminarVentaAlPaquete(paqueteViejo.buscarVentaEnPaquete(venta) );
                control.modificarPaquete(paqueteViejo);
            }
            
            servicioVenta.agregarVentaAlServicio(venta);
            control.modificarServicio(servicioVenta); //Actualizo la BD del Servicio
        }else{
            PaqueteTuristico paqueteViejo= paquetePertenecienteAVenta(venta);   //Elimino la venta de la lista en el Paquete correspondiente si existe
            if(paqueteViejo!=null){
                paqueteViejo.eliminarVentaAlPaquete( paqueteViejo.buscarVentaEnPaquete(venta) );
                control.modificarPaquete(paqueteViejo);
            }
            Servicio servicioViejo = servicioPertenecienteAVenta(venta);        //Elimino la venta de la lista en el Servicio correspondiente si existe
            if(servicioViejo!=null){
                servicioViejo.eliminarVentaAlServicio( servicioViejo.buscarVentaEnServicio(venta) );
                control.modificarServicio(servicioViejo);
            }
            
            paqueteVenta= control.lecturaPaqueteEspecifico(Integer.parseInt( queEsNuevo ));
            paqueteVenta.agregarVentaAlPaquete(venta);
            control.modificarPaquete(paqueteVenta); //Actualizo la BD del Paquete
        }
        
        control.modificarVenta(venta);
    }
    
    public List<Venta> listarVentas() {
        return control.listarVentas();
    }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------CRUD SERVICIO----------------------------------------------------------------------------------------------------------
    public void crearServicio(String nombre, String costo, String fechaServicio, String destino, String descripcion) {
        Servicio servicio= new Servicio();
        
        servicio.setNombre(nombre);
        servicio.setCosto_servicio(Double.parseDouble(costo));
        servicio.setFecha_servicio(LocalDate.parse(fechaServicio));
        servicio.setDestino_ser(destino);
        servicio.setDescripcion_breve(descripcion);
        
        control.crearServicio(servicio);
    }
    
    public void eliminarServicio(String idServicio) {
        control.eliminarServicio( Integer.parseInt(idServicio));
    }
    
    public Servicio buscarServicio(String idServicio){
        return control.lecturaServicioEspecifico(Integer.parseInt(idServicio));
    }
    
    public void editarServicio(Servicio servicio, String nombreNuevo, String descripcionNueva, String destinoNuevo, String costoNuevo, String fechaNueva){
        servicio.setNombre(nombreNuevo);
        servicio.setDescripcion_breve(descripcionNueva);
        servicio.setDestino_ser(destinoNuevo);
        servicio.setCosto_servicio(Double.parseDouble(costoNuevo));
        servicio.setFecha_servicio(LocalDate.parse(fechaNueva));
        
        control.modificarServicio(servicio);
    }
    
    public List<Servicio> listarServicios() {
        return control.listarServicios();
    }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------CRUD PAQUETE TURISTICO----------------------------------------------------------------------------------------------------------
    public void crearPaqueteTuristico(List<Servicio> serviciosSeleccionados){
        PaqueteTuristico paqueteNuevo = new PaqueteTuristico();
        paqueteNuevo.setCosto_paquete( calcularCostoPaquete(serviciosSeleccionados) );               
        paqueteNuevo.setLista_servicios(serviciosSeleccionados);
        control.crearPaquete(paqueteNuevo);
    }
    
    public void eliminarPaquete(String idPaquete){
        control.eliminarPaquete(Integer.parseInt(idPaquete));
    }
    
    public PaqueteTuristico buscarPaquete(String id_paquete){
        return control.lecturaPaqueteEspecifico( Integer.parseInt(id_paquete) );
    }
    
    public void editarPaquete(PaqueteTuristico paquete, String[] serviciosAAgregar, String[] serviciosAEliminar){
        //Eliminar Servicios
        if(serviciosAEliminar!=null){
            for (String servicioSeleccionado : serviciosAEliminar) {                //Primero obtengo el String del Id, luego a partir del Id el Servicio y por ultimo busco el Servicio en la lista del Paquete y lo elimino.
                String[] splitServicio = servicioSeleccionado.split("-");
                Servicio servicioObtenido = buscarServicio(splitServicio[0]);
                paquete.eliminarServicioAlPaquete( paquete.buscarServicioEnPaquete(servicioObtenido) );
            }
        }
        //Agregar Servicios
        if(serviciosAAgregar!=null){
            for (String servicioSeleccionado : serviciosAAgregar) {
                String[] splitServicio = servicioSeleccionado.split("-");
                Servicio servicioObtenido = buscarServicio(splitServicio[0]);
                paquete.agregarServicioAlPaquete(servicioObtenido);
            }
        }
        paquete.setCosto_paquete( calcularCostoPaquete( paquete.getLista_servicios() ) );
        
        control.modificarPaquete(paquete);
    }
    
    public List<PaqueteTuristico> listarPaquetes() {
        return control.listarPaquetes();
    }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
//----------------------------------------------------------------------CRUD USUARIO----------------------------------------------------------------------------------------------------------
    public void crearUsuario(String usuario, String nombre, String apellido, String domicilio, String documento, String fechaNac, String celular, String nacionalidad, String email, String pass) {
        Usuario user = new Usuario();
        user.setUser(usuario);
        user.setPass(pass);
        control.crearUsuario(user);
        
        crearEmpleado(user, nombre, apellido, domicilio, documento, fechaNac, celular, nacionalidad, email);
    }
    
    public void crearUsuarioRoot(String usuario, String pass){                  //Agregado para la creacion del Admin/Usuario root
        Usuario usuarioRoot = new Usuario();
        usuarioRoot.setId_usuario(0);
        usuarioRoot.setUser(usuario);
        usuarioRoot.setPass(pass);
        if(ControlUsuarios(usuario, pass)<0){
            control.crearUsuario(usuarioRoot);
        }
    }
    
    public void eliminarUsuario(int id){
        control.eliminarUsuario(id);
    }
    public Usuario editarUsuario(Usuario usuarioAEditar, String user, String pass) {
        usuarioAEditar.setUser(user);
        usuarioAEditar.setPass(pass);
        control.modificarUsuario(usuarioAEditar);
        return control.lecturaUsuarioEspecifico(usuarioAEditar.getId_usuario());
        
    }
    
    public Usuario buscarUsuario(String id){
        return control.lecturaUsuarioEspecifico(Integer.parseInt(id));
    }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------CRUD EMPLEADO----------------------------------------------------------------------------------------------------------
    public void crearEmpleado(Usuario user, String nombre, String apellido, String domicilio, String documento, String fechaNac, String celular, String nacionalidad, String email) {
        Empleado empleado= new Empleado();
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(domicilio);        
        empleado.setDni(documento);
        empleado.setFecha_nac(LocalDate.parse(fechaNac));        
        empleado.setCelular(celular);
        empleado.setNacionalidad(nacionalidad);
        empleado.setEmail(email);
        empleado.setUsuario_empleado(user);

        control.crearEmpleado(empleado);
    }
    
    public void eliminarEmpleado( String idEmpleado){
        Empleado empleadoEliminado = buscarEmpleado(idEmpleado);
        
        control.eliminarEmpleado(Integer.parseInt(idEmpleado));
        eliminarUsuario( empleadoEliminado.getUsuario_empleado().getId_usuario() );
    }
    
    //EDITAR DEL LADO DEL EMPLEADO
    public Empleado editarEmpleado(Empleado empleadoAEditar, Object id_usuario, String nombre, String apellido, String direccion, String dni, String fecha_nac, String nacionalidad, String celular, String email, String nombreUsuario, String pass, String cargo, double sueldo){
        Usuario usuarioEditado= buscarUsuario( String.valueOf(id_usuario) );
        
        empleadoAEditar.setNombre(nombre);
        empleadoAEditar.setApellido(apellido);
        empleadoAEditar.setDireccion(direccion);
        empleadoAEditar.setDni(dni);
        empleadoAEditar.setFecha_nac(LocalDate.parse(fecha_nac) );
        empleadoAEditar.setNacionalidad(nacionalidad);
        empleadoAEditar.setCelular(celular);
        empleadoAEditar.setEmail(email);
        
        usuarioEditado = editarUsuario(usuarioEditado, nombreUsuario, pass);
        
        empleadoAEditar.setCargo(cargo);    //ESTOS SON VALORES QUE EL EMPLEADO NO PUEDE CAMBIAR, SINO EL ADMIN/SUPERVISOR
        empleadoAEditar.setSueldo(sueldo);
        
        empleadoAEditar.setUsuario_empleado(usuarioEditado);
        
        control.modificarUsuario(usuarioEditado);
        control.modificarEmpleado(empleadoAEditar);
        
        return control.lecturaEmpleadoEspecifico(empleadoAEditar.getId());
    }
    
    //EDITAR DEL LADO DEL EMPLEADOR
    public Empleado editarEmpleado(Empleado empleadoAEditar, String nombre, String apellido, String direccion, String dni, String fecha_nac, String nacionalidad, String celular, String email, String cargo, String sueldo){

        empleadoAEditar.setNombre(nombre);
        empleadoAEditar.setApellido(apellido);
        empleadoAEditar.setDireccion(direccion);
        empleadoAEditar.setDni(dni);
        empleadoAEditar.setFecha_nac(LocalDate.parse(fecha_nac));
        empleadoAEditar.setNacionalidad(nacionalidad);
        empleadoAEditar.setCelular(celular);
        empleadoAEditar.setEmail(email);
        empleadoAEditar.setCargo(cargo);
        empleadoAEditar.setSueldo(Double.parseDouble(sueldo));

        control.modificarEmpleado(empleadoAEditar);
        
        return control.lecturaEmpleadoEspecifico(empleadoAEditar.getId());
    }
    
    public Empleado buscarEmpleado(String idEmpleado){
        return control.lecturaEmpleadoEspecifico(Integer.parseInt(idEmpleado) );    
    }
    
    public List<Empleado> listarEmpleados(){
        return control.listarEmpleados();
    }
    
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------METODOS FUERA DEL CRUD----------------------------------------------------------------------------------
    public int ControlUsuarios(String usuario, String pass) {                   //Controla la existencia del usuario en la BD.
        List<Usuario> usuariosTotales= control.listarUsuarios();
        for(Usuario u: usuariosTotales){
            if(u.getUser().equals(usuario) && u.getPass().equals(pass)){        //Existe el usuario con la contraseña en la BD.
                return u.getId_usuario();
            }
            if(u.getUser().equals(usuario)){
                return -2;                                                      //Existe el nombre de usuario en la BD. Para corroborar que el nombre ya existe al momento de crear uno nuevo.
            }
        }
        return -1;
    }

    public Empleado setearEmpleadoDeSesion(int idUsuario) {                     //Identifica cual es el Empleado que esta en sesion.
        List<Empleado> empleadosTotal = control.listarEmpleados();
        for(Empleado e: empleadosTotal){
            if(idUsuario==e.getUsuario_empleado().getId_usuario()){
                return e;
            }
        }
        return null;
    }

    public Servicio servicioOPaquete(String parametro) {                        //Averigua que es lo que se selecciono en el select, si un servicio o un paquete turistico.
        List<Servicio> listaServicios= listarServicios();
        for(Servicio serv : listaServicios){
            if(parametro.equals(serv.getNombre())){
                return serv;
            }
        }
        return null;
    }
    
    public Venta obtenerUltimaVentaCreada() {                                   //Obtiene la ultima venta creada en la BD.
        Venta ventaCreada;
        List<Venta> listaVentas= listarVentas();
        ventaCreada= listaVentas.get(listaVentas.size()-1);
        return ventaCreada;
    }
    
    public Cliente clientePertenecienteAVenta(Venta venta) {                    //Averigua el cliente que pertenece a la Venta dada.
        List<Cliente> clientesTotales = listarClientes();
        for(Cliente c: clientesTotales){
            if(c.buscarVentaEnCliente(venta)>=0){
                return c;
            }
        }
        return null;
    }
    
    public Servicio servicioPertenecienteAVenta(Venta venta) {                  //Averigua el servicio que pertenece a la Venta dada.
        List<Servicio> serviciosTotales = listarServicios();
        for(Servicio s: serviciosTotales){
            if(s.buscarVentaEnServicio(venta)>=0){
                return s;
            }
        }
        return null;
    }
    
    public PaqueteTuristico paquetePertenecienteAVenta(Venta venta) {           //Averigua el paquete Turistico que pertenece a la Venta dada.
        List<PaqueteTuristico> paquetesTotales = listarPaquetes();
        for(PaqueteTuristico p: paquetesTotales){
            if(p.buscarVentaEnPaquete(venta)>=0){
                return p;
            }
        }
        return null;
    }
    
    public double calcularCostoPaquete(List<Servicio> serviciosSeleccionados){  //Calcula el costo total del paquete turistico.
        int sumaCosto=0;
        for(Servicio servicio : serviciosSeleccionados){
            sumaCosto +=servicio.getCosto_servicio();
        }
        return sumaCosto-(sumaCosto*0.1);                                       //10% de rebaja por contratar el paquete
    }
    
    public Venta buscarVentaPorEmpleado(String id, Empleado empleadoEnSesion){  //Si la venta buscada pertenece al Empleado en sesion la devuelve, de lo contrario devuelve null.
        Venta ventaBuscada = buscarVenta(id);
        if(empleadoEnSesion.buscarVentaEnEmpleado(ventaBuscada) >= 0){
            return ventaBuscada;
        }else{
            return null;
        }
    }
    
    public Cliente buscarClientePorEmpleado(String id, Empleado empleadoEnSesion){  //Si el cliente buscado pertenece al Empleado en sesion lo devuelve, de lo contrario devuelve null.
        Cliente clienteBuscado = buscarCliente(id);
        List<Venta> comprasDelCliente = clienteBuscado.getVentas_cliente();         //Obtengo la lista de ventas del cliente y en esa lista de ventas debe figurar el empleado en sesion.
        for(Venta v: comprasDelCliente){
            if(empleadoEnSesion.buscarVentaEnEmpleado(v) >= 0){
                return clienteBuscado;
            }
        }
        return null;
    }
    
    public double calcularCostoVentaConComision(Venta v){                       //Calcula el costo total de la venta agregando la comision.
        String medioPagoVenta = v.getMedio_pago();
        double costoVentaConComision;
        Servicio servicioVenta = servicioPertenecienteAVenta(v);
        PaqueteTuristico paqueteVenta = paquetePertenecienteAVenta(v);
        
        switch(medioPagoVenta){
            case "Tarjeta de Credito":
                    if(servicioVenta!=null){
                        costoVentaConComision = servicioVenta.getCosto_servicio()+ (servicioVenta.getCosto_servicio()*0.09);    //9%
                    }else{
                        costoVentaConComision = paqueteVenta.getCosto_paquete()+ (paqueteVenta.getCosto_paquete()*0.09);
                    }
                    break;
            case "Tarjeta de Debito":
                    if(servicioVenta!=null){
                        costoVentaConComision = servicioVenta.getCosto_servicio()+ (servicioVenta.getCosto_servicio()*0.03);    //3%
                    }else{
                        costoVentaConComision = paqueteVenta.getCosto_paquete()+ (paqueteVenta.getCosto_paquete()*0.03);
                    }
                    break;
            case "Transferencia":
                    if(servicioVenta!=null){
                        costoVentaConComision = servicioVenta.getCosto_servicio()+ (servicioVenta.getCosto_servicio()*0.0245);  //2.45%
                    }else{
                        costoVentaConComision = paqueteVenta.getCosto_paquete()+ (paqueteVenta.getCosto_paquete()*0.0245);
                    }
                    break;
            default:
                if(servicioVenta!=null){
                        costoVentaConComision = servicioVenta.getCosto_servicio();                                              //SIN COMISION
                }else{
                        costoVentaConComision = paqueteVenta.getCosto_paquete();
                }
                break;
        }
        return costoVentaConComision;
    }
    
    public double gananciasDia(String fechaBuscada) {                           // Calcula las ganancias totales del dia dado una fecha especifica.
        LocalDate fecha = LocalDate.parse(fechaBuscada);
        LocalDate fechaVenta;
        double gananciasDelDia=0;
        int dia = fecha.getDayOfMonth();
        int mes = fecha.getMonthValue();
        List<Venta> ventasTotales = listarVentas();
        
        for(Venta v : ventasTotales){
            fechaVenta = v.getFecha_venta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            if(fechaVenta.getMonthValue()== mes){
                if(fechaVenta.getDayOfMonth() == dia){
                    gananciasDelDia += calcularCostoVentaConComision(v);
                }
            }
        }
        return gananciasDelDia;
    }
    
    public double gananciasMes(String fechaBuscada) {                           // Calcula las ganancias totales del mes dado una fecha especifica.
        LocalDate fecha = LocalDate.parse(fechaBuscada);
        LocalDate fechaVenta;
        double gananciasDelMes=0;
        int mes = fecha.getMonthValue();
        List<Venta> ventasTotales = listarVentas();
        
        for(Venta v : ventasTotales){
            fechaVenta = v.getFecha_venta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            if(fechaVenta.getMonthValue()== mes){
                gananciasDelMes+= calcularCostoVentaConComision(v);
            }
        }
        return gananciasDelMes;
    }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
