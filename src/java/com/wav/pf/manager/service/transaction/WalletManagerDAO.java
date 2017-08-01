/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager.service.transaction;

import com.wav.pf.database.Database;
import com.wav.pf.entities.Carteira;
import com.wav.pf.manager.WalletManager;
import java.util.List;

/**
 *
 * @author willian
 */
public class WalletManagerDAO
        implements
            WalletManager
{
    private Database db = Database.getInstance();
    
    @Override
    public void insert( Carteira t )
    {
        db.insert( t );
    }

    @Override
    public void update( Carteira t )
    {
        db.update( t );
    }

    @Override
    public List<Carteira> select()
    {
        return db.select( Carteira.class,"" );
    }

    @Override
    public Carteira selectById( int id )
    {
        return (Carteira)db.fetchOne( Carteira.class , " where id = " + id );
    }

    @Override
    public Carteira selectByName( String name )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete( Carteira t )
    {
        db.delete( t );
    }
    
}
