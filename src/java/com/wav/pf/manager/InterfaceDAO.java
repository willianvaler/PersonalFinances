/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager;

import java.util.List;

/**
 *
 * @author willian
 */
public abstract interface InterfaceDAO<T>
{
    public abstract void insert( T t );
    
    public abstract void update( T t );
    
    public abstract List<T> select();
    
    public abstract T selectById( int id );
    
    public abstract T selectByName( String name );
    
    public abstract void delete( T t );
}
