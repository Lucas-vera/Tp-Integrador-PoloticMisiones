<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Entidades.*" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="es">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Crear Cuenta</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/libs/css/style.css">
    <link rel="stylesheet" href="../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body>
    <!-- ============================================================== -->
    <!-- signup form  -->
    <!-- ============================================================== -->
    <form class="splash-container" method="post" action="../CrearEmpleado">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-1">Formulario de Registro</h3>
                <p>Ingresa tu información de usuario.</p>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="Usuario" required placeholder="Usuario" autocomplete="off"> 
                    <span style="color:red;"><%
                        HttpSession sesion = request.getSession();
                        if(sesion.getAttribute("existeUsuario")!=null){
                            if((boolean)sesion.getAttribute("existeUsuario") ){
                            out.print("El usuario ingresado ya existe en la base de datos.");
                            }
                        }
                        
                    %></span>
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="NombreEmpleado" required placeholder="Nombre/s" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="ApellidoEmpleado" required placeholder="Apellido/s" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="DomicilioEmpleado" required placeholder="Domicilio" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="number" name="DocumentoEmpleado" required placeholder="Documento" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="date" name="FechaNacEmpleado" required placeholder="Fecha de Nacimiento" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="number" name="CelularEmpleado" required placeholder="Celular" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="NacionalidadEmpleado" required placeholder="Nacionalidad" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="email" name="EmailEmpleado" required  placeholder="E-mail" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" id="pass1" type="password" name="ContraseñaEmpleado" required placeholder="Contraseña">
                    <span style="color:red;"><%
                        if(sesion.getAttribute("noEsIgual")!=null) {
                            if((boolean)sesion.getAttribute("noEsIgual") ){
                            out.print("La contraseña ingresada no coincide con la confirmacion.");
                            }
                        }
                        
                    %></span>
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" required type="password" name="ConfirmarContra" placeholder="Confirma contraseña">
                </div>
                <div class="form-group pt-2">
                    <button class="btn btn-block btn-primary" type="submit">Registrar mi cuenta</button>
                </div>
            </div>
            <div class="card-footer bg-white">
                <p>Ya estas registrado? <a href="../index.jsp" class="text-secondary">Entra acá.</a></p>
            </div>
        </div>
    </form>
</body>

 
</html>
