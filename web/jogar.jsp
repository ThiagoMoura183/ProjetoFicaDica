<%@page import="Classes.Palavras"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Jogar!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <div class="container"> <!-- Preto fundo já vem do css, não das classes das divs -->
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form "> <!-- responsável pela parte branca central -->
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1>Adivinhe a Palavra!</h1>
                                </div>
                                <br>

                                <%
                                    String acerto = null;
                                    int correto = 0;
                                    if (request.getAttribute("ACERTO") != null) {
                                        acerto = "Certa Resposta!";
                                        correto = 1;
                                    } else {
                                        acerto = "Tente adivinhar a palavra";
                                    }
                                %>
                                <div class="alert alert-warning" role="alert" style="text-align: center;">                               
                                    <%= acerto%>
                                </div>
                                <% //ver informação de qual palavra que tá e qual a lista a ser analisada
                                    int controle = (int) session.getAttribute("CONTROLE");
                                    ArrayList<Palavras> lista = (ArrayList<Palavras>) session.getAttribute("LISTAPALAVRAS");
                                %>
                                <br>
                                <form action="VerificarPalavras" method="POST">
                                    <div class="form-group">
                                        <label for="Dica"><strong>Dica</strong></label>
                                        <p class="text-center"> <%= lista.get(controle).getDica().toUpperCase()%></p>
                                    </div>
                                    <!--<div class="form-group">
                                        <label for="teste"><strong>Dica</strong></label>
                                        <p class="text-center"> <% //out.println(request.getAttribute("TESTE"));%> </p>
                                    </div>                       TESTE PARA VER RETORNO DA PALAVRA RESPOSTA-->
                                    <div class="form-group">
                                        <label for="Palavra">Palavra</label>
                                        <input type="text" name="txtPalavra" class="form-control" aria-describedby="palavraTentativa" placeholder="Digite a palavra" autofocus required>
                                    </div>  
                                    <br>
                                    <div class="col-md-12 text-center ">
                                        <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">Verificar</button>                           
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
