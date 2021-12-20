<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Inicio Sesion</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
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

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><h2 style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Sistema de Servicio Turístico</h2>
                <span class="splash-description">Ingresa  tu información de usuario.</span>
                <span style="color:red;"><%
                    HttpSession sesion = request.getSession();
                        if(sesion.getAttribute("noExisteUsuario")!=null){
                            if((boolean)sesion.getAttribute("noExisteUsuario") ){
                            out.print("El usuario y la contraseña no existe en la base de datos.");
                            }
                        }
                %></span>
            </div>
            <div class="card-body">
                <form action="LogIn" method="post">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="username" type="text" placeholder="Usuario" autocomplete="off" autofocus>
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Contraseña">
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar</button>
                </form>
            </div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="inicioSesion/sign-up.jsp" class="footer-link">Crear una nueva cuenta</a></div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="inicioSesion/forgot-password.jsp" class="footer-link">Olvide mi contraseña</a>
                </div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="CrearUsuarioRoot" class="footer-link">Crear usuario root</a>
                </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>
 
</html>

