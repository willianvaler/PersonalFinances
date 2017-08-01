/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager.service.transaction;

import com.wav.pf.database.Database;
import com.wav.pf.entities.Conta;
import com.wav.pf.manager.BillManager;
import java.util.List;

/**
 *
 * @author willian
 */
public class BillManagerDAO
    implements
        BillManager
{
    private Database db = Database.getInstance();
    
    @Override
    public void insert( Conta t )
    {
        db.insert( t );
    }

    @Override
    public void update( Conta t )
    {
        db.update( t );
    }

    @Override
    public List<Conta> select()
    {
        return db.select( Conta.class,"" );
    }

    @Override
    public Conta selectById( int id )
    {
        return (Conta) db.fetchOne( Conta.class, " where id = " + id );
    }

    @Override
    public Conta selectByName( String name )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete( Conta t )
    {
        db.delete( t );
    }
    
}
