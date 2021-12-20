<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empleados</title>
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
                            <a name="eliminarEmpleado"><h2 class="pageheader-title" style="margin-top: 50px;">Eliminar Empleado </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="empleados.jsp" class="breadcrumb-link">Empleados</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Eliminar Empleado</li>
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
                                    <h5 class="card-header">Eliminar Empleado</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarEmpleado">
                                            <div class="form-group">
                                                <label for="inputEmpleadosCreados">Empleados Creados</label>
                                                <select class="form-control" id="inputEmpleadosCreados" name="inputEmpleadosCreados">
                                                    <option selected>-</option>
                                                    <%  
                                                        ControladoraLogica controlL = new ControladoraLogica();
                                                        List<Empleado> listaEmpleados = controlL.listarEmpleados();
                                                        for(Empleado empleado : listaEmpleados){
                                                            out.print("<option>"+ String.valueOf( empleado.getId()) +"</option>\n");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonEliminarVenta" type="submit" class="btn btn-primary btn-lg btn-block botonEliminar">Eliminar</button>
                                        </form>
                                    </div>
                                    <h5 class="card-header">Eliminar Empleado por Id</h5>
                                    <div class="card-body">
                                        <form method="post" action="EliminarEmpleado">
                                            <div class="form-group">
                                                <label for="inputIdEmpleadoEliminado" class="col-form-label">Id del Empleado</label>
                                                <input id="inputIdEmpleadoEliminado" name="inputIdEmpleadoEliminado" type="number" value="" class="form-control form-control-sm">
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
                            <a name="buscarEmpleado"><h2 class="pageheader-title" style="margin-top: 50px;">Buscar Empleado</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="empleados.jsp" class="breadcrumb-link">Empleados</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar Empleado</li>
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
                                    <h5 class="card-header">Buscar Empleado</h5>
                                    <div class="card-body">
                                        <form method="get" action="BuscarEmpleado">
                                            <div class="form-group">
                                                <label for="inputIdEmpleadoBuscado" class="col-form-label">Id del Empleado</label>
                                                <input id="inputIdEmpleadoBuscado" name="inputIdEmpleadoBuscado" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarCliente">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header">Empleado Buscado</h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                        Empleado empleadoBuscado= (Empleado)nuevaSesion.getAttribute("empleadoBuscado");
                                                                        if(empleadoBuscado!=null){  //Si existe el Atributo mostrar el empleado
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
                                                                                <th scope="col">Cargo</th>
                                                                                <th scope="col">Sueldo</th>
                                                                                <th scope="col">Ventas Realizadas este Mes</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print(empleadoBuscado.getId());%></th>
                                                                                <td><%out.print(empleadoBuscado.getNombre());%></td>
                                                                                <td><%out.print(empleadoBuscado.getApellido());%></td>
                                                                                <td><%out.print(empleadoBuscado.getDireccion());%></td>
                                                                                <td><%out.print(empleadoBuscado.getDni());%></td>
                                                                                <td><%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(empleadoBuscado.getFecha_nac());
                                                                                    out.print(fechaDate);
                                                                                    %></td>
                                                                                <td scope="row"><%out.print(empleadoBuscado.getNacionalidad());%></td>
                                                                                <td scope="row"><%out.print(empleadoBuscado.getCelular());%></td>
                                                                                <td scope="row"><%out.print(empleadoBuscado.getEmail());%></td>
                                                                                <td scope="row"><%out.print(empleadoBuscado.getCargo());%></td>
                                                                                <td scope="row"><%out.print(empleadoBuscado.getSueldo());%></td>
                                                                                <td scope="row"><%
                                                                                                List<Venta> ventasEmpleado = empleadoBuscado.getVentas_empleado();
                                                                                                String listadoVentasMes="";
                                                                                                int mesCorriente= LocalDate.now().getMonthValue();
                                                                                                for(Venta v : ventasEmpleado){
                                                                                                    Date fechaVenta = v.getFecha_venta();
                                                                                                    LocalDate fechaVentaParseada = fechaVenta.toInstant().atZone(ZoneId.systemDefault()).toLocalDate(); //Parseo a localDate
                                                                                                    int mesDeVenta = fechaVentaParseada.getMonthValue();
                                                                                                    if(mesDeVenta==mesCorriente){
                                                                                                        listadoVentasMes+=v.getNum_venta()+", ";
                                                                                                    }
                                                                                                }
                                                                                                out.print(listadoVentasMes);
                                                                                %></td>
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
                                                                                <th scope="col">Cargo</th>
                                                                                <th scope="col">Sueldo</th>
                                                                                <th scope="col">Ventas Realizadas este Mes</th>
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
                            <a name="modificarEmpleado"><h2 class="pageheader-title" id="inicio">Modificar Empleado</h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="empleados.jsp" class="breadcrumb-link">Empleados</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar Empleado</li>
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
                                    <h5 class="card-header">Modificar Empleado</h5>
                                    <div class="card-body">
                                        <form method="post" action="ModificarEmpleadoRoot">
                                            <div class="form-group">
                                                <label for="inputIdEmpleadoViejo" class="col-form-label">Id Empleado a Modificar</label>
                                                <input id="inputIdEmpleadoViejo" name="inputIdEmpleadoViejo" type="number" value="" class="form-control form-control-sm">
                                            </div>
                                            <button style="width: 100px; float: right;" id="botonModificarEmpleado" name="botonModificarEmpleado" type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                                        </form>
                                        <br><br><br>
                                        <h5>Datos Traidos Para Modificar</h5>
                                        <form method="post" action="ModificarEmpleadoRoot">
                                            <%
                                                empleadoBuscado= (Empleado)nuevaSesion.getAttribute("empleadoAModificar");
                                                if(empleadoBuscado!=null){
                                            %>
                                            <div class="form-group">
                                                <label for="inputNombreEmpleadoNuevo" class="col-form-label">Nombre/s</label>
                                                <input id="inputNombreEmpleadoNuevo" name="inputNombreEmpleadoNuevo" type="text" class="form-control" value="<%out.print(empleadoBuscado.getNombre());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputApellidoEmpleadoNuevo">Apellido/s</label>
                                                <input id="inputApellidoEmpleadoNuevo" name="inputApellidoEmpleadoNuevo" type="text" class="form-control" value="<%out.print(empleadoBuscado.getApellido());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDomicilioEmpleadoNuevo" class="col-form-label">Direccion del Domicilio</label>
                                                <input id="inputDomicilioEmpleadoNuevo" name="inputDomicilioEmpleadoNuevo" type="text" class="form-control" placeholder="Calle 1234" value="<%out.print(empleadoBuscado.getDireccion());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDniEmpleadoNuevo">Documento</label>
                                                <input id="inputDniEmpleadoNuevo" name="inputDniEmpleadoNuevo" type="number" placeholder="" class="form-control" value="<%out.print(empleadoBuscado.getDni());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputFechanacEmpleadoNuevo" class="col-form-label">Fecha de Nacimiento</label>
                                                <input id="inputFechanacEmpleadoNuevo" name="inputFechanacEmpleadoNuevo" type="date" class="form-control" value="<%
                                                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                                    String fechaDate = sdf.format(empleadoBuscado.getFecha_nac());
                                                                                    out.print(fechaDate);
                                                                                    %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNacionalidadEmpleadoNuevo" class="col-form-label">Nacionalidad</label>
                                                <input id="inputNacionalidadEmpleadoNuevo" name="inputNacionalidadEmpleadoNuevo" type="text" class="form-control" value="<%out.print(empleadoBuscado.getNacionalidad());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCelularEmpleadoNuevo" class="col-form-label">Celular</label>
                                                <input id="inputCelularEmpleadoNuevo" name="inputCelularEmpleadoNuevo" type="number" placeholder="+54" class="form-control" value="<%out.print(empleadoBuscado.getCelular());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmailEmpleadoNuevo" class="col-form-label">Correo Electronico</label>
                                                <input id="inputEmailEmpleadoNuevo" name="inputEmailEmpleadoNuevo" type="email" class="form-control" placeholder="1234@email.com" value="<%out.print(empleadoBuscado.getEmail());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCargoEmpleadoNuevo" class="col-form-label">Cargo</label>
                                                <input id="inputCargoEmpleadoNuevo" name="inputCargoEmpleadoNuevo" type="text" class="form-control" value="<%out.print(empleadoBuscado.getCargo());%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSueldoEmpleadoNuevo" class="col-form-label">Celular</label>
                                                <input id="inputSueldoEmpleadoNuevo" name="inputSueldoEmpleadoNuevo" type="number" placeholder="" class="form-control" value="<%out.print(empleadoBuscado.getSueldo());%>">
                                            </div>
                                            <%}else{%>
                                            <div class="form-group">
                                                <label for="inputNombreEmpleadoNuevo" class="col-form-label">Nombre/s</label>
                                                <input id="inputNombreEmpleadoNuevo" name="inputNombreEmpleadoNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputApellidoEmpleadoNuevo">Apellido/s</label>
                                                <input id="inputApellidoEmpleadoNuevo" name="inputApellidoEmpleadoNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDomicilioEmpleadoNuevo" class="col-form-label">Direccion del Domicilio</label>
                                                <input id="inputDomicilioEmpleadoNuevo" name="inputDomicilioEmpleadoNuevo" type="text" class="form-control" placeholder="Calle 1234">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDniEmpleadoNuevo">Documento</label>
                                                <input id="inputDniEmpleadoNuevo" name="inputDniEmpleadoNuevo" type="number" placeholder="" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputFechanacEmpleadoNuevo" class="col-form-label">Fecha de Nacimiento</label>
                                                <input id="inputFechanacEmpleadoNuevo" name="inputFechanacEmpleadoNuevo" type="date" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNacionalidadEmpleadoNuevo" class="col-form-label">Nacionalidad</label>
                                                <input id="inputNacionalidadEmpleadoNuevo" name="inputNacionalidadEmpleadoNuevo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCelularEmpleadoNuevo" class="col-form-label">Celular</label>
                                                <input id="inputCelularEmpleadoNuevo" name="inputCelularEmpleadoNuevo" type="number" placeholder="+54" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmailEmpleadoNuevo" class="col-form-label">Correo Electronico</label>
                                                <input id="inputEmailEmpleadoNuevo" name="inputEmailEmpleadoNuevo" type="email" class="form-control" placeholder="1234@email.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputCargoEmpleadoNuevo" class="col-form-label">Cargo</label>
                                                <input id="inputCargoEmpleadoNuevo" name="inputCargoEmpleadoNuevo" type="text" class="form-control" >
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSueldoEmpleadoNuevo" class="col-form-label">Sueldo</label>
                                                <input id="inputSueldoEmpleadoNuevo" name="inputSueldoEmpleadoNuevo" type="number" placeholder="" class="form-control" >
                                            </div>
                                            <%}%>
                                            <button style="width: 100px; float: right;" id="botonModificarEmpleado" name="botonModificarEmpleado" type="submit" class="btn btn-primary btn-lg btn-block">Modificar</button>
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
                            <a name="listarEmpleados"><h2 class="pageheader-title" style="margin-top: 50px;">Listar Empleados </h2></a>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="usuarioRoot.jsp" class="breadcrumb-link">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="empleados.jsp" class="breadcrumb-link">Empleados</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Listar Empleados</li>
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
                        <!-- Tabla Empleados -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Total de Empleados</h5>
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
                                                    <th scope="col">Cargo</th>
                                                    <th scope="col">Sueldo</th>
                                                    <th scope="col">Ventas Realizadas este Mes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%listaEmpleados = controlL.listarEmpleados();
                                                for(Empleado empleado : listaEmpleados){%>
                                                <tr>
                                                    <th scope="row"><%out.print("<a name='empleado"+empleado.getId()+"'>"+empleado.getId()+"</a>");%></th>
                                                    <td><%out.print(empleado.getNombre());%></td>
                                                    <td><%out.print(empleado.getApellido());%></td>
                                                    <td><%out.print(empleado.getDireccion());%></td>
                                                    <td><%out.print(empleado.getDni());%></td>
                                                    <td><%
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                        String fechaDate = sdf.format(empleado.getFecha_nac());
                                                        out.print(fechaDate);
                                                    %></td>
                                                    <td scope="row"><%out.print(empleado.getNacionalidad());%></td>
                                                    <td scope="row"><%out.print(empleado.getCelular());%></td>
                                                    <td scope="row"><%out.print(empleado.getEmail());%></td>
                                                    <td scope="row"><%out.print(empleado.getCargo());%></td>
                                                    <td scope="row"><%out.print(empleado.getSueldo());%></td>
                                                    <td scope="row"><%
                                                        List<Venta> ventasEmpleado = empleado.getVentas_empleado();
                                                        int mesCorriente= LocalDate.now().getMonthValue();
                                                        for(Venta v : ventasEmpleado){
                                                            Date fechaVenta = v.getFecha_venta();
                                                            LocalDate fechaVentaParseada = fechaVenta.toInstant().atZone(ZoneId.systemDefault()).toLocalDate(); //Parseo a localDate
                                                            int mesDeVenta = fechaVentaParseada.getMonthValue();
                                                            if(mesDeVenta==mesCorriente){
                                                                out.print("<a href='usuarioRoot.jsp#venta"+v.getNum_venta()+"'>"+v.getNum_venta()+"</a>, ");
                                                            }
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
                        <!-- Termina Tabla Empleados -->
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
