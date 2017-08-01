<%-- 
    Document   : RegisterCategory
    Created on : 17/09/2016, 17:52:26
    Author     : willian
--%>

<%@page import="com.wav.pf.manager.service.transaction.PaymentManagerDAO"%>
<%@page import="com.wav.pf.entities.FormaPagamento"%>
<%@page import="com.wav.pf.manager.service.transaction.WalletManagerDAO"%>
<%@page import="com.wav.pf.entities.Carteira"%>
<%@page import="com.wav.pf.manager.service.transaction.CategoryManagerDAO"%>
<%@page import="com.wav.pf.entities.Categoria"%>
<%@page import="com.wav.pf.entities.Conta"%>
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
        <title>Personal Finances - Relatórios</title>

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
                            <div class="panel-title">Relatórios</div>
                            <div class="panel-body">
                                <%
                                    List<Categoria> categories = new CategoryManagerDAO().select();
                                %>
                                <section>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <form method="post" class="form-horizontal" role="form" action="Servlet?param=categoryReport">
                                                    <input type="hidden" name="id" value="" id="selectedItem">

                                                    <label for="input1" class="col-sm-2 control-label">Categoria</label>
                                                    <div class="col-sm-10">
                                                        <select name="Categoria" class="form-control" id="selectCategory">
                                                            <%
                                                                for ( Categoria c : categories )
                                                                {
                                                            %>
                                                            <option value="<%=c.getIdcategoria()%>"><%=c.getNome()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>

                                                    <br>
                                                    <br>
                                                    <br>
                                                    
                                                    <button type="submit" class="btn btn-primary" onclick="collectCategory()">Gerar Relatório</button>
                                                    
                                                    <script>
                                                        function collectCategory()
                                                        {
                                                            var idSelected = $("#selectCategory").val();
                                                            
                                                            document.getElementById("selectedItem").value = idSelected;
                                                        }
                                                        
                                                    </script>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                                        
                                                        
                                    <br>
                                    <br>
                                    <br>
                                                        
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <form method="post" class="form-horizontal" role="form" action="Servlet?param=paymentReport">
                                                    <input type="hidden" name="id" value="" id="selectedPayment">


                                                   <label for="input1" class="col-sm-2 control-label">Forma de Pagamento</label>
                                                    <div class="col-sm-10">
                                                        <select name="Pagamento" class="form-control" id="selectedPay">
                                                            <%
                                                                List<FormaPagamento> payments = new PaymentManagerDAO().select();

                                                                for ( FormaPagamento fp : payments )
                                                                {
                                                            %>
                                                            <option value="<%=fp.getIdformaPagamento()%>"><%=fp.getNome()%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>


                                                    <br>
                                                    <br>
                                                    <br>
                                                    
                                                    <button type="submit" class="btn btn-primary" onclick="collectPayment()">Gerar Relatório</button>
                                                    
                                                    <script>
                                                        function collectPayment()
                                                        {
                                                            var idSelected = $("#selectedPay").val();
                                                            
                                                            document.getElementById("selectedPayment").value = idSelected;
                                                        }
                                                        
                                                    </script>
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
