/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.servlets;

import com.wav.pf.controller.LoginController;
import com.wav.pf.database.Database;
import com.wav.pf.entities.Carteira;
import com.wav.pf.entities.Categoria;
import com.wav.pf.entities.Conta;
import com.wav.pf.entities.FormaPagamento;
import com.wav.pf.entities.Usuario;
import com.wav.pf.manager.service.transaction.BillManagerDAO;
import com.wav.pf.manager.service.transaction.CategoryManagerDAO;
import com.wav.pf.manager.service.transaction.PaymentManagerDAO;
import com.wav.pf.manager.service.transaction.UserManagerDAO;
import com.wav.pf.manager.service.transaction.WalletManagerDAO;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author willian
 */
public class Servlet extends HttpServlet
{

    private HttpServletRequest req;
    private HttpServletResponse resp;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        req = request;
        resp = response;

        resp.setContentType( "text/html;charset=UTF-8" );

        try (PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
            out.println( "<!DOCTYPE html>" );
            out.println( "<html>" );
            out.println( "<head>" );
            out.println( "<title>Servlet LoginServlet</title>" );
            out.println( "</head>" );
            out.println( "<body>" );
            out.println( "<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>" );
            out.println( "</body>" );
            out.println( "</html>" );
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
//        processRequest( request, response );
        req = request;
        resp = response;
        request.setCharacterEncoding( "UTF-8" );
        req.setCharacterEncoding( "UTF-8" );

        if ( request.getParameter( "param" ).equals( "delCategory" ) )
        {
            Categoria c = new CategoryManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            new CategoryManagerDAO().delete( c );

            forward( "CategoryList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editCategory" ) )
        {
            Categoria c = new CategoryManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            req.setAttribute( "category", c );

            forward( "RegisterCategory.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "delPayment" ) )
        {
            FormaPagamento p = new PaymentManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            new PaymentManagerDAO().delete( p );

            forward( "PaymentList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editPayment" ) )
        {
            FormaPagamento p = new PaymentManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            req.setAttribute( "payment", p );

            forward( "Payment.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editWallet" ) )
        {
            Carteira c = new WalletManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            req.setAttribute( "wallet", c );

            forward( "RegisterWallet.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "delWallet" ) )
        {
            new WalletManagerDAO().delete( new WalletManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) ) );

            forward( "walletList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editBill" ) )
        {
            Conta c = new BillManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );

            req.setAttribute( "bill", c );
            forward( "RegisterBill.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "delBill" ) )
        {
            Conta c = new BillManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            new BillManagerDAO().delete( c );

            forward( "BillList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "logout" ) )
        {
            request.getSession().invalidate();
            forward( "index.jsp" );
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
//        processRequest( request, response );
        req = request;
        resp = response;
        request.setCharacterEncoding( "UTF-8" );
        req.setCharacterEncoding( "UTF-8" );

        if ( req.getParameter( "param" ).equals( "Login" ) )
        {
            if ( LoginController.performLogin( request.getParameter( "login" ), request.getParameter( "password" ) ) )
            {
                Usuario user = new UserManagerDAO().selectUserByLogin( request.getParameter( "login" ) );
                HttpSession sessao = req.getSession();
                sessao.setAttribute( "currentUser", user );
                forward( "main.jsp" );
            }

            else
            {
                forward( "login.jsp" );
            }
        }

        else if ( request.getParameter( "param" ).equals( "regCategory" ) )
        {
            Categoria c = new Categoria();
            c.setNome( request.getParameter( "name" ) );
            new CategoryManagerDAO().insert( c );

            forward( "RegisterCategory.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editCategory" ) )
        {
            Categoria c = new CategoryManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            c.setNome( request.getParameter( "name" ) );
            new CategoryManagerDAO().update( c );

            forward( "CategoryList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "regPayment" ) )
        {
            FormaPagamento p = new FormaPagamento();
            p.setNome( request.getParameter( "name" ) );
            new PaymentManagerDAO().insert( p );

            forward( "Payment.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editPayment" ) )
        {
            FormaPagamento p = new PaymentManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            p.setNome( request.getParameter( "name" ) );
            new PaymentManagerDAO().update( p );

            forward( "PaymentList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "regWallet" ) )
        {
            Carteira c = new Carteira();
            c.setNome( request.getParameter( "name" ) );
            c.setSaldo( Double.parseDouble( request.getParameter( "balance" ) ) );
            c.setUsuario( (Usuario) req.getSession().getAttribute( "currentUser" ) );

            new WalletManagerDAO().insert( c );

            forward( "walletList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editWallet" ) )
        {
            Carteira c = new WalletManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );
            c.setNome( request.getParameter( "name" ) );
            c.setSaldo( Double.parseDouble( request.getParameter( "balance" ) ) );
            c.setUsuario( (Usuario) req.getSession().getAttribute( "currentUser" ) );

            new WalletManagerDAO().update( c );

            forward( "walletList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "regBill" ) )
        {
            Conta conta = new Conta();

            Carteira carteira = new WalletManagerDAO().selectById( Integer.valueOf( request.getParameter( "Carteira" ) ) );

            conta.setTipo( Integer.valueOf( request.getParameter( "Tipo" ) ) );
            conta.setCarteira( carteira );
            conta.setCategoria( new CategoryManagerDAO().selectById( Integer.valueOf( request.getParameter( "Categoria" ) ) ) );
            conta.setData( java.sql.Date.valueOf( request.getParameter( "Data" ) ) );
            conta.setDataVenc( java.sql.Date.valueOf( request.getParameter( "DataVenc" ) ) );
            conta.setContaFixa( (Integer.valueOf( request.getParameter( "Fixa" ) ) == 1) );
            conta.setNome( request.getParameter( "name" ) );
            conta.setValor( Double.valueOf( request.getParameter( "value" ) ) );
            conta.setUsuario( (Usuario) req.getSession().getAttribute( "currentUser" ) );
            conta.setFormaPagamento( new PaymentManagerDAO().selectById( Integer.valueOf( request.getParameter( "Pagamento" ) ) ) );
            conta.setPaga( Byte.valueOf( request.getParameter( "Paga" ) ) );

            if ( conta.getPaga() == 2 )
            {
                carteira.setSaldo( carteira.getSaldo() - conta.getValor() );
                new WalletManagerDAO().update( carteira );
            }

            new BillManagerDAO().insert( conta );

            forward( "RegisterBill.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "editBill" ) )
        {
            Conta conta = new BillManagerDAO().selectById( Integer.parseInt( request.getParameter( "id" ) ) );

            Carteira carteira = new WalletManagerDAO().selectById( Integer.valueOf( request.getParameter( "Carteira" ) ) );

            int oldStatus = Byte.valueOf( request.getParameter( "Paga" ) );

            conta.setTipo( Integer.valueOf( request.getParameter( "Tipo" ) ) );
            conta.setCarteira( new WalletManagerDAO().selectById( Integer.valueOf( request.getParameter( "Carteira" ) ) ) );
            conta.setCategoria( new CategoryManagerDAO().selectById( Integer.valueOf( request.getParameter( "Categoria" ) ) ) );
            conta.setData( java.sql.Date.valueOf( request.getParameter( "Data" ) ) );
            conta.setDataVenc( java.sql.Date.valueOf( request.getParameter( "DataVenc" ) ) );
            conta.setContaFixa( (Integer.valueOf( request.getParameter( "Fixa" ) ) == 1) );
            conta.setNome( request.getParameter( "name" ) );
            conta.setValor( Double.valueOf( request.getParameter( "value" ) ) );
            conta.setUsuario( (Usuario) req.getSession().getAttribute( "currentUser" ) );
            conta.setFormaPagamento( new PaymentManagerDAO().selectById( Integer.valueOf( request.getParameter( "Pagamento" ) ) ) );
            conta.setPaga( Byte.valueOf( request.getParameter( "Paga" ) ) );

            if ( oldStatus != conta.getPaga() )
            {
                if ( conta.getPaga() == 2 )
                {
                    carteira.setSaldo( carteira.getSaldo() - conta.getValor() );
                    new WalletManagerDAO().update( carteira );
                }

                else
                {
                    carteira.setSaldo( carteira.getSaldo() + conta.getValor() );
                    new WalletManagerDAO().update( carteira );
                }
            }

            new BillManagerDAO().update( conta );

            forward( "BillList.jsp" );
        }

        else if ( request.getParameter( "param" ).equals( "categoryReport" ) )
        {
            generateReport();
        }
        
        else if( request.getParameter( "param" ).equals( "paymentReport" ) )
        {
            generateReportPayment();
        }

        else if ( request.getParameter( "param" ).equals( "csv" ) )
        {
            gerarCSV();
        }
    }

    private void generateReport()
    {
        Categoria c = new CategoryManagerDAO().selectById( Integer.valueOf( req.getParameter( "id" ) ) );

        try
        {
            Connection conn = Database.getInstance().getConnection();
            File reportFile = new File( "/home/willian/NetBeansProjects/PersonalFinances/src/java/com/wav/reports/categorias.jasper" );
            Map parameters = new HashMap();
            parameters.put( "Categoria", c.getIdcategoria() );
            parameters.put( "CategoriaNome", c.getNome() );
            byte[] bytes = JasperRunManager.runReportToPdf( reportFile.getPath(), parameters, conn );

            resp.setContentType( "application/pdf" );
            resp.setContentLength( bytes.length );
            ServletOutputStream outStream = resp.getOutputStream();
            outStream.write( bytes, 0, bytes.length );
            outStream.flush();
            outStream.close();

        }
        catch ( Exception e )
        {
            System.out.println( "erro ao gerar relatorio: " + e );
        }
    }
    
    private void generateReportPayment()
    {
        FormaPagamento fp = new PaymentManagerDAO().selectById( Integer.valueOf( req.getParameter( "id" ) ) );

        try
        {
            Connection conn = Database.getInstance().getConnection();
            File reportFile = new File( "/home/willian/NetBeansProjects/PersonalFinances/src/java/com/wav/reports/FormasDePagamento.jasper" );
            Map parameters = new HashMap();
            parameters.put( "forma", fp.getIdformaPagamento());
            parameters.put( "formaNome", fp.getNome() );
            byte[] bytes = JasperRunManager.runReportToPdf( reportFile.getPath(), parameters, conn );

            resp.setContentType( "application/pdf" );
            resp.setContentLength( bytes.length );
            ServletOutputStream outStream = resp.getOutputStream();
            outStream.write( bytes, 0, bytes.length );
            outStream.flush();
            outStream.close();

        }
        catch ( Exception e )
        {
            System.out.println( "erro ao gerar relatorio: " + e );
        }
    }

    private void gerarCSV()
    {
        try
        {
            String ids = req.getParameter( "selectedItems" );
            List<Conta> contas = new ArrayList();

            if ( ids != null && !ids.contains( "null" ) )
            {
                String[] id = ids.split( "," );

                for ( String s : id )
                {
                    if ( !s.isEmpty() )
                    {
                        contas.add( (Conta) new BillManagerDAO().selectById( Integer.valueOf( s ) ) );
                    }
                }

                File file = new File( "/home/willian/NetBeansProjects/PersonalFinances/web/csv/arquivo.csv" );
                
                if ( !file.exists() )
                {
                    file.createNewFile();
                }

                FileWriter writer = new FileWriter( file, false );

                String newline = System.getProperty( "line.separator" );

                if ( file.canWrite() )
                {
                
                    for ( Conta c : contas )
                    {
                        String saida = "";
                        saida += c.getIdconta() + ";";
                        saida += c.getNome() + ";";
                        saida += c.getData().toString() + ";";
                        saida += c.getDataVenc().toString() + ";";
                        saida += c.getValor() + ";";
                        saida += c.getPaga() == 1 ? "Não" : "Sim" + ";";
                        saida += c.getTipo() == 1 ? "Entrada" : "Saída" + ";";
                        saida += c.getCategoria().getNome() + ";";
                        saida += c.getCarteira().getNome() + ";";
                        saida += c.getFormaPagamento().getNome() + ";";
                        
                        writer.write( saida) ;
                        
                        writer.write( newline );
                    }
                }
                
                writer.flush();
                
                writer.close();
            }

            try
            {
                resp.sendRedirect( "csv/arquivo.csv" );
            }

            catch ( Exception e )
            {
                System.out.println( "erro sendRedirect: " + e );
            }
        }

        catch ( Exception e )
        {
            e.printStackTrace();

        }

        forward( "BillList.jsp" );
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }
// </editor-fold>

    private void forward( String page )
    {
        try
        {
            RequestDispatcher rd = req.getRequestDispatcher( page );
            rd.forward( req, resp );
        }

        catch ( Exception e )
        {
            System.out.println( "erro ao encaminhar página" );
        }

    }

}
