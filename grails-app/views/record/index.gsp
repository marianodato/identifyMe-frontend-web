<!DOCTYPE html>
<html>
<head>
    <title>identyfyMe | Mis fichadas</title>
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

.submitLink:hover {
    color: #252E39;
    text-decoration: none;
}

.btn2 {
    background: #009688;
    width: 125px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: white;
    border-radius: 4px;
    border: #00877a 1px solid;
    font-weight: 800;
    font-size: 0.8em;
}

.btn2:hover {
    background: #4cb5ab;
}

#table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#table td, #table th {
    border: 1px solid #ddd;
    padding: 8px;
    width: 33%;
}

#table tr:nth-child(even) {
    background-color: #f2f2f2;
}

#table tr:hover {
    background-color: #ddd;
}

#table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #009688;
    color: white;
}
</style>
<body>
<!-- header-section-starts -->
<div class="header">
    <div class="header-top" style="background-color: #182128;">
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
                <a href="${createLink(controller: 'record', action: 'index')}"><img
                        src="${resource(dir: 'images', file: 'logo4.png')}" alt=""/></a>
            </div>
            <span class="menu"></span>

            <div class="top-menu">
                <ul>
                    <nav class="cl-effect-5">
                        <li><a class="active"
                               href="${createLink(controller: 'record', action: 'index')}">Mis fichadas</a>
                        </li>
                        <li><a href="${createLink(controller: 'profile', action: 'index')}">Mi perfil</a></li>
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
<g:if test="${!isAdmin && registrationRecords.size() == 0}">
    <div class="content">
        <div class="container">
            <div class="error">
                <div class="error-head">
                    <h1>Ups...</h1>

                    <h2>No tienes ninguna fichada en el sistema!</h2>
                    <a class="hvr-bounce-to-left button"
                       href="${createLink(controller: 'profile', action: 'index')}">Ir a mi perfil</a>
                </div>
            </div>
        </div>
    </div>

</g:if>
<g:else>
    <div class="content">
        <div class="main">
            <div class="container">
                <div class="blog-content-head text-left">
                    <h3>Mis fichadas</h3>
                    <br/>
                </div>
                <div class="section group">
                    <div class="cont span_2_of_3">
                        <div class="blog_posts">
                            <div class="section group example">

                                <g:if test="${isAdmin}">
                                    <form method="get" action="records">
                                        <div class="form-inline">
                                            <span><label>Filtrar por usuario:</label></span>
                                            <select class="id" id="userId" name="userId">
                                                <option value="0">Todos</option>
                                                <g:each in="${users}">
                                                    <g:if test="${selected == it.id}">
                                                        <option value="${it.id}"
                                                                selected="selected">${it.username}</option>
                                                    </g:if>
                                                    <g:else>
                                                        <option value="${it.id}">${it.username}</option>
                                                    </g:else>
                                                </g:each>
                                            </select>
                                            <g:submitButton disabled="false" class="btn2" id="search" field="search"
                                                            value="Buscar"/>
                                        </div>
                                    </form>
                                </g:if>

                                <g:if test="${registrationRecords.size() == 0}">
                                    <br/>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <br/>

                                    <h1 align="center"
                                        style="color: #252E39;font-size: 9em;line-height: 1em;font-weight: 400;">Ups...</h1>
                                    <br/>
                                    <br/>

                                    <h2 align="center"
                                        style="font-size: 1.5em;color: #252E39;font-weight: 500;">No se encontraron fichadas para ese usuario!</h2>
                                    <br/>
                                </g:if>

                                <g:else>
                                    <br/>

                                    <g:if test="${selected == 0}">
                                        <table id="table"><tr><th style="width: 25%;">Usuario</th> <th
                                                style="width: 25%;">Entradas</th> <th
                                                style="width: 25%;">Salidas</th> <th
                                                style="width: 25%;">Segundos en sistema</th>
                                        </tr>
                                            <g:each in="${registrationRecords}">
                                                <tr><td style="width: 25%;">${it.userUsername}</td> <td
                                                        style="width: 25%;">${it.entryTime}</td> <td
                                                        style="width: 25%;">${it.departureTime ? it.departureTime : "No hay registro"}</td> <td
                                                        style="width: 25%;">${it.secondsInSystem ? it.secondsInSystem : "No hay registro"}</td>
                                                </tr>
                                            </g:each>
                                        </table>
                                    </g:if>
                                    <g:else>
                                        <table id="table"><tr><th>Entradas</th> <th>Salidas</th> <th>Segundos en sistema</th>
                                        </tr>
                                            <g:each in="${registrationRecords}">
                                                <tr><td>${it.entryTime}</td> <td>${it.departureTime ? it.departureTime : "No hay registro"}</td> <td>${it.secondsInSystem ? it.secondsInSystem : "No hay registro"}</td>
                                                </tr>
                                            </g:each>
                                        </table>
                                    </g:else>

                                    <br/>
                                    <br/>

                                    <div class="content-pagenation">
                                        <g:if test="${page != 1 && page != 2}">
                                            <g:if test="${isAdmin}">
                                                <li>
                                                    <a href="${createLink(controller: 'record', action: 'index')}?userId=${selected}&page=1">Primero</a>
                                                </li>
                                            </g:if>
                                            <g:else>
                                                <li>
                                                    <a href="${createLink(controller: 'record', action: 'index')}?page=1">Primero</a>
                                                </li>
                                            </g:else>
                                            <li><span>. . . . .</span></li>
                                        </g:if>
                                        <g:each var="i" in="${(1..<(pages + 1))}">
                                            <g:if test="${i == (page - 1) || i == page || i == (page + 1)}">
                                                <g:if test="${isAdmin}">
                                                    <li>
                                                        <a id="page-${i}"
                                                           href="${createLink(controller: 'record', action: 'index')}?userId=${selected}&page=${i}">${i}</a>
                                                    </li>
                                                </g:if>
                                                <g:else>
                                                    <li>
                                                        <a id="page-${i}"
                                                           href="${createLink(controller: 'record', action: 'index')}?page=${i}">${i}</a>
                                                    </li>
                                                </g:else>
                                            </g:if>
                                        </g:each>
                                        <g:if test="${page != pages && page != (pages - 1)}">
                                            <li><span>. . . . .</span></li>
                                            <g:if test="${isAdmin}">
                                                <li>
                                                    <a href="${createLink(controller: 'record', action: 'index')}?userId=${selected}&page=${pages}">Último</a>
                                                </li>
                                            </g:if>
                                            <g:else>
                                                <li>
                                                    <a href="${createLink(controller: 'record', action: 'index')}?page=${pages}">Último</a>
                                                </li>
                                            </g:else>
                                        </g:if>
                                        <div class="clearfix"></div>
                                    </div>
                                </g:else>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
</g:else>

<g:if test="${registrationRecords.size() <= 4}">
    <!-- footer-section-starts -->
    <div class="fixed-footer" style="background-color: #182128;">
        <div class="container">
            <p class="location" style="padding-top: 15px">Copyright © 2018 identifyMe</p>
        </div>
    </div>
    <!-- footer-section-ends -->
</g:if>
<g:else>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="header">
        <div class="header-top" style="background-color: #182128;">
            <div class="container">
                <p class="location">Copyright © 2018 identifyMe</p>
            </div>
        </div>
    </div>
</g:else>

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
<script type="text/javascript">
    $(document).ready(function () {
        var selectedPage = document.getElementById("page-" +${page});
        selectedPage.style = "background:#009688;color:#FFF;text-decoration:underline;";
    });
</script>
</body>
</html>