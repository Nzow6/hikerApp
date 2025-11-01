/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.db_app.Models;

import java.sql.*;

/**
 *
 * @author Ryan Nathan
 */
public class GearRentals {
    
    public void getGear(Connection conn, int gear_id){
        
        Statement stmt = null;  // statement to call
        ResultSet rs = null;    // store result as a table? set? will look into it later
        ResultSetMetaData rsmd;
        int columnsNumber;
        
        //prepare the statement
        
        StringBuilder query = new StringBuilder();
        query.append("SELECT    *");
        query.append("FROM      gear");
        
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());
            rsmd = rs.getMetaData();
            columnsNumber = rsmd.getColumnCount();
            //only equate to rs if you know the query is a select 
            //it's possible for a query to be not a select (ex: adding entry to database) 
            
            while (rs.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = rs.getString(i);
                System.out.print(columnValue + " " + rsmd.getColumnName(i));
                }
                System.out.println("");
            }
            
            
            
        }
        catch (SQLException ex){
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        
        
        //code for printing a table referenced from 
        //https://coderwall.com/p/609ppa/printing-the-result-of-resultset
        
}
        
        
        
        
        
        
        
        
    
    
}
