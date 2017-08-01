/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager.service.transaction;

import com.wav.pf.database.Database;
import com.wav.pf.entities.FormaPagamento;
import com.wav.pf.manager.PaymentManager;
import java.util.List;

/**
 *
 * @author willian
 */
public class PaymentManagerDAO
        implements 
            PaymentManager
{

    private Database db = Database.getInstance();
    
    @Override
    public void insert( FormaPagamento t )
    {
        db.insert( t );
    }

    @Override
    public void update( FormaPagamento t )
    {
        db.update( t );
    }

    @Override
    public List<FormaPagamento> select()
    {
        return db.select( FormaPagamento.class,"" );
    }

    @Override
    public FormaPagamento selectById( int id )
    {
        return (FormaPagamento) db.fetchOne( FormaPagamento.class, " where id = " + id );
    }

    @Override
    public FormaPagamento selectByName( String name )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete( FormaPagamento t )
    {
        db.delete( t );
    }
    
}
