<%-- 
    Document   : RegisterCategory
    Created on : 17/09/2016, 17:52:26
    Author     : willian
--%>

<%@page import="com.wav.pf.manager.service.transaction.PaymentManagerDAO"%>
<%@page import="com.wav.pf.entities.FormaPagamento"%>
<%@page import="com.wav.pf.manager.service.transaction.CategoryManagerDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.wav.pf.entities.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    </head>
    <body>
        <jsp:include page = "navbar.jsp" />
        <div class="page-content">
            <div class="row">
                <jsp:include page = "aside.jsp" />
                <div class="col-md-10">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title">Cadastro de Formas de Pagamento</div>
                            <div class="panel-body">
                                <section>
                                    <%
                                        FormaPagamento pay = (FormaPagamento) request.getAttribute( "payment" );

                                        if ( pay == null )
                                        {
                                            pay = new FormaPagamento();
                                            pay.setIdformaPagamento( 0 );
                                        }

                                    %>
                                    <div>
                                        <form class="form-horizontal" role="form" method="post" action="Servlet?param=<%= pay.getIdformaPagamento() == 0 ? "regPayment" : "editPayment"%>">
                                            <input type="hidden" name="id" value="<%= pay.getIdformaPagamento()%>">
                                            
                                            <div class="form-group">
                                                <label for="input1" class="col-sm-2 control-label">Forma de Pagamento</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" name="name" value="<%= pay.getNome() == null ? "" : pay.getNome()%>" size="50px" required/>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Salvar</button>
                                        </form>
                                    </div>

                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
