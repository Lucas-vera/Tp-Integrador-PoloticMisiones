<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paquetes Turisticos</title>
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
            <a class="navbar-brand" href="usuarioRoot.jsp" >Servicio Turistico</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" style="color: gray;"><i class="fas fa-angle-double-down"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navbar-right-top">
                    <li class="nav-item dropdown nav-user">
                        <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user mr-2"> Usuario Root</i></a>
                        <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                            <div class="nav-user-info">
                                <h5 class="mb-0 text-white nav-user-name">
                                        <%
                                            HttpSession nuevaSesion= request.getSession();
                                            out.print("Admin");
                                        %>
                                </h5>
                                <span class="status"></span><span class="ml-2">Available</span>
                            </div>
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
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-tasks"></i>Servicios</a>
                                <div id="submenu-3" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="servicios.jsp#crearServicio">Crear Servicio<span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="servicios.jsp#eliminarServicio">Eliminar Servicio</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="servicios.jsp#buscarServicio">Buscar Servicio</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="servicios.jsp#modificarServicio">Modificar Servicio</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="servicios.jsp#listarServicios">Listar Servicios</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fas fa-box-open"></i>Paquetes de Servicios</a>
                                <div id="submenu-4" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesTuristicos.jsp#crearPaquete">Crear Paquete<span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesTuristicos.jsp#eliminarPaquete">Eliminar Paquete</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesTuristicos.jsp#buscarPaquete">Buscar Paquete</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesTuristicos.jsp#modificarPaquete">Modificar Paquete</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="paquetesTuristicos.jsp#listarPaquetes">Listar Paquetes</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-4"><i class="fas fa-box-open"></i>Empleados</a>
                                <div id="submenu-5" class="collapse submenu" >
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="empleados.jsp#eliminarEmpleado">Eliminar Empleado</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="empleados.jsp#buscarEmpleado">Buscar Empleado</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="empleados.jsp#modificarEmpleado">Modificar Empleado</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="empleados.jsp#listarEmpleados">Listar Empleados</a>
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
                            <a name="crearPaquete"><h2 class="pageheader-title" id="inicio">Crear Paquete Turístico</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="paquetesTuristicos.jsp" class="breadcrumb-link">Paquetes de Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Crear Paquete</li>
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
                                    <h5 class="card-header">Nuevo Paquete Turistico</h5>
                                    <div class="card-body">
                                        <form method="post" action="CrearPaquete">
                                            <div class="form-group">
                                                <label for="inputServiciosDelPaquete">Servicios del Paquete Turistico</label>
                                                <select class="form-control" id="inputServiciosDelPaquete" name="inputServiciosDelPaquete" multiple size="7">
                                                    <%  
                                                        ControladoraLogica controlL = new ControladoraLogica();
                                                        List<Servicio> listaServicios = controlL.listarServicios();
                                                        for(Servicio servicio : listaServicios){
                                                            out.print("<option>"+ String.valueOf( servicio.getCodigo_servicio() ) +"</option>\n");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonCrearPaquete" name="botonCrearPaquete" type="submit" class="btn btn-primary btn-lg btn-block">Crear</button>
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
                            <a name="eliminarPaquete"><h2 class="pageheader-title" style="margin-top: 50px;">Eliminar Paquete Turístico</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="paquetesTuristicos.jsp" class="breadcrumb-link">Paquetes de Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Eliminar Paquete</li>
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
                                    <h5 class="card-header">Eliminar Paquete Turistico</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarPaquete">
                                            <div class="form-group">
                                                <label for="inputPaquetesCreados">Paquetes Turisticos Creados</label>
                                                <select class="form-control" id="inputPaquetesCreados" name="inputPaquetesCreados">
                                                    <option>-</option>
                                                    <%  
                                                        List<PaqueteTuristico> listaPaquetes = controlL.listarPaquetes();
                                                        for(PaqueteTuristico paquete : listaPaquetes){
                                                            out.print("<option>"+ String.valueOf( paquete.getCodigo_paquete() ) +"</option>\n");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonEliminarVenta" type="submit" class="btn btn-primary btn-lg btn-block botonEliminar">Eliminar</button>
                                        </form>
                                    </div>
                                    <h5 class="card-header">Eliminar Paquete Turistico por Id</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarPaquete">
                                            <div class="form-group">
                                                <label for="inputIdPaqueteEliminado" class="col-form-label">Id del Paquete Turistico</label>
                                                <input id="inputIdPaqueteEliminado" name="inputIdPaqueteEliminado" type="number" value="" class="form-control form-control-sm">
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
                            <a name="buscarPaquete"><h2 class="pageheader-title" style="margin-top: 50px;">Buscar Paquete Turístico</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="paquetesTuristicos.jsp" class="breadcrumb-link">Paquetes de Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar Paquete</li>
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
                                    <h5 class="card-header">Buscar Paquetes Turisticos</h5>
                                    <div class="card-body">
                                        <form method="get" action="BuscarPaquete">
                                            <div class="form-group">
                                                <label for="inputIdPaqueteBuscado" class="col-form-label">Id del Paquete Turistico</label>
                                                <input id="inputIdPaqueteBuscado" name="inputIdPaqueteBuscado" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarServicio">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header">Paquete Buscado</h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                    PaqueteTuristico paqueteBuscado= (PaqueteTuristico)nuevaSesion.getAttribute("paqueteBuscado");
                                                                    if(paqueteBuscado!=null){  //Si existe el Atributo mostrar el paquete
                                                                    %>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Costo del Paquete Turistico</th>
                                                                                <th scope="col">Servicios que Contiene</th>
                                                                                <th scope="col">Ventas que Integra</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print(paqueteBuscado.getCodigo_paquete());%></th>
                                                                                <td><%out.print(paqueteBuscado.getCosto_paquete());%></td>
                                                                                <td><%
                                                                                    List<Servicio> serviciosDelPaquete = paqueteBuscado.getLista_servicios();
                                                                                    String mensajeServicios="";
                                                                                    for(Servicio s : serviciosDelPaquete){
                                                                                        mensajeServicios+=s.getCodigo_servicio()+"-"+s.getNombre()+", ";
                                                                                    }
                                                                                    out.print(mensajeServicios);
                                                                                %></td>
                                                                                <td><%
                                                                                    List<Venta> ventasDelPaquete = paqueteBuscado.getVenta_paquete();
                                                                                    String mensajeVentas="";
                                                                                    for(Venta v: ventasDelPaquete){
                                                                                        mensajeVentas+=v.getNum_venta()+", ";
                                                                                    }
                                                                                    out.print(mensajeVentas);
                                                                                %></td> 
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}else{%>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Costo del Paquete Turistico</th>
                                                                                <th scope="col">Servicios que Contiene</th>
                                                                                <th scope="col">Ventas que Integra</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print("Vacio");%></th>
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
                                            <button style="width: 100px; float: right;" id="botonBuscarPaquete" name="botonBuscarPaquete" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
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
                            <a name="modificarPaquete"><h2 class="pageheader-title" id="inicio">Modificar Paquete Turístico</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="paquetesTuristicos.jsp" class="breadcrumb-link">Paquetes de Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar Paquete</li>
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
                                    <h5 class="card-header">Modificar Paquete Turistico</h5>
                                    <div class="card-body">
                                        <form method="post" action="ModificarPaquete">
                                            <div class="form-group">
                                                <label for="inputIdPaqueteViejo" class="col-form-label">Id Paquete Turistico a Modificar</label>
                                                <input id="inputIdPaqueteViejo" name="inputIdPaqueteViejo" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonModificarPaquete" name="botonModificarPaquete" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                                        </form>
                                    </div>
                                    <h5 class="card-header">Datos Traidos Para Modificar</h5>
                                    <div class="card-body">
                                        <form method="post" action="ModificarPaquete">
                                            <%
                                                paqueteBuscado= (PaqueteTuristico)nuevaSesion.getAttribute("paqueteAModificar");
                                                if(paqueteBuscado!=null){
                                                    
                                                    List<Servicio> serviciosDelPaquete= paqueteBuscado.getLista_servicios();
                                            %>  
                                            <div class="form-group">
                                                <label for="inputServicioAAgregar">Servicios a Agregar </label>
                                                <select class="form-control" id="inputServicioAAgregar" name="inputServicioAAgregar" multiple>
                                                    <%List<Servicio> serviciosCreados = controlL.listarServicios();
                                                    List<Servicio> serviciosYaSeleccionados= new ArrayList<>();
                                                    for(Servicio servicio : serviciosDelPaquete){
                                                        for(Servicio s : serviciosCreados){
                                                            if(servicio.getCodigo_servicio()==s.getCodigo_servicio()){
                                                                serviciosYaSeleccionados.add(s);
                                                            }
                                                        }
                                                    }
                                                    for(Servicio servicioYaSeleccionado : serviciosYaSeleccionados){
                                                        serviciosCreados.remove(servicioYaSeleccionado);
                                                    }
                                                    for(Servicio s : serviciosCreados){
                                                        out.print("<option>"+s.getCodigo_servicio()+"-"+s.getNombre()+"</option>");
                                                    }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputServicioAEliminarPaquete">Servicios a Eliminar del Paquete </label>
                                                <select class="form-control" id="inputServicioAEliminarPaquete" name="inputServicioAEliminarPaquete" multiple>
                                                    <%
                                                    for(Servicio servicio : serviciosDelPaquete){
                                                        out.print("<option>"+servicio.getCodigo_servicio()+"-"+servicio.getNombre()+"</option>");
                                                    }
                                                    %>
                                                </select>
                                            </div>
                                            <%}else{%>
                                            <div class="form-group">
                                                <label for="inputServicioAAgregar">Servicios a Agregar </label>
                                                <select class="form-control" id="inputServicioAAgregar" name="inputServicioAAgregar" multiple>
                                                    <option>-</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputServicioAEliminarPaquete">Servicios a Eliminar del Paquete </label>
                                                <select class="form-control" id="inputServicioAEliminarPaquete" name="inputServicioAEliminarPaquete" multiple>
                                                    <option>-</option>
                                                </select>
                                            </div>
                                            <%}%>
                                            <button style="width: 100px; float: right;" id="botonModificarPaquete" name="botonModificarPaquete" type="submit" class="btn btn-primary btn-lg btn-block">Modificar</button>
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
                            <a name="listarPaquetes"><h2 class="pageheader-title" style="margin-top: 50px;">Listar Paquetes Turísticos</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="paquetesTuristicos.jsp" class="breadcrumb-link">Paquetes de Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Listar Paquetes</li>
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
                        <!-- Tabla Paquetes -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Total de Paquetes</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Costo del Paquete Turistico</th>
                                                    <th scope="col">Servicios que Contiene</th>
                                                    <th scope="col">Ventas que Integra</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%listaPaquetes = controlL.listarPaquetes();
                                                for(PaqueteTuristico paquete : listaPaquetes){%>
                                                <tr>
                                                    <th scope="row"><%out.print("<a name='paquete"+paquete.getCodigo_paquete()+"'>"+paquete.getCodigo_paquete()+"</a>");%></th>
                                                    <td><%out.print(paquete.getCosto_paquete());%></td>
                                                    <td><%
                                                    List<Servicio> serviciosDelPaquete = paquete.getLista_servicios();
                                                    for(Servicio s : serviciosDelPaquete){
                                                        out.print(s.getCodigo_servicio()+"-"+s.getNombre()+", ");
                                                    }
                                                    %></td>
                                                    <td><%
                                                    List<Venta> ventasDelPaquete = paquete.getVenta_paquete();
                                                    for(Venta v: ventasDelPaquete){
                                                        out.print("<a href='usuarioRoot.jsp#venta"+v.getNum_venta()+"'>"+v.getNum_venta()+"</a>, ");
                                                    }
                                                    %></td> 
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- Termina Tabla Paquetes  -->
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
