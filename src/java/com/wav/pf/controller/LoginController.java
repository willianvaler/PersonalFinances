/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.controller;

import com.wav.pf.entities.Usuario;
import com.wav.pf.manager.service.transaction.UserManagerDAO;

/**
 *
 * @author willian
 */
public class LoginController
{
    private static UserManagerDAO service = new UserManagerDAO();
    
    public static boolean performLogin( String login, String password )
    {
        Usuario u = null;
        
        boolean result = true;
        
        try
        {
            u = service.selectUserByLogin( login );
        }
        
        catch( Exception e )
        {
        
        }
        
        if ( u != null )
        {
            result = u.getLogin().equals( login )  && u.getSenha().equals( password );
        }
        
        return result;
    }
    
}
