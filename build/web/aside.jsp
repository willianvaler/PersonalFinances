<%-- 
    Document   : aside
    Created on : 17/09/2016, 14:27:01
    Author     : willian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body>

                <div class="col-md-2">
                    <div class="sidebar content-box" style="display: block;">
                        <ul class="nav">
                            <li class="current">
                                <a href="main.jsp">
                                    <i class="glyphicon glyphicon-home"></i>Home
                                </a>
                            </li>
                            <li class="current">
                                <a href="Reports.jsp">
                                    <i class="glyphicon glyphicon-paperclip"></i>Relatório
                                </a>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-list"></i> Listagens
                                    <span class="caret pull-right"></span>
                                </a>
                                <ul>
                                    <li><a href="CategoryList.jsp">Lista de Categorias</a></li>
                                    <li><a href="PaymentList.jsp">Lista de Formas de Pagamentos</a></li>
                                    <li><a href="walletList.jsp">Lista de Carteiras</a></li>
                                    <li><a href="BillList.jsp">Lista de Contas</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-pencil"></i> Cadastros
                                    <span class="caret pull-right"></span>
                                </a>
                                <ul>
                                    <li><a href="RegisterCategory.jsp">Cadastro de Categorias</a></li>
                                    <li><a href="Payment.jsp">Cadastro de Formas de Pagamentos</a></li>
                                    <li><a href="RegisterWallet.jsp">Cadastro de Carteiras</a></li>
                                    <li><a href="RegisterBill.jsp">Cadastro de Contas</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    </body>
</html>
