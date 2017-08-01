<%-- 
    Document   : PaymentList
    Created on : 18/09/2016, 16:07:01
    Author     : willian
--%>

<%@page import="com.wav.pf.manager.service.transaction.PaymentManagerDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.wav.pf.entities.FormaPagamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        (function (document) {
            'use strict';

            var LightTableFilter = (function (Arr) {

                var _input;

                function _onInputEvent(e) {
                    _input = e.target;
                    var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                    Arr.forEach.call(tables, function (table) {
                        Arr.forEach.call(table.tBodies, function (tbody) {
                            Arr.forEach.call(tbody.rows, _filter);
                        });
                    });
                }

                function _filter(row) {
                    var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                    row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                }

                return {
                    init: function () {
                        var inputs = document.getElementsByClassName('light-table-filter');
                        Arr.forEach.call(inputs, function (input) {
                            input.oninput = _onInputEvent;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function () {
                if (document.readyState === 'complete') {
                    LightTableFilter.init();
                }
            });

        })(document);
    </script> 
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="css/styles.css" rel="stylesheet">
        
        <title>Personal Finances - Listagem de Forma de Pagamento</title>

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
                            <div class="panel-title">Formas de Pagamento</div>
                        </div>
                        <input type="search" class="light-table-filter form-control" data-table="order-table" placeholder="Filtro"  width="100%"/>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table order-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Editar</th>
                                            <th>Excluir</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<FormaPagamento> payments = new PaymentManagerDAO().select();

                                            for ( FormaPagamento p : payments )
                                            {
                                        %>

                                        <tr>
                                            <td><%=p.getIdformaPagamento()%></td>
                                            <td><%=p.getNome()%></td>
                                            <td><a href="Servlet?param=editPayment&id=<%=p.getIdformaPagamento()%>">Editar</a></td>
                                            <td><a OnClick="return confirm('Confirma exclusão?')" href="Servlet?param=delPayment&id=<%=p.getIdformaPagamento()%>">Excluir</a></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
