<%@page import="Classes.Palavras"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Página inicial</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">

            .buttons {
                margin: 10%;
                text-align: center;
            }

            .btn-hover {
                width: 400px;
                color: #fff;
                cursor: pointer;
                margin: 1px;
                height: 55px;
                text-align:center;
                border: none;
                background-size: 300% 100%;

                border-radius: 50px;
                moz-transition: all .4s ease-in-out;
                -o-transition: all .4s ease-in-out;
                -webkit-transition: all .4s ease-in-out;
                transition: all .4s ease-in-out;
            }

            .btn-hover:hover {
                background-position: 100% 0;
                moz-transition: all .4s ease-in-out;
                -o-transition: all .4s ease-in-out;
                -webkit-transition: all .4s ease-in-out;
                transition: all .4s ease-in-out;
            }

            .btn-hover:focus {
                outline: none;
            }

            .btn-hover.color-1 {
                background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
                box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
            }
            .btn-hover.color-2 {
                background-image: linear-gradient(to right, #f5ce62, #e43603, #fa7199, #e85a19);
                box-shadow: 0 4px 15px 0 rgba(229, 66, 10, 0.75);
            }
            .btn-hover.color-3 {
                background-image: linear-gradient(to right, #667eea, #764ba2, #6B8DD6, #8E37D7);
                box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
            }
            .btn-hover.color-4 {
                background-image: linear-gradient(to right, #fc6076, #ff9a44, #ef9d43, #e75516);
                box-shadow: 0 4px 15px 0 rgba(252, 104, 110, 0.75);
            }
            .btn-hover.color-5 {
                background-image: linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673);
                box-shadow: 0 4px 15px 0 rgba(23, 168, 108, 0.75);
            }
            .btn-hover.color-6 {
                background-image: linear-gradient(to right, #009245, #FCEE21, #00A8C5, #D9E021);
                box-shadow: 0 4px 15px 0 rgba(83, 176, 57, 0.75);
            }
            .btn-hover.color-7 {
                background-image: linear-gradient(to right, #6253e1, #852D91, #A3A1FF, #F24645);
                box-shadow: 0 4px 15px 0 rgba(126, 52, 161, 0.75);
            }
            .btn-hover.color-8 {
                background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
                box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
            }
            .btn-hover.color-9 {
                background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
                box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
            }
            .btn-hover.color-10 {
                background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a , #FBB03B);
                box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
            }
            .btn-hover.color-11 {
                background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);  box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
            }
        </style>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style type="text/css">
            body{
                padding-top:4.2rem;
                padding-bottom:4.2rem;
                background:rgba(0, 0, 0, 0.76);
            }
            a{
                text-decoration:none !important;
            }
            h1,h2,h3{
                font-family: 'Kaushan Script', cursive;
            }
            .myform{
                position: relative;
                display: -ms-flexbox;
                display: flex;
                padding: 1rem;
                -ms-flex-direction: column;
                flex-direction: column;
                width: 100%;
                pointer-events: auto;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid rgba(0,0,0,.2);
                border-radius: 1.1rem;
                outline: 0;
                max-width: 500px;
            }
            .tx-tfm{
                text-transform:uppercase;
            }
            .mybtn{
                border-radius:50px;
            }

            .login-or {
                position: relative;
                color: #aaa;
                margin-top: 10px;
                margin-bottom: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
            }
            .span-or {
                display: block;
                position: absolute;
                left: 50%;
                top: -2px;
                margin-left: -25px;
                background-color: #fff;
                width: 50px;
                text-align: center;
            }
            .hr-or {
                height: 1px;
                margin-top: 0px !important;
                margin-bottom: 0px !important;
            }
            .google {
                color:#666;
                width:100%;
                height:40px;
                text-align:center;
                outline:none;
                border: 1px solid lightgrey;
            }
            form .error {
                color: #ff0000;
            }
            #second{display:none;}    </style>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            window.alert = function () {};
            var defaultCSS = document.getElementById('bootstrap-css');
            function changeCSS(css) {
                if (css)
                    $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
                else
                    $('head > link').filter(':first').replaceWith(defaultCSS);
            }
            $(document).ready(function () {
                var iframe_height = parseInt($('html').height());
                window.parent.postMessage(iframe_height, 'https://bootsnipp.com');
            });
        </script>
    </head>
    <body>
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">

        <% if (session.getAttribute("USUARIO") == null) {
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
            Palavras p = new Palavras();
            session.setAttribute("LISTAPALAVRAS", p.buscarPalavras());
            session.setAttribute("CONTROLE", 1);
        %>

        <div class="container"> <!-- Preto fundo já vem do css, não das classes das divs -->
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form "> <!-- responsável pela parte branca central -->
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">

                                    <h1>Página Inicial</h1>
                                    <br><br>
                                </div>
                                <h2>
                                    <form action="cadastrarPalavras.jsp"> <!-- Usado form para dar action ao button, já que linkref não tem o ajusta no css -->
                                        <button class="btn-hover color-7">Cadastrar Palavra</button>
                                    </form>
                                </h2>
                                <br>
                                <h2>
                                    <form action="jogar.jsp">
                                        <button class="btn-hover color-7">Jogar!</button>
                                    </form>
                                </h2>
                                <br>
                                <h2>
                                    <form action="ranking.jsp">
                                        <button class="btn-hover color-7">Ver Ranking</button>
                                    </form>
                                </h2>
                                <br>
                                <h2>
                                    <form action="login.jsp">
                                        <button class="btn-hover color-7">Sair</button>
                                    </form>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
