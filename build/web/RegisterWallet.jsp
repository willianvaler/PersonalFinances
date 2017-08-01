<%-- 
    Document   : RegisterCategory
    Created on : 17/09/2016, 17:52:26
    Author     : willian
--%>

<%@page import="com.wav.pf.entities.Carteira"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">
        <title>Personal Finances - Registro de carteira</title>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <jsp:include page = "navbar.jsp" />
        <div class="page-content">
            <div class="row">
                <jsp:include page = "aside.jsp" />

                <div class="col-md-10">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title">Cadastro de Categorias</div>
                            <div class="panel-body">
                                <%
                                    Carteira wallet = (Carteira) request.getAttribute( "wallet" );

                                    if ( wallet == null )
                                    {
                                        wallet = new Carteira();
                                        wallet.setIdcarteira( 0 );
                                    }

                                %>
                                <section>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <form method="post" class="form-horizontal" role="form" action="Servlet?param=<%= wallet.getIdcarteira()== 0 ? "regWallet" : "editWallet"%>">
                                                    <input type="hidden" name="id" value="<%= wallet.getIdcarteira()%>">

                                                    <div class="form-group">
                                                        <label for="input1" class="col-sm-2 control-label">Carteira</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" id="input1" name="name" value="<%= wallet.getNome() == null ? "" : wallet.getNome()%>" size="50px" required/>
                                                        </div>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <label for="input1" class="col-sm-2 control-label">Saldo</label>
                                                        <div class="col-sm-10">
                                                            <input type="number" step=0.01 class="form-control" id="input1" name="balance" value="<%= wallet.getSaldo() == 0 ? 0 : wallet.getSaldo()%>" size="50px" required/>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Salvar</button>
                                                    
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </section>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
