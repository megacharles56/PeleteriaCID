/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;
import java.sql.*;
/**
 *
 * @author Gloria
 */
public class Conectar {
    static String bd="peleteriacid";
    static String login="root";
    static String password="";
    static String url="jdbc:mysql://127.0.0.1:3306/"+bd;
    Connection Conectar=null;
public Connection conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Conectar=DriverManager.getConnection(url, login, password);
            System.out.println("Conexion Exitosa...");

        }catch(Exception e){
            System.out.println(e.getMessage());
            
        }
    return Conectar;
    }
}