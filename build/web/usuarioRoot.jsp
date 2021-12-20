<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.ZoneId"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
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
                                            ControladoraLogica controlL = new ControladoraLogica();
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
                            <h2 class="pageheader-title" id="inicio">Inicio</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                        <!-- campaign data -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- campaign tab one -->
                            <!-- ============================================================== -->
                            <div class="influence-profile-content pills-regular">
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="estadisticas" role="tabpanel" aria-labelledby="pills-campaign-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">Estadísticas Generales</h3>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                            <%
                                                                List <Venta> ventasTotales= controlL.listarVentas();
                                                                out.print(ventasTotales.size() );
                                                            %>
                                                        </h1>
                                                        <p>Ventas Realizadas</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                            <%
                                                                List<PaqueteTuristico> paquetesTotales = controlL.listarPaquetes();
                                                                out.print(paquetesTotales.size() );
                                                            %>
                                                        </h1>
                                                        <p>Paquetes Vendidos</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                            <%
                                                                //OBTENGO LA FECHA DEL DIA
                                                                Date hoy= Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
                                                                int contador=0;
                                                                for(Venta venta: ventasTotales){
                                                                    if(venta.getFecha_venta().equals(hoy)){
                                                                        contador++;
                                                                    }
                                                                }
                                                                out.print(contador);
                                                            %>
                                                        </h1>
                                                        <p>Ventas en el día</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">Ganancias</h3>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                            <%
                                                            double totalVendido=0;
                                                            for(Venta v : ventasTotales){
                                                                totalVendido+=controlL.calcularCostoVentaConComision(v);
                                                            }
                                                            out.print("$ "+(double)Math.round(totalVendido*1000)/1000);
                                                            %>
                                                        </h1>
                                                        <p>Total Vendido</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                        <%
                                                        double gananciasMes=0;
                                                        int mesCorriente = LocalDate.now().getMonthValue();
                                                        LocalDate fechaParseada;
                                                        for(Venta venta : ventasTotales){
                                                            fechaParseada = venta.getFecha_venta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                                                            if(fechaParseada.getMonthValue() == mesCorriente){
                                                                gananciasMes+=controlL.calcularCostoVentaConComision(venta);
                                                            }
                                                        }
                                                        out.print("$ "+(double)Math.round(gananciasMes*1000)/1000);
                                                        %>
                                                        </h1>
                                                        <p>Ganancias en el Mes</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">
                                                        <%
                                                        //OBTENGO LA FECHA DEL DIA
                                                        double gananciasHoy=0;
                                                        for(Venta venta : ventasTotales){
                                                            if(venta.getFecha_venta().equals(hoy)){
                                                                gananciasHoy+=controlL.calcularCostoVentaConComision(venta);
                                                            }
                                                        }
                                                        out.print("$ "+(double)Math.round(gananciasHoy*1000)/1000);
                                                        %>
                                                        </h1>
                                                        <p>Ganancias en el Dia</p>
                                                    </div>
                                                </div>
                                            </div>
 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end campaign tab one -->
                            <!-- ============================================================== -->
                        </div>
                        <!-- ============================================================== -->
                        <!-- end campaign data -->
                        <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                       <!-- ============================================================== -->
                        <!-- FormularioBuscar -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <a name="buscarFecha"><h5 class="card-header">Buscar Fecha</h5></a>
                                    <div class="card-body">
                                        <form method="get" action="BuscarFecha">
                                            <div class="form-group">
                                                <label for="inputFechaBuscada" class="col-form-label">Dia de trabajo</label>
                                                <input id="inputFechaBuscada" name="inputFechaBuscada" type="date" value="" class="form-control form-control-sm">
                                            </div>
                                            <div class="form-group">
                                                <div id="mostrarVenta">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="card">
                                                            <h5 class="card-header"  >Fecha Buscada: <%
                                                                Object fechaBuscada = nuevaSesion.getAttribute("fechaBuscada");
                                                                if(fechaBuscada!=null){out.print(fechaBuscada);}%></h5>
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <%
                                                                        if(nuevaSesion.getAttribute("gananciasDia")!=null){  //Si existe el Atributo mostrar la venta
                                                                            double gananciasDiaFecha= (double)nuevaSesion.getAttribute("gananciasDia");
                                                                            double gananciasMesFecha= (double)nuevaSesion.getAttribute("gananciasMes");
                                                                    %>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Ganancia del dia</th>
                                                                                <th scope="col">Ganancia de ese mes</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print("$ "+gananciasDiaFecha);%></th>
                                                                                <td><%out.print("$ "+gananciasMesFecha);%></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <%}else{%>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Ganancia del dia</th>
                                                                                <th scope="col">Ganancia de ese mes</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th scope="row"><%out.print("Vacio");%></th>
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
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- Tabla Ventas -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <a name="totalVentas"><h5 class="card-header">Total de Ventas</h5></a>
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
                                                    <th scope="col">Id-Empleado</th>
                                                    <th scope="col">Costo Venta</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Empleado> empleadosTotales = controlL.listarEmpleados();
                                                    ventasTotales = controlL.listarVentas();
                                                    for(Venta v: ventasTotales){%>
                                                    <tr>
                                                        <th scope="row"><%out.print("<a name='venta"+v.getNum_venta()+"'>"+v.getNum_venta()+"</a>");%></th>
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
                                                            out.print(clienteVenta.getId());
                                                        }%></td>
                                                        <td><%
                                                        Servicio servicioVenta= controlL.servicioPertenecienteAVenta(v);
                                                        if(servicioVenta==null){
                                                            out.print("vacio");
                                                        }else{
                                                            out.print("<a href='servicios.jsp#servicio"+servicioVenta.getCodigo_servicio()+"'>"+servicioVenta.getCodigo_servicio()+"-"+servicioVenta.getNombre()+"</a>");
                                                        }%></td>
                                                        <td><%
                                                        PaqueteTuristico paqueteVenta= controlL.paquetePertenecienteAVenta(v);
                                                        if(paqueteVenta==null){
                                                            out.print("vacio");
                                                        }else{
                                                            out.print("<a href='paquetesTuristicos.jsp#paquete"+paqueteVenta.getCodigo_paquete()+"'>"+paqueteVenta.getCodigo_paquete()+"</a>");
                                                        }%></td> 
                                                        <td><%
                                                            for(Empleado empleado : empleadosTotales){
                                                                if(empleado.buscarVentaEnEmpleado(v)>=0){
                                                                    out.print("<a href='empleados.jsp#empleado"+empleado.getId()+"'>"+empleado.getId()+"</a>");
                                                                }
                                                            }
                                                        %></td>
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
