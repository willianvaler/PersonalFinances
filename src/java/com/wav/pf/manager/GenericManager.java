/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.wav.pf.manager;

/**
 *
 * @author willian
 */
public abstract class GenericManager<T>
{
    public abstract void insert( T t ) throws Exception;
    
    public abstract void update( T t ) throws Exception;
    
    public abstract <T>T selectById( T t ) throws Exception;
    
    public abstract <T>T selectByName( T t ) throws Exception;
    
    
}
