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

//NOTE that all print lines here are either debug lines or something meant to be passed to the view.
public class GearRentals {
    
    // simply gives all info in gear
    public static void getGear(Connection conn, int gear_id){
        
        Statement stmt = null;  // statement to call
        ResultSet rs = null;    // store result as a table? set? will look into it later
        ResultSetMetaData rsmd;
        int columnsNumber;
        
        //prepare the statement
        
        StringBuilder query = new StringBuilder();
        query.append("SELECT    * ");
        query.append("FROM      gear ");
        query.append("WHERE     rental_rate>1005 ");
        
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());
            rsmd = rs.getMetaData();
            columnsNumber = rsmd.getColumnCount();
            
            int count = 0;
            
            
            //only equate to rs if you know the query is a select 
            //it's possible for a query to be not a select (ex: adding entry to database) 
            
            while (rs.next()) {
                count++;
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1) System.out.print(",  ");
                    String columnValue = rs.getString(i);
                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
                    }
                    System.out.println("");
            }
            
            System.out.println("Rows returned: " + count);
            
            rs.close();
            stmt.close();
            
            
            
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
    //take gear and hiker
    //check if hiker exists
    //check if gear exists
    //check if gear is available
    //if yes, then do the following
    //add to borrowed quantity
    //make an overload on this function for the case where they pay along with rent2
    
    //add entry to gear rentals
    //make returnGear function
    public static void rentGear(Connection conn, int hiker_id, int gear_id, String due_date){
        
        Statement stmt = null;  // statement to call
        ResultSet rs = null;    // store result as a table? set? will look into it later
        ResultSetMetaData rsmd;
        int columnsNumber;
        
        boolean hikerExists = false;
        boolean gearExists = false;
        boolean gearAvailable = false;
        
        int daysToBorrow = 0;
        double rental_rate = -1;
        double amount_due; //days to borrow * rental_rate
        
        //prepare the statement
        
        //find the hiker
        StringBuilder query = new StringBuilder();
        query.append("SELECT    * ");
        query.append("FROM      hiker ");
        query.append("WHERE     hiker_id=" + hiker_id);
        
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());
            rsmd = rs.getMetaData();
            columnsNumber = rsmd.getColumnCount();
            
            int count = 0;
            
            while (rs.next()) {
                count++;
            }
            
            System.out.println("Rows returned: " + count);
            if (count > 0 ) hikerExists = true;
            
            rs.close();
            stmt.close();
        }
        catch (SQLException ex){
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        
        //find the gear
        query = new StringBuilder();
        query.append("SELECT    * ");
        query.append("FROM      gear ");
        query.append("WHERE     gear_id=" + gear_id);
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());
            rsmd = rs.getMetaData();
            columnsNumber = rsmd.getColumnCount();
            
            int count = 0;
            int gearCount = 0;
            
            while (rs.next()) {
                count++;
                gearCount = rs.getInt("total_quantity");
                gearCount = gearCount - rs.getInt("borrowed_quantity");
                rental_rate = rs.getDouble("rental_rate");
                
            }
            
            System.out.println("Rows returned: " + count);
            if (count > 0 ) gearExists = true;
            if (gearCount>0) gearAvailable = true;
            
            rs.close();
            stmt.close();
        }
        catch (SQLException ex){
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        
        if(hikerExists && gearExists && gearAvailable){
            System.out.println("can rent!");
            System.out.println("will attempt to create record");
            
            
            query = new StringBuilder();
            query.append("INSERT INTO   gear_rental (gear_id, hiker_id, borrow_date, due_date, return_date, amount_due, amount_paid, payment_status)");
            query.append("VALUES        ("+ gear_id + ", "+hiker_id + ", NOW(), '"+due_date+"', '9999-01-01', " + rental_rate
                    + " * (1 + TIMESTAMPDIFF(DAY,NOW(),'"+due_date+"')),0,'UNPAID')");
            //VALUES (51,11,now(),'2025-12-01','9999-01-01',1000 * TIMESTAMPDIFF(DAY,now(),'2025-12-01'),0,'UNPAID');
            
            
            try {
            stmt = conn.createStatement();
            stmt.executeUpdate(query.toString());
           
            stmt.close();
            }
            catch (SQLException ex){
                // handle any errors
                System.out.println("SQLException: " + ex.getMessage());
                System.out.println("SQLState: " + ex.getSQLState());
                System.out.println("VendorError: " + ex.getErrorCode());
            }
            
            System.out.println("new rental record created");
        }
        else{
             System.out.println("cannot rent!");
        }
        
    }
        
        
        
        
        
        
        
        
    
    
}
