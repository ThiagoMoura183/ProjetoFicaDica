<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login</title>
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
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet"> <!-- responsável pela fonte -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <%
            session.removeAttribute("USUARIO");
        %>

        <div class="container"> <!-- Preto fundo já vem do css, não das classes das divs -->
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form "> <!-- responsável pela parte branca central -->
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1>Login</h1>
                                    <img src="unnamed.png" width="200" height="150" alt="logo"/>

                                </div>
                            </div>
                            <form action="Inserir" method="POST">
                                <div class="form-group">
                                    <label for="User">Usuário</label>
                                    <input type="text" name="txtNome" class="form-control" aria-describedby="user" placeholder="Digite seu usuário" autofocus required>
                                </div>
                                <div class="form-group">
                                    <label for="Senha">Senha</label>
                                    <input type="password" name="txtSenha" class="form-control" aria-describedby="senha" placeholder="Digite sua senha">
                                </div>  

                                <!-- Verificação e pego atributo de erro no servlet -->
                                <% if (request.getAttribute("errorMessage") != null) { %>                            
                                <div class="alert alert-danger" role="alert">                               
                                    <% out.println(request.getAttribute("errorMessage")); %>
                                </div>
                                <% }%>

                                <div class="form-group">
                                    <p class="text-center">Visite a homepage da <a href="https://unisagrado.edu.br/" target="_blank">Unisagrado</a></p>
                                </div>
                                <div class="col-md-12 text-center ">
                                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">Login</button>                           
                                </div>

                                <div class="col-md-12 ">
                                    <div class="login-or">
                                        <hr class="hr-or">
                                        <span class="span-or">or</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <p class="text-center">Não possui um usuário? Cadastre-se <a href="#" id="signup">Aqui!</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="second">
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1>Cadastro de Usuário</h1>
                                </div>
                            </div>
                            <form action="LoginUser" name="registration" method="GET">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nome de Usuário</label>
                                    <input type="text" name="txtNome" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="Usuário">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Senha</label>
                                    <input type="password" name="txtSenha" id="password" class="form-control" aria-describedby="emailHelp" placeholder="Senha">
                                </div>
                                <div class="col-md-12 text-center mb-3">
                                    <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Cadastrar</button>
                                </div>
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <p class="text-center"><a href="#" id="signin">Já possui cadastro?</a></p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>   

        <script type="text/javascript">
            $("#signup").click(function () {
                $("#first").fadeOut("fast", function () {
                    $("#second").fadeIn("fast");
                });
            });

            $("#signin").click(function () {
                $("#second").fadeOut("fast", function () {
                    $("#first").fadeIn("fast");
                });
            });



            $(function () {
                $("form[name='login']").validate({
                    rules: {

                        email: {
                            required: true,
                            email: true
                        },
                        password: {
                            required: true,

                        }
                    },
                    messages: {
                        email: "Please enter a valid email address",

                        password: {
                            required: "Please enter password",

                        }

                    },
                    submitHandler: function (form) {
                        form.submit();
                    }
                });
            });



            $(function () {

                $("form[name='registration']").validate({
                    rules: {
                        firstname: "required",
                        lastname: "required",
                        email: {
                            required: true,
                            email: true
                        },
                        password: {
                            required: true,
                            minlength: 5
                        }
                    },

                    messages: {
                        firstname: "Please enter your firstname",
                        lastname: "Please enter your lastname",
                        password: {
                            required: "Please provide a password",
                            minlength: "Your password must be at least 5 characters long"
                        },
                        email: "Please enter a valid email address"
                    },

                    submitHandler: function (form) {
                        form.submit();
                    }
                });
            });
        </script>
    </body>
</html>
