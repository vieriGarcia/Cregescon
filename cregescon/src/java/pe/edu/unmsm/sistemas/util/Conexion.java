/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LaboratorioFISI
 */
public class Conexion {
    String driver;
    String url;
    String user;
    String password;
    private static Connection con;
    private static Statement stm;
    private static Conexion conn;

    private Conexion(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }
    
    
    
    public static Conexion getConexion(String driver,String url,String user,String password){
        if(conn==null) {
            try {
                Class.forName(driver);
                
                con=DriverManager.getConnection(url,user,password);
                stm=con.createStatement();
                conn = new Conexion(driver,url,user,password);
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                 System.out.println("Error al registrar el driver de MySQL: " + ex);
            }
            System.out.println("Cree Conexion 1 vez.");
        } else {
            System.out.println("Ya creaste la conexion anteriormente.");
        }
        return conn;
    }
    
    public ResultSet ejecutarQuery(String sql){
        try {
            return stm.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
