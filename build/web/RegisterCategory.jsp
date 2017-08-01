<%-- 
    Document   : RegisterCategory
    Created on : 17/09/2016, 17:52:26
    Author     : willian
--%>

<%@page import="com.wav.pf.manager.service.transaction.CategoryManagerDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.wav.pf.entities.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">
        <title>Personal Finances - Registro de Categoria</title>

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
                                    Categoria cat = (Categoria) request.getAttribute( "category" );

                                    if ( cat == null )
                                    {
                                        cat = new Categoria();
                                        cat.setIdcategoria( 0 );
                                    }

                                %>
                                <section>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <form method="post" class="form-horizontal" role="form" action="Servlet?param=<%= cat.getIdcategoria() == 0 ? "regCategory" : "editCategory"%>">
                                                    <input type="hidden" name="id" value="<%= cat.getIdcategoria()%>">

                                                    <div class="form-group">
                                                        <label for="input1" class="col-sm-2 control-label">Categoria</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" id="input1" name="name" value="<%= cat.getNome() == null ? "" : cat.getNome()%>" size="50px" required/>
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
