package com.wav.pf.database;

import com.wav.config.HibernateUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author willian
 */
public class Database
{

    private static Database instance = null;
    private Connection connection = null;

    private Database()
    {
        try
        {
            Properties prop = new Properties();
            
            prop.load( getClass().getResourceAsStream( "db.properties" ) );
            
            String dbUrl = prop.getProperty( "db.url" );
            String dbUser = prop.getProperty( "db.user" );
            String dbPassword = prop.getProperty( "db.password" );
            String driver = prop.getProperty( "db.driver" );

            Class.forName( driver );
            connection = DriverManager.getConnection( dbUrl, dbUser, dbPassword );
        }

        catch ( Exception e )
        {
            System.err.println( e );
        }
    }

    /**
     *
     * @return
     */
    public static Database getInstance()
    {
//        if ( instance == null )
        {
            instance = new Database();
        }

        return instance;
    }

    /**
     *
     * @return
     */
    public Connection getConnection()
    {
        if ( connection == null )
        {
            throw new RuntimeException( "connection cannot be null" );
        }

        return connection;
    }

    /**
     * 
     */
    public void shutDown()
    {
        try
        {
            connection.close();
            instance = null;
            connection = null;
        }

        catch ( Exception e )
        {
            System.err.println( e );
        }
    }
    
    /**
     * <b>prepareStatement</b>
     * 
     * Inicializa a sessão e começa a transação
     * 
     * @return 
     */
    private Session prepareStatement()
    {
        Session session = null;
        
        try
        {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
        }
        
        catch( Exception e )
        {
            session = HibernateUtil.getSessionFactory().openSession();
        }
        
        
        session.beginTransaction();
        
        return session;
    }
    
    /**
     * 
     * @param session 
     */
    private void commitAndClose( Session session )
    {
        session.getTransaction().commit();
        close( session );
    }
    
    /**
     * 
     * @param session 
     */
    private void close( Session session )
    {
        session.close();
    }
    
    /**
     * 
     * @param <T>
     * @param clazz
     * @return 
     */
//    public <T> List<T> select( Class<? extends T> clazz )
//    {
//        return select( clazz, "" );
//    }
    
    /**
     * 
     * @param <T>
     * @param clazz
     * @param where
     * @return 
     */
    public <T> List<T> select( Class<? extends T> clazz, String where )
    {
        List<T> list = new ArrayList();

        Session session = prepareStatement();
        
        try
        {
            
            Query q = session.createQuery( "from " + clazz.getSimpleName() + ( !where.isEmpty() ? where : "" ) );
            
            list.addAll( q.list() );
        }
        
        catch ( HibernateException he )
        {
            he.printStackTrace();
        }
        
        finally
        {
            session.close();
        }
        
        return list;
    }
    
    /**
     * 
     * @param <T>
     * @param clazz
     * @param where
     * @return 
     */
    public <T> Object fetchOne( Class<? extends T> clazz, String where )
    {
        Object o = null;
        
        Session session = prepareStatement();
        
        try
        {
            Query q = session.createQuery( "from " + clazz.getSimpleName() + where );
            
            o = q.uniqueResult();
        }
        
        catch( HibernateException he )
        {
            he.printStackTrace();
        }
        
        finally
        {
            close( session );
        }
        
        return o;
    }
    
    /**
     * 
     * @param o 
     */
    public void delete( Object o )
    {
        Session session = prepareStatement();

        session.delete( o );
        
        commitAndClose( session );
    }
    
    /**
     * 
     * @param o 
     */
    public void insert( Object o )
    {
        Session session = prepareStatement();
        
        session.save( o );
        
        commitAndClose( session );
    }
    
    /**
     * 
     * @param o 
     */
    public void update( Object o )
    {
        Session session = prepareStatement();
        
        session.update( o );

        commitAndClose( session );
    }

}
