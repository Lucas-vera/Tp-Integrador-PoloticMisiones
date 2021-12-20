<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
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
                            <a name="crearCliente"><h2 class="pageheader-title" id="inicio">Crear Cliente</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="clientes.jsp" class="breadcrumb-link">Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Crear Cliente</li>
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
                                    <div class="card-body">
                                        <form id="formularioCrearCliente" method="post" action="CrearCliente" >
                                            <div class="section-block" id="basicform">
                                                <h3 class="section-title">Crear Cliente</h3>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNombreCliente" class="col-form-label">Nombre/s</label>
                                                <input id="inputNombreCliente" name="inputNombreCliente" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputApellidoCliente">Apellido/s</label>
                                                <input id="inputApellidoCliente" name="inputApellidoCliente" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDomicilioCliente" class="col-form-label">Direccion del Domicilio</label>
                                                <input id="inputDomicilioCliente" name="inputDomicilioCliente" type="text" class="form-control" placeholder="Calle 1234">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDniCliente">Documento</label>
                                                <input id="inputDniCliente" name="inputDniCliente" type="number" placeholder="" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputFechanacCliente" class="col-form-label">Fecha de Nacimiento</label>
                                                <input id="inputFechanacCliente" name="inputFechanacCliente" type="date" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNacionalidadCliente" class="col-form-label">Nacionalidad</label>
                                                <input id="inputNacionalidadCliente" name="inputNacionalidadCliente" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCelularCliente" class="col-form-label">Celular</label>
                                                <input id="inputCelularCliente" name="inputCelularCliente" type="number" placeholder="+54" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmailCliente" class="col-form-label">Correo Electronico</label>
                                                <input id="inputEmailCliente" name="inputEmailCliente" type="email" class="form-control" placeholder="1234@email.com">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonCrearCliente" name="botonCrearCliente" type="none" class="btn btn-primary btn-lg btn-block">Crear</button>
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
                            <a name="eliminarCliente"><h2 class="pageheader-title" style="margin-top: 50px;">Eliminar Cliente </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="clientes.jsp" class="breadcrumb-link">Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Eliminar Cliente</li>
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
                                    <h5 class="card-header">Eliminar Cliente</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarCliente">
                                            <div class="form-group">
                                                <label for="inputClientesCreados">Clientes Creados</label>
                                                <select class="form-control" id="inputClientesCreados" name="inputClientesCreados">
                                                    <option selected>-</option>
                                                    <%  
                                                        ControladoraLogica controlL = new ControladoraLogica();
                                                        List<Cliente> listaClientesTotales = controlL.listarClientes();
                                                        List<Cliente> listaClientes = new ArrayList<>();
                                                        for(Cliente c : listaClientesTotales){
                                                            if( controlL.buscarClientePorEmpleado(String.valueOf(c.getId()), em)!=null ){
                                                                listaClientes.add(c);
                                                            }
                                                        }
                                                        for(Cliente cliente : listaClientes){
                                                            out.print("<option>"+ String.valueOf( cliente.getId()) +"</option>\n");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonEliminarVenta" type="submit" class="btn btn-primary btn-lg btn-block botonEliminar">Eliminar</button>
                                        </form>
                                    </div>
                                    <h5 class="card-header">Eliminar Cliente por Id</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarCliente">
                                            <div class="form-group">
                                                <label for="inputIdClienteEliminado" class="col-form-label">Id del Cliente</label>
                                                <input id="inputIdClienteEliminado" name="inputIdClienteEliminado" type="number" value="" class="form-control form-control-sm">
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
                            <a name="buscarClientes"><h2 class="pageheader-title" style="margin-top: 50px;">Buscar Clientes </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="clientes.jsp" class="breadcrumb-link">Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar Clientes</li>
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
                                    <h5 class="card-header">Buscar Cliente</h5>
                                    <div class="card-body">
                                        <form method="get" action="BuscarCliente">
                                            <div class="form-group">
                                                <label for="inputIdClienteBuscado" class="col-form-label">Id del Cliente</label>
                                                <input id="inputIdClienteBuscado" name="inputIdClienteBuscado" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarCliente">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header">Cliente Buscado</h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                        Cliente clienteBuscado= (Cliente)nuevaSesion.getAttribute("clienteBuscado");
                                                                        if(clienteBuscado!=null){  //Si existe el Atributo mostrar el cliente
                                                                    %>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Nombre/s</th>
                                                                                <th scope="col">Apellido/s</th>
                                                                                <th scope="col">Domicilio</th>
                                                                                <th scope="col">Documento</th>
                                                                                <th scope="col">Fecha de Nacimiento</th>
                                                                                <th scope="col">Nacionalidad</th>
                                                                                <th scope="col">Celular</th>
                                                                                <th scope="col">Email</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print(clienteBuscado.getId());%></th>
                                                                                <td><%out.print(clienteBuscado.getNombre());%></td>
                                                                                <td><%out.print(clienteBuscado.getApellido());%></td>
                                                                                <td><%out.print(clienteBuscado.getDireccion());%></td>
                                                                                <td><%out.print(clienteBuscado.getDni());%></td>
                                                                                <td><%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(clienteBuscado.getFecha_nac());
                                                                                    out.print(fechaDate);
                                                                                    %></td>
                                                                                <td scope="row"><%out.print(clienteBuscado.getNacionalidad());%></td>
                                                                                <td scope="row"><%out.print(clienteBuscado.getCelular());%></td>
                                                                                <td scope="row"><%out.print(clienteBuscado.getEmail());%></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}else{%>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Id</th>
                                                                                <th scope="col">Nombre/s</th>
                                                                                <th scope="col">Apellido/s</th>
                                                                                <th scope="col">Domicilio</th>
                                                                                <th scope="col">Documento</th>
                                                                                <th scope="col">Fecha de Nacimiento</th>
                                                                                <th scope="col">Nacionalidad</th>
                                                                                <th scope="col">Celular</th>
                                                                                <th scope="col">Email</th>
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
                                            <button style="width: 100px; float: right;" id="botonBuscarCliente" name="botonBuscarCliente" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
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
                            <a name="modificarCliente"><h2 class="pageheader-title" id="inicio">Modificar Cliente</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="clientes.jsp" class="breadcrumb-link">Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar Cliente</li>
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
                                    <h5 class="card-header">Modificar Cliente</h5>
                                    <div class="card-body">
                                        <form method="post" action="ModificarCliente">
                                            <div class="form-group">
                                                <label for="inputIdClienteViejo" class="col-form-label">Id Cliente a Modificar</label>
                                                <input id="inputIdClienteViejo" name="inputIdClienteViejo" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonModificarCliente" name="botonModificarCliente" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                                        </form>
                                        <br><br><br>
                                        <h5>Datos Traidos Para Modificar</h5>
                                        <form method="post" action="ModificarCliente">
                                            <%
                                                clienteBuscado= (Cliente)nuevaSesion.getAttribute("clienteAModificar");
                                                if(clienteBuscado!=null){
                                            %>
                                            <div class="form-group">
                                                <label for="inputNombreClienteNuevo" class="col-form-label">Nombre/s</label>
                                                <input id="inputNombreClienteNuevo" name="inputNombreClienteNuevo" type="text" class="form-control" value="<%out.print(clienteBuscado.getNombre());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputApellidoClienteNuevo">Apellido/s</label>
                                                <input id="inputApellidoClienteNuevo" name="inputApellidoClienteNuevo" type="text" class="form-control" value="<%out.print(clienteBuscado.getApellido());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDomicilioClienteNuevo" class="col-form-label">Direccion del Domicilio</label>
                                                <input id="inputDomicilioClienteNuevo" name="inputDomicilioClienteNuevo" type="text" class="form-control" placeholder="Calle 1234" value="<%out.print(clienteBuscado.getDireccion());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDniClienteNuevo">Documento</label>
                                                <input id="inputDniClienteNuevo" name="inputDniClienteNuevo" type="number" placeholder="" class="form-control" value="<%out.print(clienteBuscado.getDni());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputFechanacClienteNuevo" class="col-form-label">Fecha de Nacimiento</label>
                                                <input id="inputFechanacClienteNuevo" name="inputFechanacClienteNuevo" type="date" class="form-control" value="<%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(clienteBuscado.getFecha_nac());
                                                                                    out.print(fechaDate);
                                                                                    %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNacionalidadClienteNuevo" class="col-form-label">Nacionalidad</label>
                                                <input id="inputNacionalidadClienteNuevo" name="inputNacionalidadClienteNuevo" type="text" class="form-control" value="<%out.print(clienteBuscado.getNacionalidad());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCelularClienteNuevo" class="col-form-label">Celular</label>
                                                <input id="inputCelularClienteNuevo" name="inputCelularClienteNuevo" type="number" placeholder="+54" class="form-control" value="<%out.print(clienteBuscado.getCelular());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmailClienteNuevo" class="col-form-label">Correo Electronico</label>
                                                <input id="inputEmailClienteNuevo" name="inputEmailClienteNuevo" type="email" class="form-control" placeholder="1234@email.com" value="<%out.print(clienteBuscado.getEmail());%>">
                                            </div>
                                            <%}else{%>
                                            <div class="form-group">
                                                <label for="inputNombreClienteNuevo" class="col-form-label">Nombre/s</label>
                                                <input id="inputNombreClienteNuevo" name="inputNombreClienteNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputApellidoClienteNuevo">Apellido/s</label>
                                                <input id="inputApellidoClienteNuevo" name="inputApellidoClienteNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDomicilioClienteNuevo" class="col-form-label">Direccion del Domicilio</label>
                                                <input id="inputDomicilioClienteNuevo" name="inputDomicilioClienteNuevo" type="text" class="form-control" placeholder="Calle 1234">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDniClienteNuevo">Documento</label>
                                                <input id="inputDniClienteNuevo" name="inputDniClienteNuevo" type="number" placeholder="" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputFechanacClienteNuevo" class="col-form-label">Fecha de Nacimiento</label>
                                                <input id="inputFechanacClienteNuevo" name="inputFechanacClienteNuevo" type="date" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNacionalidadClienteNuevo" class="col-form-label">Nacionalidad</label>
                                                <input id="inputNacionalidadClienteNuevo" name="inputNacionalidadClienteNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCelularClienteNuevo" class="col-form-label">Celular</label>
                                                <input id="inputCelularClienteNuevo" name="inputCelularClienteNuevo" type="number" placeholder="+54" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmailClienteNuevo" class="col-form-label">Correo Electronico</label>
                                                <input id="inputEmailClienteNuevo" name="inputEmailClienteNuevo" type="email" class="form-control" placeholder="1234@email.com">
                                            </div>
                                            <%}%>
                                            <button style="width: 100px; float: right;" id="botonModificarCliente" name="botonModificarCliente" type="submit" class="btn btn-primary btn-lg btn-block">Modificar</button>
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
                            <a name="listarClientes"><h2 class="pageheader-title" style="margin-top: 50px;">Listar Clientes Propios</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="inicio.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="clientes.jsp" class="breadcrumb-link">Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Listar Clientes</li>
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
                                <h5 class="card-header">Total de Clientes</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Nombre/s</th>
                                                    <th scope="col">Apellido/s</th>
                                                    <th scope="col">Domicilio</th>
                                                    <th scope="col">Documento</th>
                                                    <th scope="col">Fecha de Nacimiento</th>
                                                    <th scope="col">Nacionalidad</th>
                                                    <th scope="col">Celular</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                listaClientes = new ArrayList<>();
                                                for(Cliente c : listaClientesTotales){
                                                    if( controlL.buscarClientePorEmpleado(String.valueOf(c.getId()), em)!=null ){
                                                        listaClientes.add(c);
                                                    }
                                                }
                                                for(Cliente cliente : listaClientes){%>
                                                <tr>
                                                    <th scope="row"><%out.print("<a name='cliente"+cliente.getId()+"'>"+cliente.getId()+"</a>");%></th>
                                                    <td><%out.print(cliente.getNombre());%></td>
                                                    <td><%out.print(cliente.getApellido());%></td>
                                                    <td><%out.print(cliente.getDireccion());%></td>
                                                    <td><%out.print(cliente.getDni());%></td>
                                                    <td><%
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                        String fechaDate = sdf.format(cliente.getFecha_nac());
                                                        out.print(fechaDate);
                                                    %></td>
                                                    <td scope="row"><%out.print(cliente.getNacionalidad());%></td>
                                                    <td scope="row"><%out.print(cliente.getCelular());%></td>
                                                    <td scope="row"><%out.print(cliente.getEmail());%></td>
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
