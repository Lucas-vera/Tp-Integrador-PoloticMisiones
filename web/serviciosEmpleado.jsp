<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicios</title>
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
            <a class="navbar-brand" href="inicio.jsp" >Servicio Turistico</a>
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
                            <a name="buscarServicio"><h2 class="pageheader-title" style="margin-top: 50px;">Buscar Servicio </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="serviciosEmpleado.jsp" class="breadcrumb-link">Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar Servicio</li>
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
                                    <h5 class="card-header">Buscar Servicio</h5>
                                    <div class="card-body">
                                        <form method="get" action="BuscarServicio">
                                            <div class="form-group">
                                                <label for="inputIdServicioBuscado" class="col-form-label">Id del Servicio</label>
                                                <input id="inputIdServicioBuscado" name="inputIdServicioBuscado" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarServicio">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header">Servicio Buscado</h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                    ControladoraLogica controlL = new ControladoraLogica();
                                                                    Servicio servicioBuscado= (Servicio)nuevaSesion.getAttribute("servicioBuscado");
                                                                    if(servicioBuscado!=null){  //Si existe el Atributo mostrar el servicio
                                                                    %>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Nombre Servicio</th>
                                                                                <th scope="col">Descripcion</th>
                                                                                <th scope="col">Destino</th>
                                                                                <th scope="col">Fecha Servicio</th>
                                                                                <th scope="col">Costo</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print(servicioBuscado.getCodigo_servicio());%></th>
                                                                                <td><%out.print(servicioBuscado.getNombre());%></td>
                                                                                <td><%out.print(servicioBuscado.getDescripcion_breve());%></td>
                                                                                <td><%out.print(servicioBuscado.getDestino_ser());%></td> 
                                                                                <td><%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(servicioBuscado.getFecha_servicio());
                                                                                    out.print(fechaDate);
                                                                                %></td>
                                                                                <td><%out.print(servicioBuscado.getCosto_servicio());%></td> 
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}else{%>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Nombre Servicio</th>
                                                                                <th scope="col">Descripcion</th>
                                                                                <th scope="col">Destino</th>
                                                                                <th scope="col">Fecha Servicio</th>
                                                                                <th scope="col">Costo</th>
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
                                            <button style="width: 100px; float: right;" id="botonBuscarServicio" name="botonBuscarServicio" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
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
                            <a name="listarServicios"><h2 class="pageheader-title" style="margin-top: 50px;">Listar Servicios</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="serviciosEmpleado.jsp" class="breadcrumb-link">Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Listar Servicios</li>
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
                        <!-- Tabla Servicios -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Total de Servicios</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                    <%List<Servicio> serviciosTotales = controlL.listarServicios();%>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Nombre Servicio</th>
                                                    <th scope="col">Descripcion</th>
                                                    <th scope="col">Destino</th>
                                                    <th scope="col">Fecha Servicio</th>
                                                    <th scope="col">Costo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for(Servicio s: serviciosTotales){%>
                                                <tr>
                                                    <th scope="row"><%out.print("<a name='servicio"+s.getCodigo_servicio()+"'>"+s.getCodigo_servicio()+"</a>");%></th>
                                                    <td><%out.print(s.getNombre());%></td>
                                                    <td><%out.print(s.getDescripcion_breve());%></td>
                                                    <td><%out.print(s.getDestino_ser());%></td> 
                                                    <td><%
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                        String fechaDate = sdf.format(s.getFecha_servicio());
                                                        out.print(fechaDate);
                                                    %></td>
                                                    <td><%out.print(s.getCosto_servicio());%></td> 
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina Tabla Servicios  -->
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
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
</body>
</html>
