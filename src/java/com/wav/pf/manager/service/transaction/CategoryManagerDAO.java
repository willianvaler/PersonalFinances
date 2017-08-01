/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager.service.transaction;

import com.wav.pf.database.Database;
import com.wav.pf.entities.Categoria;
import com.wav.pf.manager.CategoryManager;
import java.util.List;

/**
 *
 * @author willian
 */
public class CategoryManagerDAO
        implements 
            CategoryManager
{
    Database db = Database.getInstance();
    
    @Override
    public void insert( Categoria t )
    {
        db.insert( t );
    }

    @Override
    public void update( Categoria t )
    {
        db.update( t );
    }

    @Override
    public Categoria selectById( int id )
    {
        return (Categoria)db.fetchOne( Categoria.class, " where id  = " + id );
    }

    @Override
    public Categoria selectByName( String name )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete( Categoria t )
    {
        db.delete( t );
    }

    @Override
    public List<Categoria> select()
    {
        return db.select( Categoria.class,"" );
    }
    
}
