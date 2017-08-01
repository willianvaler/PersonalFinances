<%-- 
    Document   : main
    Created on : 28/08/2016, 19:23:01
    Author     : willian
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.wav.pf.manager.service.transaction.WalletManagerDAO"%>
<%@page import="com.wav.pf.entities.Carteira"%>
<%@page import="com.wav.pf.manager.service.transaction.BillManagerDAO"%>
<%@page import="com.wav.pf.entities.Conta"%>
<%@page import="java.util.List"%>
<%@page import="com.wav.pf.entities.Categoria"%>
<%@page import="com.wav.pf.manager.service.transaction.CategoryManagerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        (function (document)
        {
            'use strict';

            var LightTableFilter = (function (Arr)
            {

                var _input;

                function _onInputEvent(e)
                {
                    _input = e.target;
                    var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                    Arr.forEach.call(tables, function (table)
                    {
                        Arr.forEach.call(table.tBodies, function (tbody)
                        {
                            Arr.forEach.call(tbody.rows, _filter);
                        });
                    });
                }

                function _filter(row)
                {
                    var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                    row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                }

                return {
                    init: function ()
                    {
                        var inputs = document.getElementsByClassName('light-table-filter');
                        Arr.forEach.call(inputs, function (input)
                        {
                            input.oninput = _onInputEvent;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function ()
            {
                if (document.readyState === 'complete')
                {
                    LightTableFilter.init();
                }
            });

        })(document);
    </script> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Finances</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="css/styles1.css">
        <link rel="stylesheet" href="css/styles1.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

        <!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <jsp:include page = "navbar.jsp" />
        <div class="page-content">
            <div class="row">
                <jsp:include page = "aside.jsp" />
                <%
                    List<Conta> contas = new BillManagerDAO().select();
                    List<Carteira> carteiras = new WalletManagerDAO().select();

                    double entradas = 0, saidas = 0, saldo = 0;

                    for ( Carteira ca : carteiras )
                    {
                        saldo += ca.getSaldo();
                    }

                    for ( Conta c : contas )
                    {
                        if ( c.getTipo() == 0 )
                        {
                            entradas += c.getValor();
                        }

                        else if ( c.getPaga() == 2 )
                        {
                            saidas += c.getValor();
                        }
                    }

                    saldo -= saidas;
                %>
                <div class="col-md-10">
                    <div class="content-box-large">
                        <div class="panel-body">

                            <!-- caixa verde -->
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3><%=entradas%></h3>

                                        <p>Entradas</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="BillList.jsp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>

                            <!-- caixa vermelha -->
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <h3><%=saidas%></h3>

                                        <p>Saídas</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="BillList.jsp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>

                            <!-- caixa azul -->
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-blue">
                                    <div class="inner">
                                        <h3><%=saldo%></h3>

                                        <p>Saldo</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="BillList.jsp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <!--                <div class="col-md-12">
                                    <div class="content-box-large">
                                        Div that will hold the pie chart
                                        <div id="chart_div"></div>
                                    </div>
                
                                    <script type="text/javascript">
                
                                        // Load the Visualization API and the corechart package.
                                        google.charts.load('current', {'packages': ['corechart']});
                
                                        // Set a callback to run when the Google Visualization API is loaded.
                                        google.charts.setOnLoadCallback(drawChart);
                
                                        // Callback that creates and populates a data table,
                                        // instantiates the pie chart, passes in the data and
                                        // draws it.
                                        function drawChart()
                                        {
                
                                            // Create the data table.
                                            var data = new google.visualization.DataTable();
                                            data.addColumn('string', 'Topping');
                                            data.addColumn('number', 'Slices');
                                            data.addRows([
                                                ['Mushrooms', 3],
                                                ['Onions', 1],
                                                ['Olives', 1],
                                                ['Zucchini', 1],
                                                ['Pepperoni', 2]
                                            ]);
                
                                            // Set chart options
                                            var options = {'title': 'Categorias que mais possuem contas',
                                                'width': 400,
                                                'height': 300};
                
                                            // Instantiate and draw our chart, passing in some options.
                                            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                                            chart.draw(data, options);
                                        }
                                    </script>
                                </div>-->

                <div class="col-md-10 ">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title">Contas</div>
                        </div>
                        <input type="search" class="light-table-filter form-control" data-table="order-table" placeholder="Filtro"  width="100%"/>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table order-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Valor</th>
                                            <th>Data</th>
                                            <th>Data Vencimento</th>
                                            <th>Conta Fixa</th>
                                            <th>Categoria</th>
                                            <th>Carteira</th>
                                            <th>Forma de Pagamento</th>
                                            <th>Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Conta> bills = new BillManagerDAO().select();

                                            for ( Conta c : bills )
                                            {
                                        %>

                                        <tr>
                                            <td><%=c.getIdconta()%></td>
                                            <td><%=c.getNome()%></td>
                                            <td><%=c.getValor()%></td>
                                            <td><%=c.getData()%></td>
                                            <td><%=c.getDataVenc()%></td>
                                            <td><%=c.isContaFixa() == true ? "Sim" : "Não"%></td>
                                            <td><%=c.getCategoria().getNome()%></td>
                                            <td><%=c.getCarteira().getNome()%></td>
                                            <td><%=c.getFormaPagamento().getNome()%></td>
                                            <td><%=c.getTipo() == 0 ? "Entrada" : "Saída"%></td>
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


                <div class="col-md-6">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title">Contas Vencidas</div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table order-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Valor</th>
                                            <th>Data</th>
                                            <th>Data Vencimento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Conta> contasVencidas = new ArrayList();
                                            
                                            for( Conta c : bills )
                                            {
                                                if ( c.getDataVenc().before( Calendar.getInstance().getTime() ) && c.getPaga() == 1 )
                                                {
                                                    contasVencidas.add( c );
                                                }
                                            }

                                            for ( Conta c : contasVencidas )
                                            {
                                        %>

                                        <tr>
                                            <td><%=c.getIdconta()%></td>
                                            <td><%=c.getNome()%></td>
                                            <td><%=c.getValor()%></td>
                                            <td><%=c.getData()%></td>
                                            <td><%=c.getDataVenc()%></td>
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

                <div class="col-md-6">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title">Contas à Pagar</div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table order-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nome</th>
                                            <th>Valor</th>
                                            <th>Data</th>
                                            <th>Data Vencimento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Conta> contaspagar = new ArrayList();
                                            
                                            for( Conta c : bills )
                                            {
                                                if ( c.getPaga() == 1 )
                                                {
                                                    contaspagar.add( c ); 
                                                }
                                            }
                                            
                                            for ( Conta c : contaspagar )
                                            {
                                        %>

                                        <tr>
                                            <td><%=c.getIdconta()%></td>
                                            <td><%=c.getNome()%></td>
                                            <td><%=c.getValor()%></td>
                                            <td><%=c.getData()%></td>
                                            <td><%=c.getDataVenc()%></td>
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
