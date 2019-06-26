/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas.util;

/**
 *
 * @author Vieri
 */
public  class ParametrosSistema {
    //PARAMETROS DE CONEXION
    public static String DRIVER="com.mysql.jdbc.Driver";
    public static String URL="jdbc:mysql://localhost:3306/cregescon";
    public static String CONECTION_USER="root";
    public static String CONECTION_PASS="";
    //MODULOS DEL SISTEMA
    public static final int SEGURIDAD_PERFILES=1;
    public static final int SEGURIDAD_USUARIOS=2;
    public static final int SEGURIDAD_ACCESO=3;
    public static final int PARAMETROS_SISTEMA=4;
    
}
