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
        <title>Personal Finances - Registro de Conta</title>

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
                                    Conta conta = (Conta) request.getAttribute( "bill" );

                                    if ( conta == null )
                                    {
                                        conta = new Conta();
                                        conta.setIdconta( 0 );
                                    }

                                %>
                                <section>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <form method="post" class="form-horizontal" role="form" action="Servlet?param=<%= conta.getIdconta() == 0 ? "regBill" : "editBill"%>">
                                                    <input type="hidden" name="id" value="<%= conta.getIdconta()%>">

                                                    <div class="form-group">
                                                        <label for="input1" class="col-sm-2 control-label">Conta</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" id="input1" name="name" value="<%= conta.getNome() == null ? "" : conta.getNome()%>" size="50px" required/>
                                                        </div>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <label for="input1" class="col-sm-2 control-label">Valor</label>
                                                        <div class="col-sm-10">
                                                            <input type="number" min="0" step=0.01 class="form-control" id="input1" name="value" value="<%= conta.getValor() == 0 ? 0 : conta.getValor()%>" size="50px" required/>
                                                        </div>

                                                        <br>
                                                        <br>
                                                        <br>

                                                        <label for="input1" class="col-sm-2 control-label" >Data</label>
                                                        <div class="col-sm-10">
                                                            <input type="date" class="form-control" name="Data" required value="<%=conta.getData() == null ? "" : conta.getData()%>">
                                                        </div>

                                                        <br>
                                                        <br>
                                                        <br>
                                                        <label for="input1" class="col-sm-2 control-label">Data de Vencimento</label>
                                                        <div class="col-sm-10">
                                                            <input type="date" class="form-control"  name="DataVenc" required value="<%=conta.getDataVenc() == null ? "" : conta.getDataVenc()%>">
                                                        </div>

                                                        <br>
                                                        <br>
                                                        <br>

                                                        <label for="input1" class="col-sm-2 control-label">Forma de Pagamento</label>
                                                        <div class="col-sm-10">
                                                            <select name="Pagamento" class="form-control">
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

                                                        <label for="input1" class="col-sm-2 control-label">Carteira</label>
                                                        <div class="col-sm-10">
                                                            <select name="Carteira" class="form-control">
                                                                <%
                                                                    List<Carteira> wallets = new WalletManagerDAO().select();

                                                                    for ( Carteira c : wallets )
                                                                    {
                                                                %>
                                                                <option value="<%=c.getIdcarteira()%>"><%=c.getNome()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                        
                                                        <br>
                                                        <br>
                                                        <br>
                                                            
                                                        <label for="input1" class="col-sm-2 control-label">Categoria</label>
                                                        <div class="col-sm-10">
                                                            <select name="Categoria" class="form-control">
                                                                <%
                                                                    List<Categoria> categories = new CategoryManagerDAO().select();

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

                                                        <label for="input1" class="col-sm-2 control-label">Tipo</label>
                                                        <div class="col-sm-10">
                                                            <select name="Tipo" class="form-control">
                                                                <option value="1">Entrada</option>
                                                                <option value="2">Saída</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <br>
                                                        <br>
                                                        <br>

                                                        <label for="input1" class="col-sm-2 control-label">Conta fixa</label>
                                                        <div class="col-sm-10">
                                                            <select name="Fixa" class="form-control">
                                                                <option value="1">Não</option>
                                                                <option value="2">Sim</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <br>
                                                        <br>
                                                        <br>

                                                        <label for="input1" class="col-sm-2 control-label">Paga</label>
                                                        <div class="col-sm-10">
                                                            <select name="Paga" class="form-control">
                                                                <option value="1">Não</option>
                                                                <option value="2">Sim</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <br>
                                                        <br>
                                                        <br>
                                                        
                                                        
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
