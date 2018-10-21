<!DOCTYPE html>
<html>
<head>
    <title>identifyMe | Entrar</title>
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
body {
    /*font-family: 'Open Sans', sans-serif;*/
    background: #252E39;
    margin: 0 auto 0 auto;
    width: 100%;
    text-align: center;
    /*margin: 20px 0px 20px 0px;*/
}

p {
    font-size: 12px;
    text-decoration: none;
    color: #ffffff;
}

h1 {
    font-size: 1.5em;
    color: #525252;
    padding-top: 20px;
}

.header-bottom {
    background: #FFFFFF;
}

.box {
    background: white;
    width: 300px;
    border-radius: 6px;
    margin: 0 auto 0 auto;
    padding: 0px 0px 70px 0px;
    border: #001A39 4px solid;
}

.username {
    background: #ecf0f1;
    border: #ccc 1px solid;
    border-bottom: #ccc 2px solid;
    padding: 8px;
    width: 250px;
    color: #AAAAAA;
    margin-top: 10px;
    font-size: 1em;
    border-radius: 4px;
}

.password {
    border-radius: 4px;
    background: #ecf0f1;
    border: #ccc 1px solid;
    padding: 8px;
    width: 250px;
    font-size: 1em;
}

.btn2 {
    float: left;
    background: #009688;
    width: 125px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: white;
    border-radius: 4px;
    border: #00877a 1px solid;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 84px;
    font-weight: 800;
    font-size: 0.8em;
}

.btn2:hover {
    background: #4cb5ab;
}

.login_div {
    position: relative;
    /* Center form on page horizontally & vertically */
    margin-top: 10%;
    margin-left: 0%;
}

.login_form {
    border-radius: 10px;
    margin: 0;
    padding: 0;
}

.message {
    font-size: 1.0em;
    color: #ff0000;
}
</style>

<body>
<!-- header-section-starts -->
<div class="header">
    <div class="header-top" style="background-color: #182128">
        <div class="container">
            <p class="location">Sistema de visualización de fichadas</p>

            <p class="phonenum">
                <img src="${resource(dir: 'images', file: 'user.png')}" alt=""/> No logueado
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
                        <li><a class="active" href="${createLink(controller: 'login', action: 'index')}">Entrar</a></li>
                    </nav>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<div class="slider">
    <div class="callbacks_container">
        <div class="rslides" id="slider">
            <div class="login_div">
                <form class="login_form" method="post" action="login">
                    <div class="box">
                        <h1>Bienvenido</h1>
                        <g:if test="${message}">
                            <div name="message" id="message" class="message">${message}</div>
                        </g:if>
                        <input type="text" name="username" value="Usuario" onFocus="field_focus(this, 'Usuario');"
                               onblur="field_blur(this, 'Usuario');" class="username" required="required"/>
                        <input type="password" name="password" value="Contraseña"
                               onFocus="field_focus(this, 'Contraseña');" onblur="field_blur(this, 'Password');"
                               class="username" required="required"/>
                        <g:submitButton disabled="false" class="btn2" id="sign_in" name="sign_in" value="Entrar"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

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
<script type="text/javascript" src="${resource(dir: 'js', file: 'move-top.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'easing.js')}"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
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
<!-- script for menu -->
<script>
    function field_focus(field, value) {
        if (field.value == value) {
            field.value = '';
        }
    }

    function field_blur(field, value) {
        if (field.value == '') {
            field.value = value;
        }
    }

    //Fade in welcome box
    $(document).ready(function () {
        $('.box').hide().fadeIn(1000);
    });
</script>
</body>
</html>