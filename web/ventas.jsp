<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>
<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
       <div class="dashboard-header">
        <nav class="navbar navbar-expand-lg bg-white fixed-top">
            <a class="navbar-brand" href="inicio.jsp">Servicio Turistico</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" style="color: gray;"><i class="fas fa-angle-double-down"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navbar-right-top">
                    <li class="nav-item dropdown nav-user">
                        <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user mr-2"> Usuario</i></a>
                        <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                            <div class="nav-user-info">
                                <h5 class="mb-0 text-white nav-user-name">
                                        <%
                                            HttpSession nuevaSesion= request.getSession();
                                            Empleado em = (Empleado)nuevaSesion.getAttribute("sesionEmpleado");
                                            out.print(em.getNombre()+" "+em.getApellido());
                                        %>
                                </h5>
                                <span class="status"></span><span class="ml-2">Available</span>
                            </div>
                            <a class="dropdown-item" href="perfilAdministrativo.jsp"><i class="fas fa-user mr-2"></i>Perfil</a>
                                <a class="dropdown-item" href="editarUsuario-Empleado.jsp"><i class="fas fa-cog mr-2"></i>Configuracion</a>
                                <a class="dropdown-item" href="LogOut"><i class="fas fa-power-off mr-2"></i>Salir</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
      <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Navegación</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-rocket"></i>Ventas</a>
                                <div id="submenu-2" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="ventas.jsp#crearVenta">Crear Venta<span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ventas.jsp#eliminarVenta">Eliminar Venta</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ventas.jsp#buscarVentas">Buscar Venta</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ventas.jsp#modificarVenta">Modificar Venta</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ventas.jsp#listarVentas">Listar Ventas</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-tasks"></i>Servicios</a>
                                <div id="submenu-3" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="serviciosEmpleado.jsp#buscarServicio">Buscar Servicio</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="serviciosEmpleado.jsp#listarServicios">Listar Servicios</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fas fa-box-open"></i>Paquetes de Servicios</a>
                                <div id="submenu-4" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesEmpleado.jsp#buscarPaquete">Buscar Paquete</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesEmpleado.jsp#listarPaquetes">Listar Paquetes</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-street-view"></i>Clientes</a>
                                <div id="submenu-5" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="clientes.jsp#crearCliente">Crear Cliente<span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="clientes.jsp#eliminarCliente">Eliminar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="clientes.jsp#buscarClientes">Buscar Clientes</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="clientes.jsp#modificarCliente">Modificar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="clientes.jsp#listarClientes">Listar Clientes</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <a name="crearVenta"><h2 class="pageheader-title" id="inicio">Crear Venta</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ventas.jsp" class="breadcrumb-link">Ventas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Crear Venta</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- FormularioCrear -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Nueva Venta</h5>
                                    <div class="card-body">
                                        <form id="formularioCrearVenta" action="CrearVenta" method="post">
                                            <div class="form-group">
                                                <label for="inputFecVenta" class="col-form-label">Fecha de Venta</label>
                                                <input id="inputFecVenta" name="inputFecVenta"  type="date" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPago">Medio de Pago</label>
                                                <select class="form-control" id="inputPago" name="inputPago" required>
                                                    <option>Efectivo</option>
                                                    <option>Tarjeta de Credito</option>
                                                    <option>Tarjeta de Debito</option>
                                                    <option>Monedero Virtual</option>
                                                    <option>Transferencia</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputClienteVenta" class="col-form-label">Cliente de la Venta</label>
                                                <select class="form-control" id="inputClienteVenta" name="inputClienteVenta">
                                                    <option selected>-</option>
                                                    <%  
                                                        ControladoraLogica controlL= new ControladoraLogica();
                                                        List<Cliente> listaClientes = controlL.listarClientes();
                                                        for(Cliente cliente : listaClientes){
                                                            out.print("<option>"+cliente.getId()+"</option>\n");
                                                        }
                                                        %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputQueEs">Servicio o Paquete de Servicios</label>
                                                <select class="form-control" id="inputQueEs" name="inputQueEs">
                                                    <optgroup label="Servicios" id="listaServiciosDisponibles">
                                                        <%  
                                                            List<Servicio> listaServicios = controlL.listarServicios();
                                                            for(Servicio servicio: listaServicios){
                                                                out.print("<option>"+servicio.getNombre()+"</option>\n");
                                                            }
                                                        %>
                                                    </optgroup>
                                                    <optgroup label="Paquete Turistico" id="listaPaquetesDisponibles">
                                                        <%  
                                                            List<PaqueteTuristico> listaPaquetes = controlL.listarPaquetes();
                                                            for(PaqueteTuristico pack : listaPaquetes){
                                                                out.print("<option>"+ String.valueOf( pack.getCodigo_paquete() ) +"</option>\n");
                                                            }
                                                        %>
                                                    </optgroup>
                                                </select>
                                            </div>
                                            
                                            <button style="width: 100px; float: right;" id="botonCrearVenta" type="submit" class="btn btn-primary btn-lg btn-block">Crear</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina FormularioCrear  -->
                        <!-- ============================================================== -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <a name="eliminarVenta"><h2 class="pageheader-title" style="margin-top: 50px;">Eliminar Venta </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ventas.jsp" class="breadcrumb-link">Ventas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Eliminar Venta</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- FormularioEliminar  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Eliminar Venta</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarVenta">
                                            <div class="form-group">
                                                <label for="inputVentaCreada">Ventas Creadas</label>
                                                <select class="form-control" id="inputVentaCreada" name="inputVentaCreada">
                                                    <option selected>-</option>
                                                    <%  
                                                        List<Venta> listaVentas = em.getVentas_empleado();
                                                        for(Venta venta : listaVentas){
                                                            out.print("<option>"+ String.valueOf( venta.getNum_venta() ) +"</option>\n");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonEliminarVenta" type="submit" class="btn btn-primary btn-lg btn-block botonEliminar">Eliminar</button>
                                        </form>
                                    </div>
                                    <h5 class="card-header">Eliminar Venta por Id</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarVenta">
                                            <div class="form-group">
                                                <label for="inputIdVenta" class="col-form-label">Id de la Venta</label>
                                                <input id="inputIdVenta" name="inputIdVenta" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonEliminarVenta" type="submit" class="btn btn-primary btn-lg btn-block botonEliminar">Eliminar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina FormularioEliminar  -->
                        <!-- ============================================================== -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <a name="buscarVentas"><h2 class="pageheader-title" style="margin-top: 50px;">Buscar Ventas </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ventas.jsp" class="breadcrumb-link">Ventas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar Venta</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                       <!-- ============================================================== -->
                        <!-- FormularioBuscar -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Buscar Venta</h5>
                                    <div class="card-body">
                                        <form method="get" action="BuscarVenta">
                                            <div class="form-group">
                                                <label for="inputIdVentaBuscada" class="col-form-label">Id de la Venta</label>
                                                <input id="inputIdVentaBuscada" name="inputIdVentaBuscada" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarVenta">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header">Venta Buscada</h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                        Venta ventaBuscada= (Venta)nuevaSesion.getAttribute("ventaBuscada");
                                                                        if(ventaBuscada!=null){  //Si existe el Atributo mostrar la venta
                                                                    %>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Fecha de Venta</th>
                                                                                <th scope="col">Medio de Pago</th>
                                                                                <th scope="col">Id-Cliente</th>
                                                                                <th scope="col">Id-Servicio</th>
                                                                                <th scope="col">Id-Paquete</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print(ventaBuscada.getNum_venta());%></th>
                                                                                <td><%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(ventaBuscada.getFecha_venta());
                                                                                    out.print(fechaDate);
                                                                                    %></td>
                                                                                <td><%out.print(ventaBuscada.getMedio_pago());%></td>
                                                                                <td><%
                                                                                    Cliente clienteVenta= controlL.clientePertenecienteAVenta(ventaBuscada);
                                                                                    if(clienteVenta==null){
                                                                                        out.print("vacio");
                                                                                    }else{
                                                                                        out.print(clienteVenta.getId());
                                                                                    }
                                                                                    %></td>
                                                                                <td><%
                                                                                    Servicio servicioVenta= controlL.servicioPertenecienteAVenta(ventaBuscada);
                                                                                    if(servicioVenta==null){
                                                                                        out.print("vacio");
                                                                                    }else{
                                                                                    out.print(servicioVenta.getCodigo_servicio());
                                                                                    }
                                                                                    %></td>
                                                                                <td><%
                                                                                    PaqueteTuristico paqueteVenta= controlL.paquetePertenecienteAVenta(ventaBuscada);
                                                                                    if(paqueteVenta==null){
                                                                                        out.print("vacio");
                                                                                    }else{
                                                                                    out.print(paqueteVenta.getCodigo_paquete());
                                                                                    }
                                                                                    %></td> 
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}else{%>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Fecha de Venta</th>
                                                                                <th scope="col">Medio de Pago</th>
                                                                                <th scope="col">Id-Cliente</th>
                                                                                <th scope="col">Id-Servicio</th>
                                                                                <th scope="col">Id-Paquete</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print("Vacio");%></th>
                                                                                <td><%out.print("Vacio");%></td>
                                                                                <td><%out.print("Vacio");%></td>
                                                                                <td><%out.print("Vacio");%></td>
                                                                                <td><%out.print("Vacio");%></td>
                                                                                <td><%out.print("Vacio");%></td> 
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonBuscarVenta" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina FormularioBuscar  -->
                        <!-- ============================================================== -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <a name="modificarVenta"><h2 class="pageheader-title" id="inicio">Modificar Venta</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ventas.jsp" class="breadcrumb-link">Ventas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar Venta</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- FormularioModificar -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Modificar Venta</h5>
                                    <div class="card-body">
                                        <form method="post" action="ModificarVenta">
                                            <div class="form-group">
                                                <label for="inputIdVentaVieja" class="col-form-label">Id Venta a Modificar</label>
                                                <input id="inputIdVentaVieja" name="inputIdVentaAModificar" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonModificarVenta" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                                        </form>
                                        <br><br><br>
                                        <h5>Datos Traidos Para Modificar</h5>
                                        <form method="post" action="ModificarVenta">
                                            <%
                                                ventaBuscada= (Venta)nuevaSesion.getAttribute("ventaAModificar");
                                                if(ventaBuscada!=null){
                                            %>
                                            <div class="form-group">
                                                <label for="inputFechaVentaNueva" class="col-form-label">Fecha de Venta</label>
                                                <input id="inputFechaVentaNueva" name="inputFechaVentaNueva" type="date" value="<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                                                                  String fechaDate = sdf.format(ventaBuscada.getFecha_venta());
                                                                                                                                  out.print(fechaDate);%>" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPagoVentaNueva">Medio de Pago</label>
                                                <select class="form-control" id="inputPagoVentaNueva" name="inputPagoVentaNueva" required>
                                                    <%String medioPago= ventaBuscada.getMedio_pago();%>
                                                    <%if(medioPago.equals("Efectivo")){out.print("<option selected>Efectivo</option>");}else{out.print("<option>Efectivo</option>");}%>
                                                    <%if(medioPago.equals("Tarjeta de Credito")){out.print("<option selected>Tarjeta de Credito</option>");}else{out.print("<option>Tarjeta de Credito</option>");}%>
                                                    <%if(medioPago.equals("Tarjeta de Debito")){out.print("<option selected>Tarjeta de Debito</option>");}else{out.print("<option>Tarjeta de Debito</option>");}%>
                                                    <%if(medioPago.equals("Monedero Virtual")){out.print("<option selected>Monedero Virtual</option>");}else{out.print("<option>Monedero Virtual</option>");}%>
                                                    <%if(medioPago.equals("Transferencia")){out.print("<option selected>Transferencia</option>");}else{out.print("<option>Transferencia</option>");}%>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                            <label for="inputClienteVentaNuevo" class="col-form-label">Cliente de la Venta</label>
                                            <select class="form-control" id="inputClienteVentaNuevo" name="inputClienteVentaNuevo">
                                                <%  
                                                    listaClientes = controlL.listarClientes();
                                                    Cliente clienteVenta = controlL.clientePertenecienteAVenta(ventaBuscada);
                                                    if(clienteVenta==null){
                                                        out.print("<option selected>-</option>");
                                                    }
                                                    for(Cliente cliente : listaClientes){
                                                        if(clienteVenta!=null && clienteVenta.equals(cliente)){
                                                            out.print("<option selected>"+cliente.getId()+"</option>\n");
                                                        }else{
                                                            out.print("<option>"+cliente.getId()+"</option>\n");
                                                        }
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputQueEsNuevo">Servicio o Paquete de Servicios</label>
                                                <select class="form-control" id="inputQueEsNuevo" name="inputQueEsNuevo">
                                                    <optgroup label="Servicios" id="listaServiciosDisponibles">
                                                        <%  
                                                            Servicio servicioVenta= controlL.servicioPertenecienteAVenta(ventaBuscada);
                                                            listaServicios = controlL.listarServicios();
                                                            for(Servicio servicio: listaServicios){
                                                                if(servicioVenta!=null && servicioVenta.getCodigo_servicio() == servicio.getCodigo_servicio()){
                                                                    out.print("<option selected>"+servicio.getNombre()+"</option>\n");
                                                                }else{
                                                                    out.print("<option>"+servicio.getNombre()+"</option>\n");
                                                                } 
                                                            }
                                                        %>
                                                    </optgroup>
                                                    <optgroup label="Paquete Turistico" id="listaPaquetesDisponibles">
                                                        <%  
                                                            PaqueteTuristico paqueteVenta= controlL.paquetePertenecienteAVenta(ventaBuscada);
                                                            listaPaquetes = controlL.listarPaquetes();
                                                            if(paqueteVenta==null && servicioVenta==null){
                                                                out.print("<option selected>-</option>");
                                                            }
                                                            for(PaqueteTuristico pack : listaPaquetes){
                                                                if( paqueteVenta!=null && paqueteVenta.getCodigo_paquete() == pack.getCodigo_paquete() ){
                                                                    out.print("<option selected>"+String.valueOf( pack.getCodigo_paquete() ) + "</option>\n");
                                                                }
                                                                else{
                                                                    out.print("<option>"+ String.valueOf( pack.getCodigo_paquete() ) +"</option>\n");
                                                                }
                                                            }
                                                        %>
                                                    </optgroup>
                                                </select>
                                            </div>
                                            <%}else{%>
                                            <div class="form-group">
                                                <label for="inputFechaVentaNueva" class="col-form-label">Fecha de Venta</label>
                                                <input id="inputFechaVentaNueva" name="inputFechaVentaNueva" type="date" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPagoVentaNueva">Medio de Pago</label>
                                                <select class="form-control" id="inputPagoVentaNueva" name="inputPagoVentaNueva" required>
                                                    <option>Efectivo</option>
                                                    <option>Tarjeta de Credito</option>
                                                    <option>Tarjeta de Debito</option>
                                                    <option>Monedero Virtual</option>
                                                    <option>Transferencia</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                            <label for="inputClienteVentaNuevo" class="col-form-label">Cliente de la Venta</label>
                                            <select class="form-control" id="inputClienteVentaNuevo" name="inputClienteVentaNuevo">
                                                <option selected>-</option>
                                                <%  
                                                    listaClientes = controlL.listarClientes();
                                                    for(Cliente cliente : listaClientes){
                                                        out.print("<option>"+cliente.getId()+"</option>\n");
                                                    }
                                                    %>
                                            </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputQueEsNuevo">Servicio o Paquete de Servicios</label>
                                                <select class="form-control" id="inputQueEsNuevo" name="inputQueEsNuevo">
                                                    <option selected>-</option>
                                                    <optgroup label="Servicios" id="listaServiciosDisponibles">
                                                        <%  
                                                            listaServicios = controlL.listarServicios();
                                                            for(Servicio servicio: listaServicios){
                                                                out.print("<option>"+servicio.getNombre()+"</option>\n");   
                                                            }
                                                        %>
                                                    </optgroup>
                                                    <optgroup label="Paquete Turistico" id="listaPaquetesDisponibles">
                                                        <%  
                                                            listaPaquetes = controlL.listarPaquetes();
                                                            for(PaqueteTuristico pack : listaPaquetes){
                                                                out.print("<option>"+ String.valueOf( pack.getCodigo_paquete() ) +"</option>\n");
                                                            }
                                                        %>
                                                    </optgroup>
                                                </select>
                                            </div>
                                            <%}%>
                                            <button style="width: 100px; float: right;" id="botonModificarVenta" type="submit" class="btn btn-primary btn-lg btn-block">Modificar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina FormularioModificar -->
                        <!-- ============================================================== -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <a name="listarVentas"><h2 class="pageheader-title" style="margin-top: 50px;">Listar Ventas</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ventas.jsp" class="breadcrumb-link">Ventas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Listar Ventas</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- Tabla Ventas -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Total de Ventas</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Fecha de Venta</th>
                                                    <th scope="col">Medio de Pago</th>
                                                    <th scope="col">Id-Cliente</th>
                                                    <th scope="col">Id-Servicio</th>
                                                    <th scope="col">Id-Paquete</th>
                                                    <th scope="col">Costo Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  listaVentas = em.getVentas_empleado();
                                                    for(Venta v: listaVentas){%>
                                                    <tr>
                                                        <th scope="row"><%out.print(v.getNum_venta());%></th>
                                                        <td><%
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                        String fechaDate = sdf.format(v.getFecha_venta());
                                                        out.print(fechaDate);
                                                        %></td>
                                                        <td><%out.print(v.getMedio_pago());%></td>
                                                        <td><%
                                                        Cliente clienteVenta= controlL.clientePertenecienteAVenta(v);
                                                        if(clienteVenta==null){
                                                            out.print("vacio");
                                                        }else{
                                                            out.print("<a href='clientes.jsp#cliente"+clienteVenta.getId()+"'>"+clienteVenta.getId()+"</a>");
                                                        }%></td>
                                                        <td><%
                                                        Servicio servicioVenta= controlL.servicioPertenecienteAVenta(v);
                                                        if(servicioVenta==null){
                                                            out.print("vacio");
                                                        }else{
                                                            out.print("<a href='serviciosEmpleado.jsp#servicio"+servicioVenta.getCodigo_servicio()+"'>"+servicioVenta.getCodigo_servicio()+"-"+servicioVenta.getNombre()+"</a>");
                                                        }%></td>
                                                        <td><%
                                                        PaqueteTuristico paqueteVenta= controlL.paquetePertenecienteAVenta(v);
                                                        if(paqueteVenta==null){
                                                            out.print("vacio");
                                                        }else{
                                                            out.print("<a href='paquetesEmpleado.jsp#paquete"+paqueteVenta.getCodigo_paquete()+"'>"+paqueteVenta.getCodigo_paquete()+"</a>");
                                                        }%></td>
                                                        <td><%out.print(controlL.calcularCostoVentaConComision(v));%></td>
                                                    </tr>     
                                                <%}%>                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina Tabla Ventas  -->
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div>
            <!-- sidenavbar -->
            <!-- ============================================================== -->
            <div class="col-xl-2 col-lg-2 col-md-6 col-sm-12 col-12">
                <div class="sidebar-nav-fixed">
                    <ul class="list-unstyled">
                        <li><a href="#inicio">Al principio</a></li>
                    </ul>
                </div>
            </div>
    <!-- ============================================================== -->
    <!-- end sidenavbar -->
    <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            Copyright © 2021. Todos los derechos reservados. Sistema hecho por <a href="https://www.linkedin.com/in/lucas-vera/">Vera Lucas</a>.
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end main wrapper -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
</body>
</html>
-