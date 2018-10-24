<!DOCTYPE html>
<html>
<head>
    <title>identifyMe | Mi perfil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="My Pets Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <!-- Custom Theme files -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel='stylesheet' type='text/css' media='all'/>
    <!--webfont-->
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>
</head>
<style>
.submitLink {
    background-color: transparent;
    text-decoration: none;
    border: none;
    cursor: pointer;
    margin: 0px;
    padding: 0px 10px 0px 0px;
}
</style>

<body>
<!-- header-section-starts -->
<div class="header">
    <div class="header-top" style="background-color: #182128">
        <div class="container">
            <p class="location">Sistema de visualización de fichadas</p>

            <p class="phonenum">
                <img src="${resource(dir: 'images', file: 'user.png')}" alt=""/> ${username}
            </p>

            <div class="clearfix"></div>
        </div>
    </div>

    <div class="header-bottom">
        <div class="container">
            <div class="logo">
                <a href="${createLink(controller: 'home', action: 'index')}"><img
                        src="${resource(dir: 'images', file: 'logo4.png')}" alt=""/></a>
            </div>
            <span class="menu"></span>

            <div class="top-menu">
                <ul>
                    <nav class="cl-effect-5">
                        <li><a href="${createLink(controller: 'home', action: 'index')}">Mis fichadas</a>
                        </li>
                        <li><a class="active" href="${createLink(controller: 'profile', action: 'index')}">Mi perfil</a>
                        </li>
                        <li>
                            <a>
                                <form method="post" controller="login" action="logout">
                                    <input type="submit" class="submitLink" value="  SALIR"/>
                                </form>
                            </a>
                        </li>
                    </nav>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<!-- content-section-starts -->
<div class="content">
    <div class="main">
        <div class="container">
            <div class="blog-content">
                <div class="blog-content-head text-left">
                    <h3>Mi perfil</h3>
                    <br/>
                </div>

                <div class="section group">
                    <div class="cont span_2_of_3">
                        <div class="blog_posts">
                            <div class="section group example">
                                <div class="left_form">
                                    <div class="blog_heading">
                                        <p><span style="color:#009688">Datos personales</span></p>

                                        <p class="post"><b>Nombre:</b> ${name}<br/>
                                            <b>Dni:</b> ${dni}<br/>
                                            <b>Género:</b> <g:if
                                                test="${gender == 'male'}">Masculino</g:if><g:else>Femenino</g:else><br/>
                                            <b>Email:</b> ${email}<br/>
                                            <b>Teléfono:</b> ${phoneNumber}<br/>
                                        </p>
                                        <br/>

                                        <p><span style="color:#009688">Datos de la huella</span></p>

                                        <p class="post"><b>Id:</b> <g:if
                                                test="${fingerprintId != null}">${fingerprintId}</g:if><g:else>-</g:else><br/>
                                            <b>Estado:</b> <g:if
                                                test="${fingerprintStatus == 'enrolled'}">Cargada</g:if><g:elseif
                                                test="${pet == 'pending'}">Pendiente</g:elseif><g:else>No cargada</g:else><br/>
                                        </p>
                                    </div>
                                </div>

                                <div class="right_form">
                                    <div class="blog_heading">
                                        <p><span style="color:#009688">Datos del sistema</span></p>

                                        <p class="post">
                                            <b>Id:</b> ${id}<br/>
                                            <b>Usuario:</b> ${username}<br/>
                                            <b>Creado:</b> ${dateCreated}<br/>
                                            <b>Modificado:</b> ${lastUpdated}<br/>
                                            <b>Admin:</b> <g:if test="${isAdmin}">Sí</g:if><g:else>No</g:else><br/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- content-section-ends -->
<!-- footer-section-starts -->
<div class="fixed-footer" style="background-color: #182128;">
    <div class="container">
        <p class="location" style="padding-top: 15px">Copyright © 2018 identifyMe</p>
    </div>
</div>
<!-- footer-section-ends -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'responsiveslides.min.js')}"></script>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);

function hideURLbar() {
    window.scrollTo(0, 1);
} </script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            speed: 500,
            namespace: "callbacks",
            pager: true
        });
    });
</script>
<!-- script for menu -->
<script>
    $("span.menu").click(function () {
        $(".top-menu").slideToggle("slow", function () {
            // Animation complete.
        });
    });
</script>
</body>
</html>