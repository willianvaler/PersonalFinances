/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.controller;

import com.wav.pf.entities.Categoria;
import com.wav.pf.manager.CategoryManager;
import com.wav.pf.manager.service.transaction.CategoryManagerDAO;

/**
 *
 * @author willian
 */
public class CategoryController
{
    CategoryManager cm = new CategoryManagerDAO();
    
    public void insert( Categoria c )
    {
        cm.insert( c );
    }
    
    public void delete( Categoria c )
    {
        cm.delete( c );
    }
    
    public void update( Categoria c )
    {
        cm.update( c );
    }
            
}
