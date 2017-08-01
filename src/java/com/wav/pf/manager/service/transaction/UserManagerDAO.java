/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager.service.transaction;

import com.wav.pf.database.Database;
import com.wav.pf.entities.Usuario;
import com.wav.pf.manager.UserManager;
import java.util.List;

/**
 *
 * @author willian
 */
public class UserManagerDAO
        implements
            UserManager
{
    Database db = Database.getInstance();
    
    public Usuario selectUserByLogin( String login )
    {
        return (Usuario)db.fetchOne( Usuario.class, " where login like '" + login + "'" );
    }

    @Override
    public void insert( Usuario t )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update( Usuario t )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario selectById( int id )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario selectByName( String name )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete( Usuario t )
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Usuario> select()
    {
        throw new UnsupportedOperationException( "Not supported yet." ); //To change body of generated methods, choose Tools | Templates.
    }
}
